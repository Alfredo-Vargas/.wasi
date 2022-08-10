# Command Line Shell for SQLite
[Original Source](https://www.sqlite.org/cli.html#zipdb)

- Use the `sqlite3.exe` on Windows or the binary `sqlite3` on Linux.
- `sqlite example-database` : creates a new database called example-database
- Use SQL commands terminated by `;` to executed in your CLI, example:
```sql
sqlite> create table tbl1(one text, two int);
sqlite> insert into tbl1 values('hello!',10);
sqlite> insert into tbl1 values('goodbye', 20);
sqlite> select * from tbl1;
hello!|10
goodbye|20
sqlite>
```
- To clean exit SQL CLI press Control+D
- Multiple lines SQL statements are possible unlike dot-commands:
```sql
sqlite> CREATE TABLE tbl2 (
   ...>   f1 varchar(30) primary key,
   ...>   f2 text,
   ...>   f3 real
   ...> );
sqlite>
```
- `sqlite> .save example-database` : to save/overwrite the database
- `sqlite> .help` : will show a list will available dot commands

## Changing Output Formats
- `sqlite> .mode` : will show the current mode (by default list - with | separator)
```sql
hello!|10
goodbye|20
```

- `sqlite> .separator ", "` : to change the separator to a comma
```sql
``hello!, 10
goodbye, 20`
```

- `sqlite> .mode quote` : will surround string by `''`, it affects the space in separators 
```sql
'hello!',10
'goodbye',20
```

- `sqlite> .mode line` : will show every row separated by a blank line
```sql
one = hello!
two = 10

one = goodbye
two = 20
```

- `sqlite> .mode column` : each record show on a separated line
```sql
one       two       
--------  ---
hello!    10        
goodbye   20        
```

- `sqlite> .width 12 -6` : width can be overwrite. Negative values means right-justify
```sql
one              two
------------  ------
hello!            10
goodbye           20
```

- `sqlite> .width` : resets the width to defaults values
- `sqlite> .mode markdown` : encloses the cells by using dashes and pipes
```sql
|   one   | two |
|---------|-----|
| hello!  | 10  |
| goodbye | 20  |
```

- `sqlite> .mode table` : similar to markdown bu with extra + and dashes
```sql
+---------+-----+
|   one   | two |
+---------+-----+
| hello!  | 10  |
| goodbye | 20  |
+---------+-----+
```

- `sqlite> .mode box` : the table looks as follows:
```sql
┌─────────┬─────┐
│   one   │ two │
├─────────┼─────┤
│ hello!  │ 10  │
│ goodbye │ 20  │
└─────────┴─────┘
```

- `sqlite> .mode box --wrap 30` : wraps lines longer than 30 chars long
```sql
┌────────────────────────────────┬─────┐
│              one               │ two │
├────────────────────────────────┼─────┤
│ The quick fox jumps over a laz │ 90  │
│ y brown dog.                   │     │
└────────────────────────────────┴─────┘
```

- `sqlite> .mode box --wrap 30 -ww` : to wrap around a word and not cut a word
```sql
┌─────────────────────────────┬─────┐
│             one             │ two │
├─────────────────────────────┼─────┤
│ The quick fox jumps over a  │ 90  │
│ lazy brown dog.             │     │
```

## Querying the database schema

- `sqlite> .tables` : To see the available tables of ALL attached databases
```sql
tbl1 tbl2
```

- Example of a query:
```sql
SELECT name FROM sqlite_schema 
WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%'
ORDER BY 1
```

- `sqlite> .schema` : shows the complete schema for the database, similar to:
```sql
SELECT sql FROM sqlite_schema
ORDER BY tbl_name, type DESC, name
```

- `sqlite> .schema main.*` : to show schema of all attached databases
- `sqlite> .databases` : shows all databases on the current connection
