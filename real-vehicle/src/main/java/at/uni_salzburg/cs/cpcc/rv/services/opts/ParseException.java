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
package at.uni_salzburg.cs.cpcc.rv.services.opts;

import java.util.Collection;
import java.util.Locale;

/**
 * ParseException
 */
@SuppressWarnings("serial")
public class ParseException extends Exception
{
    private Collection<Symbol> expectedSymbol;
    private Symbol actualSymbol;
    private int lineNumber;
    private int columnNumber;

    /**
     * @param expected the expected symbol.
     * @param scanner the options scanner.
     * @param token the current token.
     */
    public ParseException(Collection<Symbol> expected, OptionsScanner scanner, Token token)
    {
        super(String.format(Locale.US, "Expected a %s but got a %s in line %d column %d",
            joinIt(expected), token.getSymbol().name(), scanner.getLineNumber(), scanner.getColumnNumber()));
        expectedSymbol = expected;
        actualSymbol = token.getSymbol();
        lineNumber = scanner.getLineNumber();
        columnNumber = scanner.getColumnNumber();
    }
    
    /**
     * @param symbols the symbols.
     * @return the joint string of symbol names.
     */
    private static String joinIt(Collection<Symbol> symbols)
    {
        StringBuilder b = new StringBuilder();
        boolean first = true;
        int size = symbols.size() - 1;
        for (Symbol e : symbols)
        {
            if (first)
            {
                first = false;
            }
            else
            {
                b.append(--size > 0 ? ", " : " or ");
            }
            b.append(e.name());
        }
        return b.toString();
    }

    /**
     * @return the expectedSymbol
     */
    public Collection<Symbol> getExpectedSymbol()
    {
        return expectedSymbol;
    }

    /**
     * @return the actualSymbol
     */
    public Symbol getActualSymbol()
    {
        return actualSymbol;
    }

    /**
     * @return the lineNumber
     */
    public int getLineNumber()
    {
        return lineNumber;
    }

    /**
     * @return the columnNumber
     */
    public int getColumnNumber()
    {
        return columnNumber;
    }

}