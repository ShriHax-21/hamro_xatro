#!/bin/bash

# Activate virtual environment
source ~/venv/bin/activate

# [ Python block continues here... ]


echo "Fetching Hamro Patro Data..."

python3 <<EOF
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup
import time

options = Options()
options.binary_location = "/usr/bin/chromium"
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager("137.0.7151.68").install()),
    options=options
)

driver.get("https://english.hamropatro.com/date")
time.sleep(5)

soup = BeautifulSoup(driver.page_source, 'html.parser')

nepali_date_span = soup.select_one('div.date > span.nep')
nepali_date = nepali_date_span.text.strip() if nepali_date_span else "N/A"

date_div = soup.select_one('div.date')
tithi_div = date_div.find_next_sibling('div') if date_div else None
tithi = tithi_div.text.strip() if tithi_div else "N/A"

panchang_div = None
if tithi_div:
    sibling = tithi_div.find_next_sibling('div')
    while sibling:
        if sibling.text.strip().startswith('पञ्चाङ्ग:'):
            panchang_div = sibling
            break
        sibling = sibling.find_next_sibling('div')

panchang = panchang_div.text.strip() if panchang_div else "N/A"
if panchang != "N/A":
    panchang = panchang.replace("पञ्चाङ्ग:", "").strip()

special_event_h1 = soup.select_one('div#search h1.heading')
special_event_main = special_event_h1.text.strip() if special_event_h1 else "N/A"

special_events_list = []
special_events_container = soup.select_one('div#search ul#searchResult')
if special_events_container:
    for li in special_events_container.find_all('li'):
        special_events_list.append(li.text.strip())

print(f"Nepali Date: {nepali_date}")
print(f"Tithi: {tithi}")
print(f"Panchang: {panchang}")
print(f"Main Special Event: {special_event_main}")
print("Other Special Events:")
if special_events_list:
    for ev in special_events_list:
        print(f" - {ev}")
else:
    print(" No other special events today.")

driver.quit()
EOF

