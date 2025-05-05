drop table js_client_accounts cascade constraints;
drop table js_authors cascade constraints;
drop table js_book_genres cascade constraints;
drop table js_books cascade constraints;
drop table js_book_reviews cascade constraints;
drop table js_book_reservation_history cascade constraints;
drop sequence seq_client_id;
drop sequence seq_author_id;
drop sequence seq_genre_id;
drop sequence seq_book_id;
drop sequence seq_review_id;
drop sequence seq_reservation_id;



create table js_client_accounts (
   id_client         number primary key,
   client_surname    varchar2(100),
   client_first_name varchar2(100),
   username          varchar2(100),
   password          varchar2(100),
   phone_number      varchar2(14),
   email             varchar2(100)
);

create table js_authors (
   id_author          number primary key,
   author_name        varchar2(100) not null,
   author_description varchar2(500)
);

create table js_book_genres (
   id_genre          number primary key,
   genre_name        varchar2(100) not null unique,
   genre_description varchar2(500) not null
);

create table js_books (
   id_book            number primary key,
   id_author          number not null,
   id_genre           number not null,
   book_title         varchar2(100),
   book_description   varchar2(900),
   book_reviews_score number(1),
   publication_date   date,
   currently_borrowed char(1) check ( currently_borrowed in ( 'Y',
                                                              'N' ) ),
   foreign key ( id_author )
      references js_authors ( id_author ),
   foreign key ( id_genre )
      references js_book_genres ( id_genre )
);

create table js_book_reviews (
   id_review       number primary key,
   id_client       number not null,
   id_book         number not null,
   review_score    number not null,
   review_feedback varchar2(500),
   foreign key ( id_client )
      references js_client_accounts ( id_client ),
   foreign key ( id_book )
      references js_books ( id_book )
);

create table js_book_reservation_history (
   id_reservation          number primary key,
   id_client               number not null,
   id_book                 number not null,
   date_reservation_start  timestamp,
   date_reservation_return timestamp,
   foreign key ( id_client )
      references js_client_accounts ( id_client ),
   foreign key ( id_book )
      references js_books ( id_book )
);



-- js_client_accounts
create sequence seq_client_id start with 1 increment by 1 nocache nocycle;

-- js_authors
create sequence seq_author_id start with 1 increment by 1 nocache nocycle;

-- js_book_genres
create sequence seq_genre_id start with 1 increment by 1 nocache nocycle;

-- js_books
create sequence seq_book_id start with 1 increment by 1 nocache nocycle;

-- js_book_reviews
create sequence seq_review_id start with 1 increment by 1 nocache nocycle;

-- js_book_reservation_history
create sequence seq_reservation_id start with 1 increment by 1 nocache nocycle;



-- js_book_genres

insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Mystery',
                                    'A genre centered on fair-play puzzle plots and logical deduction.' );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Thriller',
                                    'A genre centered on suspense and dramatic, thrilling situations.' );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Horror',
                                    'A genre centered on instilling fear into the reader.' );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Fantasy',
                                    'A genre centered on fantastical elements such as magic, magical races and different worlds.'
                                    );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Science Fiction',
                                    'A genre centered on advanced technology, often set far into the future or in an alternate world.'
                                    );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Urban Fantasy',
                                    'A genre centered on supernatural or fantastical elements taking place in a contemporary setting.'
                                    );
insert into js_book_genres values ( seq_genre_id.nextval,
                                    'Literary',
                                    'Non-genre fiction focused on expressing the artistic intent of the author.' );

-- js_client_accounts

insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Smith',
                                        'Alice',
                                        'asmith',
                                        'Pass123!',
                                        '555-0101',
                                        'alice.smith@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Johnson',
                                        'Brian',
                                        'bjohnson',
                                        'Secure456$',
                                        '555-0102',
                                        'brian.j@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Williams',
                                        'Carla',
                                        'cwilliams',
                                        'Hello789#',
                                        '555-0103',
                                        'carla.w@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Brown',
                                        'David',
                                        'dbrown',
                                        'StrongPwd1$',
                                        '555-0104',
                                        'david.brown@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Jones',
                                        'Ella',
                                        'ejones',
                                        'EllaRules!4',
                                        '555-0105',
                                        'ella.j@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Garcia',
                                        'Frank',
                                        'fgarcia',
                                        'Frank123#',
                                        '555-0106',
                                        'frank.g@yahoo.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Martinez',
                                        'Grace',
                                        'gmartinez',
                                        'GracePwd8$',
                                        '555-0107',
                                        'grace.m@yahoo.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Lee',
                                        'Henry',
                                        'hlee',
                                        'Henry_2024!',
                                        '555-0108',
                                        'henry.lee@yahoo.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Clark',
                                        'Ivy',
                                        'iclark',
                                        'IvyPass!9',
                                        '555-0109',
                                        'ivy.clark@gmail.com' );
insert into js_client_accounts values ( seq_client_id.nextval,
                                        'Walker',
                                        'Jake',
                                        'jwalker',
                                        'JakeGo$11',
                                        '555-0110',
                                        'jake.walker@hotmail.com' );

-- js_authors
insert into js_authors values ( seq_author_id.nextval,
                                'Ryuusui Seiryouin',
                                'A Japanese mystery novelist known for his controversial works in the late 90s and early 2000s, particularly the Japan Detectives Club series. Also a writer of English textbooks.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Hiroshi Mori',
                                'A prolific Japanese mystery novelist known for using his experience as a university professor and knowledge of various technologial fields in his novels.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Ryohgo Narita',
                                'Japanese author of manga and light novels, known for his long running series such as Baccano!.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Otaro Maijo',
                                'A Japanese novelist known for his unique first-person stream-of-consciousness narration and his elaborate, metafictional mystery novels. Winner of the Mephisto Prize and the Mishima Yukio prize.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Nisio Isin',
                                'A Japanese author known for his eccentric characters and liberal use of wordplay in his stories.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Kouhei Kadono',
                                'A Japanese author of light novels and mystery novels, known especially for his long-running Boogiepop series, considered one of the first light novel series.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Yukito Ayatsuji',
                                'Japanese mystery and horror author known for launching the New Orthodox movement with his House Series in the early 80s. His real name is Naoyuki Uchida.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Otsuichi',
                                'Japanese author and filmmaker. Known for his dark mystery novels such as GOTH and Summer, Fireworks and My Corpse. He debuted at the age of 16. His real name is Hirotaka Adachi.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'John Dickson Carr',
                                'American mystery novelist from the Golden Age of Detective Fiction. Known as the master of locked rooms, he has written dozens of acclaimed impossible crime novels, including those featuring detective Gideon Fell.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Agatha Christie',
                                'Classic British mystery writer known for her Hercule Poirot novels, as well as her famous work, And Then There Were None, which is among the best selling novels in the world.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Ellery Queen',
                                'A pseudonym for the American writer duo Frederic Dannay and Manfred Bennington Lee, who together wrote numerous novels featuring detective Ellery Queen and Richard Queen throughout the Golden Age and beyond.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'Anthony Berkeley Cox',
                                'British mystery novelist of the Golden Age and member of the Detection Club. Known for his novels with detective Roger Sheringham.'
                                );
insert into js_authors values ( seq_author_id.nextval,
                                'G. K. Chesterton',
                                'British author, philosopher and Christian apologist known for his Father Brown mystery stories as well as his literary works and criticsm.'
                                );

-- js_books

insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Nisio Isin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Decapitation Cycle',
                              'A dropout from an elite Houston-based program for teens is on a visit to a private island. Its mistress, virtually marooned there, surrounds herself with geniuses, especially of the young and female kind - one of whom ends up headless one fine morning.'
                              ,
                              0,
                              to_date('2002-02-05','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Nisio Isin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Strangulation Romanticist',
                              'Now that he''s a cool college student, our anti-hero Iichan thinks his crime-solving days are behind him. Cynical, sarcastic and minimally engaged in his studies, Iichan is much more interested in his own feelings of disaffection and isolation. But despite his resolve to remain aloof, he''s pulled into the narrative when he encounters and bonds with a serial killer named Hitoshi Zerozaki - a homicidal maniac with the soul of an artist whose talent is on display at the grisly scenes of his crimes.'
                              ,
                              0,
                              to_date('2002-05-08','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Nisio Isin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Hanging High School',
                              'An earnestly honest guy who doesn''t even grant pipe dreams to himself, physiologically incapable of letting a single contradiction go, in other words me, got dragged this June to a renowned academy for rich girls, no questions allowed, by the world''s strongest contractor. No matter how you put it, no matter how you spin it, there was probably no point to it. Because the case that arose there was, in and of itself, a bit of nonsense.'
                              ,
                              0,
                              to_date('2002-08-05','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Nisio Isin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Nisemonogatari (Part One)',
                              'Unlike ne''r-do-well former vampire Araragi, his two younger sisters Karen and Tsukihi, who attend a private junior high, are little balls of energy and charisma that their peers look up to. Karen is the brawn and Tsukihi the brains of a vigilantism that the pair sees not merely as defending justice but as justice itself.'
                              ,
                              0,
                              to_date('2008-09-02','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Nisio Isin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Koimonogatari',
                              'Circling back to a middle school girl''s apotheosis, if we can call it that, in Otorimonogatari, and the mortal threat it poses to the hero and his girl, this - season Two''s - finale is narrated, for the first time in the series, by a grown-up - if the word conjures a sense of reliability, of stability and certainty to you, dear reader, then the lesson to take home from this is to trust no one.'
                              ,
                              0,
                              to_date('2011-12-22','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryohgo Narita'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Durarara!! x1',
                              'THE GOOD, THE BAD, AND THE DOWNRIGHT WEIRD. The Ikebukuro district in Tokyo is full of interesting people. A boy longing for the extraordinary. A hotheaded punk. An airheaded pseudo-stalker. An information broker who works for kicks. An underground doctor who specializes in truly desperate patients. A high school student infatuated with a monster. And a headless rider on a pitch-black motorcycle. Their story may not be a heartwarming one, but as it turns out, even weirdos like these sometimes fall in love.'
                              ,
                              0,
                              to_date('2004-04-25','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryohgo Narita'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Durarara!! x2',
                              'Ikebukuro has a slashing problem. Ikebukuro, Tokyo. A place where the clumsy and inept at love gather. A high school girl worried about her status. A third-rate magazine reporter covering the Ikebukuro beat. A teacher suspected of sexual harassment. A thug wearing a yellow bandanna, who is said to be the toughest around. A young man who deals in all manner of sensitive information. And a headless rider on a coal-black motorcycle. As these individuals and more are drawn into a whirl of unlucky incidents, Ikebukuro itself will begin to crumble...!'
                              ,
                              0,
                              to_date('2005-03-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryohgo Narita'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Durarara!! x3',
                              'Tokyo, Ikebukuro. Loads of baggage from the past are starting to turn up: A boss trying to escape the past. A pair of high school girls with consciences. A boy unaware of his friend''s feelings for him. A man planning a takeover. A boy who uses information to manipulate others. And a headless rider on a pitch-black motorcycle--all headed on a collision course that will decide who will overcome their past and who will become nothing more than a memory...'
                              ,
                              0,
                              to_date('2006-08-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryohgo Narita'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Baccano! The Rolling Bootlegs',
                              'New York, 1931. The manufacture and sale of alcoholic beverages is prohibited by law, but behind this prohibition, organized crime flourishes-so, too, do bank robbers, bootleggers, assassins, and homunculi. Some want money, some are chasing the secret to immortality, and others just want to have a really good time. You know what they say, though: You can''t always get what you want.'
                              ,
                              0,
                              to_date('2003-02-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryohgo Narita'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Baccano! 2002 [SIDE-A]: Bullet Garden',
                              'The year 2002. Firo and Ennis are finally on their very belated honeymoon - and for some reason, Czes has been invited to join them on the cruise to Japan. The ship is as luxurious as they come, even crossing paths with its sister ship in the middle of the Pacific Ocean in a one-of-a-kind event. But with movie stars, stuntmen, hijackers, stowaways, and gunslingers aboard, the voyage is looking to be anything but peaceful.'
                              ,
                              0,
                              to_date('2007-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryuusui Seiryouin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Cosmic: End of Century Detective Myth',
                              'An unidentified person calling themselves the Locked Room Lord sends a crime notice, claiming that 1200 people would be killed in 1200 locked rooms. What is the true identity of the Locked Room Lord, who claims to know the secret of the locked room that no one has been able to solve for over 1000 years? The JDC''s genius, the Meta Detective who transcends great detectives, Juuku Tsukumo, takes on the challenge!'
                              ,
                              0,
                              to_date('1996-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ryuusui Seiryouin'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Joker: Old Testament Detective Myth',
                              'A group of mystery authors gather at the inn Geneijou, of whom one plans to reveal his mangum opus. However, when inexplicable murders mimicking the novel begin ocurring, the Japan Detectives Club is called in to solve the case.'
                              ,
                              0,
                              to_date('1997-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'G. K. Chesterton'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Innocence of Father Brown',
                              'Chesterton portrays Father Brown as a short, stumpy Roman Catholic priest, with shapeless clothes and a large umbrella, and an uncanny insight into human evil. "How in Tartarus," cried Flambeau, "did you ever hear of the spiked bracelet?" -- "Oh, one''s little flock, you know!" said Father Brown, arching his eyebrows rather blankly. "When I was a curate in Hartlepool, there were three of them with spiked bracelets."'
                              ,
                              0,
                              to_date('1911-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Yukito Ayatsuji'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Decagon House Murders',
                              'The lonely, rockbound island of Tsunojima is notorious as the site of a series of bloody unsolved murders. Some even say it''s haunted. One thing''s for sure: it''s the perfect destination for the K-University Mystery Club''s annual trip. But when the first club member turns up dead, the remaining amateur sleuths realise they will need all of their murder-mystery expertise to get off the island alive. As the party are picked off one by one, the survivors grow desperate and paranoid, turning on each other. Will anyone be able to untangle the murderer''s fiendish plan before it''s too late?'
                              ,
                              0,
                              to_date('1987-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Yukito Ayatsuji'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Mill House Murders',
                              'Ever since a horrific car accident, Fujinuma Kiichi has lived a reclusive existence in the remote Mill House, his scarred face hidden behind a rubber mask. Then one stormy night the tranquility of his retreat is shattered by gruesome murder, a baffling disappearance and the theft of a priceless painting. The brilliant Shimada Kiyoshi arrives on the scene, but as he investigates the seemingly impossible events of that evening, death strikes again, and again...'
                              ,
                              0,
                              to_date('1988-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Yukito Ayatsuji'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Labyrinth House Murders',
                              'The famed mystery writer Miyagaki Yotaro lives a life of seclusion in the remote Labyrinth House. When Yotaro invites four young crime authors to his home for a birthday party, they are honoured to accept. But no sooner have they arrived than they are confronted with a shocking death, then lured into a bizarre, deadly competition. As the twisted contest gathers pace, murder follows murder. The ingenious sleuth Shimada Kiyoshi investigates, but can he solve the mystery of the house before all those trapped in its labyrinth are dead? And can you guess the solution before he does?'
                              ,
                              0,
                              to_date('1988-12-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Hiroshi Mori'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Perfect Insider',
                              'In a research facility hidden away on a remote island, genius programmer Shiki Magata has lived as a recluse for years. She rarely sees guests, but associate professor Souhei Saikawa and university student Moe Nishinosono still seek her out. However, their meeting is cut short when they are caught up in a locked-room murder mystery. Everything is not as it seems, and many secrets are hidden. Within an isolated facility, a seemingly impossible and gruesome crime takes place, and Saikawa and Moe must unravel the truth behind the murder and Magata''s shrouded past.'
                              ,
                              0,
                              to_date('1994-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Kouhei Kadono'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Boogiepop and Others',
                              'Do you have a dream? Sadly, I have no such thing. But the boys and girls in this story all have their own desires. They fret; unable to reach them, or launch themselves headlong towards that goal. Some remain uncertain what it is they truly want, others chase a desire they can never really hope to achieve, or unwittingly give others courage with their unconscious optimism. This story is told in pieces. It''s a very creepy story, and a little bit sad. - Mm? Who am I? My name is Boogiepop.'
                              ,
                              0,
                              to_date('1998-04-25','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Kouhei Kadono'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Boogiepop Returns: VS Imaginator',
                              'Have you ever thought there was something missing inside of you? Have you ever worried you were lacking something everyone else had? Have you ever hoped someone would come along who could make up for your flaws? You don''t need to worry about that anymore. That time is coming. A new possibility is dawning, a time that will end all suffering. If my enemy, Boogiepop, does not interfere. - Me? Well, my enemies call me the Imaginator. '
                              ,
                              0,
                              to_date('1998-10-25','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Kouhei Kadono'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Urban Fantasy'
                              ),
                              'Boogiepop Missing: The Peppermint Wizard',
                              'You''ve probably missed something at some point in your life, haven''t you? Even though it was really, really important, you were so stuck to some foolish pride and so preoccupied with what was right in front of you, that you ended up missing something. Am I wrong? - This is the story of a magician that''s had to do that kind of thing over and over again. He is talented, successful, and a failure. The road taken by this magician is a stupid, lonely, and lively story of ice cream. That cold, vivid sweetness was an innocent, cruel and sad fairy-tale that, for an instant - yes, it was so fast that even I, Boogiepop, missed it. It was a moment of amusement that connected a clown, a god of death, and those with broken dreams before it melted, disappeared, and was lost in the blink of an eye.'
                              ,
                              0,
                              to_date('2000-04-25','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Kouhei Kadono'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Fantasy'
                              ),
                              'A Case of Dragonslayer',
                              'When a dragon is murdered, the main characters must travel the globe, trying to discover how such a thing was even possible.'
                              ,
                              0,
                              to_date('1999-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Kouhei Kadono'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Fantasy'
                              ),
                              'Inside the Apocalypse Castle',
                              'During a sorcery tournament, sorcerers begin dying in unusual ways.',
                              0,
                              to_date('2000-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'G. K. Chesterton'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Literary'
                              ),
                              'The Man Who Was Thursday: A Nightmare',
                              'Can you trust yourself when you don''t know who you are? Syme uses his new acquaintance to go undercover in Europe''s Central Anarchist Council and infiltrate their deadly mission, even managing to have himself voted to the position of ''Thursday''. In a park in London, secret policeman Gabriel Syme strikes up a conversation with an anarchist. Sworn to do his duty, when Syme discovers another undercover policeman on the Council, however, he starts to question his role in their operations. And as a desperate chase across Europe begins, his confusion grows, as well as his confidence in his ability to outwit his enemies. But he has still to face the greatest terror that the Council has - its leader: a man named Sunday, whose true nature is worse than Syme could ever have imagined...'
                              ,
                              0,
                              to_date('1908-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ellery Queen'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Roman Hat Mystery',
                              'A fine silk custom top-hat is missing from a crooked lawyer who was poisoned by lead alcohol in the Roman theater at the close of the second act, 9:55 pm. Inspector Richard Q, sneezing snuff; a thin, multi-faced, small "Old Man"; and the Inspector''s large writer son Ellery, puffing cigarettes, investigate. They start with maps of theater, the victim''s bedroom, and a list of names appended with flavorful commentary: the finder of the body is "cranially a brachycephalic", and Dolly "a lady of reputation". The flavor of 1929 costume and culture, with evening attire de rigeur, and hip flasks full of bootleg liquor.'
                              ,
                              0,
                              to_date('1927-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ellery Queen'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The French Powder Mystery',
                              'The windows of French department store are one of New York''s great attractions. Year-round, their displays show off the finest in fashion, art, and home decor, and tourists and locals alike make a point of stopping to see what''s on offer. One afternoon, as the board debates a merger upstairs, a salesgirl begins a demonstration in one of the windows, showing off French''s new Murphy bed. A crowd gathers to watch the bed lower from the wall after a single touch of a button. But as the bed opens, people run screaming. Out tumbles a woman''s body, rumpled, bloody, and dead.'
                              ,
                              0,
                              to_date('1930-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Ellery Queen'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Dutch Shoe Mystery',
                              'When Ellery Queen, described by the London Times as "the logical successor to Sherlock Holmes," is invited by his friend, a doctor, to witness an operation, he accepts the offer in hopes of furthering his capabilities as an amateur detective, but soon ends up testing those same skills. The patient who is about to undergo the delicate procedure is Abagail Doorn, the richest and most famous woman in America; the doctor who will perform it is her protege, one of the leading surgeons on the East Coast. It will all take place in the main operating theater of the vast hospital that she founded.'
                              ,
                              0,
                              to_date('1932-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'John Dickson Carr'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Judas Window',
                              'Avory Hume is found stabbed to death with an arrow - in a study with bolted steel shutters and a heavy door locked from the inside. In the same room James Caplon Answell lies unconscious, his clothes disordered as though from a struggle, his fingerprints on the damning arrow.'
                              ,
                              0,
                              to_date('1922-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'John Dickson Carr'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Case of the Constant Suicides',
                              'Having lost all his money in hare-brained get-rich-quick schemes, old Angus Campbell has nothing to leave his heirs but the proceeds of his life insurance policies. After he falls to his death from a locked bedchamber in the tower of Shira Castle in the Scottish Highlands, his family gather. They are joined by amateur sleuth Dr Gideon Fell, who tries to solve the mystery. Is it suicide, or is it murder?'
                              ,
                              0,
                              to_date('1923-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Agatha Christie'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Thriller'
                              ),
                              'And Then There Were None',
                              'Ten people, each with something to hide and something to fear, are invited to an isolated mansion on Indian Island by a host who, surprisingly, fails to appear. On the island they are cut off from everything but each other and the inescapable shadows of their own past lives. One by one, the guests share the darkest secrets of their wicked pasts. And one by one, they die.'
                              ,
                              0,
                              to_date('1939-11-06','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Otsuichi'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Horror'
                              ),
                              'GOTH',
                              'In these haunting stories, two teenagers linked by an obsession with murder and torture explore the recesses of humanity''s dark side.'
                              ,
                              0,
                              to_date('2001-07-01','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Otaro Maijo'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Literary'
                              ),
                              'Asura Girl',
                              'Seventeen-year-old Aiko lives a life of casual sex and casual violence, though at heart she remains a schoolgirl with an unrequited crush on her old classmate Yoji Kaneko. Life is about to get harder for Aiko, as a recent fling, Sano, has been kidnapped, and the serial killer Guru-Guri Majin (Round-and-Round Devil) has begun slaughtering children. The youth are rioting in the streets, egged on by the underground Internet bulletin board known as Ten-no Koe, the Voice from Heaven. Expecting that Yoji will come and save her from the madness, Aiko posts a demand for her own murder on Ten-no-Koe, but will she be left waiting...or worse?'
                              ,
                              0,
                              to_date('2003-01-01','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Otaro Maijo'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Literary'
                              ),
                              'Speedboy!',
                              'A tale of solitude by Maijo Otaro following Naruo, a boy with a mane on his back, in his constant search for speed.'
                              ,
                              0,
                              to_date('2006-11-01','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Otaro Maijo'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Tsukumojuuku',
                              'One of Maijo Otaro''s major works and a tribute to Seiryouin Ryuusui''s JDC Series. "If it means suffering, I don''t need to be loved." An explosive journey of the Meta Detective Tsukumojuuku''s soul threading its way on the dance floor scourged by the trumpets sounded by God/Seiryouin Ryuusui, the maestro to serial mitate murders based on Genesis and Revelation to John from the Bible. The masterpiece of the century has finally been written by Maijo Otaro! "Hallelujah!'
                              ,
                              0,
                              to_date('2003-10-01','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Anthony Berkeley Cox'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'The Poisoned Chocolates Case',
                              'Graham and Joan Bendix have apparently succeeded in making that eighth wonder of the modern world, a happy marriage. And into the middle of it there drops, like a clap of thunder, a box of chocolates.Joan Bendix is killed by a poisoned box of liqueur chocolates that cannot have been intended for her to eat. The police investigation rapidly reaches a dead end. Chief Inspector Moresby calls on Roger Sheringham and his Crimes Circle - six amateur but intrepid detectives - to consider the case. The evidence is laid before the Circle and the members take it in turn to offer a solution. Each is more convincing than the last, slowly filling in the pieces of the puzzle, until the dazzling conclusion.'
                              ,
                              0,
                              to_date('1929-10-10','YYYY-MM-DD'),
                              'N' );
insert into js_books values ( seq_book_id.nextval,
                              (
                                 select id_author
                                   from js_authors
                                  where author_name = 'Anthony Berkeley Cox'
                              ),
                              (
                                 select id_genre
                                   from js_book_genres
                                  where genre_name = 'Mystery'
                              ),
                              'Cicely Disappears',
                              'Stephen Munro, a demobbed army officer, reconciles himself to taking a job as a footman to make ends meet. Employed at Wintringham Hall, the delightful but decaying Sussex country residence of the elderly Lady Susan Carey, his first task entails welcoming her eccentric guests to a weekend house-party, at which her bombastic nephew - who recognises Stephen from his former life - decides that an after-dinner seance would be more entertaining than bridge. Then Cicely disappears!'
                              ,
                              0,
                              to_date('1927-01-01','YYYY-MM-DD'),
                              'N' );