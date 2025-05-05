declare
   l_book_id   number := to_number ( apex_application.g_x01 );
   l_client_id number;
begin
  -- Get a random client from js_client_accounts
   select id_client
     into l_client_id
     from (
      select id_client
        from js_client_accounts
       order by dbms_random.value
   )
    where rownum = 1;

  -- Update the book status to 'Y' (reserved)
   update js_books
      set
      currently_borrowed = 'Y'
    where id_book = l_book_id;

  --  Insert reservation record
   insert into js_book_reservation_history (
      id_reservation,
      id_client,
      id_book,
      date_reservation_start,
      date_reservation_return
   ) values ( seq_reservation_id.nextval,
              l_client_id,
              l_book_id,
              sysdate,
              sysdate + 14 );

  -- JSON response to ensure APEX call succeeds
   apex_json.open_object;
   apex_json.write(
      'status',
      'ok'
   );
   apex_json.close_object;
   commit;
end;