--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

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
-- Name: destro_associates; Type: SCHEMA; Schema: -; Owner: destro_admin1
--

CREATE SCHEMA destro_associates;


ALTER SCHEMA destro_associates OWNER TO destro_admin1;

--
-- Name: destro_core; Type: SCHEMA; Schema: -; Owner: destro_admin1
--

CREATE SCHEMA destro_core;


ALTER SCHEMA destro_core OWNER TO destro_admin1;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: associate_roles; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.associate_roles (
    associate_id uuid NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE destro_associates.associate_roles OWNER TO destro_admin1;

--
-- Name: associates; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.associates (
    id uuid NOT NULL,
    associate_id character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    password_hash text NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE destro_associates.associates OWNER TO destro_admin1;

--
-- Name: audit_log; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.audit_log (
    id bigint NOT NULL,
    actor_id uuid,
    action text NOT NULL,
    target_id uuid,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE destro_associates.audit_log OWNER TO destro_admin1;

--
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: destro_associates; Owner: destro_admin1
--

CREATE SEQUENCE destro_associates.audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_associates.audit_log_id_seq OWNER TO destro_admin1;

--
-- Name: audit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_associates; Owner: destro_admin1
--

ALTER SEQUENCE destro_associates.audit_log_id_seq OWNED BY destro_associates.audit_log.id;


--
-- Name: permissions; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.permissions (
    id uuid NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE destro_associates.permissions OWNER TO destro_admin1;

--
-- Name: role_permissions; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.role_permissions (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


ALTER TABLE destro_associates.role_permissions OWNER TO destro_admin1;

--
-- Name: roles; Type: TABLE; Schema: destro_associates; Owner: destro_admin1
--

CREATE TABLE destro_associates.roles (
    id uuid NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE destro_associates.roles OWNER TO destro_admin1;

--
-- Name: alembic_version; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE destro_core.alembic_version OWNER TO destro_admin1;

--
-- Name: associate_cart_moves; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.associate_cart_moves (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    associate_id text NOT NULL,
    cart_id text NOT NULL,
    starting_door text NOT NULL,
    destination text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL,
    action_type text,
    starting_location text
);


ALTER TABLE destro_core.associate_cart_moves OWNER TO destro_admin1;

--
-- Name: associate_cart_moves_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.associate_cart_moves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.associate_cart_moves_id_seq OWNER TO destro_admin1;

--
-- Name: associate_cart_moves_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.associate_cart_moves_id_seq OWNED BY destro_core.associate_cart_moves.id;


--
-- Name: associate_sessions; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.associate_sessions (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    associate_id text NOT NULL,
    event_type text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.associate_sessions OWNER TO destro_admin1;

--
-- Name: associate_sessions_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.associate_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.associate_sessions_id_seq OWNER TO destro_admin1;

--
-- Name: associate_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.associate_sessions_id_seq OWNED BY destro_core.associate_sessions.id;


--
-- Name: buffer_occupancy_snapshots; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.buffer_occupancy_snapshots (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door_id text NOT NULL,
    occupied_slots integer NOT NULL,
    free_slots integer NOT NULL,
    total_slots integer NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL,
    door_type text
);


ALTER TABLE destro_core.buffer_occupancy_snapshots OWNER TO destro_admin1;

--
-- Name: buffer_occupancy_snapshots_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.buffer_occupancy_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.buffer_occupancy_snapshots_id_seq OWNER TO destro_admin1;

--
-- Name: buffer_occupancy_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.buffer_occupancy_snapshots_id_seq OWNED BY destro_core.buffer_occupancy_snapshots.id;


--
-- Name: cart_idle; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.cart_idle (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    cart_id text NOT NULL,
    idle_min double precision NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.cart_idle OWNER TO destro_admin1;

--
-- Name: cart_full_idle_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.cart_full_idle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.cart_full_idle_id_seq OWNER TO destro_admin1;

--
-- Name: cart_full_idle_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.cart_full_idle_id_seq OWNED BY destro_core.cart_idle.id;


--
-- Name: cart_status_snapshots; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.cart_status_snapshots (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    cart_id text NOT NULL,
    status text NOT NULL,
    location text,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL,
    door_id text,
    door_type text
);


ALTER TABLE destro_core.cart_status_snapshots OWNER TO destro_admin1;

--
-- Name: cart_status_snapshots_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.cart_status_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.cart_status_snapshots_id_seq OWNER TO destro_admin1;

--
-- Name: cart_status_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.cart_status_snapshots_id_seq OWNED BY destro_core.cart_status_snapshots.id;


--
-- Name: carts_serviced_outbound; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.carts_serviced_outbound (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door_id text NOT NULL,
    cart_id text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.carts_serviced_outbound OWNER TO destro_admin1;

--
-- Name: carts_serviced_outbound_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.carts_serviced_outbound_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.carts_serviced_outbound_id_seq OWNER TO destro_admin1;

--
-- Name: carts_serviced_outbound_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.carts_serviced_outbound_id_seq OWNED BY destro_core.carts_serviced_outbound.id;


--
-- Name: carts_unloaded_inbound; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.carts_unloaded_inbound (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door_id text NOT NULL,
    cart_id text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.carts_unloaded_inbound OWNER TO destro_admin1;

--
-- Name: carts_unloaded_inbound_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.carts_unloaded_inbound_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.carts_unloaded_inbound_id_seq OWNER TO destro_admin1;

--
-- Name: carts_unloaded_inbound_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.carts_unloaded_inbound_id_seq OWNED BY destro_core.carts_unloaded_inbound.id;


--
-- Name: coordination_events; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.coordination_events (
    id bigint NOT NULL,
    event_uuid uuid NOT NULL,
    run_id uuid NOT NULL,
    cart_id text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.coordination_events OWNER TO destro_admin1;

--
-- Name: coordination_events_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.coordination_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.coordination_events_id_seq OWNER TO destro_admin1;

--
-- Name: coordination_events_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.coordination_events_id_seq OWNED BY destro_core.coordination_events.id;


--
-- Name: coordination_routes; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.coordination_routes (
    id bigint NOT NULL,
    coordination_event_id uuid NOT NULL,
    door_id text NOT NULL,
    route_index integer NOT NULL
);


ALTER TABLE destro_core.coordination_routes OWNER TO destro_admin1;

--
-- Name: coordination_routes_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.coordination_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.coordination_routes_id_seq OWNER TO destro_admin1;

--
-- Name: coordination_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.coordination_routes_id_seq OWNED BY destro_core.coordination_routes.id;


--
-- Name: dc_door_slotting; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.dc_door_slotting (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door text NOT NULL,
    dc text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.dc_door_slotting OWNER TO destro_admin1;

--
-- Name: dc_door_slotting_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.dc_door_slotting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.dc_door_slotting_id_seq OWNER TO destro_admin1;

--
-- Name: dc_door_slotting_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.dc_door_slotting_id_seq OWNED BY destro_core.dc_door_slotting.id;


--
-- Name: door_activity_snapshots; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.door_activity_snapshots (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door_id text NOT NULL,
    door_type text NOT NULL,
    activity text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.door_activity_snapshots OWNER TO destro_admin1;

--
-- Name: door_activity_snapshots_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.door_activity_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.door_activity_snapshots_id_seq OWNER TO destro_admin1;

--
-- Name: door_activity_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.door_activity_snapshots_id_seq OWNED BY destro_core.door_activity_snapshots.id;


--
-- Name: door_dc_slotting; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.door_dc_slotting (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    door text NOT NULL,
    dc text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.door_dc_slotting OWNER TO destro_admin1;

--
-- Name: door_dc_slotting_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.door_dc_slotting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.door_dc_slotting_id_seq OWNER TO destro_admin1;

--
-- Name: door_dc_slotting_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.door_dc_slotting_id_seq OWNED BY destro_core.door_dc_slotting.id;


--
-- Name: exception_events; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.exception_events (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    event_code text NOT NULL,
    exception_code text NOT NULL,
    reported_by text NOT NULL,
    issue text NOT NULL,
    target text,
    description text,
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE destro_core.exception_events OWNER TO destro_admin1;

--
-- Name: exception_events_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.exception_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.exception_events_id_seq OWNER TO destro_admin1;

--
-- Name: exception_events_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.exception_events_id_seq OWNED BY destro_core.exception_events.id;


--
-- Name: fallback_events; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.fallback_events (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    cart_id text NOT NULL,
    original_door text NOT NULL,
    fallback_door text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.fallback_events OWNER TO destro_admin1;

--
-- Name: fallback_events_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.fallback_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.fallback_events_id_seq OWNER TO destro_admin1;

--
-- Name: fallback_events_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.fallback_events_id_seq OWNED BY destro_core.fallback_events.id;


--
-- Name: free_carts; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.free_carts (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    free_carts integer NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.free_carts OWNER TO destro_admin1;

--
-- Name: free_carts_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.free_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.free_carts_id_seq OWNER TO destro_admin1;

--
-- Name: free_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.free_carts_id_seq OWNED BY destro_core.free_carts.id;


--
-- Name: inbound_dock_dwell; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.inbound_dock_dwell (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    dock_id text NOT NULL,
    dwell_min double precision NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.inbound_dock_dwell OWNER TO destro_admin1;

--
-- Name: inbound_dock_dwell_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.inbound_dock_dwell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.inbound_dock_dwell_id_seq OWNER TO destro_admin1;

--
-- Name: inbound_dock_dwell_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.inbound_dock_dwell_id_seq OWNED BY destro_core.inbound_dock_dwell.id;


--
-- Name: outbound_density; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.outbound_density (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    dock_id text NOT NULL,
    count text NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.outbound_density OWNER TO destro_admin1;

--
-- Name: outbound_density_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.outbound_density_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.outbound_density_id_seq OWNER TO destro_admin1;

--
-- Name: outbound_density_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.outbound_density_id_seq OWNED BY destro_core.outbound_density.id;


--
-- Name: outbound_dock_dwell; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.outbound_dock_dwell (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    dock_id text NOT NULL,
    dwell_min double precision NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.outbound_dock_dwell OWNER TO destro_admin1;

--
-- Name: outbound_dock_dwell_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.outbound_dock_dwell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.outbound_dock_dwell_id_seq OWNER TO destro_admin1;

--
-- Name: outbound_dock_dwell_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.outbound_dock_dwell_id_seq OWNED BY destro_core.outbound_dock_dwell.id;


--
-- Name: robot_distance; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.robot_distance (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    robot_id text NOT NULL,
    total_distance double precision NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.robot_distance OWNER TO destro_admin1;

--
-- Name: robot_distance_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.robot_distance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.robot_distance_id_seq OWNER TO destro_admin1;

--
-- Name: robot_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.robot_distance_id_seq OWNED BY destro_core.robot_distance.id;


--
-- Name: robot_dwell; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.robot_dwell (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    robot_id text NOT NULL,
    dwell_min double precision NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.robot_dwell OWNER TO destro_admin1;

--
-- Name: robot_dwell_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.robot_dwell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.robot_dwell_id_seq OWNER TO destro_admin1;

--
-- Name: robot_dwell_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.robot_dwell_id_seq OWNED BY destro_core.robot_dwell.id;


--
-- Name: robot_status_snapshots; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.robot_status_snapshots (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    robot_id text NOT NULL,
    status text NOT NULL,
    location text,
    battery_level integer NOT NULL,
    job_type text NOT NULL,
    carrying_cart_id text,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.robot_status_snapshots OWNER TO destro_admin1;

--
-- Name: robot_status_snapshots_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.robot_status_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.robot_status_snapshots_id_seq OWNER TO destro_admin1;

--
-- Name: robot_status_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.robot_status_snapshots_id_seq OWNED BY destro_core.robot_status_snapshots.id;


--
-- Name: robot_trips; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.robot_trips (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    robot_id text NOT NULL,
    trips integer NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.robot_trips OWNER TO destro_admin1;

--
-- Name: robot_trips_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.robot_trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.robot_trips_id_seq OWNER TO destro_admin1;

--
-- Name: robot_trips_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.robot_trips_id_seq OWNED BY destro_core.robot_trips.id;


--
-- Name: run_config; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.run_config (
    run_id uuid,
    num_robots integer NOT NULL,
    num_carts integer NOT NULL,
    num_associates integer NOT NULL,
    warehouse_id character varying NOT NULL,
    dispatcher_mode character varying NOT NULL,
    fleet_mode character varying NOT NULL,
    num_chargers integer NOT NULL,
    destro_inbound_doors json NOT NULL,
    destro_outbound_doors json NOT NULL,
    priority_doors json NOT NULL,
    cart_capacity double precision NOT NULL,
    config_version integer NOT NULL,
    total_inbound_doors integer NOT NULL,
    total_outbound_doors integer NOT NULL,
    out_prio integer NOT NULL,
    maintain_prio integer NOT NULL,
    fallback_prio integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    fallback_doors json DEFAULT '[]'::json NOT NULL
);


ALTER TABLE destro_core.run_config OWNER TO destro_admin1;

--
-- Name: run_config_config_version_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.run_config_config_version_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.run_config_config_version_seq OWNER TO destro_admin1;

--
-- Name: run_config_config_version_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.run_config_config_version_seq OWNED BY destro_core.run_config.config_version;


--
-- Name: runner_trips; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.runner_trips (
    id bigint NOT NULL,
    run_id uuid NOT NULL,
    associate_id text NOT NULL,
    trips integer NOT NULL,
    recorded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE destro_core.runner_trips OWNER TO destro_admin1;

--
-- Name: runner_trips_id_seq; Type: SEQUENCE; Schema: destro_core; Owner: destro_admin1
--

CREATE SEQUENCE destro_core.runner_trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE destro_core.runner_trips_id_seq OWNER TO destro_admin1;

--
-- Name: runner_trips_id_seq; Type: SEQUENCE OWNED BY; Schema: destro_core; Owner: destro_admin1
--

ALTER SEQUENCE destro_core.runner_trips_id_seq OWNED BY destro_core.runner_trips.id;


--
-- Name: runs; Type: TABLE; Schema: destro_core; Owner: destro_admin1
--

CREATE TABLE destro_core.runs (
    run_id uuid NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE destro_core.runs OWNER TO destro_admin1;

--
-- Name: audit_log id; Type: DEFAULT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.audit_log ALTER COLUMN id SET DEFAULT nextval('destro_associates.audit_log_id_seq'::regclass);


--
-- Name: associate_cart_moves id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_cart_moves ALTER COLUMN id SET DEFAULT nextval('destro_core.associate_cart_moves_id_seq'::regclass);


--
-- Name: associate_sessions id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_sessions ALTER COLUMN id SET DEFAULT nextval('destro_core.associate_sessions_id_seq'::regclass);


--
-- Name: buffer_occupancy_snapshots id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.buffer_occupancy_snapshots ALTER COLUMN id SET DEFAULT nextval('destro_core.buffer_occupancy_snapshots_id_seq'::regclass);


--
-- Name: cart_idle id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_idle ALTER COLUMN id SET DEFAULT nextval('destro_core.cart_full_idle_id_seq'::regclass);


--
-- Name: cart_status_snapshots id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_status_snapshots ALTER COLUMN id SET DEFAULT nextval('destro_core.cart_status_snapshots_id_seq'::regclass);


--
-- Name: carts_serviced_outbound id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_serviced_outbound ALTER COLUMN id SET DEFAULT nextval('destro_core.carts_serviced_outbound_id_seq'::regclass);


--
-- Name: carts_unloaded_inbound id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_unloaded_inbound ALTER COLUMN id SET DEFAULT nextval('destro_core.carts_unloaded_inbound_id_seq'::regclass);


--
-- Name: coordination_events id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.coordination_events ALTER COLUMN id SET DEFAULT nextval('destro_core.coordination_events_id_seq'::regclass);


--
-- Name: coordination_routes id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.coordination_routes ALTER COLUMN id SET DEFAULT nextval('destro_core.coordination_routes_id_seq'::regclass);


--
-- Name: dc_door_slotting id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.dc_door_slotting ALTER COLUMN id SET DEFAULT nextval('destro_core.dc_door_slotting_id_seq'::regclass);


--
-- Name: door_activity_snapshots id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_activity_snapshots ALTER COLUMN id SET DEFAULT nextval('destro_core.door_activity_snapshots_id_seq'::regclass);


--
-- Name: door_dc_slotting id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_dc_slotting ALTER COLUMN id SET DEFAULT nextval('destro_core.door_dc_slotting_id_seq'::regclass);


--
-- Name: exception_events id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.exception_events ALTER COLUMN id SET DEFAULT nextval('destro_core.exception_events_id_seq'::regclass);


--
-- Name: fallback_events id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.fallback_events ALTER COLUMN id SET DEFAULT nextval('destro_core.fallback_events_id_seq'::regclass);


--
-- Name: free_carts id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.free_carts ALTER COLUMN id SET DEFAULT nextval('destro_core.free_carts_id_seq'::regclass);


--
-- Name: inbound_dock_dwell id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.inbound_dock_dwell ALTER COLUMN id SET DEFAULT nextval('destro_core.inbound_dock_dwell_id_seq'::regclass);


--
-- Name: outbound_density id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_density ALTER COLUMN id SET DEFAULT nextval('destro_core.outbound_density_id_seq'::regclass);


--
-- Name: outbound_dock_dwell id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_dock_dwell ALTER COLUMN id SET DEFAULT nextval('destro_core.outbound_dock_dwell_id_seq'::regclass);


--
-- Name: robot_distance id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_distance ALTER COLUMN id SET DEFAULT nextval('destro_core.robot_distance_id_seq'::regclass);


--
-- Name: robot_dwell id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_dwell ALTER COLUMN id SET DEFAULT nextval('destro_core.robot_dwell_id_seq'::regclass);


--
-- Name: robot_status_snapshots id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_status_snapshots ALTER COLUMN id SET DEFAULT nextval('destro_core.robot_status_snapshots_id_seq'::regclass);


--
-- Name: robot_trips id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_trips ALTER COLUMN id SET DEFAULT nextval('destro_core.robot_trips_id_seq'::regclass);


--
-- Name: run_config config_version; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.run_config ALTER COLUMN config_version SET DEFAULT nextval('destro_core.run_config_config_version_seq'::regclass);


--
-- Name: runner_trips id; Type: DEFAULT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.runner_trips ALTER COLUMN id SET DEFAULT nextval('destro_core.runner_trips_id_seq'::regclass);


--
-- Name: associate_roles associate_roles_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.associate_roles
    ADD CONSTRAINT associate_roles_pkey PRIMARY KEY (associate_id, role_id);


--
-- Name: associates associates_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.associates
    ADD CONSTRAINT associates_pkey PRIMARY KEY (id);


--
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_key; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.permissions
    ADD CONSTRAINT permissions_name_key UNIQUE (name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: associate_cart_moves associate_cart_moves_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_cart_moves
    ADD CONSTRAINT associate_cart_moves_pkey PRIMARY KEY (id);


--
-- Name: associate_sessions associate_sessions_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_sessions
    ADD CONSTRAINT associate_sessions_pkey PRIMARY KEY (id);


--
-- Name: buffer_occupancy_snapshots buffer_occupancy_snapshots_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.buffer_occupancy_snapshots
    ADD CONSTRAINT buffer_occupancy_snapshots_pkey PRIMARY KEY (id);


--
-- Name: cart_idle cart_full_idle_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_idle
    ADD CONSTRAINT cart_full_idle_pkey PRIMARY KEY (id);


--
-- Name: cart_status_snapshots cart_status_snapshots_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_status_snapshots
    ADD CONSTRAINT cart_status_snapshots_pkey PRIMARY KEY (id);


--
-- Name: carts_serviced_outbound carts_serviced_outbound_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_serviced_outbound
    ADD CONSTRAINT carts_serviced_outbound_pkey PRIMARY KEY (id);


--
-- Name: carts_unloaded_inbound carts_unloaded_inbound_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_unloaded_inbound
    ADD CONSTRAINT carts_unloaded_inbound_pkey PRIMARY KEY (id);


--
-- Name: coordination_events coordination_events_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.coordination_events
    ADD CONSTRAINT coordination_events_pkey PRIMARY KEY (id);


--
-- Name: coordination_routes coordination_routes_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.coordination_routes
    ADD CONSTRAINT coordination_routes_pkey PRIMARY KEY (id);


--
-- Name: dc_door_slotting dc_door_slotting_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.dc_door_slotting
    ADD CONSTRAINT dc_door_slotting_pkey PRIMARY KEY (id);


--
-- Name: door_activity_snapshots door_activity_snapshots_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_activity_snapshots
    ADD CONSTRAINT door_activity_snapshots_pkey PRIMARY KEY (id);


--
-- Name: door_dc_slotting door_dc_slotting_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_dc_slotting
    ADD CONSTRAINT door_dc_slotting_pkey PRIMARY KEY (id);


--
-- Name: exception_events exception_events_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.exception_events
    ADD CONSTRAINT exception_events_pkey PRIMARY KEY (id);


--
-- Name: fallback_events fallback_events_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.fallback_events
    ADD CONSTRAINT fallback_events_pkey PRIMARY KEY (id);


--
-- Name: free_carts free_carts_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.free_carts
    ADD CONSTRAINT free_carts_pkey PRIMARY KEY (id);


--
-- Name: inbound_dock_dwell inbound_dock_dwell_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.inbound_dock_dwell
    ADD CONSTRAINT inbound_dock_dwell_pkey PRIMARY KEY (id);


--
-- Name: outbound_density outbound_density_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_density
    ADD CONSTRAINT outbound_density_pkey PRIMARY KEY (id);


--
-- Name: outbound_dock_dwell outbound_dock_dwell_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_dock_dwell
    ADD CONSTRAINT outbound_dock_dwell_pkey PRIMARY KEY (id);


--
-- Name: robot_distance robot_distance_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_distance
    ADD CONSTRAINT robot_distance_pkey PRIMARY KEY (id);


--
-- Name: robot_dwell robot_dwell_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_dwell
    ADD CONSTRAINT robot_dwell_pkey PRIMARY KEY (id);


--
-- Name: robot_status_snapshots robot_status_snapshots_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_status_snapshots
    ADD CONSTRAINT robot_status_snapshots_pkey PRIMARY KEY (id);


--
-- Name: robot_trips robot_trips_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_trips
    ADD CONSTRAINT robot_trips_pkey PRIMARY KEY (id);


--
-- Name: run_config run_config_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.run_config
    ADD CONSTRAINT run_config_pkey PRIMARY KEY (config_version);


--
-- Name: runner_trips runner_trips_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.runner_trips
    ADD CONSTRAINT runner_trips_pkey PRIMARY KEY (id);


--
-- Name: runs runs_pkey; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (run_id);


--
-- Name: cart_status_snapshots uq_cart_status_run_cart; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_status_snapshots
    ADD CONSTRAINT uq_cart_status_run_cart UNIQUE (run_id, cart_id);


--
-- Name: robot_status_snapshots uq_robot_status_run_robot; Type: CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_status_snapshots
    ADD CONSTRAINT uq_robot_status_run_robot UNIQUE (run_id, robot_id);


--
-- Name: ix_destro_associates_associates_associate_id; Type: INDEX; Schema: destro_associates; Owner: destro_admin1
--

CREATE UNIQUE INDEX ix_destro_associates_associates_associate_id ON destro_associates.associates USING btree (associate_id);


--
-- Name: ix_destro_associates_associates_first_name; Type: INDEX; Schema: destro_associates; Owner: destro_admin1
--

CREATE INDEX ix_destro_associates_associates_first_name ON destro_associates.associates USING btree (first_name);


--
-- Name: ix_destro_core_associate_cart_moves_associate_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_associate_id ON destro_core.associate_cart_moves USING btree (associate_id);


--
-- Name: ix_destro_core_associate_cart_moves_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_cart_id ON destro_core.associate_cart_moves USING btree (cart_id);


--
-- Name: ix_destro_core_associate_cart_moves_destination; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_destination ON destro_core.associate_cart_moves USING btree (destination);


--
-- Name: ix_destro_core_associate_cart_moves_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_recorded_at ON destro_core.associate_cart_moves USING btree (recorded_at);


--
-- Name: ix_destro_core_associate_cart_moves_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_run_id ON destro_core.associate_cart_moves USING btree (run_id);


--
-- Name: ix_destro_core_associate_cart_moves_starting_door; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_cart_moves_starting_door ON destro_core.associate_cart_moves USING btree (starting_door);


--
-- Name: ix_destro_core_associate_sessions_associate_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_sessions_associate_id ON destro_core.associate_sessions USING btree (associate_id);


--
-- Name: ix_destro_core_associate_sessions_event_type; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_sessions_event_type ON destro_core.associate_sessions USING btree (event_type);


--
-- Name: ix_destro_core_associate_sessions_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_sessions_recorded_at ON destro_core.associate_sessions USING btree (recorded_at);


--
-- Name: ix_destro_core_associate_sessions_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_associate_sessions_run_id ON destro_core.associate_sessions USING btree (run_id);


--
-- Name: ix_destro_core_buffer_occupancy_snapshots_door_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_buffer_occupancy_snapshots_door_id ON destro_core.buffer_occupancy_snapshots USING btree (door_id);


--
-- Name: ix_destro_core_buffer_occupancy_snapshots_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_buffer_occupancy_snapshots_recorded_at ON destro_core.buffer_occupancy_snapshots USING btree (recorded_at);


--
-- Name: ix_destro_core_buffer_occupancy_snapshots_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_buffer_occupancy_snapshots_run_id ON destro_core.buffer_occupancy_snapshots USING btree (run_id);


--
-- Name: ix_destro_core_cart_full_idle_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_full_idle_cart_id ON destro_core.cart_idle USING btree (cart_id);


--
-- Name: ix_destro_core_cart_full_idle_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_full_idle_recorded_at ON destro_core.cart_idle USING btree (recorded_at);


--
-- Name: ix_destro_core_cart_full_idle_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_full_idle_run_id ON destro_core.cart_idle USING btree (run_id);


--
-- Name: ix_destro_core_cart_status_snapshots_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_status_snapshots_cart_id ON destro_core.cart_status_snapshots USING btree (cart_id);


--
-- Name: ix_destro_core_cart_status_snapshots_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_status_snapshots_recorded_at ON destro_core.cart_status_snapshots USING btree (recorded_at);


--
-- Name: ix_destro_core_cart_status_snapshots_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_cart_status_snapshots_run_id ON destro_core.cart_status_snapshots USING btree (run_id);


--
-- Name: ix_destro_core_carts_serviced_outbound_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_serviced_outbound_cart_id ON destro_core.carts_serviced_outbound USING btree (cart_id);


--
-- Name: ix_destro_core_carts_serviced_outbound_door_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_serviced_outbound_door_id ON destro_core.carts_serviced_outbound USING btree (door_id);


--
-- Name: ix_destro_core_carts_serviced_outbound_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_serviced_outbound_recorded_at ON destro_core.carts_serviced_outbound USING btree (recorded_at);


--
-- Name: ix_destro_core_carts_serviced_outbound_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_serviced_outbound_run_id ON destro_core.carts_serviced_outbound USING btree (run_id);


--
-- Name: ix_destro_core_carts_unloaded_inbound_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_unloaded_inbound_cart_id ON destro_core.carts_unloaded_inbound USING btree (cart_id);


--
-- Name: ix_destro_core_carts_unloaded_inbound_door_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_unloaded_inbound_door_id ON destro_core.carts_unloaded_inbound USING btree (door_id);


--
-- Name: ix_destro_core_carts_unloaded_inbound_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_unloaded_inbound_recorded_at ON destro_core.carts_unloaded_inbound USING btree (recorded_at);


--
-- Name: ix_destro_core_carts_unloaded_inbound_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_carts_unloaded_inbound_run_id ON destro_core.carts_unloaded_inbound USING btree (run_id);


--
-- Name: ix_destro_core_coordination_events_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_events_cart_id ON destro_core.coordination_events USING btree (cart_id);


--
-- Name: ix_destro_core_coordination_events_event_uuid; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_events_event_uuid ON destro_core.coordination_events USING btree (event_uuid);


--
-- Name: ix_destro_core_coordination_events_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_events_id ON destro_core.coordination_events USING btree (id);


--
-- Name: ix_destro_core_coordination_events_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_events_recorded_at ON destro_core.coordination_events USING btree (recorded_at);


--
-- Name: ix_destro_core_coordination_events_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_events_run_id ON destro_core.coordination_events USING btree (run_id);


--
-- Name: ix_destro_core_coordination_routes_coordination_event_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_routes_coordination_event_id ON destro_core.coordination_routes USING btree (coordination_event_id);


--
-- Name: ix_destro_core_coordination_routes_door_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_coordination_routes_door_id ON destro_core.coordination_routes USING btree (door_id);


--
-- Name: ix_destro_core_dc_door_slotting_dc; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_dc_door_slotting_dc ON destro_core.dc_door_slotting USING btree (dc);


--
-- Name: ix_destro_core_dc_door_slotting_door; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_dc_door_slotting_door ON destro_core.dc_door_slotting USING btree (door);


--
-- Name: ix_destro_core_dc_door_slotting_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_dc_door_slotting_recorded_at ON destro_core.dc_door_slotting USING btree (recorded_at);


--
-- Name: ix_destro_core_dc_door_slotting_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_dc_door_slotting_run_id ON destro_core.dc_door_slotting USING btree (run_id);


--
-- Name: ix_destro_core_door_activity_snapshots_door_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_activity_snapshots_door_id ON destro_core.door_activity_snapshots USING btree (door_id);


--
-- Name: ix_destro_core_door_activity_snapshots_door_type; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_activity_snapshots_door_type ON destro_core.door_activity_snapshots USING btree (door_type);


--
-- Name: ix_destro_core_door_activity_snapshots_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_activity_snapshots_recorded_at ON destro_core.door_activity_snapshots USING btree (recorded_at);


--
-- Name: ix_destro_core_door_activity_snapshots_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_activity_snapshots_run_id ON destro_core.door_activity_snapshots USING btree (run_id);


--
-- Name: ix_destro_core_door_dc_slotting_dc; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_dc_slotting_dc ON destro_core.door_dc_slotting USING btree (dc);


--
-- Name: ix_destro_core_door_dc_slotting_door; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_dc_slotting_door ON destro_core.door_dc_slotting USING btree (door);


--
-- Name: ix_destro_core_door_dc_slotting_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_dc_slotting_recorded_at ON destro_core.door_dc_slotting USING btree (recorded_at);


--
-- Name: ix_destro_core_door_dc_slotting_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_door_dc_slotting_run_id ON destro_core.door_dc_slotting USING btree (run_id);


--
-- Name: ix_destro_core_exception_events_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_exception_events_recorded_at ON destro_core.exception_events USING btree (recorded_at);


--
-- Name: ix_destro_core_exception_events_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_exception_events_run_id ON destro_core.exception_events USING btree (run_id);


--
-- Name: ix_destro_core_fallback_events_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_fallback_events_cart_id ON destro_core.fallback_events USING btree (cart_id);


--
-- Name: ix_destro_core_fallback_events_fallback_door; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_fallback_events_fallback_door ON destro_core.fallback_events USING btree (fallback_door);


--
-- Name: ix_destro_core_fallback_events_original_door; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_fallback_events_original_door ON destro_core.fallback_events USING btree (original_door);


--
-- Name: ix_destro_core_fallback_events_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_fallback_events_recorded_at ON destro_core.fallback_events USING btree (recorded_at);


--
-- Name: ix_destro_core_fallback_events_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_fallback_events_run_id ON destro_core.fallback_events USING btree (run_id);


--
-- Name: ix_destro_core_free_carts_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_free_carts_recorded_at ON destro_core.free_carts USING btree (recorded_at);


--
-- Name: ix_destro_core_free_carts_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_free_carts_run_id ON destro_core.free_carts USING btree (run_id);


--
-- Name: ix_destro_core_inbound_dock_dwell_dock_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_inbound_dock_dwell_dock_id ON destro_core.inbound_dock_dwell USING btree (dock_id);


--
-- Name: ix_destro_core_inbound_dock_dwell_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_inbound_dock_dwell_recorded_at ON destro_core.inbound_dock_dwell USING btree (recorded_at);


--
-- Name: ix_destro_core_inbound_dock_dwell_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_inbound_dock_dwell_run_id ON destro_core.inbound_dock_dwell USING btree (run_id);


--
-- Name: ix_destro_core_outbound_density_dock_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_density_dock_id ON destro_core.outbound_density USING btree (dock_id);


--
-- Name: ix_destro_core_outbound_density_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_density_id ON destro_core.outbound_density USING btree (id);


--
-- Name: ix_destro_core_outbound_density_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_density_recorded_at ON destro_core.outbound_density USING btree (recorded_at);


--
-- Name: ix_destro_core_outbound_density_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_density_run_id ON destro_core.outbound_density USING btree (run_id);


--
-- Name: ix_destro_core_outbound_dock_dwell_dock_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_dock_dwell_dock_id ON destro_core.outbound_dock_dwell USING btree (dock_id);


--
-- Name: ix_destro_core_outbound_dock_dwell_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_dock_dwell_recorded_at ON destro_core.outbound_dock_dwell USING btree (recorded_at);


--
-- Name: ix_destro_core_outbound_dock_dwell_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_outbound_dock_dwell_run_id ON destro_core.outbound_dock_dwell USING btree (run_id);


--
-- Name: ix_destro_core_robot_distance_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_distance_recorded_at ON destro_core.robot_distance USING btree (recorded_at);


--
-- Name: ix_destro_core_robot_distance_robot_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_distance_robot_id ON destro_core.robot_distance USING btree (robot_id);


--
-- Name: ix_destro_core_robot_distance_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_distance_run_id ON destro_core.robot_distance USING btree (run_id);


--
-- Name: ix_destro_core_robot_dwell_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_dwell_recorded_at ON destro_core.robot_dwell USING btree (recorded_at);


--
-- Name: ix_destro_core_robot_dwell_robot_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_dwell_robot_id ON destro_core.robot_dwell USING btree (robot_id);


--
-- Name: ix_destro_core_robot_dwell_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_dwell_run_id ON destro_core.robot_dwell USING btree (run_id);


--
-- Name: ix_destro_core_robot_status_snapshots_carrying_cart_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_status_snapshots_carrying_cart_id ON destro_core.robot_status_snapshots USING btree (carrying_cart_id);


--
-- Name: ix_destro_core_robot_status_snapshots_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_status_snapshots_recorded_at ON destro_core.robot_status_snapshots USING btree (recorded_at);


--
-- Name: ix_destro_core_robot_status_snapshots_robot_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_status_snapshots_robot_id ON destro_core.robot_status_snapshots USING btree (robot_id);


--
-- Name: ix_destro_core_robot_status_snapshots_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_status_snapshots_run_id ON destro_core.robot_status_snapshots USING btree (run_id);


--
-- Name: ix_destro_core_robot_trips_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_trips_recorded_at ON destro_core.robot_trips USING btree (recorded_at);


--
-- Name: ix_destro_core_robot_trips_robot_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_trips_robot_id ON destro_core.robot_trips USING btree (robot_id);


--
-- Name: ix_destro_core_robot_trips_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_robot_trips_run_id ON destro_core.robot_trips USING btree (run_id);


--
-- Name: ix_destro_core_runner_trips_associate_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_runner_trips_associate_id ON destro_core.runner_trips USING btree (associate_id);


--
-- Name: ix_destro_core_runner_trips_recorded_at; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_runner_trips_recorded_at ON destro_core.runner_trips USING btree (recorded_at);


--
-- Name: ix_destro_core_runner_trips_run_id; Type: INDEX; Schema: destro_core; Owner: destro_admin1
--

CREATE INDEX ix_destro_core_runner_trips_run_id ON destro_core.runner_trips USING btree (run_id);


--
-- Name: associate_roles associate_roles_associate_id_fkey; Type: FK CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.associate_roles
    ADD CONSTRAINT associate_roles_associate_id_fkey FOREIGN KEY (associate_id) REFERENCES destro_associates.associates(id) ON DELETE CASCADE;


--
-- Name: associate_roles associate_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.associate_roles
    ADD CONSTRAINT associate_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES destro_associates.roles(id) ON DELETE CASCADE;


--
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES destro_associates.permissions(id) ON DELETE CASCADE;


--
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: destro_associates; Owner: destro_admin1
--

ALTER TABLE ONLY destro_associates.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES destro_associates.roles(id) ON DELETE CASCADE;


--
-- Name: associate_cart_moves associate_cart_moves_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_cart_moves
    ADD CONSTRAINT associate_cart_moves_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: associate_sessions associate_sessions_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.associate_sessions
    ADD CONSTRAINT associate_sessions_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: buffer_occupancy_snapshots buffer_occupancy_snapshots_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.buffer_occupancy_snapshots
    ADD CONSTRAINT buffer_occupancy_snapshots_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: cart_idle cart_full_idle_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_idle
    ADD CONSTRAINT cart_full_idle_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: cart_status_snapshots cart_status_snapshots_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.cart_status_snapshots
    ADD CONSTRAINT cart_status_snapshots_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: carts_serviced_outbound carts_serviced_outbound_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_serviced_outbound
    ADD CONSTRAINT carts_serviced_outbound_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: carts_unloaded_inbound carts_unloaded_inbound_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.carts_unloaded_inbound
    ADD CONSTRAINT carts_unloaded_inbound_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: coordination_events coordination_events_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.coordination_events
    ADD CONSTRAINT coordination_events_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: dc_door_slotting dc_door_slotting_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.dc_door_slotting
    ADD CONSTRAINT dc_door_slotting_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: door_activity_snapshots door_activity_snapshots_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_activity_snapshots
    ADD CONSTRAINT door_activity_snapshots_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: door_dc_slotting door_dc_slotting_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.door_dc_slotting
    ADD CONSTRAINT door_dc_slotting_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: exception_events exception_events_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.exception_events
    ADD CONSTRAINT exception_events_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: fallback_events fallback_events_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.fallback_events
    ADD CONSTRAINT fallback_events_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: free_carts free_carts_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.free_carts
    ADD CONSTRAINT free_carts_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: inbound_dock_dwell inbound_dock_dwell_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.inbound_dock_dwell
    ADD CONSTRAINT inbound_dock_dwell_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: outbound_density outbound_density_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_density
    ADD CONSTRAINT outbound_density_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: outbound_dock_dwell outbound_dock_dwell_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.outbound_dock_dwell
    ADD CONSTRAINT outbound_dock_dwell_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: robot_distance robot_distance_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_distance
    ADD CONSTRAINT robot_distance_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: robot_dwell robot_dwell_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_dwell
    ADD CONSTRAINT robot_dwell_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: robot_status_snapshots robot_status_snapshots_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_status_snapshots
    ADD CONSTRAINT robot_status_snapshots_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: robot_trips robot_trips_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.robot_trips
    ADD CONSTRAINT robot_trips_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: run_config run_config_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.run_config
    ADD CONSTRAINT run_config_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: runner_trips runner_trips_run_id_fkey; Type: FK CONSTRAINT; Schema: destro_core; Owner: destro_admin1
--

ALTER TABLE ONLY destro_core.runner_trips
    ADD CONSTRAINT runner_trips_run_id_fkey FOREIGN KEY (run_id) REFERENCES destro_core.runs(run_id) ON DELETE CASCADE;


--
-- Name: SCHEMA destro_associates; Type: ACL; Schema: -; Owner: destro_admin1
--

GRANT USAGE ON SCHEMA destro_associates TO destro_runtime;
GRANT USAGE ON SCHEMA destro_associates TO destro_usermgmt;
GRANT USAGE ON SCHEMA destro_associates TO destro_grafana;


--
-- Name: SCHEMA destro_core; Type: ACL; Schema: -; Owner: destro_admin1
--

GRANT USAGE ON SCHEMA destro_core TO destro_runtime;
GRANT USAGE ON SCHEMA destro_core TO destro_grafana;


--
-- Name: TABLE associate_roles; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.associate_roles TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.associate_roles TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.associate_roles TO destro_grafana;


--
-- Name: TABLE associates; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.associates TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.associates TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.associates TO destro_grafana;


--
-- Name: TABLE audit_log; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.audit_log TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.audit_log TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.audit_log TO destro_grafana;


--
-- Name: SEQUENCE audit_log_id_seq; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_associates.audit_log_id_seq TO destro_runtime;
GRANT SELECT,USAGE ON SEQUENCE destro_associates.audit_log_id_seq TO destro_usermgmt;


--
-- Name: TABLE permissions; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.permissions TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.permissions TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.permissions TO destro_grafana;


--
-- Name: TABLE role_permissions; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.role_permissions TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.role_permissions TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.role_permissions TO destro_grafana;


--
-- Name: TABLE roles; Type: ACL; Schema: destro_associates; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.roles TO destro_runtime;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_associates.roles TO destro_usermgmt;
GRANT SELECT ON TABLE destro_associates.roles TO destro_grafana;


--
-- Name: TABLE alembic_version; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.alembic_version TO destro_runtime;
GRANT SELECT ON TABLE destro_core.alembic_version TO destro_grafana;


--
-- Name: TABLE associate_cart_moves; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.associate_cart_moves TO destro_runtime;
GRANT SELECT ON TABLE destro_core.associate_cart_moves TO destro_grafana;


--
-- Name: SEQUENCE associate_cart_moves_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.associate_cart_moves_id_seq TO destro_runtime;


--
-- Name: TABLE associate_sessions; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.associate_sessions TO destro_runtime;
GRANT SELECT ON TABLE destro_core.associate_sessions TO destro_grafana;


--
-- Name: SEQUENCE associate_sessions_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.associate_sessions_id_seq TO destro_runtime;


--
-- Name: TABLE buffer_occupancy_snapshots; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.buffer_occupancy_snapshots TO destro_runtime;
GRANT SELECT ON TABLE destro_core.buffer_occupancy_snapshots TO destro_grafana;


--
-- Name: SEQUENCE buffer_occupancy_snapshots_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.buffer_occupancy_snapshots_id_seq TO destro_runtime;


--
-- Name: TABLE cart_idle; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.cart_idle TO destro_runtime;
GRANT SELECT ON TABLE destro_core.cart_idle TO destro_grafana;


--
-- Name: SEQUENCE cart_full_idle_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.cart_full_idle_id_seq TO destro_runtime;


--
-- Name: TABLE cart_status_snapshots; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.cart_status_snapshots TO destro_runtime;
GRANT SELECT ON TABLE destro_core.cart_status_snapshots TO destro_grafana;


--
-- Name: SEQUENCE cart_status_snapshots_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.cart_status_snapshots_id_seq TO destro_runtime;


--
-- Name: TABLE carts_serviced_outbound; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.carts_serviced_outbound TO destro_runtime;
GRANT SELECT ON TABLE destro_core.carts_serviced_outbound TO destro_grafana;


--
-- Name: SEQUENCE carts_serviced_outbound_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.carts_serviced_outbound_id_seq TO destro_runtime;


--
-- Name: TABLE carts_unloaded_inbound; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.carts_unloaded_inbound TO destro_runtime;
GRANT SELECT ON TABLE destro_core.carts_unloaded_inbound TO destro_grafana;


--
-- Name: SEQUENCE carts_unloaded_inbound_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.carts_unloaded_inbound_id_seq TO destro_runtime;


--
-- Name: TABLE coordination_events; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.coordination_events TO destro_runtime;
GRANT SELECT ON TABLE destro_core.coordination_events TO destro_grafana;


--
-- Name: SEQUENCE coordination_events_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.coordination_events_id_seq TO destro_runtime;


--
-- Name: TABLE coordination_routes; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.coordination_routes TO destro_runtime;
GRANT SELECT ON TABLE destro_core.coordination_routes TO destro_grafana;


--
-- Name: SEQUENCE coordination_routes_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.coordination_routes_id_seq TO destro_runtime;


--
-- Name: TABLE dc_door_slotting; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.dc_door_slotting TO destro_runtime;
GRANT SELECT ON TABLE destro_core.dc_door_slotting TO destro_grafana;


--
-- Name: SEQUENCE dc_door_slotting_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.dc_door_slotting_id_seq TO destro_runtime;


--
-- Name: TABLE door_activity_snapshots; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.door_activity_snapshots TO destro_runtime;
GRANT SELECT ON TABLE destro_core.door_activity_snapshots TO destro_grafana;


--
-- Name: SEQUENCE door_activity_snapshots_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.door_activity_snapshots_id_seq TO destro_runtime;


--
-- Name: TABLE door_dc_slotting; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.door_dc_slotting TO destro_runtime;
GRANT SELECT ON TABLE destro_core.door_dc_slotting TO destro_grafana;


--
-- Name: SEQUENCE door_dc_slotting_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.door_dc_slotting_id_seq TO destro_runtime;


--
-- Name: TABLE exception_events; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.exception_events TO destro_runtime;
GRANT SELECT ON TABLE destro_core.exception_events TO destro_grafana;


--
-- Name: SEQUENCE exception_events_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.exception_events_id_seq TO destro_runtime;


--
-- Name: TABLE fallback_events; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.fallback_events TO destro_runtime;
GRANT SELECT ON TABLE destro_core.fallback_events TO destro_grafana;


--
-- Name: SEQUENCE fallback_events_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.fallback_events_id_seq TO destro_runtime;


--
-- Name: TABLE free_carts; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.free_carts TO destro_runtime;
GRANT SELECT ON TABLE destro_core.free_carts TO destro_grafana;


--
-- Name: SEQUENCE free_carts_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.free_carts_id_seq TO destro_runtime;


--
-- Name: TABLE inbound_dock_dwell; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.inbound_dock_dwell TO destro_runtime;
GRANT SELECT ON TABLE destro_core.inbound_dock_dwell TO destro_grafana;


--
-- Name: SEQUENCE inbound_dock_dwell_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.inbound_dock_dwell_id_seq TO destro_runtime;


--
-- Name: TABLE outbound_density; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.outbound_density TO destro_runtime;
GRANT SELECT ON TABLE destro_core.outbound_density TO destro_grafana;


--
-- Name: SEQUENCE outbound_density_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.outbound_density_id_seq TO destro_runtime;


--
-- Name: TABLE outbound_dock_dwell; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.outbound_dock_dwell TO destro_runtime;
GRANT SELECT ON TABLE destro_core.outbound_dock_dwell TO destro_grafana;


--
-- Name: SEQUENCE outbound_dock_dwell_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.outbound_dock_dwell_id_seq TO destro_runtime;


--
-- Name: TABLE robot_distance; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.robot_distance TO destro_runtime;
GRANT SELECT ON TABLE destro_core.robot_distance TO destro_grafana;


--
-- Name: SEQUENCE robot_distance_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.robot_distance_id_seq TO destro_runtime;


--
-- Name: TABLE robot_dwell; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.robot_dwell TO destro_runtime;
GRANT SELECT ON TABLE destro_core.robot_dwell TO destro_grafana;


--
-- Name: SEQUENCE robot_dwell_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.robot_dwell_id_seq TO destro_runtime;


--
-- Name: TABLE robot_status_snapshots; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.robot_status_snapshots TO destro_runtime;
GRANT SELECT ON TABLE destro_core.robot_status_snapshots TO destro_grafana;


--
-- Name: SEQUENCE robot_status_snapshots_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.robot_status_snapshots_id_seq TO destro_runtime;


--
-- Name: TABLE robot_trips; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.robot_trips TO destro_runtime;
GRANT SELECT ON TABLE destro_core.robot_trips TO destro_grafana;


--
-- Name: SEQUENCE robot_trips_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.robot_trips_id_seq TO destro_runtime;


--
-- Name: TABLE run_config; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.run_config TO destro_runtime;
GRANT SELECT ON TABLE destro_core.run_config TO destro_grafana;


--
-- Name: SEQUENCE run_config_config_version_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.run_config_config_version_seq TO destro_runtime;


--
-- Name: TABLE runner_trips; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.runner_trips TO destro_runtime;
GRANT SELECT ON TABLE destro_core.runner_trips TO destro_grafana;


--
-- Name: SEQUENCE runner_trips_id_seq; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,USAGE ON SEQUENCE destro_core.runner_trips_id_seq TO destro_runtime;


--
-- Name: TABLE runs; Type: ACL; Schema: destro_core; Owner: destro_admin1
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE destro_core.runs TO destro_runtime;
GRANT SELECT ON TABLE destro_core.runs TO destro_grafana;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: destro_associates; Owner: destro_admin1
--

ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_associates GRANT SELECT,USAGE ON SEQUENCES  TO destro_runtime;
ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_associates GRANT SELECT,USAGE ON SEQUENCES  TO destro_usermgmt;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: destro_associates; Owner: db_init
--

ALTER DEFAULT PRIVILEGES FOR ROLE db_init IN SCHEMA destro_associates GRANT SELECT,USAGE ON SEQUENCES  TO destro_usermgmt;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: destro_associates; Owner: destro_admin1
--

ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_associates GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO destro_runtime;
ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_associates GRANT SELECT ON TABLES  TO destro_grafana;
ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_associates GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO destro_usermgmt;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: destro_associates; Owner: db_init
--

ALTER DEFAULT PRIVILEGES FOR ROLE db_init IN SCHEMA destro_associates GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO destro_usermgmt;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: destro_core; Owner: destro_admin1
--

ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_core GRANT SELECT,USAGE ON SEQUENCES  TO destro_runtime;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: destro_core; Owner: destro_admin1
--

ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_core GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO destro_runtime;
ALTER DEFAULT PRIVILEGES FOR ROLE destro_admin1 IN SCHEMA destro_core GRANT SELECT ON TABLES  TO destro_grafana;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: destro_core; Owner: db_init
--

ALTER DEFAULT PRIVILEGES FOR ROLE db_init IN SCHEMA destro_core GRANT SELECT ON TABLES  TO destro_grafana;


--
-- PostgreSQL database dump complete
--

