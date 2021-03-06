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

package cpcc.vvrte.services.task;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import cpcc.core.entities.PolarCoordinate;
import cpcc.core.services.jobs.TimeService;
import cpcc.vvrte.entities.Task;

/**
 * GatedTspSchedulingAlgorithmTest implementation.
 */
public class GatedTspSchedulingAlgorithmTest
{
    private GatedTspSchedulingAlgorithm sut;
    private List<PolarCoordinate> depots;
    private Logger logger;
    private TimeService timeService;

    /**
     * Test setup.
     */
    @BeforeMethod
    public void setUp()
    {
        logger = mock(Logger.class);
        timeService = mock(TimeService.class);

        depots = spy(new ArrayList<>());
        sut = new GatedTspSchedulingAlgorithm(logger, timeService, 30);
    }

    @DataProvider
    public Object[][] pendingTasksDataProvider()
    {
        Task taskA = mock(Task.class);
        when(taskA.getPosition()).thenReturn(new PolarCoordinate(47.1, 13.2, 5.0));
        when(taskA.toString()).thenReturn("taskA");

        Task taskB = mock(Task.class);
        when(taskB.getPosition()).thenReturn(new PolarCoordinate(47.9, 13.45, 5.0));
        when(taskB.toString()).thenReturn("taskB");

        Task taskC = mock(Task.class);
        when(taskC.getPosition()).thenReturn(new PolarCoordinate(47.8, 13.2, 5.0));
        when(taskC.toString()).thenReturn("taskC");

        Task taskD = mock(Task.class);
        when(taskD.getPosition()).thenReturn(new PolarCoordinate(47.3, 13.5, 5.0));
        when(taskD.toString()).thenReturn("taskD");

        Task taskE = mock(Task.class);
        when(taskE.getPosition()).thenReturn(new PolarCoordinate(47.3, 13.8, 5.0));
        when(taskE.toString()).thenReturn("taskE");

        Task taskF = mock(Task.class);
        when(taskF.getPosition()).thenReturn(new PolarCoordinate(47.9, 13.7, 5.0));
        when(taskF.toString()).thenReturn("taskF");

        return new Object[][]{
            new Object[]{
                new PolarCoordinate(47.4, 13.2, 5.0),
                Collections.<Task> emptyList(),
                Arrays.asList(taskA, taskB, taskC, taskD, taskE, taskF),
                Arrays.asList(taskC, taskB, taskF, taskE, taskD, taskA),
                Collections.<Task> emptyList(),
                true
            },
            new Object[]{
                new PolarCoordinate(47.4, 13.2, 5.0),
                Collections.<Task> emptyList(),
                Arrays.asList(taskA, taskC, taskB, taskD),
                Arrays.asList(taskA, taskD, taskB, taskC),
                Collections.<Task> emptyList(),
                true
            },
        };
    }

    @Test(dataProvider = "pendingTasksDataProvider")
    public void shouldSchedulePendingTasksIfNoTasksAreScheduled(PolarCoordinate rvPosition
        , List<Task> scheduled, List<Task> pending
        , List<Task> expectedScheduled, List<Task> expectedPending, boolean expectedChange)
    {
        List<Task> scheduledTasks = new ArrayList<>(scheduled);
        List<Task> pendingTasks = new ArrayList<>(pending);

        boolean actual = sut.schedule(rvPosition, depots, scheduledTasks, pendingTasks);

        assertThat(actual).describedAs("Schedule changes").isEqualTo(expectedChange);
        assertThat(scheduledTasks).has(new TspListCondition<Task>(expectedScheduled));
        assertThat(pendingTasks).has(new TspListCondition<Task>(expectedPending));
        // verify(depots).isEmpty();
    }

    @DataProvider
    public Object[][] pendingTasksDataProviderWithDepot()
    {
        Task taskA = mock(Task.class);
        when(taskA.getPosition()).thenReturn(new PolarCoordinate(47.1, 13.2, 5.0));
        when(taskA.toString()).thenReturn("taskA");

        Task taskB = mock(Task.class);
        when(taskB.getPosition()).thenReturn(new PolarCoordinate(47.9, 13.45, 5.0));
        when(taskB.toString()).thenReturn("taskB");

        Task taskC = mock(Task.class);
        when(taskC.getPosition()).thenReturn(new PolarCoordinate(47.8, 13.2, 5.0));
        when(taskC.toString()).thenReturn("taskC");

        Task taskD = mock(Task.class);
        when(taskD.getPosition()).thenReturn(new PolarCoordinate(47.3, 13.5, 5.0));
        when(taskD.toString()).thenReturn("taskD");

        Task taskE = mock(Task.class);
        when(taskE.getPosition()).thenReturn(new PolarCoordinate(47.3, 13.8, 5.0));
        when(taskE.toString()).thenReturn("taskE");

        Task taskF = mock(Task.class);
        when(taskF.getPosition()).thenReturn(new PolarCoordinate(47.9, 13.7, 5.0));
        when(taskF.toString()).thenReturn("taskF");

        return new Object[][]{
            new Object[]{
                new PolarCoordinate(47.4, 13.2, 5.0),
                new PolarCoordinate(47.4, 13.2, 5.0),
                Collections.<Task> emptyList(),
                Arrays.asList(taskA, taskB, taskC, taskD, taskE, taskF),
                Arrays.asList(taskC, taskB, taskF, taskE, taskD, taskA),
                Collections.<Task> emptyList(),
                true
            },
            new Object[]{
                new PolarCoordinate(47.4, 13.2, 5.0),
                new PolarCoordinate(47.8, 13.0, 5.0),
                Collections.<Task> emptyList(),
                Arrays.asList(taskA, taskC, taskB, taskD),
                Arrays.asList(taskA, taskD, taskB, taskC),
                Collections.<Task> emptyList(),
                true
            },
        };
    }

    @Test(dataProvider = "pendingTasksDataProviderWithDepot")
    public void shouldSchedulePendingTasksIfNoTasksAreScheduledAndConsiderDepotPositions(PolarCoordinate rvPosition
        , PolarCoordinate depotPosition
        , List<Task> scheduled, List<Task> pending
        , List<Task> expectedScheduled, List<Task> expectedPending, boolean expectedChange)
    {
        depots.add(depotPosition);
        List<Task> scheduledTasks = new ArrayList<>(scheduled);
        List<Task> pendingTasks = new ArrayList<>(pending);

        boolean actual = sut.schedule(rvPosition, depots, scheduledTasks, pendingTasks);

        assertThat(actual).describedAs("Schedule changes").isEqualTo(expectedChange);
        assertThat(scheduledTasks)
            .overridingErrorMessage("Expecting:\n<" + scheduledTasks + ">\nto have:\n<" + expectedScheduled + ">")
            .has(new TspListCondition<Task>(expectedScheduled));
        assertThat(pendingTasks).has(new TspListCondition<Task>(expectedPending));
        // verify(depots).isEmpty();
        // verify(depots).get(0);
    }

    @Test
    public void shouldNotChangeScheduleIfScheduledTaskAreActive()
    {
        Task taskA = mock(Task.class);
        Task taskB = mock(Task.class);
        List<Task> scheduledTasks = spy(new ArrayList<Task>(Arrays.asList(taskA, taskB)));

        boolean actual = sut.schedule(null, depots, scheduledTasks, null);

        assertThat(actual).describedAs("Scheduling result").isFalse();
        verify(scheduledTasks).isEmpty();
    }

    @Test
    public void shouldScheduleSingleTask()
    {
        Task taskA = mock(Task.class);
        List<Task> scheduledTasks = spy(new ArrayList<Task>());
        List<Task> pendingTasks = new ArrayList<Task>(Arrays.asList(taskA));

        boolean actual = sut.schedule(null, depots, scheduledTasks, pendingTasks);

        assertThat(actual).describedAs("Scheduling result").isTrue();
        assertThat(scheduledTasks).hasSize(1).contains(taskA);
        assertThat(pendingTasks).isEmpty();
    }
}
