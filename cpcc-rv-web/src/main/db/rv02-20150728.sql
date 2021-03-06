
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (1,'at.uni_salzburg.cs.cpcc.ros.sensors.ImageSensorAdapter','CAMERA','sensor_msgs/Image','PUBLISHER','image');
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (2,'at.uni_salzburg.cs.cpcc.ros.sensors.CameraInfoSensorAdapter','CAMERA_INFO','sensor_msgs/CameraInfo','PUBLISHER','camera_info');
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (3,'at.uni_salzburg.cs.cpcc.ros.sensors.GpsSensorAdapter','GPS_POSITION_PROVIDER','sensor_msgs/NavSatFix','PUBLISHER',null);
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (4,'at.uni_salzburg.cs.cpcc.ros.actuators.SimpleWayPointControllerAdapter','WAYPOINT_CONTROLLER','big_actor_msgs/LatLngAlt','SUBSCRIBER',null);
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (5,'at.uni_salzburg.cs.cpcc.ros.sensors.GpsSensorAdapter','GPS_POSITION_PROVIDER','sensor_msgs/NavSatFix','PUBLISHER','gps');
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (6,'at.uni_salzburg.cs.cpcc.ros.actuators.SimpleWayPointControllerAdapter','WAYPOINT_CONTROLLER','big_actor_msgs/LatLngAlt','SUBSCRIBER','waypoint');
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (7,'at.uni_salzburg.cs.cpcc.ros.sensors.AltimeterAdapter','ALTITUDE_OVER_GROUND','std_msgs/Float32','PUBLISHER','sonar');
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (8,'at.uni_salzburg.cs.cpcc.ros.actuators.MorseWayPointControllerAdapter','WAYPOINT_CONTROLLER','big_actor_msgs/LatLngAlt','SUBSCRIBER',null);
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (9,'at.uni_salzburg.cs.cpcc.ros.sensors.MorseGpsSensorAdapter','GPS_POSITION_PROVIDER','sensor_msgs/NavSatFix','PUBLISHER',null);
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (10,'at.uni_salzburg.cs.cpcc.ros.sensors.AltimeterAdapter','ALTITUDE_OVER_GROUND','std_msgs/Float32','PUBLISHER',null);
INSERT INTO TOPIC (ID,ADAPTERCLASSNAME,CATEGORY,MESSAGETYPE,NODETYPE,SUBPATH) VALUES (11,'at.uni_salzburg.cs.cpcc.ros.sensors.ImageSensorAdapter','CAMERA','sensor_msgs/Image','PUBLISHER','image_raw');

INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (1,'at.uni_salzburg.cs.cpcc.ros.sim.osm.NodeGroup','Simulated Belly Mounted Camera',1);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (2,null,'GPS Receiver',3);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (3,null,'Simple Waypoint Controller',4);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (4,'at.uni_salzburg.cs.cpcc.ros.sim.quadrotor.NodeGroup','Simulated Quadrotor',6);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (5,null,'Generic Camera',1);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (6,null,'MORSE Waypoint Controller',8);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (7,null,'MORSE GPS Receiver',9);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (8,'at.uni_salzburg.cs.cpcc.ros.sim.SonarEmulator','Sonar Emulator',10);
INSERT INTO DEVICETYPE (ID,CLASSNAME,NAME,MAINTOPIC_ID) VALUES (9,null,'Generic RAW Camera',11);

INSERT INTO DEVICETYPE_TOPIC (DEVICETYPE_ID,SUBTOPICS_ID) VALUES (1,2);
INSERT INTO DEVICETYPE_TOPIC (DEVICETYPE_ID,SUBTOPICS_ID) VALUES (4,5);
INSERT INTO DEVICETYPE_TOPIC (DEVICETYPE_ID,SUBTOPICS_ID) VALUES (4,7);
INSERT INTO DEVICETYPE_TOPIC (DEVICETYPE_ID,SUBTOPICS_ID) VALUES (5,2);
INSERT INTO DEVICETYPE_TOPIC (DEVICETYPE_ID,SUBTOPICS_ID) VALUES (9,2);
