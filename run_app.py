import streamlit.web.cli as stcli
import os, sys

def resolve_path(path):
    if getattr(sys, "frozen", False):
        basedir = sys._MEIPASS
    else:
        basedir = os.path.dirname(__file__)
    return os.path.join(basedir, path)

if __name__ == "__main__":
    # 1. تنظیم روی لوکال‌هاست (برای جلوگیری از گیر دادن فایروال)
    os.environ["STREAMLIT_SERVER_ADDRESS"] = "localhost"
    
    # 2. مهم: این گزینه را فالس می‌کنیم تا مرورگر اتوماتیک باز شود
    os.environ["STREAMLIT_SERVER_HEADLESS"] = "false"
    
    sys.argv = [
        "streamlit",
        "run",
        resolve_path("main.py"),
        "--global.developmentMode=false",
        "--server.address=localhost",
        "--server.headless=false", # تاکید مجدد برای باز شدن مرورگر
    ]
    sys.exit(stcli.main())
