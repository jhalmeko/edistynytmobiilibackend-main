

from fastapi import APIRouter, Path

from dtos.feature import AddFeatureReq, AddFeatureRes
from services.feature import FServ


router = APIRouter(
    prefix='/api/v1/feature',
    tags=['feature']
)


@router.post('/')
async def add_feature(service: FServ, req: AddFeatureReq) -> AddFeatureRes:
    feature = service.add_feature(req)
    return feature

