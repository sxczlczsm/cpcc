INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (1,'Altimeter',current_timestamp,'std_msgs/Float32',null,'ALTIMETER','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (2,'Area of Operations',current_timestamp,'std_msgs/Float32',null,'AREA_OF_OPERATIONS','PRIVILEGED_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (3,'Barometer',current_timestamp,'std_msgs/Float32',null,'BAROMETER','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (4,'Battery',current_timestamp,'std_msgs/Float32',null,'BATTERY','PRIVILEGED_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (5,'Belly Mounted Camera 640x480',current_timestamp,'sensor_msgs/Image','width=640 height=480 yaw=0 down=1.571 alignment=''north''','CAMERA','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (7,'CO2',current_timestamp,'std_msgs/Float32',null,'CO2','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (9,'GPS',current_timestamp,'sensor_msgs/NavSatFix',null,'GPS','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (10,'Hardware',current_timestamp,'std_msgs/Float32',null,'HARDWARE','PRIVILEGED_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (11,'NOx',current_timestamp,'std_msgs/Float32',null,'NOX','ALL_VV',0);
INSERT INTO SENSOR_DEFINITIONS (ID,DESCRIPTION,LAST_UPDATE,MESSAGE_TYPE,PARAMETERS,TYPE,VISIBILITY,DELETED)
VALUES (12,'Thermometer',current_timestamp,'std_msgs/Float32',null,'THERMOMETER','ALL_VV',0);

INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 1,current_timestamp,'GS01','http://localhost:8000','GROUND_STATION','{"type":"FeatureCollection","properties":{"center":[13.040811717510222,47.821922207617014],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040811717510222,47.821922207617014]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 2,current_timestamp,'RV01','http://localhost:8010','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82009916391517],[13.037789752707795,47.82054832155723],[13.038458678912905,47.82054832155723],[13.038458678912905,47.82009916391517],[13.037789752707795,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (11,current_timestamp,'RV10','http://localhost:8100','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82054832155723],[13.037789752707795,47.82099747919929],[13.038458678912905,47.82099747919929],[13.038458678912905,47.82054832155723],[13.037789752707795,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (20,current_timestamp,'RV19','http://localhost:8190','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82099747919929],[13.037789752707795,47.82144663684135],[13.038458678912905,47.82144663684135],[13.038458678912905,47.82099747919929],[13.037789752707795,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (29,current_timestamp,'RV28','http://localhost:8280','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82144663684135],[13.037789752707795,47.82189579448341],[13.038458678912905,47.82189579448341],[13.038458678912905,47.82144663684135],[13.037789752707795,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (38,current_timestamp,'RV37','http://localhost:8370','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82189579448341],[13.037789752707795,47.822344952125476],[13.038458678912905,47.822344952125476],[13.038458678912905,47.82189579448341],[13.037789752707795,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (47,current_timestamp,'RV46','http://localhost:8460','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.822344952125476],[13.037789752707795,47.82279410976753],[13.038458678912905,47.82279410976753],[13.038458678912905,47.822344952125476],[13.037789752707795,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (56,current_timestamp,'RV55','http://localhost:8550','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.82279410976753],[13.037789752707795,47.823243267409595],[13.038458678912905,47.823243267409595],[13.038458678912905,47.82279410976753],[13.037789752707795,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (65,current_timestamp,'RV64','http://localhost:8640','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.823243267409595],[13.037789752707795,47.823692425051654],[13.038458678912905,47.823692425051654],[13.038458678912905,47.823243267409595],[13.037789752707795,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (74,current_timestamp,'RV73','http://localhost:8730','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038124215810349,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.037789752707795,47.823692425051654],[13.037789752707795,47.82414158269371],[13.038458678912905,47.82414158269371],[13.038458678912905,47.823692425051654],[13.037789752707795,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038124215810349,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 3,current_timestamp,'RV02','http://localhost:8020','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82009916391517],[13.038458678912905,47.82054832155723],[13.039127605118011,47.82054832155723],[13.039127605118011,47.82009916391517],[13.038458678912905,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (12,current_timestamp,'RV11','http://localhost:8110','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82054832155723],[13.038458678912905,47.82099747919929],[13.039127605118011,47.82099747919929],[13.039127605118011,47.82054832155723],[13.038458678912905,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (21,current_timestamp,'RV20','http://localhost:8200','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82099747919929],[13.038458678912905,47.82144663684135],[13.039127605118011,47.82144663684135],[13.039127605118011,47.82099747919929],[13.038458678912905,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (30,current_timestamp,'RV29','http://localhost:8290','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82144663684135],[13.038458678912905,47.82189579448341],[13.039127605118011,47.82189579448341],[13.039127605118011,47.82144663684135],[13.038458678912905,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (39,current_timestamp,'RV38','http://localhost:8380','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82189579448341],[13.038458678912905,47.822344952125476],[13.039127605118011,47.822344952125476],[13.039127605118011,47.82189579448341],[13.038458678912905,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (48,current_timestamp,'RV47','http://localhost:8470','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.822344952125476],[13.038458678912905,47.82279410976753],[13.039127605118011,47.82279410976753],[13.039127605118011,47.822344952125476],[13.038458678912905,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (57,current_timestamp,'RV56','http://localhost:8560','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.82279410976753],[13.038458678912905,47.823243267409595],[13.039127605118011,47.823243267409595],[13.039127605118011,47.82279410976753],[13.038458678912905,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (66,current_timestamp,'RV65','http://localhost:8650','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.823243267409595],[13.038458678912905,47.823692425051654],[13.039127605118011,47.823692425051654],[13.039127605118011,47.823243267409595],[13.038458678912905,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (75,current_timestamp,'RV74','http://localhost:8740','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.038793142015457,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.038458678912905,47.823692425051654],[13.038458678912905,47.82414158269371],[13.039127605118011,47.82414158269371],[13.039127605118011,47.823692425051654],[13.038458678912905,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.038793142015457,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 4,current_timestamp,'RV03','http://localhost:8030','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82009916391517],[13.039127605118011,47.82054832155723],[13.039796531323123,47.82054832155723],[13.039796531323123,47.82009916391517],[13.039127605118011,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (13,current_timestamp,'RV12','http://localhost:8120','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82054832155723],[13.039127605118011,47.82099747919929],[13.039796531323123,47.82099747919929],[13.039796531323123,47.82054832155723],[13.039127605118011,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (22,current_timestamp,'RV21','http://localhost:8210','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82099747919929],[13.039127605118011,47.82144663684135],[13.039796531323123,47.82144663684135],[13.039796531323123,47.82099747919929],[13.039127605118011,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (31,current_timestamp,'RV30','http://localhost:8300','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82144663684135],[13.039127605118011,47.82189579448341],[13.039796531323123,47.82189579448341],[13.039796531323123,47.82144663684135],[13.039127605118011,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (40,current_timestamp,'RV39','http://localhost:8390','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82189579448341],[13.039127605118011,47.822344952125476],[13.039796531323123,47.822344952125476],[13.039796531323123,47.82189579448341],[13.039127605118011,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (49,current_timestamp,'RV48','http://localhost:8480','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.822344952125476],[13.039127605118011,47.82279410976753],[13.039796531323123,47.82279410976753],[13.039796531323123,47.822344952125476],[13.039127605118011,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (58,current_timestamp,'RV57','http://localhost:8570','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.82279410976753],[13.039127605118011,47.823243267409595],[13.039796531323123,47.823243267409595],[13.039796531323123,47.82279410976753],[13.039127605118011,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (67,current_timestamp,'RV66','http://localhost:8660','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.823243267409595],[13.039127605118011,47.823692425051654],[13.039796531323123,47.823692425051654],[13.039796531323123,47.823243267409595],[13.039127605118011,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (76,current_timestamp,'RV75','http://localhost:8750','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.039462068220567,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039127605118011,47.823692425051654],[13.039127605118011,47.82414158269371],[13.039796531323123,47.82414158269371],[13.039796531323123,47.823692425051654],[13.039127605118011,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.039462068220567,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 5,current_timestamp,'RV04','http://localhost:8040','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82009916391517],[13.039796531323123,47.82054832155723],[13.040465457528231,47.82054832155723],[13.040465457528231,47.82009916391517],[13.039796531323123,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (14,current_timestamp,'RV13','http://localhost:8130','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82054832155723],[13.039796531323123,47.82099747919929],[13.040465457528231,47.82099747919929],[13.040465457528231,47.82054832155723],[13.039796531323123,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (23,current_timestamp,'RV22','http://localhost:8220','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82099747919929],[13.039796531323123,47.82144663684135],[13.040465457528231,47.82144663684135],[13.040465457528231,47.82099747919929],[13.039796531323123,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (32,current_timestamp,'RV31','http://localhost:8310','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82144663684135],[13.039796531323123,47.82189579448341],[13.040465457528231,47.82189579448341],[13.040465457528231,47.82144663684135],[13.039796531323123,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (41,current_timestamp,'RV40','http://localhost:8400','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82189579448341],[13.039796531323123,47.822344952125476],[13.040465457528231,47.822344952125476],[13.040465457528231,47.82189579448341],[13.039796531323123,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (50,current_timestamp,'RV49','http://localhost:8490','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.822344952125476],[13.039796531323123,47.82279410976753],[13.040465457528231,47.82279410976753],[13.040465457528231,47.822344952125476],[13.039796531323123,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (59,current_timestamp,'RV58','http://localhost:8580','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.82279410976753],[13.039796531323123,47.823243267409595],[13.040465457528231,47.823243267409595],[13.040465457528231,47.82279410976753],[13.039796531323123,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (68,current_timestamp,'RV67','http://localhost:8670','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.823243267409595],[13.039796531323123,47.823692425051654],[13.040465457528231,47.823692425051654],[13.040465457528231,47.823243267409595],[13.039796531323123,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (77,current_timestamp,'RV76','http://localhost:8760','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040130994425677,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.039796531323123,47.823692425051654],[13.039796531323123,47.82414158269371],[13.040465457528231,47.82414158269371],[13.040465457528231,47.823692425051654],[13.039796531323123,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040130994425677,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 6,current_timestamp,'RV05','http://localhost:8050','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82009916391517],[13.040465457528231,47.82054832155723],[13.041134383733338,47.82054832155723],[13.041134383733338,47.82009916391517],[13.040465457528231,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (15,current_timestamp,'RV14','http://localhost:8140','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82054832155723],[13.040465457528231,47.82099747919929],[13.041134383733338,47.82099747919929],[13.041134383733338,47.82054832155723],[13.040465457528231,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (24,current_timestamp,'RV23','http://localhost:8230','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82099747919929],[13.040465457528231,47.82144663684135],[13.041134383733338,47.82144663684135],[13.041134383733338,47.82099747919929],[13.040465457528231,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (33,current_timestamp,'RV32','http://localhost:8320','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82144663684135],[13.040465457528231,47.82189579448341],[13.041134383733338,47.82189579448341],[13.041134383733338,47.82144663684135],[13.040465457528231,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (42,current_timestamp,'RV41','http://localhost:8410','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82189579448341],[13.040465457528231,47.822344952125476],[13.041134383733338,47.822344952125476],[13.041134383733338,47.82189579448341],[13.040465457528231,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (51,current_timestamp,'RV50','http://localhost:8500','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.822344952125476],[13.040465457528231,47.82279410976753],[13.041134383733338,47.82279410976753],[13.041134383733338,47.822344952125476],[13.040465457528231,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (60,current_timestamp,'RV59','http://localhost:8590','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.82279410976753],[13.040465457528231,47.823243267409595],[13.041134383733338,47.823243267409595],[13.041134383733338,47.82279410976753],[13.040465457528231,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (69,current_timestamp,'RV68','http://localhost:8680','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.823243267409595],[13.040465457528231,47.823692425051654],[13.041134383733338,47.823692425051654],[13.041134383733338,47.823243267409595],[13.040465457528231,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (78,current_timestamp,'RV77','http://localhost:8770','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.040799920630784,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.040465457528231,47.823692425051654],[13.040465457528231,47.82414158269371],[13.041134383733338,47.82414158269371],[13.041134383733338,47.823692425051654],[13.040465457528231,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.040799920630784,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 7,current_timestamp,'RV06','http://localhost:8060','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82009916391517],[13.041134383733338,47.82054832155723],[13.04180330993845,47.82054832155723],[13.04180330993845,47.82009916391517],[13.041134383733338,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (16,current_timestamp,'RV15','http://localhost:8150','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82054832155723],[13.041134383733338,47.82099747919929],[13.04180330993845,47.82099747919929],[13.04180330993845,47.82054832155723],[13.041134383733338,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (25,current_timestamp,'RV24','http://localhost:8240','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82099747919929],[13.041134383733338,47.82144663684135],[13.04180330993845,47.82144663684135],[13.04180330993845,47.82099747919929],[13.041134383733338,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (34,current_timestamp,'RV33','http://localhost:8330','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82144663684135],[13.041134383733338,47.82189579448341],[13.04180330993845,47.82189579448341],[13.04180330993845,47.82144663684135],[13.041134383733338,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (43,current_timestamp,'RV42','http://localhost:8420','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82189579448341],[13.041134383733338,47.822344952125476],[13.04180330993845,47.822344952125476],[13.04180330993845,47.82189579448341],[13.041134383733338,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (52,current_timestamp,'RV51','http://localhost:8510','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.822344952125476],[13.041134383733338,47.82279410976753],[13.04180330993845,47.82279410976753],[13.04180330993845,47.822344952125476],[13.041134383733338,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (61,current_timestamp,'RV60','http://localhost:8600','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.82279410976753],[13.041134383733338,47.823243267409595],[13.04180330993845,47.823243267409595],[13.04180330993845,47.82279410976753],[13.041134383733338,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (70,current_timestamp,'RV69','http://localhost:8690','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.823243267409595],[13.041134383733338,47.823692425051654],[13.04180330993845,47.823692425051654],[13.04180330993845,47.823243267409595],[13.041134383733338,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (79,current_timestamp,'RV78','http://localhost:8780','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.041468846835896,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.041134383733338,47.823692425051654],[13.041134383733338,47.82414158269371],[13.04180330993845,47.82414158269371],[13.04180330993845,47.823692425051654],[13.041134383733338,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.041468846835896,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 8,current_timestamp,'RV07','http://localhost:8070','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82009916391517],[13.04180330993845,47.82054832155723],[13.042472236143556,47.82054832155723],[13.042472236143556,47.82009916391517],[13.04180330993845,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (17,current_timestamp,'RV16','http://localhost:8160','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82054832155723],[13.04180330993845,47.82099747919929],[13.042472236143556,47.82099747919929],[13.042472236143556,47.82054832155723],[13.04180330993845,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (26,current_timestamp,'RV25','http://localhost:8250','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82099747919929],[13.04180330993845,47.82144663684135],[13.042472236143556,47.82144663684135],[13.042472236143556,47.82099747919929],[13.04180330993845,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (35,current_timestamp,'RV34','http://localhost:8340','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82144663684135],[13.04180330993845,47.82189579448341],[13.042472236143556,47.82189579448341],[13.042472236143556,47.82144663684135],[13.04180330993845,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (44,current_timestamp,'RV43','http://localhost:8430','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82189579448341],[13.04180330993845,47.822344952125476],[13.042472236143556,47.822344952125476],[13.042472236143556,47.82189579448341],[13.04180330993845,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (53,current_timestamp,'RV52','http://localhost:8520','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.822344952125476],[13.04180330993845,47.82279410976753],[13.042472236143556,47.82279410976753],[13.042472236143556,47.822344952125476],[13.04180330993845,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (62,current_timestamp,'RV61','http://localhost:8610','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.82279410976753],[13.04180330993845,47.823243267409595],[13.042472236143556,47.823243267409595],[13.042472236143556,47.82279410976753],[13.04180330993845,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (71,current_timestamp,'RV70','http://localhost:8700','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.823243267409595],[13.04180330993845,47.823692425051654],[13.042472236143556,47.823692425051654],[13.042472236143556,47.823243267409595],[13.04180330993845,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (80,current_timestamp,'RV79','http://localhost:8790','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.042137773041004,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.04180330993845,47.823692425051654],[13.04180330993845,47.82414158269371],[13.042472236143556,47.82414158269371],[13.042472236143556,47.823692425051654],[13.04180330993845,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.042137773041004,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES ( 9,current_timestamp,'RV08','http://localhost:8080','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82009916391517],[13.042472236143556,47.82054832155723],[13.043141162348666,47.82054832155723],[13.043141162348666,47.82009916391517],[13.042472236143556,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (18,current_timestamp,'RV17','http://localhost:8170','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82054832155723],[13.042472236143556,47.82099747919929],[13.043141162348666,47.82099747919929],[13.043141162348666,47.82054832155723],[13.042472236143556,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (27,current_timestamp,'RV26','http://localhost:8260','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82099747919929],[13.042472236143556,47.82144663684135],[13.043141162348666,47.82144663684135],[13.043141162348666,47.82099747919929],[13.042472236143556,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (36,current_timestamp,'RV35','http://localhost:8350','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82144663684135],[13.042472236143556,47.82189579448341],[13.043141162348666,47.82189579448341],[13.043141162348666,47.82144663684135],[13.042472236143556,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (45,current_timestamp,'RV44','http://localhost:8440','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82189579448341],[13.042472236143556,47.822344952125476],[13.043141162348666,47.822344952125476],[13.043141162348666,47.82189579448341],[13.042472236143556,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (54,current_timestamp,'RV53','http://localhost:8530','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.822344952125476],[13.042472236143556,47.82279410976753],[13.043141162348666,47.82279410976753],[13.043141162348666,47.822344952125476],[13.042472236143556,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (63,current_timestamp,'RV62','http://localhost:8620','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.82279410976753],[13.042472236143556,47.823243267409595],[13.043141162348666,47.823243267409595],[13.043141162348666,47.82279410976753],[13.042472236143556,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (72,current_timestamp,'RV71','http://localhost:8710','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.823243267409595],[13.042472236143556,47.823692425051654],[13.043141162348666,47.823692425051654],[13.043141162348666,47.823243267409595],[13.042472236143556,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (81,current_timestamp,'RV80','http://localhost:8800','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04280669924611,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.042472236143556,47.823692425051654],[13.042472236143556,47.82414158269371],[13.043141162348666,47.82414158269371],[13.043141162348666,47.823692425051654],[13.042472236143556,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04280669924611,47.82391700387267]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (10,current_timestamp,'RV09','http://localhost:8090','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.82032374273621],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82009916391517],[13.043141162348666,47.82054832155723],[13.043810088553776,47.82054832155723],[13.043810088553776,47.82009916391517],[13.043141162348666,47.82009916391517]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.82032374273621]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (19,current_timestamp,'RV18','http://localhost:8180','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.82077290037826],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82054832155723],[13.043141162348666,47.82099747919929],[13.043810088553776,47.82099747919929],[13.043810088553776,47.82054832155723],[13.043141162348666,47.82054832155723]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.82077290037826]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (28,current_timestamp,'RV27','http://localhost:8270','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.82122205802032],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82099747919929],[13.043141162348666,47.82144663684135],[13.043810088553776,47.82144663684135],[13.043810088553776,47.82099747919929],[13.043141162348666,47.82099747919929]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.82122205802032]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (37,current_timestamp,'RV36','http://localhost:8360','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.821671215662384],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82144663684135],[13.043141162348666,47.82189579448341],[13.043810088553776,47.82189579448341],[13.043810088553776,47.82144663684135],[13.043141162348666,47.82144663684135]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.821671215662384]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (46,current_timestamp,'RV45','http://localhost:8450','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.822120373304436],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82189579448341],[13.043141162348666,47.822344952125476],[13.043810088553776,47.822344952125476],[13.043810088553776,47.82189579448341],[13.043141162348666,47.82189579448341]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.822120373304436]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (55,current_timestamp,'RV54','http://localhost:8540','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.8225695309465],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.822344952125476],[13.043141162348666,47.82279410976753],[13.043810088553776,47.82279410976753],[13.043810088553776,47.822344952125476],[13.043141162348666,47.822344952125476]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.8225695309465]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (64,current_timestamp,'RV63','http://localhost:8630','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.823018688588554],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.82279410976753],[13.043141162348666,47.823243267409595],[13.043810088553776,47.823243267409595],[13.043810088553776,47.82279410976753],[13.043141162348666,47.82279410976753]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.823018688588554]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (73,current_timestamp,'RV72','http://localhost:8720','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.82346784623062],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.823243267409595],[13.043141162348666,47.823692425051654],[13.043810088553776,47.823692425051654],[13.043810088553776,47.823243267409595],[13.043141162348666,47.823243267409595]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.82346784623062]}}]}',0);
INSERT INTO REAL_VEHICLES (ID,LAST_UPDATE,NAME,URL,TYPE,AREA_OF_OPERATION,DELETED)
VALUES (82,current_timestamp,'RV81','http://localhost:8810','QUADROCOPTER','{"type":"FeatureCollection","properties":{"center":[13.04347562545122,47.82391700387267],"zoom":18,"layer":"No map"},"features":[{"type":"Feature","properties":{"maxAlt":60.0,"minAlt":0.0},"geometry":{"type":"Polygon","coordinates":[[[13.043141162348666,47.823692425051654],[13.043141162348666,47.82414158269371],[13.043810088553776,47.82414158269371],[13.043810088553776,47.823692425051654],[13.043141162348666,47.823692425051654]]]}},{"type":"Feature","properties":{"type":"depot"},"geometry":{"type":"Point","coordinates":[13.04347562545122,47.82391700387267]}}]}',0);

INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 1, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 2, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 2, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 2, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (11, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (11, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (11, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (20, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (20, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (20, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (29, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (29, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (29, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (38, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (38, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (38, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (47, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (47, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (47, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (56, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (56, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (56, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (65, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (65, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (65, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (74, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (74, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (74, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 3, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 3, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 3, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (12, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (12, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (12, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (21, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (21, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (21, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (30, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (30, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (30, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (39, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (39, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (39, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (48, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (48, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (48, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (57, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (57, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (57, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (66, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (66, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (66, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (75, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (75, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (75, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 4, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 4, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 4, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (13, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (13, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (13, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (22, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (22, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (22, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (31, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (31, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (31, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (40, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (40, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (40, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (49, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (49, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (49, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (58, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (58, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (58, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (67, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (67, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (67, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (76, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (76, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (76, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 5, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 5, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 5, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (14, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (14, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (14, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (23, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (23, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (23, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (32, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (32, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (32, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (41, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (41, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (41, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (50, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (50, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (50, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (59, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (59, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (59, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (68, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (68, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (68, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (77, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (77, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (77, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 6, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 6, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 6, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (15, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (15, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (15, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (24, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (24, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (24, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (33, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (33, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (33, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (42, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (42, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (42, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (51, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (51, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (51, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (60, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (60, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (60, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (69, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (69, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (69, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (78, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (78, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (78, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 7, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 7, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 7, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (16, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (16, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (16, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (25, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (25, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (25, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (34, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (34, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (34, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (43, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (43, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (43, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (52, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (52, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (52, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (61, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (61, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (61, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (70, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (70, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (70, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (79, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (79, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (79, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 8, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 8, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 8, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (17, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (17, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (17, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (26, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (26, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (26, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (35, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (35, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (35, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (44, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (44, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (44, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (53, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (53, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (53, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (62, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (62, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (62, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (71, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (71, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (71, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (80, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (80, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (80, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 9, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 9, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES ( 9, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (18, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (18, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (18, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (27, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (27, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (27, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (36, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (36, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (36, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (45, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (45, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (45, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (54, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (54, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (54, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (63, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (63, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (63, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (72, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (72, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (72, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (81, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (81, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (81, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (10, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (10, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (10, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (19, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (19, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (19, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (28, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (28, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (28, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (37, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (37, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (37, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (46, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (46, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (46, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (55, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (55, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (55, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (64, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (64, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (64, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (73, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (73, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (73, 9);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (82, 1);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (82, 5);
INSERT INTO REAL_VEHICLES_SENSOR_DEFINITIONS (REAL_VEHICLES_ID,SENSORS_ID) VALUES (82, 9);

