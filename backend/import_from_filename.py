import sqlite3
from pathlib import Path
from datetime import datetime, date
import re

# assumes run from backend directory of dataentryapp
# create connection and cursor

dataDir = Path("../../data")
print(dataDir)
appDir = Path("../../dataentryapp")
datasheetsDir = dataDir / "datasheets" / "final"
conn = sqlite3.connect(dataDir / "rw.db", detect_types=sqlite3.PARSE_DECLTYPES)

# check if database is empty, if so, create the tables
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
res = cursor.fetchall()

if not res:
    create_tables()

cursos.close()

filenames = [f.stem for f in datasheetsDir.iterdir() if f.is_file()]
print("\n".join(filenames))

def parse_filename(filename):
    keys = ["stage", "type", "site", "treatment", "burn", "plots"]
    filename_parts = filename.split("_")
    parts1 = filename_parts[:5]
    plotnums = filename_parts[5:]
    parts1.append(plotnums)
    collection = {k:v for k, v in zip(keys, parts1)}
    return collection

# insert plots, insert collections, insert datasheets, insert collectdatasheets 
for filename in filenames:
    collection = parse_filename(filename)
    key_names = ("stage", "type", "site", "treatment", "burn")
    newfilename = make_unique_filename(collection, key_names)

    for plot in collection["plots"]:
        plotid = backend.insert_plot(collection)
        collectid = backend.insert_collectid(collection)
