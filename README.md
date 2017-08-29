# Aultron

Aultron is an autograder that strives to provide real time feedback for students as they submit code for grading. It can be deployed on a server and is controlled by a single config file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Aultron works bests on a linux machine 
The following instructions are for the Fedora operating system. If you are using another Linux distribution, most of the commands will be the same except maybe changing the package manager and package name. Detailed instructions for Ubuntu coming soon.

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

##### 1. Clone this repository. It does not matter where you put it as we will be using absolute paths in our config file.

```
git clone https://github.com/derekso1/Aultron.git
```

##### 2. Set up empty directories. Aultron needs four empty directories to function correctly. You can set up these directories anyway you like. If you are on a server, you can use the following command four times with different file paths.

```
mkdir <path to new folder>
```

##### 3) Configure our config file. The config file has the following layout.
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

###### username:
This is your Cornell NetID.

###### Password:
This is your actual Cornell Password.

###### URL of Assignment:
This is the Url of the cms page where all the student submissions reside. Typically you can reach this page by 
```
logging into cms -> assignments -> groups (for the assignment you want to grade)
```

###### /path/to/download/folder:
This will be the path to the download folder. The download folder is where we will be storing the fresh downloads of each student. NOTE: this folder is wiped per run of Aultron.

###### /path/to/temp/extract/folder
This will be a temporary folder in which we extract all the zipped student submissions.

###### /path/backup/folder
This will be the folder where we store the last recently seen submission for each student including no-submission. There is a folder invariant. Any submission in this backup folder has already been graded. Do not switch backup folders on each run of Aultron for the same assignment.

###### /path/to/grading/folder
This will be the folder Aultron most recently graded. Note that it only grades new submissions for each student which is why it is not the same as the backup folder.

###### /path/to/input/folder
This will be the location of the input folder for the CS 4321 project.

###### /path/to/output/folder
This will be the location of the output folder for the CS 4321 project.

##### 3) Run Aultron. Aultron is controlled by the main script master.sh. master.sh takes in a single argument which is our config file. Note that you must run Aultron in the same directory as all the other scripts. I DO NOT recommend running Aultron without first going through the tests section below.

```
./master.sh <path to config file>
```

## Running the tests

Note: The fact that you are reading this means that you are most likely a TA for CS 4320/1. You should have all the credentials needed to test that Aultron has been installed correctly. You will also need to have already been a TA for CS 4320/1 for a single semester so that you have previous student submissions to test Aultron on.

If you are a TA but do not have access to previous submissions, the test files folder has some dummy submissions that can be used for testing prepare and testing grading.


Aultron is essentially a set of scripts that do three major things: download all submissions, prep all submissions for grading, grade each submission. Therefore, we will check that Aultron works correctly in three parts. In this repo is a test folder that contains three scripts.
```
testDownload.sh
testPrepare.sh
testGrading.sh
```
These three scripts are the decomposition of master.sh. If these three scripts run correctly, then master.sh should run correctly. Just like master, they take in a single argument; config file. The config file follows the same format as shown above.
```
test*.sh <path to config file>
```

### Testing Submission Download

After configuring the config file, test that submissions are being downloaded correctly using the testDownload.sh script.
```
./testDownload.sh /path/to/config/file
```
Check that you are downloading the correct submissions.

Note: If you are not on a server, there is a second way to check for correct downloads. Assuming you are familiar with some python, you can actually read through getSubmissions.py and comment out the part where we use a virtual display. This will cause selenium to not run headless. When you run testDownload.sh, you will actually see a chrome browser open up, navigate to the desired page, and download student submissions.

### Testing Prepare

Run the following command to test that we are extracting files and preparing them for grading correctly.
```
./testPrepare.sh /path/to/config/file
```

The extracted, grading, and backup folder should be populated accordingly. Grading folder should contain no empty submissions unlike backup. Each submission in grading should also have a copy of input and output next to the submission .jar file.

### Testing Grading

Run the following command to test that projects are being graded correctly.
```
./testGrading.sh /path/to/config/file
```

After this script, a new file called list.txt will be generated. This file contains all the groups whose .jar file has produced an error against our inputs. Inside each group's folder in the grading folder will also be a log.txt file. This log file as the exact error message when we ran their jar file.

Yay, Aultron is working properly!


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
