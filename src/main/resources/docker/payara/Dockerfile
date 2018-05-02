# Using the Payara Micro 5
FROM payara/micro:5.181
 
# Adding JDBC postgresql driver
RUN wget -O $PAYARA_PATH/database-connector.jar https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar
ENV PAYARA_PATH /opt/payara
ADD mantenimiento-WEB.war postbootfile.txt $PAYARA_PATH/
ENTRYPOINT java -jar $PAYARA_PATH/payara-micro.jar --addJars $PAYARA_PATH/database-connector.jar --deploy $PAYARA_PATH/mantenimiento-WEB.war --postbootcommandfile $PAYARA_PATH/postbootfile.txt










