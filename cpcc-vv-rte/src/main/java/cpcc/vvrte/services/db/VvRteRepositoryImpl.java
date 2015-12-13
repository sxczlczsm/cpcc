// This code is part of the CPCC-NG project.
//
// Copyright (c) 2013 Clemens Krainer <clemens.krainer@gmail.com>
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

package cpcc.vvrte.services.db;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;

import cpcc.vvrte.entities.VirtualVehicle;
import cpcc.vvrte.entities.VirtualVehicleState;
import cpcc.vvrte.entities.VirtualVehicleStorage;

/**
 * VvRteRepository implementation.
 */
public class VvRteRepositoryImpl implements VvRteRepository
{
    private Logger logger;
    private Session session;
    private TaskRepository taskRepository;

    /**
     * @param logger the application logger.
     * @param session the Hibernate session.
     * @param taskRepository the task repository instance.
     */
    public VvRteRepositoryImpl(Logger logger, Session session, TaskRepository taskRepository)
    {
        this.logger = logger;
        this.session = session;
        this.taskRepository = taskRepository;

        resetVirtualVehicleStates();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void resetVirtualVehicleStates()
    {
        session
            .createQuery("UPDATE VirtualVehicle SET state = :newState WHERE state = :oldState")
            .setParameter("newState", VirtualVehicleState.MIGRATION_INTERRUPTED)
            .setParameter("oldState", VirtualVehicleState.MIGRATING)
            .executeUpdate();

        session
            .createQuery("UPDATE VirtualVehicle SET state = :newState WHERE state = :oldState")
            .setParameter("newState", VirtualVehicleState.INTERRUPTED)
            .setParameter("oldState", VirtualVehicleState.RUNNING)
            .executeUpdate();
    }

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<VirtualVehicle> findAllVehicles()
    {
        return (List<VirtualVehicle>) session
            .createCriteria(VirtualVehicle.class)
            .addOrder(Property.forName("id").asc())
            .list();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public VirtualVehicle findVirtualVehicleById(Integer id)
    {
        return (VirtualVehicle) session.createCriteria(VirtualVehicle.class)
            .add(Restrictions.eq("id", id))
            .uniqueResult();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public VirtualVehicle findVirtualVehicleByName(String name)
    {
        return (VirtualVehicle) session.createCriteria(VirtualVehicle.class)
            .add(Restrictions.eq("name", name))
            .uniqueResult();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public VirtualVehicle findVirtualVehicleByUUID(String uuid)
    {
        return (VirtualVehicle) session.createCriteria(VirtualVehicle.class)
            .add(Restrictions.eq("uuid", uuid))
            .uniqueResult();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteVirtualVehicleById(VirtualVehicle vehicle)
    {
        if (vehicle == null)
        {
            return;
        }

        if (!VirtualVehicleState.VV_STATES_FOR_DELETE.contains(vehicle.getState()))
        {
            logger.warn("Not deleting virtual vehicle " + vehicle.getName()
                + " (" + vehicle.getUuid() + ") because of state " + vehicle.getState());
            return;
        }

        logger.info("Deleting virtual vehicle " + vehicle.getName() + " (" + vehicle.getUuid() + ")");

        session
            .createQuery("DELETE FROM VirtualVehicleStorage WHERE virtualVehicle.id = :id")
            .setParameter("id", vehicle.getId())
            .executeUpdate();

        taskRepository.unlinkTasksFromVirtualVehicleById(vehicle.getId());

        vehicle.setTask(null);
        session.update(vehicle);
        session.delete(vehicle);
    }

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<String> findAllStorageItemNames()
    {
        return (List<String>) session
            .createQuery("select name from VirtualVehicleStorage")
            .list();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public VirtualVehicleStorage findStorageItemByVirtualVehicleAndName(VirtualVehicle vehicle, String name)
    {
        return (VirtualVehicleStorage) session
            .createQuery("from VirtualVehicleStorage where virtualVehicle.id = :id AND name = :name")
            .setInteger("id", vehicle.getId())
            .setString("name", name)
            .uniqueResult();

        //        return (VirtualVehicleStorage) session
        //            .createCriteria(VirtualVehicleStorage.class)
        //            .add(Restrictions.and(
        //                Restrictions.eq("virtualVehicle.id", vehicle.getId()), 
        //                Restrictions.eq("name", name)))
        //            .uniqueResult();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public VirtualVehicleStorage findStorageItemById(Integer id)
    {
        return (VirtualVehicleStorage) session.createCriteria(VirtualVehicleStorage.class)
            .add(Restrictions.eq("id", id))
            .uniqueResult();
    }

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<VirtualVehicleStorage> findStorageItemsByVirtualVehicle(Integer id)
    {
        return (List<VirtualVehicleStorage>) session
            .createQuery("from VirtualVehicleStorage where virtualVehicle.id = :id")
            .setInteger("id", id)
            .list();

        //        return (VirtualVehicleStorage) session
        //            .createCriteria(VirtualVehicleStorage.class)
        //            .add(Restrictions.eq("virtualVehicle.id", vehicle.getId()))
        //            .uniqueResult(); 
    }

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<VirtualVehicleStorage> findStorageItemsByVirtualVehicle(Integer id, String startName,
        int maxEntries)
    {
        return (List<VirtualVehicleStorage>) session
            .createQuery("FROM VirtualVehicleStorage WHERE virtualVehicle.id = :id AND name > :name ORDER BY name")
            .setInteger("id", id)
            .setString("name", startName)
            .setMaxResults(maxEntries)
            .list();
    }
}