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

package cpcc.vvrte.services.json;

import org.apache.tapestry5.json.JSONArray;
import org.apache.tapestry5.json.JSONObject;

import cpcc.vvrte.entities.Task;
import cpcc.vvrte.entities.VirtualVehicle;

/**
 * VvJsonConverter
 */
public interface VvJsonConverter
{
    /**
     * @param vehicle a virtual vehicle object.
     * @return the requested JSON object.
     */
    JSONObject toJson(VirtualVehicle vehicle);

    /**
     * @param vehicles a list of virtual vehicles.
     * @return the requested JSON array.
     */
    JSONArray toJsonArray(VirtualVehicle... vehicles);

    /**
     * @param task a task object.
     * @return the requested JSON object.
     */
    JSONObject toJson(Task task);

    /**
     * @param tasks a list of tasks
     * @return the requested JSON array.
     */
    JSONArray toJsonArray(Task... tasks);
}