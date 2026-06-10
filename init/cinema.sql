create database cinema;
create role postgrest noinherit login password 'abcdef';
create role guest nologin;
create role super nologin;

grant guest to postgrest;
grant super to postgrest;


\c cinema;

create table pays(
    code2 text,
    code3 text,
    codenum text,
    nom text,
    drapeau text,
    long text
);

copy pays from '/docker-entrypoint-initdb.d/pays.csv' with csv header;

grant usage on schema public to guest;
grant usage on schema public to super;

grant select on pays to guest;
grant select on pays to super;