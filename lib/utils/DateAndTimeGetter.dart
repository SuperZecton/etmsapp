class DateAndTime
{
  static final DateAndTime _singleton = DateAndTime._internal();
  factory DateAndTime()
  {
    return _singleton;
  }
  String Date(DateTime dt)
  {
    String date = dt.day.toString() + dt.month.toString() + dt.year.toString();
    return date;
  }

  String Time(DateTime dt)
  {
    String time = dt.hour.toString() + dt.minute.toString() + dt.second.toString();
    return time;
  }

  DateAndTime._internal();
}