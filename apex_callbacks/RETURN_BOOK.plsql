declare
   l_book_id js_books.id_book%type := to_number ( apex_application.g_x01 );
begin
  -- Only update if currently borrowed
   update js_books
      set
      currently_borrowed = 'N'
    where id_book = l_book_id
      and currently_borrowed = 'Y';

   apex_json.open_object;
   apex_json.write(
      'status',
      'returned'
   );
   apex_json.close_object;
   commit;
end;