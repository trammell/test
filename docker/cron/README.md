# docker-cron

Based off of https://github.com/Ekito/docker-cron/ (An example of running
cron job in a docker container.)

More discussion at
<https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container>.


```
# build the image
docker --debug build -t cron .

# run the image
docker run -ti cron
```

