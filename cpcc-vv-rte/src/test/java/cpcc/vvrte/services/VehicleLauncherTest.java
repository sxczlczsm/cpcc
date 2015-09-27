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

package cpcc.vvrte.services;

import static org.fest.assertions.api.Assertions.assertThat;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Matchers.anyObject;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.IOUtils;
import org.apache.tapestry5.hibernate.HibernateSessionManager;
import org.hibernate.Session;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.slf4j.Logger;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import cpcc.vvrte.entities.VirtualVehicle;
import cpcc.vvrte.entities.VirtualVehicleState;
import cpcc.vvrte.services.VirtualVehicleLaunchException;
import cpcc.vvrte.services.VirtualVehicleLauncherImpl;
import cpcc.vvrte.services.VirtualVehicleMigrator;
import cpcc.vvrte.services.VvRteRepository;
import cpcc.vvrte.services.js.JavascriptService;
import cpcc.vvrte.services.js.JavascriptWorker;
import cpcc.vvrte.services.js.JavascriptWorkerStateListener;

/**
 * VehicleLauncherTest
 */
public class VehicleLauncherTest
{
    JavascriptWorkerStateListener jobListener = null;
    private VirtualVehicle vehicle;
    private VirtualVehicleLauncherImpl launcher;
    private Session session;
    private HibernateSessionManager sessionManager;
    private Logger logger;

    @BeforeMethod
    public void setUp() throws IOException
    {
        logger = mock(Logger.class);

        String vvProgramFileName = "simple-vv.js";
        InputStream scriptStream = VehicleLauncherTest.class.getResourceAsStream(vvProgramFileName);
        String program = IOUtils.toString(scriptStream, "UTF-8");

        vehicle = spy(new VirtualVehicle());
        vehicle.setId(1001);
        vehicle.setApiVersion(1);
        vehicle.setCode(program);
        vehicle.setState(VirtualVehicleState.INIT);
        vehicle.setName("rv001");

        final JavascriptWorker worker = mock(JavascriptWorker.class);
        when(worker.getApplicationState()).thenReturn(null);

        doAnswer(new Answer<Object>()
        {
            public Object answer(InvocationOnMock invocation)
            {
                Object[] args = invocation.getArguments();
                jobListener = (JavascriptWorkerStateListener) args[0];
                return null;
            }
        }).when(worker).addStateListener((JavascriptWorkerStateListener) anyObject());

        doAnswer(new Answer<Object>()
        {
            public Object answer(InvocationOnMock invocation)
            {
                jobListener.notify(worker, VirtualVehicleState.RUNNING);
                return null;
            }
        }).when(worker).start();

        session = mock(Session.class);
        sessionManager = mock(HibernateSessionManager.class);
        when(sessionManager.getSession()).thenReturn(session);

        JavascriptService jss = mock(JavascriptService.class);
        when(jss.createWorker(anyString(), anyInt())).thenReturn(worker);

        VirtualVehicleMigrator migrator = mock(VirtualVehicleMigrator.class);

        VvRteRepository vvRteRepository = mock(VvRteRepository.class);
        when(vvRteRepository.findVirtualVehicleById(1001)).thenReturn(vehicle);

        launcher = new VirtualVehicleLauncherImpl(logger, sessionManager, jss, migrator, vvRteRepository);
    }

    @Test
    public void shouldLaunchSimpleVirtualVehicle()
        throws SerialException, SQLException, IOException, VirtualVehicleLaunchException
    {
        launcher.start(vehicle.getId());

        verify(vehicle).setState(VirtualVehicleState.RUNNING);
        assertThat(vehicle.getState()).isNotNull().isEqualTo(VirtualVehicleState.RUNNING);

        verify(session, never()).beginTransaction();
        verify(sessionManager, times(2)).commit();
    }

    @Test(expectedExceptions = {VirtualVehicleLaunchException.class},
        expectedExceptionsMessageRegExp = "Invalid virtual vehicle 'null'")
    public void shouldThrowVLEIfVirtualVehicleIsNull() throws VirtualVehicleLaunchException, IOException
    {
        launcher.start(-1);
    }

    @Test(expectedExceptions = {VirtualVehicleLaunchException.class},
        expectedExceptionsMessageRegExp = "Expected vehicle in state INIT, but got RUNNING")
    public void shouldThrowVLEIfVirtualVehicleHasWrongState() throws VirtualVehicleLaunchException, IOException
    {
        vehicle.setState(VirtualVehicleState.RUNNING);
        launcher.start(vehicle.getId());
    }
}