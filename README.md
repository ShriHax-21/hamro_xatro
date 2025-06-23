
# Hamro_xatro

This Python script uses Selenium and BeautifulSoup to scrape essential data (Nepali date, Tithi, Panchang, and special events) from [https://english.hamropatro.com/date](https://english.hamropatro.com/date).

---

## Features

- Retrieves Nepali date
- Retrieves Tithi
- Retrieves Panchang
- Retrieves Main and Additional Special Events

---

## Prerequisites

- Python 3.7+
- Chromium browser installed (make sure `/usr/bin/chromium` exists)
- Compatible ChromeDriver installed (matching Chromium version)
- Internet connection

---

## Setup Instructions

### 1. Clone or Download the script

```bash
git clone <your-repo-url>
cd <your-repo-folder>
````

### 2. Create and activate Python virtual environment

```bash
python3 -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```

### 3. Install required packages

```bash
pip install -r requirements.txt
```

### 4. Download matching ChromeDriver

Find your Chromium version:

```bash
chromium --version
```

Download corresponding ChromeDriver from [https://chromedriver.chromium.org/downloads](https://chromedriver.chromium.org/downloads) and place it somewhere (e.g., `/usr/local/bin/chromedriver`).

Make it executable:

```bash
chmod +x /usr/local/bin/chromedriver
```

Update the `CHROMEDRIVER_PATH` in the script if necessary.

---

## Running the script

```bash
python3 script.py
```

---

## Troubleshooting

* If you get errors about ChromeDriver version mismatch, download the correct version.
* Make sure Chromium is installed and accessible at `/usr/bin/chromium` or update the path in the script options.
* Ensure the virtual environment is activated before running the script.

---

## requirements.txt

```
selenium==4.10.0
beautifulsoup4==4.12.2
webdriver-manager==3.8.6
```

---

## Notes

* The script runs Chromium in headless mode.
* Adjust sleep timing if needed to allow the page to fully load.
* Modify selectors in the script if website structure changes.

---

Feel free to open an issue if you run into any problems or want enhancements!

---
