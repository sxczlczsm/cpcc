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

package at.uni_salzburg.cs.cpcc.com.services;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;

import at.uni_salzburg.cs.cpcc.com.services.CommunicationRequest.Connector;
import at.uni_salzburg.cs.cpcc.core.entities.RealVehicle;

/**
 * CommunicationService
 */
public interface CommunicationService
{
    /**
     * @param realVehicle the real vehicle to communicate with.
     * @param connector the connector to be used.
     * @param data the data chunk to be transferred.
     * @return the response object
     * @throws ClientProtocolException thrown in case of errors.
     * @throws IOException thrown in case of errors.
     */
    CommunicationResponse transfer(RealVehicle realVehicle, Connector connector, byte[] data)
        throws ClientProtocolException, IOException;
}
