import os
import sqlite3
from pathlib import Path
from datetime import datetime, date
import re
import backend

# assumes run from backend directory of dataentryapp
# create connection and cursor

# dataDir = Path("../../data")
# appDir = Path("../../dataentryapp")
# datasheetsDir = dataDir / "datasheets" / "final"
# conn = sqlite3.connect(dataDir / "rw.db", detect_types=sqlite3.PARSE_DECLTYPES)
#
# # check if database is empty, if so, create the tables
# cursor = conn.cursor()
# cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
# res = cursor.fetchall()
#
# if not res:
#     backend.create_tables()
#
# cursor.close()

backend.initialize_database()
importDir = Path("data/datasheets/import")

filepaths = [f for f in importDir.iterdir() if f.is_file()]
print("\n".join([f.stem for f in filepaths]))

def parse_filename(fp):
    keys = ["stage", "type", "site", "treatment", "burn", "plotnums"]
    filename_parts = fp.stem.split("_")
    unit = filename_parts[:5]
    plotnums = filename_parts[5:]
    unit.append(plotnums)
    collection = {k:v for k, v in zip(keys, unit)}
    return collection

# insert plots, insert collections, insert datasheets, insert collectdatasheets 
for fp in filepaths:
    collection = parse_filename(fp)
    newfp = backend.make_unique_filename(collection)
    fp.rename(newfp)
    datasheetid = backend.insert_datasheet(newfp)

    for plot in collection["plotnums"]:
        print("plot: ", plot)
        collection["plotnum"] = int(plot)
        plotid = backend.insert_plot(collection)
        collection["plotid"] = plotid
        collectid = backend.insert_collectid(collection)
        backend.link_datasheet(collectid, datasheetid)
