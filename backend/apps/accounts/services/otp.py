class OtpProvider:
    def request_otp(self, phone):
        raise NotImplementedError

    def verify_otp(self, phone, code):
        raise NotImplementedError


class FirebaseOtpProvider(OtpProvider):
    def request_otp(self, phone):
        # TODO: Integrate Firebase Auth (phone verification)
        raise NotImplementedError

    def verify_otp(self, phone, code):
        # TODO: Verify code and return Firebase UID
        raise NotImplementedError



