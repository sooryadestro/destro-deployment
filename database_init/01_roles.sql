-- Init Step 1: Create application roles idempotently.
-- Uses EXCEPTION WHEN duplicate_object so this is safe to re-run and safe
-- on any PostgreSQL version that supports DO blocks (9.0+).
--
-- Passwords match the DATABASE_URL values in destro-deploy.yaml.
-- To rotate: update the corresponding DATABASE_URL env vars and re-run ALTER ROLE.

DO $$
BEGIN
    CREATE ROLE destro_admin1
        WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB
             LOGIN NOREPLICATION NOBYPASSRLS
             PASSWORD 'destro_pass';
EXCEPTION WHEN duplicate_object THEN
    RAISE NOTICE 'role destro_admin1 already exists, skipping create';
END$$;

DO $$
BEGIN
    CREATE ROLE destro_grafana
        WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB
             LOGIN NOREPLICATION NOBYPASSRLS
             PASSWORD 'destro_pass';
EXCEPTION WHEN duplicate_object THEN
    RAISE NOTICE 'role destro_grafana already exists, skipping create';
END$$;

DO $$
BEGIN
    CREATE ROLE destro_runtime
        WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB
             LOGIN NOREPLICATION NOBYPASSRLS
             PASSWORD 'destro_pass';
EXCEPTION WHEN duplicate_object THEN
    RAISE NOTICE 'role destro_runtime already exists, skipping create';
END$$;

DO $$
BEGIN
    CREATE ROLE destro_usermgmt
        WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB
             LOGIN NOREPLICATION NOBYPASSRLS
             PASSWORD 'destro_pass';
EXCEPTION WHEN duplicate_object THEN
    RAISE NOTICE 'role destro_usermgmt already exists, skipping create';
END$$;

-- search_path for app roles (idempotent — ALTER ROLE is always safe to re-run)
ALTER ROLE destro_admin1  SET search_path TO 'destro_core', 'destro_associates', 'public';
ALTER ROLE destro_runtime SET search_path TO 'destro_core', 'destro_associates', 'public';
