from Tkinter import mainloop, Button, X
from tkMessageBox import showerror
from tkFileDialog import askopenfilename      

def callback():
    askopenfilename() 

errmsg = 'Error!'
Button(text='Quit', command=callback).pack(fill=X)
Button(text='Spam', command=(lambda: showerror('Spam', errmsg))).pack(fill=X)
mainloop()

