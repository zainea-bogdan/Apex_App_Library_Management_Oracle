declare
   l_book_id   number := to_number ( apex_application.g_x01 );
   l_feedback  varchar2(4000) := apex_application.g_x02;
   l_client_id js_client_accounts.id_client%type;
   l_score     number := trunc(dbms_random.value(
      1,
      6
   )); -- random score 1–5
begin
  -- Select random client
   select id_client
     into l_client_id
     from (
      select id_client
        from js_client_accounts
       order by dbms_random.value
   )
    where rownum = 1;

  -- Insert into reviews table
   insert into js_book_reviews (
      id_review,
      id_client,
      id_book,
      review_score,
      review_feedback
   ) values ( seq_review_id.nextval,
              l_client_id,
              l_book_id,
              l_score,
              l_feedback );

  -- Success JSON
   apex_json.open_object;
   apex_json.write(
      'status',
      'success'
   );
   apex_json.close_object;
exception
   when others then
      apex_json.open_object;
      apex_json.write(
         'status',
         'error'
      );
      apex_json.write(
         'message',
         sqlerrm
      );
      apex_json.close_object;
end;