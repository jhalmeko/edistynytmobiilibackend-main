from pydantic import BaseModel


class AddFeatureReq(BaseModel):
    rental_item_feature_name: str


class AddFeatureRes(AddFeatureReq):
    rental_item_feature_id: int