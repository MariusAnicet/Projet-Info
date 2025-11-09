-----------------------------------------------------
-- Drop existing tables (respecting FK dependencies)
-----------------------------------------------------
DROP TABLE IF EXISTS liker CASCADE;
DROP TABLE IF EXISTS commentaire CASCADE;
DROP TABLE IF EXISTS suivi CASCADE;
DROP TABLE IF EXISTS activite CASCADE;
DROP TABLE IF EXISTS utilisateur CASCADE;


-----------------------------------------------------
-- Utilisateur
-----------------------------------------------------
CREATE TABLE utilisateur (
    id_user     SERIAL PRIMARY KEY,
    nom_user    VARCHAR(256) NOT NULL,
    mail_user   VARCHAR(50)  NOT NULL UNIQUE,
    mdp         VARCHAR(256) NOT NULL,
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-----------------------------------------------------
-- Activite
-----------------------------------------------------
CREATE TABLE activite (
    id_activite   SERIAL PRIMARY KEY,
    titre         VARCHAR(256) NOT NULL,
    description   VARCHAR(512),
    date_activite TIMESTAMP    NOT NULL,
    lieu          VARCHAR(256),
    duree         DOUBLE PRECISION,
    distance      DOUBLE PRECISION NOT NULL,
    sport         VARCHAR(64) NOT NULL,
    detail_sport  VARCHAR(256),
    id_user       INTEGER NOT NULL,
    FOREIGN KEY (id_user) REFERENCES utilisateur(id_user)
);


-----------------------------------------------------
-- Commentaire
-----------------------------------------------------
CREATE TABLE commentaire (
    id_comment      SERIAL PRIMARY KEY,
    contenu         VARCHAR(512) NOT NULL,
    date_comment    TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_user         INTEGER NOT NULL,
    id_activite     INTEGER NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES utilisateur(id_user),
    FOREIGN KEY (id_activite) REFERENCES activite(id_activite)
);


-----------------------------------------------------
-- Like
-----------------------------------------------------
CREATE TABLE liker (
    id_like        SERIAL PRIMARY KEY,
    date_like      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_user        INTEGER NOT NULL,
    id_activite    INTEGER NOT NULL,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_like_user_activity UNIQUE (id_user, id_activite),
    FOREIGN KEY (id_user) REFERENCES utilisateur(id_user),
    FOREIGN KEY (id_activite) REFERENCES activite(id_activite)
);


-----------------------------------------------------
-- Suivi
-----------------------------------------------------
CREATE TABLE suivi (
    id_suiveur  INTEGER NOT NULL,
    id_suivi    INTEGER NOT NULL,
    date_suivi  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_suiveur, id_suivi),
    FOREIGN KEY (id_suiveur) REFERENCES utilisateur(id_user),
    FOREIGN KEY (id_suivi) REFERENCES utilisateur(id_user)
);
