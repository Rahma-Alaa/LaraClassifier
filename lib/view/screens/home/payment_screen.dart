import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'Vipps';
  String _selectedCardType = 'Visa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Lara',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3DBC24)),
            ),
            Text(
              'Classifier',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            _buildPaymentOption(
              title: 'Paypal',
              logo: 'assets/icons/paypal.png',
              selected: _selectedMethod == 'Paypal',
              onTap: () {
                setState(() {
                  _selectedMethod = 'Paypal';
                });
              },
            ),
            _buildPaymentOption(
              title: 'Card payment',
              logos: [
                'assets/icons/visa.png',
                'assets/icons/mastercard.png',
              ],
              selected: _selectedMethod == 'Card payment',
              onTap: () {
                setState(() {
                  _selectedMethod = 'Card payment';
                });
              },
            ),
            if (_selectedMethod == 'Card payment') ...[
              Divider(),
              _buildCardTypeOption(
                title: 'Visa',
                selected: _selectedCardType == 'Visa',
                onTap: () {
                  setState(() {
                    _selectedCardType = 'Visa';
                  });
                },
              ),
              _buildCardTypeOption(
                title: 'Mastercard',
                selected: _selectedCardType == 'Mastercard',
                onTap: () {
                  setState(() {
                    _selectedCardType = 'Mastercard';
                  });
                },
              ),
              SizedBox(height: 16),
              _buildTextField(label: 'Name', initialValue: 'Lara Classifier'),
              _buildTextField(label: 'Card number', initialValue: '4209 9807 0987 0987'),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(label: 'Expiry date', initialValue: '12/26'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(label: 'CVV Code', initialValue: '123'),
                  ),
                ],
              ),
            ],
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedMethod == 'Paypal') {
                    _processPayPalPayment();
                  } else {
                    // Process card payment
                  }
                },
                child: Text('Pay 1899 AED',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3DBC24),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayPalPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsePaypal(
          sandboxMode: true,
          clientId: "YOUR_PAYPAL_CLIENT_ID",
          secretKey: "YOUR_PAYPAL_SECRET_KEY",
          returnURL: "https://samplesite.com/return",
          cancelURL: "https://samplesite.com/cancel",
          transactions: [
            {
              "amount": {
                "total": '1899',
                "currency": "AED",
                "details": {
                  "subtotal": '1899',
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": "The payment transaction description.",
              "item_list": {
                "items": [
                  {
                    "name": "Item name",
                    "quantity": 1,
                    "price": '1899',
                    "currency": "AED"
                  }
                ],

                // Shipping address is not required though
                "shipping_address": {
                  "recipient_name": "Lara Classifier",
                  "line1": "123 Main Street",
                  "line2": "",
                  "city": "Dubai",
                  "country_code": "AE",
                  "postal_code": "00000",
                  "phone": "+0000000000",
                  "state": "Dubai"
                },
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
          },
          onCancel: (params) {
            print('cancelled: $params');
          },
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    String? logo,
    List<String>? logos,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: logo != null
          ? Image.asset(logo, height: 24)
          : logos != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: logos.map((logo) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(logo, height: 24),
        )).toList(),
      )
          : null,
      title: Text(title),
      trailing: Radio(
        value: title,
        groupValue: _selectedMethod,
        activeColor: Color(0xFF3DBC24),
        onChanged: (value) => onTap(),
      ),
      onTap: onTap,
    );
  }

  Widget _buildCardTypeOption({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return RadioListTile<String>(
      title: Text(title),
      value: title,
      groupValue: _selectedCardType,
      activeColor: Color(0xFF3DBC24),
      onChanged: (value) => onTap(),
    );
  }

  Widget _buildTextField({required String label, required String initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: Color(0xFF3DBC24),
        cursorErrorColor: Color(0xFF3DBC24),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3DBC24), width: 2.0),
          ),
          floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
        ),
      ),
    );
  }
}
