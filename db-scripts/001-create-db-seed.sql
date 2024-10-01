--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: actor_instances_actor_type_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.actor_instances_actor_type_enum AS ENUM (
    'source',
    'destination',
    'generator'
);


ALTER TYPE public.actor_instances_actor_type_enum OWNER TO root;

--
-- Name: actor_instances_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.actor_instances_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.actor_instances_status_enum OWNER TO root;

--
-- Name: actor_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.actor_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.actor_status_enum OWNER TO root;

--
-- Name: actor_type_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.actor_type_enum AS ENUM (
    'source',
    'destination',
    'generator'
);


ALTER TYPE public.actor_type_enum OWNER TO root;

--
-- Name: connection_run_logs_loglevel_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.connection_run_logs_loglevel_enum AS ENUM (
    'FATAL',
    'ERROR',
    'WARN',
    'INFO',
    'DEBUG',
    'TRACE'
);


ALTER TYPE public.connection_run_logs_loglevel_enum OWNER TO root;

--
-- Name: connection_run_logs_message_type_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.connection_run_logs_message_type_enum AS ENUM (
    'STATE',
    'LOG'
);


ALTER TYPE public.connection_run_logs_message_type_enum OWNER TO root;

--
-- Name: connection_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.connection_status_enum AS ENUM (
    'active',
    'inactive',
    'deleted'

);


ALTER TYPE public.connection_status_enum OWNER TO root;

--
-- Name: connections_schedule_type_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.connections_schedule_type_enum AS ENUM (
    'manual',
    'cron'
);


ALTER TYPE public.connections_schedule_type_enum OWNER TO root;

--
-- Name: organizations_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.organizations_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.organizations_status_enum OWNER TO root;

--
-- Name: workspaces_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.workspaces_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.workspaces_status_enum OWNER TO root;

--
-- Name: function_actor_instances_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_actor_instances_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_actor_instances_updated_at() OWNER TO root;

--
-- Name: function_actors_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_actors_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_actors_updated_at() OWNER TO root;

--
-- Name: function_connection_run_logs_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_connection_run_logs_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_connection_run_logs_updated_at() OWNER TO root;

--
-- Name: function_connections_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_connections_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_connections_updated_at() OWNER TO root;

--
-- Name: function_organizations_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_organizations_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_organizations_updated_at() OWNER TO root;

--
-- Name: function_users_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_users_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_users_updated_at() OWNER TO root;

--
-- Name: function_workspace_users_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_workspace_users_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_workspace_users_updated_at() OWNER TO root;

--
-- Name: function_workspaces_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.function_workspaces_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.function_workspaces_updated_at() OWNER TO root;

--
-- Name: update_workspaces_updated_at(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.update_workspaces_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.update_workspaces_updated_at() OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor_instances; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.actor_instances (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    workspace_id character varying(36) NOT NULL,
    actor_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    name character varying(255),
    configuration json,
    actor_type public.actor_instances_actor_type_enum,
    status public.actor_instances_status_enum DEFAULT 'active'::public.actor_instances_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.actor_instances OWNER TO root;

--
-- Name: actors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.actors (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    actor_type public.actor_type_enum NOT NULL,
    status public.actor_status_enum DEFAULT 'active'::public.actor_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    module_name character varying(255) DEFAULT 'google_drive'::character varying NOT NULL
);


ALTER TABLE public.actors OWNER TO root;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO root;

--
-- Name: connection_run_logs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.connection_run_logs (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    connection_id character varying(36) NOT NULL,
    message character varying NOT NULL,
    stack_trace character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    run_id character varying(36) NOT NULL,
    message_type public.connection_run_logs_message_type_enum NOT NULL
);


ALTER TABLE public.connection_run_logs OWNER TO root;

--
-- Name: connections; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.connections (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    source_instance_id character varying(36) NOT NULL,
    generator_instance_id character varying(36) NOT NULL,
    destination_instance_id character varying(36) NOT NULL,
    configuration json,
    catalog json,
    status public.connection_status_enum DEFAULT 'active'::public.connection_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    workspace_id character varying(36) NOT NULL,
    namespace_format character varying(255) DEFAULT '${SOURCE_NAMESPACE}'::character varying NOT NULL,
    prefix character varying(255),
    schedule json,
    schedule_type public.connections_schedule_type_enum DEFAULT 'manual'::public.connections_schedule_type_enum NOT NULL
);


ALTER TABLE public.connections OWNER TO root;

--
-- Name: organizations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.organizations (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    status public.organizations_status_enum DEFAULT 'active'::public.organizations_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.organizations OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    password_hash character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: workspace_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workspace_users (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    workspace_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.workspace_users OWNER TO root;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.workspaces (
    id character varying(36) DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id character varying(36) NOT NULL,
    name character varying(50) NOT NULL,
    status public.workspaces_status_enum DEFAULT 'active'::public.workspaces_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.workspaces OWNER TO root;

--
-- Data for Name: actor_instances; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.actor_instances (id, workspace_id, actor_id, user_id, name, configuration, actor_type, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.alembic_version (version_num) FROM stdin;
04274709cf77
\.


--
-- Data for Name: connection_run_logs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.connection_run_logs (id, connection_id, message, stack_trace, created_at, updated_at, run_id, message_type) FROM stdin;
\.


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.connections (id, name, source_instance_id, generator_instance_id, destination_instance_id, configuration, catalog, status, created_at, updated_at, workspace_id, namespace_format, prefix, schedule, schedule_type) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.organizations (id, name, status, created_at, updated_at) FROM stdin;
org-uuid	Org	active	2024-03-22 17:44:32.043887	2024-03-22 17:44:32.043887
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, email, created_at, updated_at, password_hash) FROM stdin;
09922bd9-7872-4664-99d0-08eae42fb554	user@dat.com	2024-03-19 18:11:21.886584	2024-03-19 18:55:37.549741	$2b$12$2zHF/LVD/R2zQpPNcP/lve3i.yFUmDDnD7Hfm/.CTfwvHGxO5Hqh.
\.


--
-- Data for Name: workspace_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workspace_users (id, workspace_id, user_id, created_at, updated_at) FROM stdin;
36b1c935-44da-4d33-b570-598bf6a4adf7	wkspc-uuid	09922bd9-7872-4664-99d0-08eae42fb554	2024-03-19 18:11:55.3905	2024-03-19 18:11:55.3905
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.workspaces (id, organization_id, name, status, created_at, updated_at) FROM stdin;
wkspc-uuid	org-uuid	Default	active	2024-03-22 17:44:33.581936	2024-03-22 17:44:33.581936
\.


--
-- Name: actor_instances actor_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.actor_instances
    ADD CONSTRAINT actor_instances_pkey PRIMARY KEY (id);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: connection_run_logs connection_run_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connection_run_logs
    ADD CONSTRAINT connection_run_logs_pkey PRIMARY KEY (id);


--
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workspace_users workspace_users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workspace_users
    ADD CONSTRAINT workspace_users_pkey PRIMARY KEY (id);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: actor_instances trigger_actor_instances_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_actor_instances_updated_at BEFORE UPDATE ON public.actor_instances FOR EACH ROW EXECUTE FUNCTION public.function_actor_instances_updated_at();


--
-- Name: actors trigger_actors_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_actors_updated_at BEFORE UPDATE ON public.actors FOR EACH ROW EXECUTE FUNCTION public.function_actors_updated_at();


--
-- Name: connection_run_logs trigger_connection_run_logs_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_connection_run_logs_updated_at BEFORE UPDATE ON public.connection_run_logs FOR EACH ROW EXECUTE FUNCTION public.function_connection_run_logs_updated_at();


--
-- Name: connections trigger_connections_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_connections_updated_at BEFORE UPDATE ON public.connections FOR EACH ROW EXECUTE FUNCTION public.function_connections_updated_at();


--
-- Name: organizations trigger_organizations_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_organizations_updated_at BEFORE UPDATE ON public.organizations FOR EACH ROW EXECUTE FUNCTION public.function_organizations_updated_at();


--
-- Name: users trigger_users_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.function_users_updated_at();


--
-- Name: workspace_users trigger_workspace_users_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_workspace_users_updated_at BEFORE UPDATE ON public.workspace_users FOR EACH ROW EXECUTE FUNCTION public.function_workspace_users_updated_at();


--
-- Name: workspaces trigger_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trigger_workspaces_updated_at BEFORE UPDATE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.function_workspaces_updated_at();


--
-- Name: actor_instances actor_instances_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.actor_instances
    ADD CONSTRAINT actor_instances_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(id);


--
-- Name: actor_instances actor_instances_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.actor_instances
    ADD CONSTRAINT actor_instances_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: actor_instances actor_instances_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.actor_instances
    ADD CONSTRAINT actor_instances_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id);


--
-- Name: connection_run_logs connection_run_logs_connection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connection_run_logs
    ADD CONSTRAINT connection_run_logs_connection_id_fkey FOREIGN KEY (connection_id) REFERENCES public.connections(id);


--
-- Name: connections connections_destination_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_destination_instance_id_fkey FOREIGN KEY (destination_instance_id) REFERENCES public.actor_instances(id);


--
-- Name: connections connections_generator_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_generator_instance_id_fkey FOREIGN KEY (generator_instance_id) REFERENCES public.actor_instances(id);


--
-- Name: connections connections_source_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_source_instance_id_fkey FOREIGN KEY (source_instance_id) REFERENCES public.actor_instances(id);


--
-- Name: connections connections_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id);


--
-- Name: workspace_users workspace_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workspace_users
    ADD CONSTRAINT workspace_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: workspace_users workspace_users_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workspace_users
    ADD CONSTRAINT workspace_users_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id);


--
-- Name: workspaces workspaces_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- PostgreSQL database dump complete
--

