from typing import Annotated

from fastapi import HTTPException, Depends

import models
from dtos.rental_item import AddFeatureReq, EditItemReq
from services.base import BaseService


class RentalItemService(BaseService):
    def __init__(self, db: models.Db):
        super(RentalItemService, self).__init__(db)

    def get_item_by_id(self, _id) -> models.RentalItem:
        return self.db.query(models.RentalItem).filter(models.RentalItem.rental_item_id == _id).first()

    def get_feature_by_id(self, _id) -> models.RentalItemFeature:
        return self.db.query(models.RentalItemFeature).filter(
            models.RentalItemFeature.rental_item_feature_id == _id).first()

    def add_feature(self, _id, req: AddFeatureReq):
        _item = self.get_item_by_id(_id)

        if _item is None:
            raise HTTPException(status_code=404, detail='item not found')
        feature = self.get_feature_by_id(req.feature_id)

        if feature is None:
            raise HTTPException(status_code=404, detail='feature not found')

        self.db.add(models.RentalItemHasRentalItemFeature(
            value=req.value,
            rental_item_rental_item=_item, rental_item_feature_rental_item_feature=feature))
        self.db.commit()

    def edit_item(self, _id, req: EditItemReq):
        item = self.get_item_by_id(_id)
        if item is None:
            raise HTTPException(status_code=404, detail='item not found')
        item.rental_item_name = req.rental_item_name
        self.db.commit()
        return item


def get_service(db: models.Db):
    return RentalItemService(db)


RItemServ = Annotated[RentalItemService, Depends(get_service)]
