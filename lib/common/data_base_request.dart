abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'Role';
  static const String tableUsers = 'Users';
  static const String tableProfile = 'Profile';
  static const String tableCategory = 'Category';
  static const String tableType = 'Type';
  static const String tableCharacteristics = 'Characteristics';
  static const String tableProduct = 'Product';
  static const String tableAddProduct = 'AddProduct';
  static const String tableBasket = 'Basket';
  

  static const List<String> tableList = [tableRole, tableUsers,tableProfile, tableCategory, tableType,
  tableCharacteristics, tableProduct, tableAddProduct, tableBasket];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableUsers,
    _createProfile,
    _createCategory,
    _createType,
    _createCharacteristics,
    _createProduct,
    _createAddProduct,
    _createBasket
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id"),PRIMARY KEY("id"))';

  static const String _createProfile =
      'CREATE TABLE "$tableProfile" ("id" INTEGER,"surname" TEXT NOT NULL UNIQUE, "name" TEXT NOT NULL UNIQUE, "middleName" TEXT NULL UNIQUE, "address" TEXT NULL, "birthDate" DATE NULL, "id_user"	INTEGER,FOREIGN KEY("id_user") REFERENCES "User"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createType =
      'CREATE TABLE "$tableType" ("id" INTEGER,"type" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createCharacteristics =
      'CREATE TABLE "$tableCharacteristics" ("id" INTEGER,"width" DOUBLE NOT NULL, "length" DOUBLE NOT NULL, "height" DOUBLE NOT NULL, "weight" DOUBLE NOT NULL, "color" TEXT NOT NULL, "id_category"	INTEGER,FOREIGN KEY("id_category") REFERENCES "Category"("id"), "id_type"	INTEGER,FOREIGN KEY("id_type") REFERENCES "Type"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createProduct =
      'CREATE TABLE "$tableProduct" ("id" INTEGER,"productName" TEXT NOT NULL UNIQUE, "price" DOUBLE NOT NULL UNIQUE, "id_characteristics"	INTEGER,FOREIGN KEY("id_characteristics") REFERENCES "Characteristics"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createAddProduct =
      'CREATE TABLE "$tableAddProduct" ("id" INTEGER,"quantity" INT NOT NULL UNIQUE, "id_product"	INTEGER,FOREIGN KEY("id_product") REFERENCES "Product"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createBasket =
      'CREATE TABLE "$tableBasket" ("id" INTEGER,"totalAmount" INT NOT NULL UNIQUE,"id_addProduct"	INTEGER,FOREIGN KEY("id_addProduct") REFERENCES "AddProduct"("id"), "id_profile"	INTEGER,FOREIGN KEY("id_profile") REFERENCES "Profile"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

        static const String _createCategory = "create table tableCategory("
      "id int primary key not null,"
      "category text"
      ");";
}
