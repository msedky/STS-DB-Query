CREATE DATABASE sts_test_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


CREATE TABLE public."User"
(
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    PRIMARY KEY (user_id)
);

ALTER TABLE IF EXISTS public."User"
    OWNER to postgres;
	
	
CREATE TABLE public."Training_details"
(
    user_training_id integer NOT NULL,
    user_id integer NOT NULL,
    training_id integer NOT NULL,
    training_date date NOT NULL,
    PRIMARY KEY (user_training_id),
    CONSTRAINT training_user_id_fk FOREIGN KEY (user_id)
        REFERENCES public."User" (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
);

ALTER TABLE IF EXISTS public."Training_details"
    OWNER to postgres;