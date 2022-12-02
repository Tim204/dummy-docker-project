FROM python:3.8-alpine

# Adding scripts to the path of the running Container
ENV PATH="/scripts:${PATH}"

# Copies requierements files to the docker image
COPY ./requirements.txt /requirements.txt

# Needed to install the uwsgi server on alpine package manager(APK)
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers

# Installing dependencies
RUN pip install -r /requirements.txt

# Removing temp files after the installation is complete( gcc libc-dev and linux headers)
RUN apk del .tmp


RUN mkdir /app
COPY . .
WORKDIR /app

# Copying the scripts folder into the docker image
COPY ./scripts /scripts
# Adding executable permissions to the scripts
RUN chmod +x /scripts/*

# Creating Static and media files directories inside the docker image
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

# Setting up a User
RUN adduser -D user

# Setting the recently created user as the owner of the static and media folders (/vol)
RUN chown -R user:user /vol

# 755 - grating user full access while only grating Read access to groups
RUN chmod -R 755 /vol/web 

# Switching to the newly created user
USER user

CMD [ "entrypoint.sh" ]