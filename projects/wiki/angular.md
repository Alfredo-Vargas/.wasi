# Installation of Angular and Project Creation
## Data Binding:
1. Interpolation. - Inside the same component {{}}
2. Zero-way. -  
3. Two-way data-binding, Banana in the Box: e.g. `[(ngModel)]` = `boolean`
4. Property binding uses square brackets `[]`: e.g. `[user] = givenUser`. `user` is in the child component and `givenUser` is in the parent Component.
5. Event binding uses parenthesis `()`: e.g. `(createUserEvent) = "onCreateUserEvent($event)"`

## Native creation:
Install angular
```console
npm install -g @angular/cli
```
Creation a new project
```console
ng new <project-name>
```
Add new component (two options)
```console
ng generate component <component-name>
ng g c <component-name>
```
Add new pipe (two options)
```console
ng generate pipe <pipe-name>
ng g p <pipe-name>
```
Starting the Web Server (On `http://localhost:4200`):
```console
ng serve
```
Installing bootstrap in angular
```console
npm install bootstrap jquery popper.js --save
```
To install a fresh pull project (inside the directory)
```
npm install
```

## Docker container
Creation of a project on your docker container, see [link](https://hub.docker.com/r/alexsuch/angular-cli):
Git-hub of developer: [Mihai-B](https://github.com/Mihai-B/angular-cli-docker)
```console
docker run -it --rm -w /app -v $(pwd):/app alexsuch/angular-cli:10.2.3 ng new <project-name>
```
Creation of a new component:
```console
docker run -it --rm -w /app -v $(pwd)/<project-name>:/app alexsuch/angular-cli:10.2.3 ng g component <component-name>
```
Running the server 
```console
docker run -it --rm -w /app -v $(pwd)/<project-name>:/app -p 4200:4200 alexsuch/angular-cli:10.2.3 ng serve --host 0.0.0.0
```

## Can't Resolve rxjs
When this issue appear one needs to install
```console
npm install --save rxjs-compat
```

## Managing permission between docker container and host
To `tty` into your docker container:
```console
docker exec -it <container-name> /bin/sh
```
Changing the permissions such the `id` and `gid` numbers from the container match the `id` and `gid` of the host user.

## Programming Principles:
1. DRY principle: Do Not Repeat Yourself
2. Simple Responsibility Principle

## Express Server Integration Nodejs microservice
To Install Nodejs express globally:
```console
npm -i g express-generator
```
To name the recently created microservice:
```console
express <microservice-name>
```
To run the microservice
```console
npm start app.js
```
To avoid restart of the server when changes are made install on the microservice directory:
```console
npm i nodemon
```
or if the above did not install the binary `nodemon` correctly then:
```console
sudo npm install -g --force nodemon
```
to run nodemon for the express js
```console
nodemon index.js
```

## Cross Origin Resource `CORS` Error
This type of error looks as follows:
`Access to XMLHttpRequest at 'http://localhost:3000/photos' from origin 'http://localhost:4200' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.`
To allow this cross communication one needs to install on the `api` of the server the following:
```console
npm i cors
```
Then we include in the `app.js` the following:
```console
var cors = require('cors');
```
And before the statements for defining routes we must use the `cors`:
```console
app.use(cors());
```

