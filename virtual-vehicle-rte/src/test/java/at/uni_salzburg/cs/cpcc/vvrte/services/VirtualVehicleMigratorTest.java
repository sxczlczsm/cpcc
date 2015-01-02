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

package at.uni_salzburg.cs.cpcc.vvrte.services;

import static org.fest.assertions.api.Assertions.assertThat;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyObject;
import static org.mockito.Matchers.anyString;
import static org.mockito.Matchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.compress.archivers.ArchiveException;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.tapestry5.hibernate.HibernateSessionManager;
import org.hibernate.Session;
import org.hibernate.internal.util.SerializationHelper;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.mozilla.javascript.NativeObject;
import org.mozilla.javascript.ScriptableObject;
import org.slf4j.Logger;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import at.uni_salzburg.cs.cpcc.com.services.CommunicationService;
import at.uni_salzburg.cs.cpcc.core.entities.Parameter;
import at.uni_salzburg.cs.cpcc.core.entities.RealVehicle;
import at.uni_salzburg.cs.cpcc.core.services.QueryManager;
import at.uni_salzburg.cs.cpcc.vvrte.entities.VirtualVehicle;
import at.uni_salzburg.cs.cpcc.vvrte.entities.VirtualVehicleState;
import at.uni_salzburg.cs.cpcc.vvrte.entities.VirtualVehicleStorage;

public class VirtualVehicleMigratorTest
{
    private static final int VV_ID1 = 123456;
    private static final int VV_ID2 = 654321;

    private Logger logger;
    private VvRteRepository repo;
    private VirtualVehicleMigrator migrator;
    private CommunicationService com;
    private Session session;
    private HibernateSessionManager sessionManager;
    private QueryManager qm;
    private Parameter paramChunkSize;

    private Map<String, VirtualVehicle> virtualVehicleMap;
    private HashMap<String, VirtualVehicleStorage> virtualVehicleStorageMap;
    private VirtualVehicle vv1;
    private VirtualVehicle vv2;

    @BeforeMethod
    public void setUp()
    {
        logger = mock(Logger.class);
        paramChunkSize = mock(Parameter.class);

        session = mock(Session.class);
        sessionManager = mock(HibernateSessionManager.class);
        when(sessionManager.getSession()).thenReturn(session);

        qm = mock(QueryManager.class);
        when(qm.findParameterByName(eq(Parameter.VIRTUAL_VEHICLE_MIGRATION_CHUNK_SIZE), anyString()))
            .thenReturn(paramChunkSize);

        repo = mock(VvRteRepository.class);

        setUpVv1();
        setUpVv2();
        setUpDatabase();

        com = mock(CommunicationService.class);

        migrator = new VirtualVehicleMigratorImpl(logger, sessionManager, repo, com, qm);
        assertThat(migrator).isNotNull();
    }

    public void setUpVv1()
    {
        Date startTime = new Date();
        Date modificationTime1 = new Date(startTime.getTime() + 100);
        Date modificationTime2 = new Date(startTime.getTime() + 200);
        Date modificationTime3 = new Date(startTime.getTime() + 300);
        Date modificationTime4 = new Date(startTime.getTime() + 400);
        Date endTime = new Date(startTime.getTime() + 1000);

        vv1 = mock(VirtualVehicle.class);
        when(vv1.getId()).thenReturn(VV_ID1);
        when(vv1.getUuid()).thenReturn("efc6ef21-6d90-4f4b-95cf-baf5a9000467");
        when(vv1.getName()).thenReturn("rv23");
        when(vv1.getApiVersion()).thenReturn(1);
        when(vv1.getCode()).thenReturn("the code");
        when(vv1.getState()).thenReturn(VirtualVehicleState.FINISHED);
        when(vv1.getContinuation()).thenReturn(new byte[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10});
        when(vv1.getStartTime()).thenReturn(startTime);
        when(vv1.getEndTime()).thenReturn(endTime);

        ScriptableObject scriptableObject1 = new NativeObject();
        scriptableObject1.put("a", scriptableObject1, "a");
        scriptableObject1.put("b", scriptableObject1, null);
        scriptableObject1.put("c", scriptableObject1, Double.valueOf(3));
        scriptableObject1.put("d", scriptableObject1, Boolean.TRUE);
        scriptableObject1.put("e", scriptableObject1, Integer.valueOf(13));

        VirtualVehicleStorage storage1 = mock(VirtualVehicleStorage.class);
        when(storage1.getId()).thenReturn(1789);
        when(storage1.getVirtualVehicle()).thenReturn(vv1);
        when(storage1.getModificationTime()).thenReturn(modificationTime1);
        when(storage1.getName()).thenReturn("storage1");
        when(storage1.getContent()).thenReturn(scriptableObject1);
        when(storage1.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject1));

        ScriptableObject scriptableObject2 = new NativeObject();
        scriptableObject2.put("A", scriptableObject2, "A");
        scriptableObject2.put("B", scriptableObject2, scriptableObject1);
        scriptableObject2.put("C", scriptableObject2, scriptableObject1);
        scriptableObject2.put("D", scriptableObject2, scriptableObject1);
        scriptableObject2.put("E", scriptableObject2, scriptableObject1);
        scriptableObject2.put("F", scriptableObject2, scriptableObject1);
        scriptableObject2.put("G", scriptableObject2, scriptableObject1);

        VirtualVehicleStorage storage2 = mock(VirtualVehicleStorage.class);
        when(storage2.getId()).thenReturn(2789);
        when(storage2.getVirtualVehicle()).thenReturn(vv1);
        when(storage2.getModificationTime()).thenReturn(modificationTime2);
        when(storage2.getName()).thenReturn("storage2");
        when(storage2.getContent()).thenReturn(scriptableObject2);
        when(storage2.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject2));

        ScriptableObject scriptableObject3 = new NativeObject();
        scriptableObject3.put("f", scriptableObject3, "FFF");
        scriptableObject3.put("g", scriptableObject3, "GGGGG");
        scriptableObject3.put("h", scriptableObject3, "HH");
        scriptableObject3.put("i", scriptableObject3, "");
        scriptableObject3.put("j", scriptableObject3, "J");

        VirtualVehicleStorage storage3 = mock(VirtualVehicleStorage.class);
        when(storage3.getId()).thenReturn(3789);
        when(storage3.getVirtualVehicle()).thenReturn(vv1);
        when(storage3.getModificationTime()).thenReturn(modificationTime3);
        when(storage3.getName()).thenReturn("storage3");
        when(storage3.getContent()).thenReturn(scriptableObject3);
        when(storage3.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject3));

        ScriptableObject scriptableObject4 = null;

        VirtualVehicleStorage storage4 = mock(VirtualVehicleStorage.class);
        when(storage4.getId()).thenReturn(4789);
        when(storage4.getVirtualVehicle()).thenReturn(vv1);
        when(storage4.getModificationTime()).thenReturn(modificationTime4);
        when(storage4.getName()).thenReturn("storage4");
        when(storage4.getContent()).thenReturn(scriptableObject4);
        when(storage4.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject4));

        when(repo.findVirtualVehicleById(vv1.getId())).thenReturn(vv1);
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq((String) null), eq(1)))
            .thenReturn(Arrays.asList(storage1));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq(""), eq(1)))
            .thenReturn(Arrays.asList(storage1));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage1"), eq(1)))
            .thenReturn(Arrays.asList(storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage2"), eq(1)))
            .thenReturn(Arrays.asList(storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage3"), eq(1)))
            .thenReturn(Arrays.asList(storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq((String) null), eq(2)))
            .thenReturn(Arrays.asList(storage1, storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq(""), eq(2)))
            .thenReturn(Arrays.asList(storage1, storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage2"), eq(2)))
            .thenReturn(Arrays.asList(storage3, storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq((String) null), eq(3)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq(""), eq(3)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage3"), eq(3)))
            .thenReturn(Arrays.asList(storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq((String) null), eq(4)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3, storage4));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq(""), eq(4)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3, storage4));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv1.getId()), eq("storage4"), eq(4)))
            .thenReturn(new ArrayList<VirtualVehicleStorage>());
    }

    public void setUpVv2()
    {
        Date startTime = new Date();
        Date modificationTime1 = new Date(startTime.getTime() + 100);
        Date modificationTime2 = new Date(startTime.getTime() + 200);
        Date modificationTime3 = new Date(startTime.getTime() + 300);
        Date modificationTime4 = new Date(startTime.getTime() + 400);

        vv2 = mock(VirtualVehicle.class);
        when(vv2.getId()).thenReturn(VV_ID2);
        when(vv2.getUuid()).thenReturn("fec6ef21-6d90-4f4b-95cf-baf5a9000764");
        when(vv2.getName()).thenReturn("rv32");
        when(vv2.getApiVersion()).thenReturn(1);
        when(vv2.getCode()).thenReturn("the 2nd code");
        when(vv2.getState()).thenReturn(VirtualVehicleState.FINISHED);
        when(vv2.getContinuation()).thenReturn(null);
        when(vv2.getStartTime()).thenReturn(null);
        when(vv2.getEndTime()).thenReturn(null);

        ScriptableObject scriptableObject1 = new NativeObject();
        scriptableObject1.put("z", scriptableObject1, "a");
        scriptableObject1.put("y", scriptableObject1, null);
        scriptableObject1.put("x", scriptableObject1, Double.valueOf(3));
        scriptableObject1.put("w", scriptableObject1, Boolean.TRUE);
        scriptableObject1.put("v", scriptableObject1, Integer.valueOf(13));

        VirtualVehicleStorage storage1 = mock(VirtualVehicleStorage.class);
        when(storage1.getId()).thenReturn(1789);
        when(storage1.getVirtualVehicle()).thenReturn(vv2);
        when(storage1.getModificationTime()).thenReturn(modificationTime1);
        when(storage1.getName()).thenReturn("storage1");
        when(storage1.getContent()).thenReturn(scriptableObject1);
        when(storage1.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject1));

        ScriptableObject scriptableObject2 = new NativeObject();
        scriptableObject2.put("X", scriptableObject2, "Y");
        scriptableObject2.put("Y", scriptableObject2, scriptableObject1);
        scriptableObject2.put("Z", scriptableObject2, scriptableObject1);
        scriptableObject2.put("U", scriptableObject2, scriptableObject1);
        scriptableObject2.put("T", scriptableObject2, scriptableObject1);

        VirtualVehicleStorage storage2 = mock(VirtualVehicleStorage.class);
        when(storage2.getId()).thenReturn(2789);
        when(storage2.getVirtualVehicle()).thenReturn(vv2);
        when(storage2.getModificationTime()).thenReturn(modificationTime2);
        when(storage2.getName()).thenReturn("storage2");
        when(storage2.getContent()).thenReturn(scriptableObject2);
        when(storage2.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject2));

        ScriptableObject scriptableObject3 = new NativeObject();
        scriptableObject3.put("f", scriptableObject3, "FFF");
        scriptableObject3.put("g", scriptableObject3, "GGGGG");
        scriptableObject3.put("h", scriptableObject3, "h");
        scriptableObject3.put("i", scriptableObject3, "iiiiiiiiiiiiii");
        scriptableObject3.put("j", scriptableObject3, "jj");
        scriptableObject3.put("k", scriptableObject3, "kk");
        scriptableObject3.put("l", scriptableObject3, "lllll");
        scriptableObject3.put("m", scriptableObject3, "mm");

        VirtualVehicleStorage storage3 = mock(VirtualVehicleStorage.class);
        when(storage3.getId()).thenReturn(3789);
        when(storage3.getVirtualVehicle()).thenReturn(vv2);
        when(storage3.getModificationTime()).thenReturn(modificationTime3);
        when(storage3.getName()).thenReturn("storage3");
        when(storage3.getContent()).thenReturn(scriptableObject3);
        when(storage3.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject3));

        ScriptableObject scriptableObject4 = null;

        VirtualVehicleStorage storage4 = mock(VirtualVehicleStorage.class);
        when(storage4.getId()).thenReturn(4789);
        when(storage4.getVirtualVehicle()).thenReturn(vv2);
        when(storage4.getModificationTime()).thenReturn(modificationTime4);
        when(storage4.getName()).thenReturn("storage4");
        when(storage4.getContent()).thenReturn(scriptableObject4);
        when(storage4.getContentAsByteArray()).thenReturn(SerializationHelper.serialize(scriptableObject4));

        when(repo.findVirtualVehicleById(vv2.getId())).thenReturn(vv2);
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq((String) null), eq(1)))
            .thenReturn(Arrays.asList(storage1));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq(""), eq(1)))
            .thenReturn(Arrays.asList(storage1));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage1"), eq(1)))
            .thenReturn(Arrays.asList(storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage2"), eq(1)))
            .thenReturn(Arrays.asList(storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage3"), eq(1)))
            .thenReturn(Arrays.asList(storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq((String) null), eq(2)))
            .thenReturn(Arrays.asList(storage1, storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq(""), eq(2)))
            .thenReturn(Arrays.asList(storage1, storage2));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage2"), eq(2)))
            .thenReturn(Arrays.asList(storage3, storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq((String) null), eq(3)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq(""), eq(3)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage3"), eq(3)))
            .thenReturn(Arrays.asList(storage4));

        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq((String) null), eq(4)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3, storage4));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq(""), eq(4)))
            .thenReturn(Arrays.asList(storage1, storage2, storage3, storage4));
        when(repo.findStorageItemsByVirtualVehicle(eq(vv2.getId()), eq("storage4"), eq(4)))
            .thenReturn(new ArrayList<VirtualVehicleStorage>());
    }

    private void setUpDatabase()
    {
        virtualVehicleMap = new HashMap<String, VirtualVehicle>();
        virtualVehicleStorageMap = new HashMap<String, VirtualVehicleStorage>();

        when(repo.findAllVehicles()).thenAnswer(new Answer<List<VirtualVehicle>>()
        {
            @Override
            public List<VirtualVehicle> answer(InvocationOnMock invocation) throws Throwable
            {
                return Arrays.asList(virtualVehicleMap.values().toArray(new VirtualVehicle[0]));
            }
        });

        when(repo.findVirtualVehicleByUUID(anyString())).thenAnswer(new Answer<VirtualVehicle>()
        {
            @Override
            public VirtualVehicle answer(InvocationOnMock invocation) throws Throwable
            {
                Object[] args = invocation.getArguments();
                String uuid = (String) args[0];
                return virtualVehicleMap.get(uuid);
            }
        });

        doAnswer(new Answer<Object>()
        {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable
            {
                Object[] args = invocation.getArguments();
                Object o = args[0];

                if (o instanceof VirtualVehicle)
                {
                    VirtualVehicle vv = (VirtualVehicle) o;
                    virtualVehicleMap.put(vv.getUuid(), vv);
                }
                else if (o instanceof VirtualVehicleStorage)
                {
                    VirtualVehicleStorage s = (VirtualVehicleStorage) o;
                    virtualVehicleStorageMap.put(s.getName(), s);
                }
                else
                {
                    throw new IllegalStateException("Can not store objects of type " + o.getClass().getName());
                }
                return null;
            }
        }).when(session).saveOrUpdate(anyObject());

        when(repo.findStorageItemByVirtualVehicleAndName(any(VirtualVehicle.class), anyString()))
            .thenAnswer(new Answer<VirtualVehicleStorage>()
            {
                @Override
                public VirtualVehicleStorage answer(InvocationOnMock invocation) throws Throwable
                {
                    Object[] args = invocation.getArguments();
                    VirtualVehicle vv = (VirtualVehicle) args[0];
                    if (!virtualVehicleMap.containsKey(vv.getUuid()))
                    {
                        return null;
                    }

                    String name = (String) args[1];
                    return virtualVehicleStorageMap.get(name);
                }
            });

    }

    @DataProvider
    public Object[][] chunkDataProvider()
    {
        return new Object[][]{
            new Object[]{VV_ID1, 1, 5,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 8, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"vv/vv-continuation.js", 10, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 727, 1789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 2, "vvrte", "cpcc", "storage/storage1"},
                        new Object[]{"storage/storage2", 897, 2789, 2, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 3, "vvrte", "cpcc", "storage/storage2"},
                        new Object[]{"storage/storage3", 574, 3789, 3, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 4, "vvrte", "cpcc", "storage/storage3"},
                        new Object[]{"storage/storage4", 5, 4789, 4, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID1, 2, 3,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 8, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"vv/vv-continuation.js", 10, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 727, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 897, 2789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 2, "vvrte", "cpcc", "storage/storage2"},
                        new Object[]{"storage/storage3", 574, 3789, 2, "vvrte", "cpcc"},
                        new Object[]{"storage/storage4", 5, 4789, 2, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID1, 3, 3,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 8, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"vv/vv-continuation.js", 10, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 727, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 897, 2789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage3", 574, 3789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 188, 0, 2, "vvrte", "cpcc", "storage/storage3"},
                        new Object[]{"storage/storage4", 5, 4789, 2, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID1, 4, 2,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 172, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 8, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"vv/vv-continuation.js", 10, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 727, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 897, 2789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage3", 574, 3789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage4", 5, 4789, 1, "vvrte", "cpcc"},
                    }
                }
            },

            new Object[]{VV_ID2, 1, 5,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 12, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 726, 1789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 2, "vvrte", "cpcc", "storage/storage1"},
                        new Object[]{"storage/storage2", 854, 2789, 2, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 3, "vvrte", "cpcc", "storage/storage2"},
                        new Object[]{"storage/storage3", 655, 3789, 3, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 4, "vvrte", "cpcc", "storage/storage3"},
                        new Object[]{"storage/storage4", 5, 4789, 4, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID2, 2, 3,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 12, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 726, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 854, 2789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 2, "vvrte", "cpcc", "storage/storage2"},
                        new Object[]{"storage/storage3", 655, 3789, 2, "vvrte", "cpcc"},
                        new Object[]{"storage/storage4", 5, 4789, 2, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID2, 3, 3,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 12, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 726, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 854, 2789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage3", 655, 3789, 1, "vvrte", "cpcc"},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 140, 0, 2, "vvrte", "cpcc", "storage/storage3"},
                        new Object[]{"storage/storage4", 5, 4789, 2, "vvrte", "cpcc"},
                    }
                }
            },
            new Object[]{VV_ID2, 4, 2,
                new Object[]{
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 0, "vvrte", "cpcc", null},
                    },
                    new Object[]{
                        new Object[]{"vv/vv.properties", 124, 0, 1, "vvrte", "cpcc", null},
                        new Object[]{"vv/vv-source.js", 12, 0, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage1", 726, 1789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage2", 854, 2789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage3", 655, 3789, 1, "vvrte", "cpcc"},
                        new Object[]{"storage/storage4", 5, 4789, 1, "vvrte", "cpcc"},
                    }
                }
            },
        };
    }

    @Test(dataProvider = "chunkDataProvider")
    public void shouldZipVirtualVehicleToByteArray(int vvId, int chunkSize, int numberOfChunks, Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        byte[] firstChunk = migrator.findFirstChunk(vv);
        verifyChunk(params, factory, 0, firstChunk);

        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);
            if (chunkNumber == numberOfChunks - 1)
            {
                assertThat(vv.getState() == VirtualVehicleState.MIGRATION_COMPLETED);
            }

            verifyChunk(params, factory, chunkNumber, chunk);
        }
    }

    private void verifyChunk(Object[] params, ArchiveStreamFactory factory, int chunkNumber, byte[] chunk)
        throws ArchiveException, IOException
    {
        ByteArrayInputStream bis = new ByteArrayInputStream(chunk);
        ArchiveInputStream inStream = factory.createArchiveInputStream("tar", bis);

        Object[] chunkParams = (Object[]) params[chunkNumber];

        int entryNumber = 0;
        for (TarArchiveEntry entry = readEntry(inStream); entry != null; entry = readEntry(inStream), ++entryNumber)
        {
            byte[] content = IOUtils.toByteArray(inStream); // readContent(inStream);

            Object[] entryParams = (Object[]) chunkParams[entryNumber];

            String name = (String) entryParams[0];
            int length = (Integer) entryParams[1];
            int storageId = (Integer) entryParams[2];
            int chunkId = (Integer) entryParams[3];
            String userName = (String) entryParams[4];
            String groupName = (String) entryParams[5];

            assertThat(entry.getName())
                .overridingErrorMessage("Expected %s but was %s in chunk %d", name, entry.getName(), chunkNumber)
                .isNotNull().isEqualTo(name);
            assertThat(entry.getSize())
                .overridingErrorMessage("Expected %d but was %d in chunk %d", length, entry.getSize(), chunkNumber)
                .isNotNull().isEqualTo(length);
            assertThat(entry.getUserId()).isNotNull().isEqualTo(storageId);
            assertThat(entry.getGroupId()).isNotNull().isEqualTo(chunkId);
            assertThat(entry.getUserName()).isNotNull().isEqualTo(userName);
            assertThat(entry.getGroupName()).isNotNull().isEqualTo(groupName);
            assertThat(content.length).isEqualTo(length);
        }

        inStream.close();
        bis.close();
    }

    private TarArchiveEntry readEntry(ArchiveInputStream inStream) throws IOException
    {
        TarArchiveEntry entry = (TarArchiveEntry) inStream.getNextEntry();
        if (entry == null)
        {
            return null;
        }
        System.out.printf("entry: %s, l=%d, (%d, %d), (%s/%s) %d\n",
            entry.getName(),
            entry.getSize(),
            entry.getUserId(),
            entry.getGroupId(),
            entry.getUserName(),
            entry.getGroupName(),
            entry.getModTime().getTime()
            );
        return entry;
    }

    @Test(dataProvider = "chunkDataProvider")
    public void shouldStoreChunksInDatabase(int vvId, int chunkSize, int numberOfChunks, Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        byte[] firstChunk = migrator.findFirstChunk(vv);
        verifyChunk(params, factory, 0, firstChunk);
        migrator.storeChunk(new ByteArrayInputStream(firstChunk));

        assertThat(virtualVehicleMap.entrySet().size()).isEqualTo(1);
        assertThat(virtualVehicleStorageMap.entrySet().size()).isEqualTo(0);

        int storageEntries = 0;
        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);

            verifyChunk(params, factory, chunkNumber, chunk);

            migrator.storeChunk(new ByteArrayInputStream(chunk));
            assertThat(virtualVehicleMap.entrySet().size()).isEqualTo(1);

            for (int k = 0, l = ((Object[]) params[chunkNumber]).length; k < l; ++k)
            {
                String name = (String) ((Object[]) ((Object[]) params[chunkNumber])[k])[0];
                if (name.startsWith("storage/"))
                {
                    ++storageEntries;
                }
            }

            int actualEntries = virtualVehicleStorageMap.entrySet().size();
            assertThat(virtualVehicleStorageMap.entrySet().size())
                .overridingErrorMessage("Expected %d but was %d in chunk %d",
                    storageEntries, actualEntries, chunkNumber)
                .isEqualTo(storageEntries);
        }
    }

    private static void appendEntryToStream(String entryName, byte[] content, ArchiveOutputStream os)
        throws IOException
    {
        TarArchiveEntry entry = new TarArchiveEntry(entryName);
        entry.setModTime(new Date());
        entry.setSize(content.length);
        entry.setIds(0, 0);
        entry.setNames("vvrte", "cpcc");

        os.putArchiveEntry(entry);
        os.write(content);
        os.closeArchiveEntry();
    }

    @DataProvider
    public Object[][] unknownEntryTypeDataProvider()
    {
        return new Object[][]{
            new Object[]{"unknown", new byte[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}},
            new Object[]{"unknown/unknown", new byte[]{9, 8, 7, 6, 5, 4, 3, 2, 1, 0}},
        };
    }

    @Test(dataProvider = "unknownEntryTypeDataProvider", expectedExceptions = {IOException.class},
        expectedExceptionsMessageRegExp = "Can not store unknown type of entry .*")
    public void shouldThrowIOEOnUnknownEntryType(String entryName, byte[] content) throws ArchiveException, IOException
    {
        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ArchiveOutputStream os = factory.createArchiveOutputStream("tar", baos);

        appendEntryToStream(entryName, content, os);
        os.close();
        baos.close();

        byte[] chunk = baos.toByteArray();

        migrator.storeChunk(new ByteArrayInputStream(chunk));
    }

    @DataProvider
    public Object[][] unknownVirtualVehicleEntryDataProvider()
    {
        return new Object[][]{
            new Object[]{"vv/lala", new byte[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}},
            new Object[]{"vv/unknown", new byte[]{9, 8, 7, 6, 5, 4, 3, 2, 1, 0}},
        };
    }

    @Test(dataProvider = "unknownVirtualVehicleEntryDataProvider", expectedExceptions = {IOException.class},
        expectedExceptionsMessageRegExp = "Can not store unknown virtual vehicle entry .*")
    public void shouldThrowIOEOnUnknownVirtualVehicleEntry(String entryName, byte[] content) throws ArchiveException,
        IOException
    {
        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ArchiveOutputStream os = factory.createArchiveOutputStream("tar", baos);

        appendEntryToStream(entryName, content, os);
        os.close();
        baos.close();

        byte[] chunk = baos.toByteArray();

        migrator.storeChunk(new ByteArrayInputStream(chunk));
    }

    @Test(dataProvider = "chunkDataProvider")
    public void shouldOverwriteExistingStorageEntries(int vvId, int chunkSize, int numberOfChunks, Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();

        VirtualVehicleStorage st1 = new VirtualVehicleStorage();
        st1.setId(1);
        st1.setName("storage1");
        st1.setModificationTime(new Date(1000));
        st1.setContentAsByteArray(new byte[]{0});
        st1.setVirtualVehicle(vv);
        virtualVehicleStorageMap.put("storage1", st1);

        VirtualVehicleStorage st2 = new VirtualVehicleStorage();
        st2.setId(2);
        st2.setName("storage2");
        st2.setModificationTime(new Date(2000));
        st2.setContentAsByteArray(new byte[]{0, 1});
        st2.setVirtualVehicle(vv);
        virtualVehicleStorageMap.put("storage2", st2);

        VirtualVehicleStorage st3 = new VirtualVehicleStorage();
        st3.setId(3);
        st3.setName("storage3");
        st3.setModificationTime(new Date(3000));
        st3.setContentAsByteArray(new byte[]{0, 1, 2});
        st3.setVirtualVehicle(vv);
        virtualVehicleStorageMap.put("storage3", st3);

        VirtualVehicleStorage st4 = new VirtualVehicleStorage();
        st4.setId(4);
        st4.setName("storage4");
        st4.setModificationTime(new Date(4000));
        st4.setContentAsByteArray(new byte[]{0, 1, 2, 3});
        st4.setVirtualVehicle(vv);
        virtualVehicleStorageMap.put("storage4", st4);

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        assertThat(virtualVehicleStorageMap.entrySet().size()).isEqualTo(4);

        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);

            verifyChunk(params, factory, chunkNumber, chunk);

            migrator.storeChunk(new ByteArrayInputStream(chunk));

            for (int k = 0, l = ((Object[]) params[chunkNumber]).length; k < l; ++k)
            {
                String name = (String) ((Object[]) ((Object[]) params[chunkNumber])[k])[0];
                if (name.startsWith("storage/storage"))
                {
                    int n = Integer.parseInt(name.substring(15));
                    VirtualVehicleStorage storage = null;
                    switch (n)
                    {
                        case 1:
                            storage = st1;
                            assertThat(storage.getContent().size()).isNotEqualTo(n);
                            break;
                        case 2:
                            storage = st2;
                            assertThat(storage.getContent().size()).isNotEqualTo(n);
                            break;
                        case 3:
                            storage = st3;
                            assertThat(storage.getContent().size()).isNotEqualTo(n);
                            break;
                        case 4:
                            storage = st4;
                            assertThat(storage.getContent()).isNull();
                            break;
                        default:
                            break;
                    }

                    assertThat(storage.getModificationTime()).isNotEqualTo(new Date(n * 1000));
                    assertThat(storage.getVirtualVehicle()).isEqualTo(vv);
                }
            }
        }
    }

    @Test(dataProvider = "chunkDataProvider", expectedExceptions = {IOException.class},
        expectedExceptionsMessageRegExp = "Virtual vehicle \\S+ (\\S+) has not state MIGRATING but FINISHED")
    public void shouldThrowIOEOnWrongVirtualVehicleState(int vvId, int chunkSize, int numberOfChunks, Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();
        vv.setState(VirtualVehicleState.DEFECTIVE);

        virtualVehicleMap.put(vv.getUuid(), vv);

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);

            verifyChunk(params, factory, chunkNumber, chunk);

            migrator.storeChunk(new ByteArrayInputStream(chunk));
        }
    }

    @Test(dataProvider = "chunkDataProvider", expectedExceptions = {IOException.class},
        expectedExceptionsMessageRegExp = "Virtual vehicle \\S+ (\\S+) is being migrated "
            + "and can not be a migration target.")
    public void shouldThrowIOEIfVirtualVehicleIsBeingMigrated(int vvId, int chunkSize, int numberOfChunks,
        Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        when(vv1.getState()).thenReturn(VirtualVehicleState.MIGRATING);
        when(vv1.getMigrationDestination()).thenReturn(new RealVehicle());
        when(vv2.getState()).thenReturn(VirtualVehicleState.MIGRATING);
        when(vv2.getMigrationDestination()).thenReturn(new RealVehicle());

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();

        virtualVehicleMap.put(vv.getUuid(), vv);

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);

            verifyChunk(params, factory, chunkNumber, chunk);

            migrator.storeChunk(new ByteArrayInputStream(chunk));
        }
    }

    @Test(dataProvider = "chunkDataProvider")
    public void shouldMigrateVirtualVehicleToRemoteRealVehicle(int vvId, int chunkSize, int numberOfChunks,
        Object[] params)
        throws IOException, ArchiveException
    {
        when(paramChunkSize.getValue()).thenReturn(Integer.toString(chunkSize));

        VirtualVehicle vv = repo.findVirtualVehicleById(vvId);
        assertThat(vv).isNotNull();

        ArchiveStreamFactory factory = new ArchiveStreamFactory();
        factory.setEntryEncoding("UTF-8");

        byte[] firstChunk = migrator.findFirstChunk(vv);
        verifyChunk(params, factory, 0, firstChunk);

        for (int chunkNumber = 1; chunkNumber < numberOfChunks; ++chunkNumber)
        {
            String lastStorageName = (String) ((Object[]) ((Object[]) params[chunkNumber])[0])[6];
            byte[] chunk = migrator.findChunk(vv, lastStorageName, chunkNumber);

            verifyChunk(params, factory, chunkNumber, chunk);
        }
    }
}
