# Aultron

Aultron is an autograder that strives to provide real time feedback for students as they submit code for grading. It can be deployed on a server and is controlled by a single config file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Aultron works bests on a linux machine 
The following instructions are for the two most popular Linux distributions Fedora and Ubuntu. The following are all the things needed to get Aultron up and running.

#### Fedora

#####Python 2.7

Fedora comes with python 2 pre-installed. If for some reason you need to install it again, you can install it from Fedora's package manager dnf.

```
dnf install python
```

##### Selenium

Selenium is a great tool for automated browser testing. We will be using it to crawl through CMS and pull student submissions. We will be using the python variant of Selenium and you can still it with pip.

```
pip install python
```

##### Xvfb

Selenium opens an actual browser for you to see and touch, but we can't have that happen on a server. The compromise is to use Xvfb, a virtual display.

```
dnf install -y xorg-x11-server-Xvfb
```

##### Pyvirtualdisplay

A nice package we can use for python that handles the Xvfb for us.

```
dnf install pyvirtualdisplay
```

### Installing

A step by step series of examples that tell you have to get a development env running

Clone the Repository

```
git clone <git url>
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc