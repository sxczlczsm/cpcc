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
package at.uni_salzburg.cs.cpcc.rv.services;

import java.awt.Dimension;

import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.services.RequestGlobals;

import sensor_msgs.Image;
import at.uni_salzburg.cs.cpcc.ros.base.AbstractRosAdapter;
import at.uni_salzburg.cs.cpcc.ros.sensors.ImageProvider;

/**
 * ImageTagServiceImpl
 */
public class ImageTagServiceImpl implements ImageTagService
{
    private static final Object ROS_CAMERA_IMAGE = "ros/cameraimage";
    private static final String ROS_CAMERA_IMAGE_TAG =
        "<img src=\"%s/%s/%s/%d\" width=\"%d\" height=\"%d\" alt=\"%s\" title=\"%s\">";
    private static final String ROS_CAMERA_IMAGE_TAG_ALT = "camera.image.alt";
    private static final String ROS_CAMERA_IMAGE_TAG_TITLE = "camera.image.title";

    private String contextPath;

    private Messages messages;

    /**
     * @param requestGlobals the request globals.
     * @param messages the messages service.
     */
    public ImageTagServiceImpl(RequestGlobals requestGlobals, Messages messages)
    {
        this.contextPath = requestGlobals.getRequest().getContextPath();
        this.messages = messages;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getRosImageTag(AbstractRosAdapter adapter)
    {
        int width = 10;
        int height = 10;
        if (adapter instanceof ImageProvider)
        {
            Image image = ((ImageProvider) adapter).getImage();
            if (image != null)
            {
                width = image.getWidth();
                height = image.getHeight();
            }
        }

        String param = adapter.getTopic().getName().replaceAll("/", "_");
        String alt = messages.get(ROS_CAMERA_IMAGE_TAG_ALT);
        String title = messages.get(ROS_CAMERA_IMAGE_TAG_TITLE);
        long time = System.currentTimeMillis();
        
        return String.format(ROS_CAMERA_IMAGE_TAG, contextPath, ROS_CAMERA_IMAGE, param, time, width, height, alt,
            title);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Dimension getRosImageDimension(AbstractRosAdapter adapter)
    {
        int width = 10;
        int height = 10;
        if (adapter instanceof ImageProvider)
        {
            Image image = ((ImageProvider) adapter).getImage();
            if (image != null)
            {
                width = image.getWidth();
                height = image.getHeight();
            }
        }
        return new Dimension(width, height);
    }
}
