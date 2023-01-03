import sys
import tkinter as tk
from tkinter import ttk
import subprocess as sp
import platform
from pathlib import Path
from tkinter import filedialog

from dataentryapp.backend import backend
from dataentryapp.frontend import template

from dataentryapp.frontend import treedataentry
from dataentryapp.frontend import fueldataentry
from dataentryapp.frontend import regendataentry
from dataentryapp.frontend import datasheetnamer
from dataentryapp.backend import backend

class DatasheetsFrame(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        # define dataview
        columns = ("id", "filename", "date_modified", "status")
        self.datasheets = ttk.Treeview(self, columns=columns, show="headings")

        # define headings
        self.datasheets.heading('id', text="id")
        self.datasheets.heading('filename', text="Filename")
        self.datasheets.heading('date_modified', text="Date modified")
        self.datasheets.heading('status', text="Status")

        # adjust columns
        self.datasheets.column("id", width=50, stretch=False)
        self.datasheets.column("filename", width=210, stretch=False)
        self.datasheets.column("date_modified", width=210, stretch=False)
        self.datasheets.column("status", width=100, stretch=False)

        # arrange in frame
        self.rowconfigure(0, weight=1)
        self.columnconfigure(0, weight=1)
        self.datasheets.grid(sticky=tk.NSEW)

        # add a scrollbar
        scrollbar = ttk.Scrollbar(self, orient=tk.VERTICAL, command=self.datasheets.yview)
        self.datasheets.configure(yscroll=scrollbar.set)
        scrollbar.grid(row=0, column=1, sticky='ns')


class ButtonsFrame(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)
        # field options
        options = {'padx': 5, 'pady': 5}

        self.import_button = tk.Button(self, text="Import", command=parent.open_import)
        self.impute_button = tk.Button(self, text="Enter data", command=parent.on_enter_data)

        # self.rowconfigure(0, weight=1)
        # self.columnconfigure(0, weight=1)

        self.import_button.grid(**options)
        self.impute_button.grid(**options)


class MainMenu(tk.Tk):
    def __init__(self):
        super().__init__()

        self.datasheetDir = Path("../../data/datasheets/final/")

        self.title('RW Fire Mitigation Datasheet Entry')
        # self.geometry('620x400')

        self.rowconfigure(0, weight=1)
        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)

        self.ds_frame = DatasheetsFrame(self)
        self.ds_frame.grid(column=0, sticky=tk.NS)

        self.b_frame = ButtonsFrame(self)
        self.b_frame.grid(row=0, column=1, sticky="ew")

        self.update_dataview()

    def update_dataview(self):
        for i in self.ds_frame.datasheets.get_children():
            self.ds_frame.datasheets.delete(i)
        # get data
        db_datasheets = backend.get_datasheets_table()

        # add data to the treeview
        for sheet in db_datasheets:
            self.ds_frame.datasheets.insert('', tk.END, values=sheet)

    def focus_entry_form(self):
        # disable main menu window
        self.dataEntryWindow.wait_visibility()
        self.dataEntryWindow.focus()
        self.dataEntryWindow.grab_set()
        # Open datasheet in default pdf viewer
        if platform.system() == 'Darwin':       # macOS
            sp.call(('open', self.filename))
        elif platform.system() == 'Windows':    # Windows
            sp.Popen(("start", self.filename), shell=True)
        else:                                   # linux variants
            sp.call(('xdg-open', self.filename))

    def on_enter_data(self):
        # get values for selected row
        cur_row = self.ds_frame.datasheets.focus()
        cur_row = self.ds_frame.datasheets.item(cur_row, "values")

        # Only if there is an active selection
        if(cur_row):
            # This should actually get datasheettype
            collection = backend.get_collection_from_datasheetid(cur_row[0])
            # get first row to identify datasheet type
            datasheettype = collection[0]["datasheettype"]
            self.filename = self.datasheetDir / cur_row[1]
            # Then open appropriate data entry form
            if datasheettype == "tree":
                self.dataEntryWindow = treedataentry.App(self, cur_row[0])
                self.focus_entry_form()
            elif datasheettype == "regen":
                self.dataEntryWindow = regendataentry.App(self, cur_row[0])
                self.focus_entry_form()
            elif datasheettype == "fuel":
                self.dataEntryWindow = fueldataentry.App(self, cur_row[0])
                self.focus_entry_form()

    def open_import(self):
        filetypes = (
            ("Pdf files", '*.pdf'),
            ('All files', '*.*')
        )
        filename = filedialog.askopenfilename(
            title='Open PDF',
            initialdir='../data/datasheets/raw',
            filetypes=filetypes)
        # self.withdraw()
        self.datasheetnamer = datasheetnamer.App(self, filename)
        
if __name__ == "__main__":
    app = MainMenu()
    app.mainloop()
