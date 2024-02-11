import pandas as pd
import os
from zipfile import ZipFile
import glob
from openpyxl import load_workbook
from pathlib import Path
import sys

# Define the directory with CSV files and the target Excel file
csv_folder_path = '../aggregated_data'
excel_file_path = '../reports/report.xlsx'


import pandas as pd
import sys
import os
import glob
from pathlib import Path

extension = 'csv'
all_filenames = glob.glob(os.path.join(csv_folder_path, '*.csv'))

writer = pd.ExcelWriter(excel_file_path, engine='openpyxl', mode='a', if_sheet_exists='replace') # Arbitrary output name
for csvfilename in all_filenames:
    sheetname = csvfilename.split("/")[-1].split(".")[0]
        
    try:
        print(sheetname)
        workBook.remove(workBook[sheetname])
    except:
        print("There is no such sheet in this file")
    finally:
        df= pd.read_csv(csvfilename,sep=',', encoding='utf-8')
        df.to_excel(writer, sheet_name=sheetname,index=False)


writer.close()
print("task completed")