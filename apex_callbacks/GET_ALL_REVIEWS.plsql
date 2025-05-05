begin
   apex_json.open_object;
   apex_json.open_array('items');
   for rec in (
      select r.id_review,
             b.book_title,
             r.id_client,
             r.review_score,
             r.review_feedback
        from js_book_reviews r
        join js_books b
      on r.id_book = b.id_book
       order by b.book_title asc,
                r.id_review
   ) loop
      apex_json.open_object;
      apex_json.write(
         'ID_REVIEW',
         rec.id_review
      );
      apex_json.write(
         'BOOK_TITLE',
         rec.book_title
      );
      apex_json.write(
         'ID_CLIENT',
         rec.id_client
      );
      apex_json.write(
         'REVIEW_SCORE',
         rec.review_score
      );
      apex_json.write(
         'REVIEW_FEEDBACK',
         rec.review_feedback
      );
      apex_json.close_object;
   end loop;

   apex_json.close_array;
   apex_json.close_object;
end;