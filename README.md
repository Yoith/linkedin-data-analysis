# LinkedIn Job Offers Analysis

### Project Description

The project aims to conduct data analysis on job offers posted on LinkedIn, focusing on positions related to Data Analyst, Data Engineer, and Data Scientist across different geographical locations. The process is divided into two main stages: data extraction and data cleaning, followed by visualization and analysis.

### Libraries Used

#### Data Extraction:
- `os`
- `pickle`
- `time`
- `datetime`
- `numpy`
- `random`
- `pandas`
- `selenium`
- `BeautifulSoup`
- `dotenv`

#### Data Cleaning:
- `pandas`
- `datetime`
- `dateutil.relativedelta`
- `re`
- `numpy`
- `random`

### Data Extraction Process

In the `notebooks` directory, you'll find the `extracting.ipynb` file, which contains the data extraction process. Two main functions have been created:

1. `scrape_linkedin_jobs`: This function utilizes Selenium to access job offers on LinkedIn using specific keywords and locations. It then extracts the HTML information of each job offer, processes it with BeautifulSoup, and saves the information into CSV and Pickle files.

2. `extract_job_info`: This function takes the HTML information obtained previously and processes it to extract relevant data, which is stored in a DataFrame. This DataFrame is also saved in a CSV file.

### Data Cleaning Process

In the `cleaning.ipynb` file within the `notebooks` directory, the data cleaning process is carried out. The `clean_dataframe` function performs a series of transformations and cleanups on the DataFrame obtained in the extraction process.

Additionally, there's the `generate_df_skills` function, which generates a transposed DataFrame counting the frequency of the top 75 most repeated skills based on job keywords and responsibilities.

### Visualization and Analysis

The analysis results have been visualized using Tableau, with an accessible presentation at [this link](https://public.tableau.com/app/profile/guillermo.diaz6123/viz/LinkedinDataAnalysis_17102774055100/Story1?publish=yes). The visualization includes a mix of presentation slide images and interactive visualizations based on the extracted and cleaned data.

### Repository Organization

- **Data**: Contains the DataFrames obtained in the extraction and cleaning process, as well as files related to SQL queries.
- **Images**: Logos used for presentation and visualizations.
- **Notebooks**: Jupyter Notebook files containing the code for data extraction and cleaning.
- **README.md**: This file providing an overview of the project.

Thank you for reviewing this project! If you have any questions or comments, feel free to contact me.