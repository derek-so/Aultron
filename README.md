# Aultron

Aultron is an autograder that strives to provide real time feedback for students as they submit code for grading. It can be deployed on a server and is controlled by a single config file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Aultron works bests on a linux machine 
The following instructions are for the two most popular Linux distributions Fedora and Ubuntu. The following are all the things needed to get Aultron up and running.

#### Fedora

##### Python 2.7

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

##### ChromeDriver

Chrome driver is needed for selenium to run properly. You can get chrome driver for your machine at the following url. Simply download + extract the version that matches your machine and you're good to go.

```
https://sites.google.com/a/chromium.org/chromedriver/downloads
```

### Installing

A step by step series of examples that tell you have to get a development env running

1) Clone this repository. It does not matter where you put it as we will be using absolute paths in our config file.

```
git clone https://github.com/derekso1/Aultron.git
```

2) Configure our config file. The config file has the following layout.
```
username
password
URL of assignment
/path/to/download/folder
/path/to/temp/extract/folder
/path/to/backup/folder
/path/to/grading/folder
/path/to/input/folder
/path/to/output/folder
```

Username:
This is your Cornell NetID.

Password:
This is your actual Cornell Password.

URL of Assignment:
This is the Url of the cms page where all the student submissions reside.

/path/to/some/folder:
Explanation of what each folder path is for coming soon. What is import to know for now is that 6 directories MUST be created and their file paths supplied to this config file for Aultron to run correctly.

3) Run Aultron. Aultron is controlled by the main script master.sh. master.sh takes in a single argument which is our config file. Note that you must run Aultron in the same directory as all the other scripts.

```
./master.sh <path to config file>
```

## Running the tests

The fact that you are reading this means that you are most likely already a TA for CS 4320/1. You should have all the credentials needed to test Aultron as well as a sample semester to get test projects from.

### Aultron's Output

After running Aultron successfully, a new file called list.txt will be generated. This file contains all the groups whose .jar file has produced an error against our inputs. Inside each group's folder in the grading folder will also be a log.txt file. This log file as the exact error message when we ran their jar file.


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please contact me at dts76@cornell.edu if you would like to contribute. There is much work to be done on Aultron!

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## Authors

* **Derek So** - *Initial work* - [derekso1](https://github.com/derekso1)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Inspired by the amazing autograders from CS 4410 / 3410
