/*
 * This code is part of the CPCC-NG project.
 *
 * Copyright (c) 2013 Clemens Krainer <clemens.krainer@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
package at.uni_salzburg.cs.cpcc.vvrte.task;

import java.util.HashMap;
import java.util.Map;

import org.mozilla.javascript.ScriptableObject;

import at.uni_salzburg.cs.cpcc.persistence.services.QueryManager;

/**
 * TaskAnalyzerImpl
 */
public class TaskAnalyzerImpl implements TaskAnalyzer
{
    private Map<String, AbstractTaskAnalyzer> analyzermap = new HashMap<String, AbstractTaskAnalyzer>();

    /**
     * @param qm the query manager.
     */
    public TaskAnalyzerImpl(QueryManager qm)
    {
        analyzermap.put("point", new SimpleTaskAnalyzer(qm));
        // analyzermap.put("patrol-line", new PatrolLineTaskAnalyzer(qm));
        // analyzermap.put("patrol-area", new PatrolAreaTaskAnalyzer(qm));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Task analyzeTaskParameters(ScriptableObject taskParameters, int sequenceNumber)
    {
        String taskType = (String) taskParameters.get("type");

        if (!analyzermap.containsKey(taskType))
        {
            return null;
        }

        return analyzermap.get(taskType).analyzeTaskParameters(taskParameters, sequenceNumber);
    }

}
