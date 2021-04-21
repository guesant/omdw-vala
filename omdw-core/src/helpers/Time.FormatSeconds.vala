namespace OMDW.Core.Utils.Time {

public static string format_seconds(int64 duration) {
  string remaing_hours = "%i".printf((int)Math.floor(duration/3600));
  string minutes_and_seconds = (new DateTime.from_unix_utc(duration)).format("%M:%S");
  return "%s:%s".printf(remaing_hours, minutes_and_seconds);
}

}