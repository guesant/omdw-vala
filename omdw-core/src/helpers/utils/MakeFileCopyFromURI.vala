namespace OMDW.Core.Utils {

public File make_file_copy_from_uri(string image_url, File local_file, FileCopyFlags flags = FileCopyFlags.OVERWRITE) throws Error {
  var file_from_http = File.new_for_uri(image_url);
  file_from_http.copy(local_file, flags);
  return local_file;
}

}