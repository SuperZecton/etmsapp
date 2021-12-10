/*import 'dart:async';
import 'package:mysql1/mysql1.dart';

class DatabaseCore {
  //initialise DB link here
  Future<void> establishMySQLConnection() async
  {
    var settings = new ConnectionSettings(
        host: '192.168.86.34',
        port: 3306,
        user: 'LTCAppuser',
        password: 'LTCuser123',
        db: 'test'
    );


  var conn = await MySqlConnection.connect(settings);

  var userId = 1;
  var results = await conn.query('select Username from Users where ID = ?', [userId]);

  for (var row in results) {
    print('Name: ${row[0]}');
  }
*/










  /*var result = await conn.query('insert into users (name, email, age) values (?, ?, ?)', ['Bob', 'bob@bob.com', 25]);*/

  /*var results = await query.queryMulti(
  'insert into users (name, email, age) values (?, ?, ?)',
  [['Bob', 'bob@bob.com', 25],
  ['Bill', 'bill@bill.com', 26],
  ['Joe', 'joe@joe.com', 37]]); */

  /*await conn.query(
  'update users set age=? where name=?',
  [26, 'Bob']);*/


