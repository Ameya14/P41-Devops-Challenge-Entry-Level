# P41 DevOps Challenge - Entry level

## CHALLENGE

Create a simple microservice in any programming language of your choice, as follows:

- The application should be a web server that returns a JSON response with the following structure, when its `/` URL path is accessed:

```json
{
  "timestamp": "<current date and time>",
  "ip": "<the IP address of the visitor>"
}
```

- Create a Dockerfile for this microservice and publish the image to Docker Hub. Your application must be configured to run as a non-root user in the container.

- Create a Kubernetes manifest in YAML format, containing a Deployment and a Service, to deploy your microservice on Kubernetes. Your Deployment must use your public Docker image.

- Publish your code, Dockerfile, and Kubernetes manifests to a public Git repository in a platform of your choice (e.g. GitHub, GitLab, Bitbucket, etc.), so that it can be cloned by the team.


## Criteria


Your task will be considered successful if a colleague is able to deploy your manifests to a running Kubernetes cluster and use your microservice.

Assuming that your manifest file is named `microservice.yml` (but you can name it whatever you want), the command:

```sh
kubectl apply -f microservice.yml # i.e. your manifest file
```

must be the only command needed to deploy your microservice to Kubernetes.

Other criteria for evaluation will be:

- Code quality and style: your code must be easy for others to read, and properly documented when relevant

- Container best practices: your container image should be as small as possible, without unnecessary bloat



# SOLUTION

## Clone this repo

``` shell
git clone https://github.com/Ameya14/P41-Devops-Challenge-Entry-Level
```


## Project Description

This project is written in .Net Core 3.1. So make sure you have installed .Net Core 3.1 SDK installed in your machine if you want to run this project locally.

### To run locally
```shell
dotnet run --project .\DevopsChallenge\DevopsChallenge.csproj
```

### To run using Docker

You need to install Docker Desktop (or any other relavant Docker engine) and make sure you Docker Desktop is running.

Build the Docker image:
```shell
docker build ./ -t <your-imagename>
```

OR

You can pull the image from Docker Hub:
```shell
docker pull ameya141193/devops-challenge-entry-level
```

To run:
```shell
docker run -d -p <your-port-number>:80 <your-imageid>
```
And then you can run on browser using http://localhost:<your-port-number>

### To run using Kubernetes

You need to install Docker Desktop (or MiniKube or any other relavant Kubernetes engine) and make sure you are running Kubernetes in Docker Desktop.

To run:
```shell
kubectl apply -f microservice.yml

kubectl port-forward <pod-name> <your-port-number>:80
```
And then you can run on browser using http://localhost:<your-port-number>
