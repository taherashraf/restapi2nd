class Urls {

  static String baseUrl = 'http://35.73.30.144:2008/api/v1';
  static String readUrl = '$baseUrl/ReadProduct';
  static String createProductUrl = '$baseUrl/CreateProduct';
  static String updateUrl(String id) => '$baseUrl/UpdateProduct/$id';
  static String deleteUrl(String id) => '$baseUrl/DeleteProduct/$id';

}