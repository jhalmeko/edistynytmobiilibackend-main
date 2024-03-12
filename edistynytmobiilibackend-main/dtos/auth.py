from pydantic import BaseModel


class RegisterReq(BaseModel):
    username: str
    password: str


class LoginReq(RegisterReq):
    pass


class Role(BaseModel):
    auth_role_id: int
    role_name: str


class RegisterRes(BaseModel):
    auth_user_id: int
    username: str
    auth_role_auth_role: Role


class LoginRes(BaseModel):
    access_token: str
    account: RegisterRes
