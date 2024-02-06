// import 'package:avatar_letter/avatar_letter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/model/addToCart/addToCart.dart';
import 'package:tanvi/model/address/addressProvider.dart';
import 'package:tanvi/model/notificationList/notificationList.dart';
import 'package:tanvi/model/profile/profileProvider.dart';
import 'package:tanvi/screens/notifications.dart';
import 'package:tanvi/screens/pendingOrdersPage.dart';
import 'package:tanvi/screens/wallet_screen.dart';
import 'package:tanvi/widgets/cart/checkout.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AddressProvider? addressProvider;
  ProfileProvider? profileProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    profileProvider = Provider.of<ProfileProvider>(context);
    addressProvider=Provider.of<AddressProvider>(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            if (profileProvider!.isLogedUser) ...[
              UserAccountsDrawerHeader(
                /*decoration: BoxDecoration(
                  color: AppBarTheme.of(context).color,
                ),*/
                currentAccountPicture: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: profileProvider!.getProfileImageEndPoind.isNotEmpty
                          ? Image(image: NetworkImage(profileProvider!.getProfileImage,),fit: BoxFit.cover,)
                          :Text("NA")
                    ),
                  ),
                ),
                accountName: Text("${profileProvider!.getFullName??"No Name"}"),
                // accountName: Text("No Name",style: TextStyle(color: Colors.red),),
                accountEmail: Text("${profileProvider!.getEmail??"No Number"}"),
              ),
              ListTile(
                title: Text("Pay Now"),
                leading: Icon(Icons.payment),
                onTap: () async {
                  Navigator.pop(context);
                  var provider = Provider.of<AddToCartProvider>(context,listen: false);
                  final providerMap = provider.cartData;
                  SharedPreferences localStorage = await SharedPreferences.getInstance();
                 var couponCode = localStorage.getString('couponCode');
                  Navigator.of(context)
                      .pushNamed('/checkout-screen', arguments: {
                    'data': providerMap,
                    'tax': provider.taxCalculation,
                    'discountCode': couponCode
                  });
                },
              ),
              ListTile(
                title: Text("Wallet"),
                leading: Icon(Icons.favorite),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WalletScreen()));
                },
              ),
              ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.wallet),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PendingOrders()));
                },
              ), ListTile(
                title: Text("Notifications"),
                leading: Icon(Icons.notification_add_outlined),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
              ),
              ListTile(
                title: Text("Sign Out"),
                leading: Icon(Icons.lock),
                onTap: (){
                  Navigator.pop(context);
                  profileProvider!.logout();
                  // Provider.of<ValueNotifier<int>>(context, listen: false).value=0;
                },
              )
            ] else ...[
              UserAccountsDrawerHeader(
                // currentAccountPicture: Icon(Icons.supervised_user_circle),
                accountName: Text("Welcome"),
                accountEmail: Text("Guest User"),
              ),
              ListTile(
                title: Text("Login"),
                leading: Icon(Icons.lock_open),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/sign-in');
                },
              )
            ],
            ListTile(
              title: Text("Customer Care"),
              leading: Icon(Icons.chat_bubble_outline_outlined),
              onTap: () async {
                Navigator.pop(context);

               String mobNo="8050002655";
                String url = "whatsapp://send?&phone=+91$mobNo";
                if (await canLaunch(url)) {
                await launch(url);
                } else {
                throw 'Could not launch $url';
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderListScreen()));
              },
            ),
         /*   ListTile(leading: Icon(Icons.chat),title: Text("Whatsapp"),
              onTap: () async {
                Navigator.pop(context);
                String mobNo = userRepository.orgContact;
                // String url = "whatsapp://send/$mobNo";
                // String url = "whatsapp://send?text=YourShareTextHere&phone=$mobNo";
                String url = "whatsapp://send?&phone=+91$mobNo";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )*/
          ],
        ),
      ),
    );
  }
}
