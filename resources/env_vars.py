from dotenv import load_dotenv
import os

load_dotenv()

USER_NAME = os.getenv("USER_NAME", "")
PASSWORD = os.getenv("PASSWORD", "")