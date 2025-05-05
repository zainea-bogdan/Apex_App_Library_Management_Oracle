declare
   l_book_id js_books.id_book%type := to_number ( apex_application.g_x01 );
begin
   for rec in (
      select b.id_book,
             b.book_title,
             b.book_description,
             b.currently_borrowed,
             to_char(
                b.publication_date,
                'YYYY-MM-DD'
             ) as pub_date,
             a.author_name,
             g.genre_name
        from js_books b
        join js_authors a
      on b.id_author = a.id_author
        join js_book_genres g
      on b.id_genre = g.id_genre
       where b.id_book = l_book_id
   ) loop
      apex_json.open_object;
      apex_json.write(
         'BOOK_ID',
         rec.id_book
      );
      apex_json.write(
         'TITLE',
         rec.book_title
      );
      apex_json.write(
         'DESCRIPTION',
         rec.book_description
      );
      apex_json.write(
         'RESERVED',
         rec.currently_borrowed
      );
      apex_json.write(
         'DATE',
         rec.pub_date
      );
      apex_json.write(
         'AUTHOR',
         rec.author_name
      );
      apex_json.write(
         'GENRE',
         rec.genre_name
      );
      apex_json.close_object;
   end loop;
end;