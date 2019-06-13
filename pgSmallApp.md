From Mastering PostgreSQL in Application Development, Chapter 3.
(Note. Nothing in the book actually works so we'll be winging it. I've corrected the first couple of items. Beyond that, who knows?)

At the terminal prompt say

```bash
createdb chinook
psql chinook
```

Then at the psql prompt say

`\i Chinook_PostgreSql.sql`

`\dt`

```sql
  select Genre.Name, count(*) as count
    from           Genre
         left join Track using(GenreId)
group by Genre.Name
order by count desc;
```

```sql
\set n 10

-- name: top-artists-by-album
-- Get the list of the N artists with the most albums
  select artist.name, count(*) as albums
    from           artist
         left join album using(artistid)
group by artist.name
order by albums desc
   limit :n;
```

An alternative to setting the variable in psql interactively is to call psql from the terminal as follows.

```bash
psql --variable "n=10" -f artist.sql chinook
```

```sql
\set name "U2"

-- name: list-albums-by-artist
-- List the album titles and duration of a given artist
  select album.title as album,
         sum(milliseconds) * interval '1 ms' as duration
    from album
         join artist using(artistid)
         left join track using(albumid)
   where artist.name = :name
group by album
order by album;
```

```sql
  select name
    from track
   where albumid = 193
order by trackid;
```

```sql
  select track.name as track, genre.name as genre
    from      track
         join genre using(genreid)
   where albumid = 193
order by trackid;
```

```sql
  select name,
         milliseconds * interval '1 ms' as duration,
         pg_size_pretty(bytes) as bytes
    from track
   where albumid = 193
order by trackid;
```

```sql
  select album.title as album,
         sum(milliseconds) * interval '1 ms' as duration
    from album
         join artist using(artistid)
         left join track using(albumid)
   where artist.name = 'Red Hot Chili Peppers'
group by album
order by album;
```

```python
#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import psycopg2
import psycopg2.extras
import sys
from datetime import timedelta

DEBUGSQL = False
PGCONNSTRING = "user=cdstore dbname=appdev application_name=cdstore"


class Model(object):
    tablename = None
    columns = None

    @classmethod
    def buildsql(cls, pgconn, **kwargs):
        if cls.tablename and kwargs:
            cols = ", ".join(['"%s"' % c for c in cls.columns])
            qtab = '"%s"' % cls.tablename
            sql = "select %s from %s where " % (cols, qtab)
            for key in kwargs.keys():
                sql += "\"%s\" = '%s'" % (key, kwargs[key])
            if DEBUGSQL:
                print(sql)
            return sql


    @classmethod
    def fetchone(cls, pgconn, **kwargs):
        if cls.tablename and kwargs:
            sql = cls.buildsql(pgconn, **kwargs)
            curs = pgconn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            curs.execute(sql)
            result = curs.fetchone()
            if result is not None:
                return cls(*result)

    @classmethod
    def fetchall(cls, pgconn, **kwargs):
        if cls.tablename and kwargs:
            sql = cls.buildsql(pgconn, **kwargs)
            curs = pgconn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            curs.execute(sql)
            resultset = curs.fetchall()
            if resultset:
                return [cls(*result) for result in resultset]


class Artist(Model):
    tablename = "artist"
    columns = ["artistid", "name"]

    def __init__(self, id, name):
        self.id = id
        self.name = name


class Album(Model):
    tablename = "album"
    columns = ["albumid", "title"]

    def __init__(self, id, title):
        self.id = id
        self.title = title
        self.duration = None


class Track(Model):
    tablename = "track"
    columns = ["trackid", "name", "milliseconds", "bytes", "unitprice"]

    def __init__(self, id, name, milliseconds, bytes, unitprice):
        self.id = id
        self.name = name
        self.duration = milliseconds
        self.bytes = bytes
        self.unitprice = unitprice


if __name__ == '__main__':
    if len(sys.argv) > 1:
        pgconn = psycopg2.connect(PGCONNSTRING)
        artist = Artist.fetchone(pgconn, name=sys.argv[1])

        for album in Album.fetchall(pgconn, artistid=artist.id):
            ms = 0
            for track in Track.fetchall(pgconn, albumid=album.id):
                ms += track.duration

            duration = timedelta(milliseconds=ms)
            print("%25s: %s" % (album.title, duration))
    else:
        print('albums.py <artist name>')
```

```sql
create or replace function get_all_albums
 (
   in  name     text,
   out album    text,
   out duration interval
 )
returns setof record
language sql
as $$
  select album.title as album,
         sum(milliseconds) * interval '1 ms' as duration
    from album
         join artist using(artistid)
         left join track using(albumid)
   where artist.name = get_all_albums.name
group by album
order by album;
$$;
```

```sql
create or replace function get_all_albums
 (
   in  artistid bigint,
   out album    text,
   out duration interval
 )
returns setof record
language sql
as $$
  select album.title as album,
         sum(milliseconds) * interval '1 ms' as duration
    from album
         join artist using(artistid)
         left join track using(albumid)
   where artist.artistid = get_all_albums.artistid
group by album
order by album;
$$;
```

```sql
select * from get_all_albums(127);
```

```sql
select *
  from get_all_albums(
         (select artistid
            from artist
           where name = 'Red Hot Chili Peppers')
       );
```

```sql
select album, duration
  from artist,
       lateral get_all_albums(artistid)
 where artist.name = 'Red Hot Chili Peppers';
```

```sql
with four_albums as
(
   select artistid
     from album
 group by artistid
   having count(*) = 4
)
  select artist.name, album, duration
    from four_albums
         join artist using(artistid),
         lateral get_all_albums(artistid)
order by artistid, duration desc;
```

```sql
create or replace function get_all_albums
 (
   in  name     text,
   out album    text,
   out duration interval
 )
returns setof record
language plpgsql
as $$
declare
  rec record;
begin
  for rec in select albumid
               from album
                    join artist using(artistid)
              where album.name = get_all_albums.name
  loop
       select title, sum(milliseconds) * interval '1ms'
         into album, duration
         from album
              left join track using(albumid)
        where albumid = record.albumid
     group by title
     order by title;
    return next;
  end loop;
end;
$$;
```
