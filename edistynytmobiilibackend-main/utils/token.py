import time
from typing import Annotated

import jwt
from fastapi import Depends


class BaseToken:
    def create(self, claims):
        pass

    def validate(self, t):
        pass


class SymmetricToken(BaseToken):
    def __init__(self):
        self.secret = 'sdflkjdsflkdsfjdsf09w34q8p43kj324lk342j342243+2432340842378o423iu423'

    def create(self, claims):

        now = time.time()
        issuer = 'edistynytmobiili'
        audience = 'edistynytmobiili'
        _type = claims['type']
        exp = claims['exp']
        sub = claims['sub']
        csrf = claims['csrf']

        data = {'iss': issuer, 'aud': audience, 'type': _type, 'sub': sub, 'iat': now, 'nbf': now - 10}
        if exp is not None:
            data['exp'] = exp
        if csrf is not None:
            data['csrf'] = csrf
        _token = jwt.encode(data, self.secret, algorithm='HS512')
        return _token

    def validate(self, t):
        claims = jwt.decode(t, self.secret, algorithms=['HS512'], audience='edistynytmobiili')
        return claims


def init_token():
    return SymmetricToken()


Token = Annotated[BaseToken, Depends(init_token)]