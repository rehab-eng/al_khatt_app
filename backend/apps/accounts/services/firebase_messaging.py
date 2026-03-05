from firebase_admin import messaging

from alkhatt.firebase import get_firebase_app


def send_notification(tokens, title, body, data=None):
    if not tokens:
        return 0
    try:
        get_firebase_app()
        message = messaging.MulticastMessage(
            tokens=list(tokens),
            notification=messaging.Notification(title=title, body=body),
            data=data or {},
        )
        response = messaging.send_multicast(message)
        return response.success_count
    except Exception:
        return 0
