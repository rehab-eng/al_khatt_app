import uuid

from firebase_admin import storage

from alkhatt.firebase import get_firebase_app


def upload_file(file_obj, destination_folder):
    get_firebase_app()
    bucket = storage.bucket()
    extension = ''
    if hasattr(file_obj, 'name') and '.' in file_obj.name:
        extension = file_obj.name.split('.')[-1]
    filename = f'{uuid.uuid4().hex}'
    if extension:
        filename = f'{filename}.{extension}'
    blob = bucket.blob(f'{destination_folder}/{filename}')
    blob.upload_from_file(file_obj, content_type=getattr(file_obj, 'content_type', None))
    blob.make_public()
    return blob.public_url
