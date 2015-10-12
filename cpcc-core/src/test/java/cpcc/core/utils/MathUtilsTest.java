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

package cpcc.core.utils;

import static org.fest.assertions.api.Assertions.assertThat;
import static org.fest.assertions.api.Assertions.offset;

import java.lang.reflect.Constructor;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

/**
 * ConvertUtilsTest
 */
public class MathUtilsTest
{
    @Test
    public void shouldHavePrivateConstructor() throws Exception
    {
        Constructor<MathUtils> cnt = MathUtils.class.getDeclaredConstructor();
        assertThat(cnt.isAccessible()).isFalse();
        cnt.setAccessible(true);
        cnt.newInstance();
    }

    @DataProvider
    public Object[][] doubleValuesDataProvider()
    {
        return new Object[][]{
            new Object[]{1, 3, 2},
            new Object[]{1.03, 1.01, 1.02},
        };
    }

    @Test(dataProvider = "doubleValuesDataProvider")
    public void shouldConvertDoubleListToString(double a, double b, double expected)
    {
        double actual = MathUtils.avg(a, b);

        assertThat(actual).isEqualTo(expected, offset(1E-8));
    }

    @DataProvider
    public Object[][] doubleNaNValuesDataProvider()
    {
        return new Object[][]{
            new Object[]{new double[]{1, 3, 2}, true},
            new Object[]{new double[]{1.03, 1.01, 1.02}, true},
            new Object[]{new double[]{Double.NaN, 1.01, 1.02}, false},
            new Object[]{new double[]{1.03, Double.NaN, 1.02}, false},
            new Object[]{new double[]{1.03, 1.01, Double.NaN, 1.02}, false},
        };
    }

    @Test(dataProvider = "doubleNaNValuesDataProvider")
    public void shouldRecognizeNaNs(double[] values, boolean expected)
    {
        boolean actual = MathUtils.containsNoNaN(values);

        assertThat(actual).isEqualTo(expected);
    }
}
