// This code is part of the CPCC-NG project.
//
// Copyright (c) 2015 Clemens Krainer <clemens.krainer@gmail.com>
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

package cpcc.rv.base.services;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;

import at.uni_salzburg.cs.cpcc.core.entities.Parameter;
import at.uni_salzburg.cs.cpcc.core.entities.RealVehicle;
import at.uni_salzburg.cs.cpcc.core.services.QueryManager;
import at.uni_salzburg.cs.cpcc.core.services.jobs.JobCreationException;
import at.uni_salzburg.cs.cpcc.core.services.jobs.JobService;

/**
 * This service synchronizes real vehicle and sensor configuration data to other real vehicles.
 */
public class StateSynchronizerImpl implements StateSynchronizer
{
    private Logger logger;
    private QueryManager qm;
    private JobService jobService;

    /**
     * @param logger the application logger.
     * @param qm the query manager.
     * @param jobService the job service.
     */
    public StateSynchronizerImpl(Logger logger, QueryManager qm, JobService jobService)
    {
        this.logger = logger;
        this.qm = qm;
        this.jobService = jobService;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void synchronizeConfiguration()
    {
        queueSateSyncJobs("config");
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void realVehicleStatusUpdate()
    {
        queueSateSyncJobs("status");
    }

    /**
     * @param mode the synchronization mode.
     */
    private void queueSateSyncJobs(String mode)
    {
        Parameter param = qm.findParameterByName(Parameter.REAL_VEHICLE_NAME);
        if (param == null || StringUtils.isEmpty(param.getValue()))
        {
            logger.error("Hosting real vehicle name is not configured. Config sync aborted!");
            return;
        }

        String hostingRvName = param.getValue();

        for (RealVehicle rv : qm.findAllRealVehicles())
        {
            if (hostingRvName.equals(rv.getName()))
            {
                continue;
            }

            try
            {
                jobService.addJob(RealVehicleBaseConstants.JOB_QUEUE_NAME
                    , String.format("mode=%s,rv=%d", mode, rv.getId()));
            }
            catch (JobCreationException e)
            {
                String msg = String.format("Can not create config sync job for real vehicle %s (%d), mode=%s"
                    , rv.getName(), rv.getId(), mode);
                logger.error(msg, e);
            }
        }
    }
}
