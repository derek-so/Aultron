import sys
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from pyvirtualdisplay import Display

def beginHeadlessMode():
    display = Display(visible=0, size=(1800, 1600));
    display.start();

def getSubmissions(username, password, url):
    browser.get("https://cms.csuglab.cornell.edu/web/guest/");

    browser.find_element_by_link_text('Sign in').click();
    user = browser.find_element_by_id("netid");
    pasw = browser.find_element_by_id("password");

    user.send_keys(username);
    pasw.send_keys(password);

    login = browser.find_element_by_name("Submit");
    login.click();

    browser.get(url);

    linkar = browser.find_elements_by_link_text("Files");
    for x in linkar:
        x.click();

if __name__ == "__main__":
    beginHeadlessMode();
    chromeOptions = Options();
    prefs = {"download.default_directory" : sys.argv[4]};
    chromeOptions.add_experimental_option("prefs",prefs);
    browser = webdriver.Chrome("/home/dso/Documents/chromedriver", chrome_options = chromeOptions);
    getSubmissions(sys.argv[1],sys.argv[2],sys.argv[3]);
