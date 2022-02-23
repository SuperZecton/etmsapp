class DateAndTime
{
  static final DateAndTime _singleton = DateAndTime._internal();
  factory DateAndTime()
  {
    return _singleton;
  }
  String dateTimeToDate(DateTime dt)
  {
    var now = dt;
    String currentDate = now.day.toString().padLeft(2, '0') +
        "/" +
        now.month.toString().padLeft(2, '0') +
        "/" +
        now.year.toString();
    return currentDate;
  }

  String dateTimeToTime(DateTime dt)
  {
    var now = dt;
    String currentTime = now.hour.toString().padLeft(2, '0') + now.minute.toString().padLeft(2, '0') + now.second.toString().padLeft(2, '0');
    return currentTime;
  }

  String getCurrentTime()
  {
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String currentTime = now.hour.toString().padLeft(2, '0') + now.minute.toString().padLeft(2, '0') + now.second.toString().padLeft(2, '0');
    return currentTime;
  }

  String getCurrentDate()
  {
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String currentDate = now.day.toString().padLeft(2, '0') +
        "/" +
        now.month.toString().padLeft(2, '0') +
        "/" +
        now.year.toString();
    return currentDate;
  }

  DateTime dateAndTimetoDateTime(String date, String time)
  {
    var rawdate = date.split('/');
    var datetime = DateTime.utc(
        int.parse(rawdate[2]),
        int.parse(rawdate[1]),
        int.parse(rawdate[0]),
        int.parse(time.substring(0, time.length - 4)),
        int.parse(time.substring(2, time.length - 2)),
        int.parse(time.substring(4, time.length)));
    return datetime;
  }

  DateTime getGMT(DateTime dt) {
    var now = DateTime.parse(dt.toString() + '-08:00');
    return now;
  }

  String getDisplayCurrentTime()
  {
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String currentTime = now.hour.toString().padLeft(2, '0') + ":" + now.minute.toString().padLeft(2, '0');
    return currentTime;

  }

  DateAndTime._internal();
}