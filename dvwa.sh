# Docker must be install
docker pull vulnerables/web-dvwa
# You only need to pull once

# If it has already been pulled then run this command to start the container
docker run --rm -it -p 80:80 vulnerables/web-dvwa
