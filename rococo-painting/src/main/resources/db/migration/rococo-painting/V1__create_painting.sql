create table if not exists painting
(
    id                      binary(16)    unique not null default (UUID_TO_BIN(UUID(), true)),
    title                   varchar(255)  not null,
    description             text          not null,
    content                 longblob      not null,
    museum_id               binary(16)    not null,
    artist_id               binary(16)    not null,
    primary key (id),
    constraint fk_artist_id foreign key (artist_id) references `artist` (id),
    constraint fk_museum_id foreign key (museum_id) references `museum` (id)
);