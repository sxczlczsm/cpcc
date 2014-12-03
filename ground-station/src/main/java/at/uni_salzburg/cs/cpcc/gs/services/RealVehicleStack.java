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
package at.uni_salzburg.cs.cpcc.gs.services;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.tapestry5.Asset;
import org.apache.tapestry5.services.AssetSource;
import org.apache.tapestry5.services.javascript.JavaScriptAggregationStrategy;
import org.apache.tapestry5.services.javascript.JavaScriptStack;
import org.apache.tapestry5.services.javascript.StylesheetLink;

/**
 * RealVehicleStack
 */
@Deprecated
public class RealVehicleStack implements JavaScriptStack
{
    //    private StylesheetLink[] stylesheets;

    private Asset[] javaScriptLibraries;

    /**
     * @param assetSource the asset source
     */
    public RealVehicleStack(final AssetSource assetSource)
    {
        //        stylesheets =
        //            new StylesheetLink[]
        //            {
        //                TapestryInternalUtils.assetToStylesheetLink.map(assetSource
        //                    .getUnlocalizedAsset("/at/uni_salzburg/cs/cpcc/commons/css/Vehicle.css")),
        //            };

        javaScriptLibraries =
            new Asset[]
            {
                assetSource.getUnlocalizedAsset("/at/uni_salzburg/cs/cpcc/gs/js/realVehicle.js"),
            };
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<String> getStacks()
    {
        return Collections.emptyList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Asset> getJavaScriptLibraries()
    {
        return Arrays.asList(javaScriptLibraries);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<StylesheetLink> getStylesheets()
    {
        return Arrays.asList(); // Arrays.asList(stylesheets);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getInitialization()
    {
        return null;
    }

    @Override
    public List<String> getModules()
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public JavaScriptAggregationStrategy getJavaScriptAggregationStrategy()
    {
        // TODO Auto-generated method stub
        return null;
    }
}
