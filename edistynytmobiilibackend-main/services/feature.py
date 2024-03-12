from typing import Annotated

from fastapi import Depends

import models
from dtos.feature import AddFeatureReq
from services.base import BaseService


class FeatureService(BaseService):
    def __init__(self, db: models.Db):
        super(FeatureService, self).__init__(db)

    def add_feature(self, req: AddFeatureReq):
        feature = models.RentalItemFeature(**req.model_dump())
        self.db.add(feature)
        self.db.commit()
        return feature


def get_service(db: models.Db):
    return FeatureService(db)


FServ = Annotated[FeatureService, Depends(get_service)]
