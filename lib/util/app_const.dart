class AppConst {
  // static String baseUrl="https://25e9-45-115-91-177.in.ngrok.io/";
  // static String baseUrl="https://c9a9-45-115-91-177.in.ngrok.io/";
  // static String baseUrl = "localhost:8000/";
  // static String baseUrl="http://10.0.2.2:8000/";
  // static String baseUrl = "http://127.0.0.1:8000/";
  // static String baseUrl = "http://192.168.0.201:8000/";
  static String baseUrl = "http://34.100.212.22/"; // Live base url
  static String keyIsSkippedLogin = "login Skipped";
  // static String keyIsSkippedLogin = "login not Skipped";
  static int homescreenCategoryCount = 12;

  static String category = "category";

  static String cartKey = "cart key";

  static String ctegoryResponse = """
  {
  "count": 1,
  "data": [
    {
      "id": 489,
      "category": {
        "id": 1,
        "name": "Fruits and Vegetables",
        "categoryImage": "/media/product_module/category/Screenshot_2022-11-22-14-19-17-38_40deb401b9ffe8e1df2f1cc5ba480b12.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Banana_123",
      "short_description": "",
      "description": "",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/vegetables.jpg",
      "vendor": 22,
      "quantities": [
        {
          "id": 9,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-08T12:26:52.295007+05:30",
          "updated_at": "2023-01-08T12:45:18.238971+05:30",
          "weight": "1",
          "qty": 118,
          "price": 123,
          "discount_price": 3,
          "product": 489,
          "offer_price": 120
        },
        {
          "id": 10,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-08T12:27:03.051597+05:30",
          "updated_at": "2023-01-08T12:27:03.051597+05:30",
          "weight": "2",
          "qty": 1212,
          "price": 321,
          "discount_price": 2,
          "product": 489,
          "offer_price": 319
        }
      ],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    }
  ]
}
  """;
  static String ctegoryResponse2 = """
  {
  "count": 68,
  "data": [
    {
      "id": 20,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Ground nut cold pressed oil",
      "short_description": "Cold pressed  pure natural Groundnut oil",
      "description": "cold pressed pure and natural  Groundnut oil",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1155638436481687745.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 23,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Tata Rock Salt",
      "short_description": "Rock salt for best health",
      "description": "Rock salt for best Health",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3841681646351915125.jpg",
      "vendor": 22,
      "quantities": [
        {
          "id": 4,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2022-12-25T19:44:07.313653+05:30",
          "updated_at": "2023-01-05T18:21:43.376856+05:30",
          "weight": "1",
          "qty": 4551,
          "price": 100,
          "discount_price": 10,
          "product": 23,
          "offer_price": 90
        },
        {
          "id": 5,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2022-12-25T19:44:32.131566+05:30",
          "updated_at": "2023-01-04T16:57:41.266153+05:30",
          "weight": "0.5",
          "qty": 1096,
          "price": 20,
          "discount_price": 5,
          "product": 23,
          "offer_price": 15
        }
      ],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 28,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Dabur Honey",
      "short_description": "Dabur Honey",
      "description": "Dabur Branded Honey",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4702006581429275429.jpg",
      "vendor": 22,
      "quantities": [
        {
          "id": 6,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-02T23:57:41.847581+05:30",
          "updated_at": "2023-01-05T18:21:43.384853+05:30",
          "weight": "1",
          "qty": 1229,
          "price": 110,
          "discount_price": 12,
          "product": 28,
          "offer_price": 98
        },
        {
          "id": 7,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-02T23:58:01.201898+05:30",
          "updated_at": "2023-01-04T16:57:41.258152+05:30",
          "weight": "2",
          "qty": 121122,
          "price": 250,
          "discount_price": 15,
          "product": 28,
          "offer_price": 235
        }
      ],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 29,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Tata Iodised Salt 1 kg",
      "short_description": "Tata Iodised Salt packet",
      "description": "Tata Iodised Salt Packet 1 kg",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6893934133502259763.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 30,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Tata Crystal Salt 1 kg",
      "short_description": "Tata Crystal Salt",
      "description": "Tata Crystal Salt",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4965574203737469321.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 35,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Tata Salt low sodium Iodised",
      "short_description": "this salt useful for health because low iodised",
      "description": "lite iodised Salt",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5342783728757578206.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 36,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Kesari Amazing Saffron",
      "short_description": "Saffron is good for health",
      "description": "saffron good for health",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5377003402210100268.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 37,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Kesari Amazing Saffron",
      "short_description": "Saffron is good for health",
      "description": "saffron good for health",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6391576893619097713.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 38,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Chilli Powder",
      "short_description": "MTR Chilli Powder 100 gm",
      "description": "MTR Chilli Powder 100 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1749419587708781275.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 39,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Turmeric Powder",
      "short_description": "MTR Turmeric POWDER",
      "description": "MTR Termeric Powder",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1435447225516229262.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 65,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Toor Dal / Tur Dal",
      "short_description": "Toor Dal No 1 Quality",
      "description": "Toor dal No.1 Quality",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker932465116522839944.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 66,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Moong Dal",
      "short_description": "Moong Dal",
      "description": "Moong Dal",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2041824566683854286.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 67,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Fried Gram/ Bengal Gram",
      "short_description": "Fried Gram , Bengal Gram",
      "description": "Bengal Gram",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6240297578121162359.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 68,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Aashirwad ATTA",
      "short_description": "Aashirwad ATTA",
      "description": "Aashirwad ATTA",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7643785286298734320.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 69,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Aashirwad ATTA",
      "short_description": "Aashirwad ATTA",
      "description": "Aashirwad ATTA",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7643785286298734320_PUB9lBx.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 81,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Mustard Seeds",
      "short_description": "Mustard Seeds",
      "description": "Mustard Seeds",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1445331678525951889.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 82,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Jeera",
      "short_description": "<p>jeera</p>",
      "description": "<p>jeera</p>",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7295861933345279330.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 83,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Roasted vermicelli",
      "short_description": "Roasted vermicelli",
      "description": "Roasted vermicelli",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3349362395304665561.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 84,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Tamarind",
      "short_description": "Tamarind",
      "description": "Tamarind",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7215403887531960445.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 87,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Cumin powder",
      "short_description": "Cumin powder",
      "description": "Cumin powder",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker594752456733182675.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 88,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Garam Masala",
      "short_description": "MTR Garam Masala",
      "description": "MTR Garam Masala",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3479629639849299201.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 89,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Sambar Powder",
      "short_description": "Sambar Powder",
      "description": "Sambar Powder",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4552264856400751141.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 90,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Puligare",
      "short_description": "Puligare",
      "description": "Puligare",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8148290179478173358.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 91,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Rasam Powder",
      "short_description": "Rasam Powder",
      "description": "Rasam Powder",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4902100551386422451.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 92,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Black pepper",
      "short_description": "Black pepper",
      "description": "Black pepper",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3483799959989913682.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 93,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Biryani Masala",
      "short_description": "Biryani Masala",
      "description": "Biryani Masala",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3820079841023884296.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 145,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Kachi Ghani Mustard oil",
      "short_description": "Kachi Ghani Mustard oil",
      "description": "Kachi Ghani Mustard oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6995034520800679683.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 174,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Groundnut",
      "short_description": "Groundnut 1 kg",
      "description": "Groundnut 1 kg",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5880120554683305675.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 195,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Eastern Coriander Powder,Dhaniya powder 250 g Pouch",
      "short_description": "Eastern 250 gram",
      "description": "Eastern 250 gram",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8498491829940930119_fe52MaR.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 196,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Sun Premium Refined Sunflower Oil",
      "short_description": "Sun Premium Refined Sunflower Oil MRP 180 offer price 152",
      "description": "Sun Premium Refined Sunflower Oil MRP 180 offer price 152",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1604981898507159065.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 197,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Freedom Refined  Sun flower oil",
      "short_description": "Freedom Refined  Sun flower oil MRP 192 offer price 159",
      "description": "Freedom Refined  Sun flower oil 192 offer price 159",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6181849222302914616.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 198,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Sunpure Filtered Groundnut oil",
      "short_description": "Sunpure Filtered Groundnut oil  1L MRP 250 offer price 185",
      "description": "Sunpure Filtered Groundnut oil MRP 250 offer price 185",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6266984760333606723.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 200,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Tomato Pickle 300 Gram",
      "short_description": "MTR Tomato Pickles",
      "description": "MTR Tomato Pickles",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3323632316117201709.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 201,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Lemon Pickles 300 gm",
      "short_description": "MTR Lemon Pickles 300 gm",
      "description": "MTR Lemon Pickles 300 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5169519932199942220.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 271,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Moongdal",
      "short_description": "Moongdal",
      "description": "Moongdal",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2547259270388476968.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 272,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Green Moongdal",
      "short_description": "Moongdal",
      "description": "Moongdal",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3523641506990251998.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 273,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Sanaga Badalu",
      "short_description": "Sanaga Badalu",
      "description": "Sanaga Badalu",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1548966127162381972.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 274,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Upma rava / bansi rava",
      "short_description": "Upma rava/ bansi rava",
      "description": "Upma rava / bansi rava",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker3289907441691344635.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 275,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Sooji Rava( Upma rava)",
      "short_description": "Sooji Rava( Upma rava)",
      "description": "Sooji Rava( Upma rava)",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1478888185024741831.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 276,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Vermicelli",
      "short_description": "MTR Vermicelli",
      "description": "MTR Vermicelli",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4873220560469512082.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 277,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Bambino vermicelli / Semiya",
      "short_description": "Bambino vermicelli / Semiya",
      "description": "Bambino vermicelli",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6710670143694423397.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 278,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Yippi Noodles",
      "short_description": "Yippi Noodles",
      "description": "Yippi Noodles",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7012170289750099903.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 279,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Yippi Noodles 520 gm( Pack of 8)",
      "short_description": "Yippi Noodles 520 gm( Pack of 8)",
      "description": "Yippi Noodles 520 gm( Pack of 8)",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5139903296178847886.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 280,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Home made Lemon Pickle 200 gm",
      "short_description": "Home made Lemon Pickle",
      "description": "Home made Lemon Pickle",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2686581828315350244.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 281,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Safal Sunflower Oil",
      "short_description": "Safal Sunflower Oil",
      "description": "Safal Sunflower Oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker7312740888573672055.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 282,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Safal Groundnut Oil",
      "short_description": "Safal Groundnut Oil",
      "description": "Safal Groundnut Oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2155547467698700550.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 304,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Ginger Garlic Paste 200 gram",
      "short_description": "Ginger Garlic Paste",
      "description": "Ginger Garlic Paste 200 gram",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1108040561323722147.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 349,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "MTR Kadhai Paneer Masala 12 g",
      "short_description": "MTR Kadhai Paneer Masala 12 g",
      "description": "MTR Kadhai Paneer Masala 12 g",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2017734178444856872.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 356,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Sago (Sabudana) 200 gm",
      "short_description": "Sago (Sabudana) 200 gm",
      "description": "Sago (Sabudana) 200 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1827903320368225500.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 377,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Eastern Chicken Masala 100 gm",
      "short_description": "Eastern Chicken Masala 100 gm",
      "description": "Eastern Chicken Masala 100 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5372051102293783837.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 378,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Aachi chicken Kabab/ chicken 65  masala",
      "short_description": "Aachi chicken Kabab/ chicken 65  50 gm",
      "description": "Aachi chicken Kabab/ chicken 65",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8058499219599764628.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 399,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Red Chawli / Alasandulu / Bobbarlu",
      "short_description": "Red Chawli / Alasandulu / Bobbarlu",
      "description": "Red Chawli / Alasandulu / Bobbarlu",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6875453956957145609.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 404,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Lemon Pickle Home made",
      "short_description": "Lemon Pickle Home made",
      "description": "Lemon Pickle Home made",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker736692789958371999.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 419,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Sugar 1 kg",
      "short_description": "sugar",
      "description": "sugar",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4714476306739444489.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 420,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Poha/ Atukulu/ Avalkki 1 kg",
      "short_description": "Poha/ Atukulu/ Avalkki 1 kg",
      "description": "Poha/ Atukulu/ Avalkki 1 kg",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker9218018417966610750.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 421,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Jaggery 1 kg",
      "short_description": "Jaggery 1 kg",
      "description": "Jaggery 1 kg",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker767286444250270196.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 422,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Diamond Mishri / Patika bellam",
      "short_description": "Diamond Mishri / Patika bellam",
      "description": "Diamond Mishri / Patika bellam",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker9184972163615438830.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 423,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "yippee 280 gm",
      "short_description": "yippee 280 gm",
      "description": "yippee 280 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6335235885979972058.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 439,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Cold Pressed Sunflower oil",
      "short_description": "Cold Pressed Sunflower oil",
      "description": "Cold Pressed Sunflower oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker6167461416747827748.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 440,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Cold Pressed coconut Oil",
      "short_description": "Cold Pressed coconut Oil",
      "description": "Cold Pressed coconut Oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4941760174868208095.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 441,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Cold Pressed Sesame Oil",
      "short_description": "Cold Pressed Sesame Oil",
      "description": "Cold Pressed Sesame Oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker2531215022895271068.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 442,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Cold pressed Safflower Oil",
      "short_description": "Cold pressed Safflower Oil",
      "description": "Cold pressed Safflower Oil",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8520049519362747768.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 443,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Homemade Turmeric Powder",
      "short_description": "Homemade Turmeric Powder",
      "description": "Homemade Turmeric Powder",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5979452135911479909.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 461,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Urdi dal / urad dal",
      "short_description": "Urdi dal ,urad dal",
      "description": "Urdi dal , urad dal",
      "status": "out_of_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker5200371572476738164.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 462,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Urad dal split / urdi dal split",
      "short_description": "Urad dal / urdi dal split",
      "description": "Urad dal / urdi dal split",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8945717195778599400.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 474,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Harlicks 200 gram",
      "short_description": "Harlicks 200 gram",
      "description": "Harlicks 200 gram",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker1611207422746609606.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 475,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Boost 500 gm",
      "short_description": "Boost 500 gm",
      "description": "Boost 500 gm",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker4836068994565409335.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    },
    {
      "id": 476,
      "category": {
        "id": 3,
        "name": "Grocery and Staples",
        "categoryImage": "/media/product_module/category/grocery.jpg",
        "active": true
      },
      "brand_name": null,
      "name": "Nescafe Sunrise Coffee Powder 50 g",
      "short_description": "Nescafe Sunrise Premium Instant Coffee Powder 50 g",
      "description": "Nescafe Sunrise Premium Instant Coffee Powder 50 g",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/image_picker8059510558170797221.jpg",
      "vendor": 22,
      "quantities": [],
      "selectedQuantity": 0,
      "cartId": 0,
      "vendorDistance": 2.0168573109384362
    }
  ]
}
  
  """;

  static String searchResponse = """
  {
  "count": 1,
  "data": [
    {
      "id": 489,
      "category": {
        "id": 1,
        "name": "Fruits and Vegetables",
        "categoryImage": "/media/product_module/category/Screenshot_2022-11-22-14-19-17-38_40deb401b9ffe8e1df2f1cc5ba480b12.jpg",
        "active": true
      },
      "brand_name": {
        "id": 1,
        "name": "None"
      },
      "name": "Banana_123",
      "short_description": "",
      "description": "",
      "status": "in_stock",
      "tax": "0.00",
      "main_image": "/media/product_module/product/vegetables.jpg",
      "vendor": 22,
      "quantities": [
        {
          "id": 9,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-08T12:26:52.295007+05:30",
          "updated_at": "2023-01-08T13:45:48.938379+05:30",
          "weight": "1",
          "qty": 117,
          "price": 123,
          "discount_price": 3,
          "product": 489,
          "offer_price": 120
        },
        {
          "id": 10,
          "uom": {
            "id": 1,
            "name": "Kilogram",
            "short_name": "Kg"
          },
          "created_at": "2023-01-08T12:27:03.051597+05:30",
          "updated_at": "2023-01-08T13:45:48.933379+05:30",
          "weight": "2",
          "qty": 1211,
          "price": 321,
          "discount_price": 2,
          "product": 489,
          "offer_price": 319
        }
      ]
    }
  ]
}
  """;
}
