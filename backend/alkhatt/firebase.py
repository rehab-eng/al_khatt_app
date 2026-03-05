import os

import firebase_admin
from firebase_admin import credentials


def get_firebase_app():
    if firebase_admin._apps:
        return firebase_admin.get_app()

    cred_path = os.environ.get('FIREBASE_CREDENTIALS')
    if not cred_path:
        raise RuntimeError('FIREBASE_CREDENTIALS env var is required')

    bucket = os.environ.get('FIREBASE_STORAGE_BUCKET')
    if not bucket:
        raise RuntimeError('FIREBASE_STORAGE_BUCKET env var is required')

    cred = credentials.Certificate(cred_path)
    firebase_admin.initialize_app(cred, {'storageBucket': bucket})
    return firebase_admin.get_app()
