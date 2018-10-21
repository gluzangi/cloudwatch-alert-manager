## Project Cloudwatcher Manager

Create a Cloudwatcher Manager that creates alerts using a scripted AWS-CLI approach

### Prerequisites

- aws-cli
- Docker Engine


### How To Run The App

- Use git to checkout the code and change the working directory to the cloned repo and run the app :
```bash
$ docker run -d --name cloudwatch-mgr -p 9050:5005 -v $PWD:/app gluzangi/rocks:python-cloudwatch-mgr
```


#### References

* [AWS Cloudwatch Ref](https://docs.aws.amazon.com/cli/latest/reference/cloudwatch/) - Cloudwatch Reference
* [Cloudwatch Alerts Ref](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/cw-example-creating-alarms.html) -Creating CloudWatch Alarms
* [boto Ref](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html) - boto 3 Documentation

### Built For/With

* [AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) - AWS CLI
* [Docker](https://hub.docker.com/_/python/) - Python Docker Image

## Authors

* **Gerald Luzangi**
