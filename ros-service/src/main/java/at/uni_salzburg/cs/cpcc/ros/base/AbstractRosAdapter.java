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
package at.uni_salzburg.cs.cpcc.ros.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.ros.namespace.GraphName;
import org.ros.node.AbstractNodeMain;

/**
 * GenericRosAdapter
 */
public abstract class AbstractRosAdapter extends AbstractNodeMain
{
    private GraphName defaultNodeName = GraphName.newAnonymous();
    
    private GraphName name;
    
    private RosTopic topic;

    private Map<String, List<String>> config;

    /**
     * {@inheritDoc}
     */
    @Override
    public GraphName getDefaultNodeName()
    {
        return defaultNodeName;
    }

    /**
     * @return ROS node path
     */
    public GraphName getName()
    {
        return name;
    }

    /**
     * @param name ROS node path
     */
    public void setName(GraphName name)
    {
        this.name = name;
    }

    /**
     * @return ROS topic
     */
    public RosTopic getTopic()
    {
        return topic;
    }

    /**
     * @param topic ROS topic
     */
    public void setTopic(RosTopic topic)
    {
        this.topic = topic;
    }

    /**
     * @param config the configuration.
     */
    public void setConfig(Map<String, List<String>> config)
    {
        this.config = config;
    }
    
    /**
     * @return the configuration.
     */
    public Map<String, List<String>> getConfig()
    {
        return config;
    }
    
    /**
     * @return the current state of the ROS adapter.
     */
    public Map<String, List<String>> getCurrentState()
    {
        Map<String, List<String>> map = new HashMap<String, List<String>>();

        if (getConfig() != null)
        {
            for (Entry<String, List<String>> entry : getConfig().entrySet())
            {
                map.put("config." + entry.getKey(), entry.getValue());
            }
        }
        return map;
    }
}
