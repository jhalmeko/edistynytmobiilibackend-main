from fastapi import APIRouter, Path

from dtos.rental_item import AddFeatureReq, GetItemRes, GetRentalItemFeaturesRes, EditItemReq
from services.rental_item import RItemServ

router = APIRouter(
    prefix='/api/v1/rentalitem',
    tags=['rental_item']
)


@router.get('/{rental_item_id}')
async def get_item_by_item_id(service: RItemServ, rental_item_id: int = Path(gt=0)) -> GetItemRes:
    item = service.get_item_by_id(rental_item_id)

    return item


@router.get('/{rental_item_id}/features')
async def get_features_by_item(service: RItemServ, rental_item_id: int = Path(gt=0)) -> GetRentalItemFeaturesRes:
    item = service.get_item_by_id(rental_item_id)

    return {'features': item.rental_item_has_rental_item_feature}


@router.put('/{rental_item_id}/features')
async def add_feature_to_item(service: RItemServ, req: AddFeatureReq, rental_item_id: int = Path(gt=0)):
    service.add_feature(rental_item_id, req)


@router.put('/{rental_item_id}')
async def add_feature_to_item(service: RItemServ, req: EditItemReq, rental_item_id: int = Path(gt=0)) -> GetItemRes:
    item = service.edit_item(rental_item_id, req)
    return item
