import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Vehicles extends StatelessWidget{
  final List<String> imageList = [
    "https://www.lifeandexperiences.com/wp-content/uploads/2017/08/wheelchair-car.jpg",
    "https://alliedvehiclesgroup.com/wp-content/uploads/2016/04/Ford-Freedom-1990-1.jpg",
    "https://www.alliedmobility.com/au/wp-content/uploads/2019/05/JLP_PeugotHorizon_147-1.jpg",
    "https://d2f0ora2gkri0g.cloudfront.net/bkpam2193675_e7taxiwebsizeimag0151.jpg",
    "https://www.larue.k12.ky.us/docs/_full_/district/news%20images/2018/april/lcs%20upgrade%20van.jpg?id=3134&thumbwidth=200&fullwidth=500",
    "https://mobilityexpress.com/media/mageplaza/blog/post/image/b/l/blog_medicarewheelchairvans.jpg"
  ];
  final List<String> imageList1 = [
    "https://www.lewisreedgroup.co.uk/wp-content/uploads/2019/09/standard1.jpg",
    "https://thorntreesgarage.co.uk/wp-content/uploads/2019/05/vw-blog-image-1200x900.jpg",
    "https://www.mobility-services.com/wavs/DSC_0038(1).jpg",
    "https://www.telegraph.co.uk/content/dam/business/spark/ldc-lloyds/female-wheelchair-user-getting-into-taxi.jpg?imwidth=450",
    "https://alliedvehiclesgroup.com/wp-content/uploads/2016/08/RentalsMAIN.jpg",
    "https://cdn.shopify.com/s/files/1/0618/3501/files/Mobility-Ventures-2016-MV-1-best-wheelchair-accessible-cars.jpg?10945117968718284563"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('DUMAPOHEALTH',
            style:TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
            ),),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Sedans/SUVs/Minivans',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Initial cost: \$1.00'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Service fee: \$2.80'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Price per minute: \$0.16'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Price per mile: \$1.10'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Minimum fare: \$4'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Maximum fare: \$400'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Cancelation fee: \$5'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GFCarousel(
                      items: imageList.map(
                            (url) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  width: 1000.0
                              ),
                            ),
                          );
                        },

                      ).toList(),
                    ),
                  ],
                ),
              ),
              //end of 1
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                        title: Text(
                          'Wheelchair Accessible Vehicles',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Initial cost: \$1.50'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Service fee: \$3.00'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Price per minute: \$0.25'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Price per mile: \$1.66'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Minimum fare: \$6.35'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Maximum fare: \$400'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text('Cancelation fee: \$5'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GFCarousel(
                      items: imageList1.map(
                            (url) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  width: 1000.0
                              ),
                            ),
                          );
                        },

                      ).toList(),
                    ),
                  ],
                ),
              ),
              //end of 2
            ],
          ),
        ),
      ),
    );
  }

}