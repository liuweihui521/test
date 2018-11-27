
cd /home/ubuntu/roomserver

mvn clean package -am -pl kurento-room-sdk -DskipTests
mvn install -DskipTests
mvn clean package -am -pl kurento-room-client-js -DskipTests
mvn install -DskipTests
mvn clean package -am -pl kurento-room-server -DskipTests
mvn install -DskipTests
mvn clean package -am -pl kurento-room-client -DskipTests
mvn install -DskipTests
mvn clean package -am -pl kurento-room-demo -DskipTests
mvn install -DskipTests


sleep 3s

echo "start hoozhaRoom server..."
pid3=`ps -ef | grep hoozhaRoom | awk '{print $2}'|sed -n '1p'`
pid4=`ps -ef | grep hoozhaRoom | awk '{print $2}'|sed -n '2p'`
pid5=`ps -ef | grep hoozhaRoom | awk '{print $2}'|sed -n '3p'`
kill -9 ${pid3} ${pid4} ${pid5}
sleep 2s
cd /home/ubuntu/roomserver/kurento-room-demo/
#nohup /usr/maven/apache-maven-3.5.2/bin/mvn exec:java&
pwd
nohup mvn exec:java -Dspring.profiles.active=dev &

echo wancheng
