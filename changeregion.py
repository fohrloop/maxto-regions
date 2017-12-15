####################################
#
#  MaxTo regions v. 1.0.0
#  (c) Niko Pasanen 2017
#  Licence: MIT
# 
##################################

import  logging
from    logging.handlers import RotatingFileHandler
from    pywinauto import actionlogger
from    pywinauto.application import Application
import  sys

selection = sys.argv[1]
actionlogger.enable()

formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger()
handler = RotatingFileHandler(
    'autohotkey.log', mode='a', maxBytes=1024 * 150, backupCount=1)
handler.setFormatter(formatter)
logger.addHandler(handler)

try:
    app = Application().connect(title_re="MaxTo main window")
    mainwindow = app.window(best_match='MaxTo main window')
    mainwindow['Load profile'].Click()

    window = app.window(best_match='Manage profiles')
    window['ProfilesListBox'].Select(selection)
    window['Load'].Click()

    mainwindow['Done'].Click()

except Exception as e:
    import ipdb; ipdb.set_trace()
