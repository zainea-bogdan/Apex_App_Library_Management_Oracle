begin
   apex_json.open_object;         -- {
   apex_json.open_array('items'); -- "items": [

   for rec in (
      select id_book,
             book_title,
             currently_borrowed
        from js_books
       order by id_book
   ) loop
      apex_json.open_object;       -- {
      apex_json.write(
         'BOOK_ID',
         rec.id_book
      );
      apex_json.write(
         'TITLE',
         rec.book_title
      );
      apex_json.write(
         'RESERVED',
         rec.currently_borrowed
      );
      apex_json.close_object;      -- }
   end loop;

   apex_json.close_array;         -- ]
   apex_json.close_object;        -- }
end;