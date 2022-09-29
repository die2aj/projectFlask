# Simple Application with Flask and Docker



In this application you can see the names of the Game of Thrones characters that are extracted from https://thronesapi.com/. To run this application in your local environment you must do the following steps:


```
docker image build -t project_flask .
```

```
docker run -p 5000:5000 -d project_flask
```




