
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/Modules/Web_view/Web_view_screen.dart';
import '../Network/local/cache_Helper.dart';

Widget DefaultButton(
    {
      double width=double.infinity,
      Color Background=Colors.blue,
      required String text,
      required VoidCallback function,
      var fontcolor=Colors.white,

    })=> Container(
          width: width,
          color: Background,
          child:
              MaterialButton(
                  onPressed: function,
                  child: Text(
                    '$text',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: fontcolor,
                      fontWeight:FontWeight.bold,

),
),
),
);

Widget DefaultTFF(
    {
  required TextEditingController Controller,
  required TextInputType Keyboard,
  ValueChanged<String>? OnSubmit,
  ValueChanged<String>? OnChange,
  required FormFieldValidator<String> Validate,
  required IconData PrefixIcon,
  IconData? SufffixIcon ,
  required String Label,
  VoidCallback? SuffixFunction,
  bool IsPassword=false,
  GestureTapCallback? onTap,
  bool onChecked=true
})=>TextFormField(
  controller: Controller ,
  keyboardType:Keyboard,
  onFieldSubmitted: OnSubmit,
  onChanged: OnChange,
  validator: Validate,
  obscureText: IsPassword,
  onTap: onTap,
  enabled: onChecked,
  decoration: InputDecoration(
    labelText: Label,
    prefixIcon: Icon(PrefixIcon),
    suffixIcon:  IconButton(
      onPressed: SuffixFunction
      , icon: Icon(SufffixIcon)
    ),

    border:OutlineInputBorder(

    ),
  ),
);


Widget BuildArticleItem(data,context,)=>Padding(

  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image:  NetworkImage('${data['urlToImage']}'),

              fit: BoxFit.cover,

            )

        ),

      ),

      SizedBox(

        width: 20.0,),

      Expanded(

        child: Container(

          height: 120.0,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [



              Expanded(

                child: Text('${data['title']} ',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text('${data['publishedAt']}',
                maxLines: 3,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);

Widget articleBuilder(list,context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context, index) => InkWell(
        onTap: () =>
          navigatorTo(context, WebViewScreen(list[index]['url']))
        ,
        child: BuildArticleItem(list[index],context)),
    separatorBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10.0
        ),
        child: MyDivider(),
      );
    },
    itemCount: list.length);

Widget MyDivider()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

void navigatorTo(context,widget) => Navigator.push(
    context,
    MaterialPageRoute(builder:(context) =>  widget,)
);

void navigatorAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
  context,
    MaterialPageRoute(builder:(context) =>  widget,),
      (route)=>false
);



void toast({
  required String message,
  required Color color,

}) => Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor:color,
textColor: Colors.white,
fontSize: 16.0,
);


