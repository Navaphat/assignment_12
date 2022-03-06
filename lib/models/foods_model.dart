class foodsModel {
  List<dynamic> _data = [];

  foodsModel() {
  }

  setData(var data){
    this._data = data;
  }

  getName(int index) {
    return this._data[index]['name'];
  }

  getPrice(int index) {
    return this._data[index]['price'];
  }

  getImage(int index) {
    return this._data[index]['image'];
  }

  getData(int index) {
    return this._data[index];
  }

  getLength() {
    return _data.length;
  }
}