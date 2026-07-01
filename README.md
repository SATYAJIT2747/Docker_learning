# 🐳 Docker Complete Revision Notes

> Beginner-friendly notes covering everything from **Why Docker?** to **Docker Hub**, **Docker Engine**, **Images**, **Containers**, and **Docker Workflow**.

---

# Table of Contents

1. Why Docker?
2. Problems Without Docker
3. Virtual Machine vs Docker
4. Docker Architecture
5. Docker Components
6. Docker CLI
7. Docker Engine
8. Docker Daemon
9. Docker REST API
10. Docker Image
11. Docker Container
12. Image vs Container
13. Dockerfile
14. Building an Image
15. Running a Container
16. Docker Hub
17. Repository
18. Tags
19. Push & Pull Images
20. Container Lifecycle
21. Essential Docker Commands
22. Complete Docker Workflow
23. What Happens Inside `docker run`
24. Real-Life Analogy
25. Interview Questions
26. Quick Revision Mind Map

---

# 1. Why Docker?

Imagine you develop an application on your laptop.

It works perfectly.

You send the code to your friend.

Your friend gets errors like:

* Python version mismatch
* Missing libraries
* Different operating system
* Dependency conflicts

This is the famous problem:

> **"Works on my machine."**

Docker solves this problem by packaging everything needed to run the application into a single portable unit.

---

# 2. Problems Without Docker

Different computers have different:

* Operating Systems
* Python versions
* Java versions
* Libraries
* Environment variables
* Package versions

Even if the code is correct, the application may fail because the environment is different.

Docker packages:

* Application
* Runtime
* Libraries
* Dependencies
* Environment

into a single package called an **Image**.

---

# 3. Virtual Machine vs Docker

## Virtual Machine

```text
Hardware
    │
Host OS
    │
Hypervisor
    │
Guest OS
    │
Libraries
    │
Application
```

### Advantages

* Strong isolation
* Different operating systems possible

### Disadvantages

* Heavy (GBs)
* Slow startup
* Consumes more RAM

---

## Docker

```text
Hardware
    │
Host OS
    │
Docker Engine
    │
Container 1
Container 2
Container 3
```

Containers share the host operating system kernel.

### Advantages

* Lightweight
* Starts in seconds
* Uses less memory
* Easy to distribute

---

# 4. Docker Architecture

```text
Docker CLI
      │
      │ REST API
      ▼
Docker Engine
      │
 ┌────┴────┐
 │         │
Images  Containers
 │         │
Networks Volumes
```

---

# 5. Docker Components

| Component        | Purpose                        |
| ---------------- | ------------------------------ |
| Docker CLI       | Accepts user commands          |
| Docker Engine    | Executes Docker operations     |
| Docker Daemon    | Background service (`dockerd`) |
| Docker Image     | Blueprint/template             |
| Docker Container | Running instance of an image   |
| Docker Hub       | Cloud registry for images      |

---

# 6. Docker CLI

The Docker CLI (Command Line Interface) is what users interact with.

Example:

```bash
docker run ubuntu
docker build .
docker ps
docker images
```

The CLI **does not create containers itself**.

It sends requests to Docker Engine.

---

# 7. Docker Engine

Docker Engine is the core runtime.

It is responsible for:

* Building images
* Running containers
* Managing networks
* Managing volumes
* Pulling images
* Pushing images

Think of it as the **brain of Docker**.

---

# 8. Docker Daemon

The daemon (`dockerd`) is a background service that continuously runs.

It performs all Docker operations.

The CLI talks to the daemon through the Docker API.

---

# 9. Docker REST API

Communication flow:

```text
User

↓

Docker CLI

↓

REST API

↓

Docker Engine
```

Example:

```bash
docker run nginx
```

Internally, the CLI sends requests to the Engine such as:

* Create container
* Start container

The Engine performs these actions.

---

# 10. Docker Image

An Image is a **read-only template**.

It contains:

* Application code
* Runtime
* Libraries
* Dependencies
* Configuration

An image is **not running**.

Think of it as a blueprint.

---

# 11. Docker Container

A Container is a **running instance of an Image**.

```text
Image

↓

docker run

↓

Container
```

One image can create many containers.

Example:

```text
Ubuntu Image

↓

Container 1

Container 2

Container 3
```

---

# 12. Image vs Container

| Image                    | Container           |
| ------------------------ | ------------------- |
| Blueprint                | Running application |
| Read-only                | Read-write          |
| Static                   | Dynamic             |
| Created using Dockerfile | Created from Image  |

---

# 13. Dockerfile

A Dockerfile contains instructions to build an image.

Example:

```dockerfile
FROM python:3.12

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD ["python","app.py"]
```

---

# 14. Building an Image

```bash
docker build -t myapp .
```

Flow:

```text
Dockerfile

↓

docker build

↓

Docker Image
```

---

# 15. Running a Container

```bash
docker run myapp
```

Flow:

```text
Image

↓

docker run

↓

Container
```

---

# 16. Docker Hub

Docker Hub is an online registry for Docker images.

Think of it like:

* GitHub → Stores source code
* Docker Hub → Stores Docker images

---

# 17. Repository

A Repository stores different versions (tags) of the same image.

Example:

```text
satyajitpriyadarshi/repo1
```

Repository:

```text
repo1

├── latest

├── version1

├── version2

└── version3
```

---

# 18. Tags

A Tag identifies a specific version of an image.

Examples:

```text
ubuntu:22.04

ubuntu:24.04

ubuntu:latest
```

---

# 19. Push & Pull Images

Login:

```bash
docker login
```

Tag image:

```bash
docker tag local-image satyajitpriyadarshi/repo1:version1
```

Push:

```bash
docker push satyajitpriyadarshi/repo1:version1
```

Pull:

```bash
docker pull satyajitpriyadarshi/repo1:version1
```

> **Important:** Repository names must be lowercase.

---

# 20. Container Lifecycle

```text
Image

↓

Run

↓

Running

↓

Stop

↓

Exited

↓

Start Again

↓

Running

↓

Remove
```

Useful commands:

```bash
docker stop container_id
docker start container_id
docker rm container_id
```

---

# 21. Essential Docker Commands

| Command                   | Description                 |
| ------------------------- | --------------------------- |
| `docker images`           | List images                 |
| `docker ps`               | Running containers          |
| `docker ps -a`            | All containers              |
| `docker build -t name .`  | Build image                 |
| `docker run image`        | Run container               |
| `docker stop id`          | Stop container              |
| `docker start id`         | Start container             |
| `docker rm id`            | Remove container            |
| `docker rmi image`        | Remove image                |
| `docker logs id`          | View logs                   |
| `docker exec -it id bash` | Open shell inside container |

---

# 22. Complete Docker Workflow

```text
Write Application

↓

Create Dockerfile

↓

docker build

↓

Docker Image

↓

docker run

↓

Container

↓

docker tag

↓

Docker Hub Repository

↓

docker push

↓

Another Computer

↓

docker pull

↓

docker run
```

---

# 23. What Happens Inside `docker run`

When you execute:

```bash
docker run nginx
```

Docker performs these steps:

```text
User

↓

Docker CLI

↓

REST API

↓

Docker Engine

↓

Check Image
```

If image doesn't exist:

```text
↓

Pull from Docker Hub
```

Then:

```text
↓

Create Writable Layer

↓

Create Container

↓

Start Container

↓

Application Running
```

---

# 24. Real-Life Analogy

| Docker Concept | Real-Life Example              |
| -------------- | ------------------------------ |
| Dockerfile     | Recipe                         |
| Image          | Cake mix                       |
| Container      | Baked cake                     |
| Repository     | Shelf in a bakery              |
| Tag            | Chocolate, Vanilla, Strawberry |
| Docker Hub     | Bakery warehouse               |

---

# 25. Common Interview Questions

### What is Docker?

A platform used to package, distribute, and run applications consistently using containers.

---

### What is an Image?

A read-only blueprint containing everything needed to run an application.

---

### What is a Container?

A running instance of an image.

---

### What is Docker Engine?

The core runtime that builds images and manages containers.

---

### What is Docker Hub?

A cloud registry for storing and sharing Docker images.

---

### What is a Repository?

A named collection of image versions (tags).

---

### What is a Tag?

A version identifier for an image.

---

### What is Docker CLI?

The command-line client used to communicate with Docker Engine.

---

### Does Docker CLI create containers?

No.

The CLI sends requests to Docker Engine, which creates and manages containers.

---

# 26. One-Page Revision Mind Map

```text
Docker
│
├── Why?
│   └── Solve environment dependency
│
├── Docker CLI
│   └── Accepts commands
│
├── REST API
│   └── CLI ↔ Engine communication
│
├── Docker Engine
│   ├── Images
│   ├── Containers
│   ├── Networks
│   ├── Volumes
│   └── Daemon
│
├── Dockerfile
│   └── Build instructions
│
├── Image
│   └── Blueprint
│
├── Container
│   └── Running Image
│
├── Docker Hub
│   └── Cloud registry
│
├── Repository
│   └── Collection of image tags
│
└── Tag
    └── Image version
```

---

# Next Topics to Learn

* Docker Volumes
* Bind Mounts
* Port Mapping (`-p`)
* Docker Networks
* Docker Compose
* Multi-stage Builds
* Docker in CI/CD
* Docker Registry
* Docker Swarm (Basics)
* Kubernetes (after Docker)
