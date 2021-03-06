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

package cpcc.core.utils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.tapestry5.StreamResponse;
import org.apache.tapestry5.services.Response;
import org.geojson.FeatureCollection;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

/**
 * GeoJsonStreamResponse
 */
public class GeoJsonStreamResponse implements StreamResponse
{
    private FeatureCollection featureCollection;

    /**
     * @param featureCollection the FeatureCollection object to be streamed.
     */
    public GeoJsonStreamResponse(FeatureCollection featureCollection)
    {
        this.featureCollection = featureCollection;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getContentType()
    {
        return "application/json";
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public InputStream getStream() throws IOException
    {
        byte[] byteArray = new ObjectMapper()
            .disable(SerializationFeature.INDENT_OUTPUT)
            .writeValueAsBytes(featureCollection);
        return new ByteArrayInputStream(byteArray);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void prepareResponse(Response response)
    {
        // intentionally empty.
    }

}
