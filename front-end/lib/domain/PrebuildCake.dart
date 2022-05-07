class PrebuildCake {


  int merchantId;
  String cakeName;
  int baseSizeId;
  int baseFlavorId;
  int baseColorId;
  int frostingColorId;
  int frostingFlavorId;
  double price;
  List<int> toppingIds;

  PrebuildCake(

      this.merchantId,
      this.cakeName,
      this.baseSizeId,
      this.baseFlavorId,
      this.baseColorId,
      this.frostingColorId,
      this.frostingFlavorId,
      this.price,
      this.toppingIds);
}