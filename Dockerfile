# Use the official Tomcat 10 base image
FROM tomcat:10.0

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Define the artifact path as a build argument
ARG artifact=dist/angular-docker

# Copy the application files to a temporary directory
RUN mkdir /usr/local/angular-docker/
COPY ${artifact} /usr/local/angular-docker/

# Rename the application directory
# RUN mv /usr/local/angular-docker/browser /usr/local/angular-docker/ROOT

# Copy the renamed ROOT directory to the Tomcat webapps directory
RUN cp -r /usr/local/angular-docker/ROOT $CATALINA_HOME/webapps/

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
