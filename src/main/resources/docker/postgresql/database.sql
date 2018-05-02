-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.com.br
-- Model Author: Alejandro Vàsquez


CREATE USER docker WITH encrypted password 'secret'; 
CREATE DATABASE mantenimiento;
GRANT ALL PRIVILEGES ON DATABASE mantenimiento TO docker;

-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: mantenimiento | type: DATABASE --
-- -- DROP DATABASE IF EXISTS mantenimiento;

-- -- ddl-end --
-- 

-- object: public.orden_trabajo | type: TABLE --
-- DROP TABLE IF EXISTS public.orden_trabajo CASCADE;
CREATE TABLE public.orden_trabajo(
	id_orden_trabajo serial NOT NULL,
	id_equipo integer,
	id_prioridad integer NOT NULL DEFAULT 1,
	id_solicitud integer NOT NULL,
	id_responsable integer NOT NULL,
	diagnostico text NOT NULL,
	CONSTRAINT pk_orden_trabajo PRIMARY KEY (id_orden_trabajo)

);
-- ddl-end --
COMMENT ON COLUMN public.orden_trabajo.id_equipo IS 'Identificador del equipo';
-- ddl-end --
COMMENT ON COLUMN public.orden_trabajo.id_responsable IS 'Identificador de la persona que llega a hacer un diagnostico del equipo';
-- ddl-end --
ALTER TABLE public.orden_trabajo OWNER TO postgres;
-- ddl-end --

-- object: public.orden_trabajo_detalle | type: TABLE --
-- DROP TABLE IF EXISTS public.orden_trabajo_detalle CASCADE;
CREATE TABLE public.orden_trabajo_detalle(
	id_orden_trabajo_detalle serial NOT NULL,
	id_orden_trabajo integer NOT NULL,
	comentario text,
	id_parte integer,
	id_responsable integer NOT NULL,
	CONSTRAINT pk_orden_trabajo_detalle PRIMARY KEY (id_orden_trabajo_detalle)

);
-- ddl-end --
ALTER TABLE public.orden_trabajo_detalle OWNER TO postgres;
-- ddl-end --

-- object: public.equipo | type: TABLE --
-- DROP TABLE IF EXISTS public.equipo CASCADE;
CREATE TABLE public.equipo(
	id_equipo serial NOT NULL,
	numero_inventario character varying(25) NOT NULL,
	numero_serie character varying(25),
	marca character varying(255),
	descripcion text,
	comentario text,
	CONSTRAINT pk_equipo PRIMARY KEY (id_equipo)

);
-- ddl-end --
COMMENT ON COLUMN public.equipo.id_equipo IS 'Identificador del equipo dentro del sistema';
-- ddl-end --
COMMENT ON COLUMN public.equipo.numero_serie IS 'Numero de serie del equipo';
-- ddl-end --
COMMENT ON COLUMN public.equipo.descripcion IS 'Descripcion con la que cuenta el equipo';
-- ddl-end --
COMMENT ON COLUMN public.equipo.comentario IS 'espacio para indicar comentarios';
-- ddl-end --
ALTER TABLE public.equipo OWNER TO postgres;
-- ddl-end --

-- object: public.equipo_detalle | type: TABLE --
-- DROP TABLE IF EXISTS public.equipo_detalle CASCADE;
CREATE TABLE public.equipo_detalle(
	id_equipo integer NOT NULL,
	id_parte integer NOT NULL,
	numero_serie character varying(50),
	descripcion text,
	CONSTRAINT pk_equipo_detalle PRIMARY KEY (id_equipo,id_parte)

);
-- ddl-end --
COMMENT ON COLUMN public.equipo_detalle.id_parte IS 'Tipo de parte';
-- ddl-end --
ALTER TABLE public.equipo_detalle OWNER TO postgres;
-- ddl-end --

-- object: public.responsable | type: TABLE --
-- DROP TABLE IF EXISTS public.responsable CASCADE;
CREATE TABLE public.responsable(
	id_responsable serial NOT NULL,
	id_tipo_responsable integer NOT NULL,
	nombre character varying(75) NOT NULL,
	primer_apellido character varying(50) NOT NULL,
	segundo_apellido character varying(50),
	activo boolean NOT NULL DEFAULT false,
	CONSTRAINT pk_id_responsable PRIMARY KEY (id_responsable)

);
-- ddl-end --
COMMENT ON TABLE public.responsable IS 'Tabla que contiene los responsables de mantenimiento';
-- ddl-end --
COMMENT ON COLUMN public.responsable.id_responsable IS 'Identificador del responsable';
-- ddl-end --
COMMENT ON COLUMN public.responsable.id_tipo_responsable IS 'Identificador del tipo de resposable al que pertenece ek responsable';
-- ddl-end --
COMMENT ON COLUMN public.responsable.nombre IS 'Nombre del responsable';
-- ddl-end --
COMMENT ON COLUMN public.responsable.segundo_apellido IS 'segundo apellido del responsable, en caso de contar con el';
-- ddl-end --
COMMENT ON CONSTRAINT pk_id_responsable ON public.responsable  IS 'Constraint para la llave primaria del responsable';
-- ddl-end --
ALTER TABLE public.responsable OWNER TO postgres;
-- ddl-end --

-- object: public.prioridad | type: TABLE --
-- DROP TABLE IF EXISTS public.prioridad CASCADE;
CREATE TABLE public.prioridad(
	id_prioridad serial NOT NULL,
	prioridad smallint NOT NULL,
	descripcion character varying(255),
	activo boolean NOT NULL DEFAULT true,
	CONSTRAINT pk_id_prioridad PRIMARY KEY (id_prioridad)

);
-- ddl-end --
COMMENT ON TABLE public.prioridad IS 'Tabla que contiene las prioridades';
-- ddl-end --
COMMENT ON COLUMN public.prioridad.id_prioridad IS 'Identificador de la tabla prioridad';
-- ddl-end --
COMMENT ON COLUMN public.prioridad.prioridad IS 'Prioridad';
-- ddl-end --
COMMENT ON COLUMN public.prioridad.descripcion IS 'Descripcion para la prioridad';
-- ddl-end --
COMMENT ON COLUMN public.prioridad.activo IS 'Valor que determina si la prioridad puede ser utilizada';
-- ddl-end --
COMMENT ON CONSTRAINT pk_id_prioridad ON public.prioridad  IS 'Constraint para prioridad';
-- ddl-end --
ALTER TABLE public.prioridad OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_responsable | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_responsable CASCADE;
CREATE TABLE public.tipo_responsable(
	id_tipo_responsable serial NOT NULL,
	nombre_tipo_responsable character varying(50) NOT NULL,
	detalle_tipo_responsable text,
	activo boolean NOT NULL DEFAULT true,
	CONSTRAINT pk_tipo_responsable PRIMARY KEY (id_tipo_responsable)

);
-- ddl-end --
COMMENT ON TABLE public.tipo_responsable IS 'Identificador del tipo de responsable';
-- ddl-end --
COMMENT ON COLUMN public.tipo_responsable.id_tipo_responsable IS 'Identificador del tipo de responsable';
-- ddl-end --
COMMENT ON COLUMN public.tipo_responsable.nombre_tipo_responsable IS 'Nombre del tipo de responsable';
-- ddl-end --
COMMENT ON COLUMN public.tipo_responsable.detalle_tipo_responsable IS 'Detalles para el tipo de resposable';
-- ddl-end --
COMMENT ON COLUMN public.tipo_responsable.activo IS 'Boolean que determina si se puede utilizar el tipo de responsable';
-- ddl-end --
COMMENT ON CONSTRAINT pk_tipo_responsable ON public.tipo_responsable  IS 'Constraint para la llave primaria de tipo de responsable';
-- ddl-end --
ALTER TABLE public.tipo_responsable OWNER TO postgres;
-- ddl-end --

-- object: public.paso | type: TABLE --
-- DROP TABLE IF EXISTS public.paso CASCADE;
CREATE TABLE public.paso(
	id_paso serial NOT NULL,
	nombre character varying(255) NOT NULL,
	descripcion text,
	activo boolean DEFAULT true,
	CONSTRAINT pk_paso PRIMARY KEY (id_paso)

);
-- ddl-end --
COMMENT ON COLUMN public.paso.id_paso IS 'Identificador de cada paso';
-- ddl-end --
COMMENT ON COLUMN public.paso.nombre IS 'Nombre del paso';
-- ddl-end --
COMMENT ON COLUMN public.paso.descripcion IS 'Descipcion del paso';
-- ddl-end --
ALTER TABLE public.paso OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_solicitud | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_solicitud CASCADE;
CREATE TABLE public.tipo_solicitud(
	id_tipo_solicitud serial NOT NULL,
	nombre character varying(255) NOT NULL,
	descripcion text,
	activo boolean DEFAULT true,
	CONSTRAINT pk_tipo_solicitud PRIMARY KEY (id_tipo_solicitud)

);
-- ddl-end --
COMMENT ON COLUMN public.tipo_solicitud.id_tipo_solicitud IS 'Identificador de la solicitud';
-- ddl-end --
COMMENT ON COLUMN public.tipo_solicitud.nombre IS 'Nombre de la solicitiud';
-- ddl-end --
COMMENT ON COLUMN public.tipo_solicitud.descripcion IS 'Descripcion de tipo solicitud';
-- ddl-end --
ALTER TABLE public.tipo_solicitud OWNER TO postgres;
-- ddl-end --

-- object: public.solicitud | type: TABLE --
-- DROP TABLE IF EXISTS public.solicitud CASCADE;
CREATE TABLE public.solicitud(
	id_solicitud serial NOT NULL,
	id_tipo_solicitud integer NOT NULL,
	solicitante character varying(255) NOT NULL,
	departamento character varying(255),
	CONSTRAINT pk_id_solicitud PRIMARY KEY (id_solicitud)

);
-- ddl-end --
COMMENT ON TABLE public.solicitud IS 'Tabla donde estàn registradas todas las solicitudes hechas ';
-- ddl-end --
COMMENT ON COLUMN public.solicitud.id_solicitud IS 'Identificador de solicitud';
-- ddl-end --
ALTER TABLE public.solicitud OWNER TO postgres;
-- ddl-end --

-- object: public.estado_orden_trabajo_detalle | type: TABLE --
-- DROP TABLE IF EXISTS public.estado_orden_trabajo_detalle CASCADE;
CREATE TABLE public.estado_orden_trabajo_detalle(
	id_orden_trabajo_detalle_proceso serial NOT NULL,
	id_orden_trabajo_detalle integer NOT NULL,
	id_paso_procedimiento integer NOT NULL,
	CONSTRAINT pk_estado_orden_detalle_trabajo_detalle PRIMARY KEY (id_orden_trabajo_detalle_proceso)

);
-- ddl-end --
ALTER TABLE public.estado_orden_trabajo_detalle OWNER TO postgres;
-- ddl-end --

-- object: public.procedimiento | type: TABLE --
-- DROP TABLE IF EXISTS public.procedimiento CASCADE;
CREATE TABLE public.procedimiento(
	id_procedimiento serial NOT NULL,
	nombre character varying(255) NOT NULL,
	descripcion text,
	activo boolean DEFAULT true,
	CONSTRAINT pk_procedimiento PRIMARY KEY (id_procedimiento)

);
-- ddl-end --
COMMENT ON COLUMN public.procedimiento.id_procedimiento IS 'Identificador de cada procedimiento';
-- ddl-end --
COMMENT ON COLUMN public.procedimiento.nombre IS 'Nombre del procedimiento';
-- ddl-end --
COMMENT ON COLUMN public.procedimiento.descripcion IS 'Descripcion del procedimiento';
-- ddl-end --
ALTER TABLE public.procedimiento OWNER TO postgres;
-- ddl-end --

-- object: public.paso_procedimiento | type: TABLE --
-- DROP TABLE IF EXISTS public.paso_procedimiento CASCADE;
CREATE TABLE public.paso_procedimiento(
	id_paso_procedimiento serial NOT NULL,
	id_procedimiento integer NOT NULL,
	id_paso_parte integer NOT NULL,
	requerido boolean NOT NULL DEFAULT false,
	CONSTRAINT pk_paso_procedimiento_tb PRIMARY KEY (id_paso_procedimiento)

);
-- ddl-end --
ALTER TABLE public.paso_procedimiento OWNER TO postgres;
-- ddl-end --

-- object: public.parte | type: TABLE --
-- DROP TABLE IF EXISTS public.parte CASCADE;
CREATE TABLE public.parte(
	id_parte serial NOT NULL,
	nombre character varying(255) NOT NULL,
	descripcion text,
	activo boolean DEFAULT true,
	CONSTRAINT pk_id_parte PRIMARY KEY (id_parte)

);
-- ddl-end --
COMMENT ON COLUMN public.parte.id_parte IS 'Identificador de parte';
-- ddl-end --
COMMENT ON COLUMN public.parte.nombre IS 'Nombre de la parte';
-- ddl-end --
COMMENT ON COLUMN public.parte.descripcion IS 'Descripcion de la parte';
-- ddl-end --
ALTER TABLE public.parte OWNER TO postgres;
-- ddl-end --

-- object: public.paso_por_parte | type: TABLE --
-- DROP TABLE IF EXISTS public.paso_por_parte CASCADE;
CREATE TABLE public.paso_por_parte(
	id_paso_parte serial NOT NULL,
	id_parte integer NOT NULL,
	id_paso integer NOT NULL,
	nombre character varying(255) NOT NULL,
	descripcion text,
	activo boolean DEFAULT true,
	requerido boolean NOT NULL DEFAULT false,
	CONSTRAINT pk_paso_por_parte PRIMARY KEY (id_paso_parte)

);
-- ddl-end --
COMMENT ON COLUMN public.paso_por_parte.nombre IS 'Nombre del paso por parte';
-- ddl-end --
COMMENT ON COLUMN public.paso_por_parte.requerido IS 'valor boolean que indica si el paso por parte es necesario';
-- ddl-end --
ALTER TABLE public.paso_por_parte OWNER TO postgres;
-- ddl-end --

-- object: fk_equipo_orden_trabajo | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo DROP CONSTRAINT IF EXISTS fk_equipo_orden_trabajo CASCADE;
ALTER TABLE public.orden_trabajo ADD CONSTRAINT fk_equipo_orden_trabajo FOREIGN KEY (id_equipo)
REFERENCES public.equipo (id_equipo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_prioridad_orden_trabajo | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo DROP CONSTRAINT IF EXISTS fk_prioridad_orden_trabajo CASCADE;
ALTER TABLE public.orden_trabajo ADD CONSTRAINT fk_prioridad_orden_trabajo FOREIGN KEY (id_prioridad)
REFERENCES public.prioridad (id_prioridad) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_solicitud_orden_trabajo | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo DROP CONSTRAINT IF EXISTS fk_solicitud_orden_trabajo CASCADE;
ALTER TABLE public.orden_trabajo ADD CONSTRAINT fk_solicitud_orden_trabajo FOREIGN KEY (id_solicitud)
REFERENCES public.solicitud (id_solicitud) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_responsable_orden_trabajo | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo DROP CONSTRAINT IF EXISTS fk_responsable_orden_trabajo CASCADE;
ALTER TABLE public.orden_trabajo ADD CONSTRAINT fk_responsable_orden_trabajo FOREIGN KEY (id_responsable)
REFERENCES public.responsable (id_responsable) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_orden_tranbajo_orden_trabajo_detalle | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo_detalle DROP CONSTRAINT IF EXISTS fk_orden_tranbajo_orden_trabajo_detalle CASCADE;
ALTER TABLE public.orden_trabajo_detalle ADD CONSTRAINT fk_orden_tranbajo_orden_trabajo_detalle FOREIGN KEY (id_orden_trabajo)
REFERENCES public.orden_trabajo (id_orden_trabajo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_responsable_orden_trabajo_detalle | type: CONSTRAINT --
-- ALTER TABLE public.orden_trabajo_detalle DROP CONSTRAINT IF EXISTS fk_responsable_orden_trabajo_detalle CASCADE;
ALTER TABLE public.orden_trabajo_detalle ADD CONSTRAINT fk_responsable_orden_trabajo_detalle FOREIGN KEY (id_responsable)
REFERENCES public.responsable (id_responsable) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_equipo_detalle_equipo | type: CONSTRAINT --
-- ALTER TABLE public.equipo_detalle DROP CONSTRAINT IF EXISTS fk_equipo_detalle_equipo CASCADE;
ALTER TABLE public.equipo_detalle ADD CONSTRAINT fk_equipo_detalle_equipo FOREIGN KEY (id_equipo)
REFERENCES public.equipo (id_equipo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_parte_detalle_equipo | type: CONSTRAINT --
-- ALTER TABLE public.equipo_detalle DROP CONSTRAINT IF EXISTS fk_parte_detalle_equipo CASCADE;
ALTER TABLE public.equipo_detalle ADD CONSTRAINT fk_parte_detalle_equipo FOREIGN KEY (id_parte)
REFERENCES public.parte (id_parte) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_responsable_responsable | type: CONSTRAINT --
-- ALTER TABLE public.responsable DROP CONSTRAINT IF EXISTS fk_tipo_responsable_responsable CASCADE;
ALTER TABLE public.responsable ADD CONSTRAINT fk_tipo_responsable_responsable FOREIGN KEY (id_tipo_responsable)
REFERENCES public.tipo_responsable (id_tipo_responsable) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_solicitud_solicitud | type: CONSTRAINT --
-- ALTER TABLE public.solicitud DROP CONSTRAINT IF EXISTS fk_tipo_solicitud_solicitud CASCADE;
ALTER TABLE public.solicitud ADD CONSTRAINT fk_tipo_solicitud_solicitud FOREIGN KEY (id_tipo_solicitud)
REFERENCES public.tipo_solicitud (id_tipo_solicitud) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_id_orden_trabajo_detalle_t | type: CONSTRAINT --
-- ALTER TABLE public.estado_orden_trabajo_detalle DROP CONSTRAINT IF EXISTS fk_id_orden_trabajo_detalle_t CASCADE;
ALTER TABLE public.estado_orden_trabajo_detalle ADD CONSTRAINT fk_id_orden_trabajo_detalle_t FOREIGN KEY (id_orden_trabajo_detalle)
REFERENCES public.orden_trabajo_detalle (id_orden_trabajo_detalle) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_paso_procedimiento_estado_orden_trabajo_detalle | type: CONSTRAINT --
-- ALTER TABLE public.estado_orden_trabajo_detalle DROP CONSTRAINT IF EXISTS fk_paso_procedimiento_estado_orden_trabajo_detalle CASCADE;
ALTER TABLE public.estado_orden_trabajo_detalle ADD CONSTRAINT fk_paso_procedimiento_estado_orden_trabajo_detalle FOREIGN KEY (id_paso_procedimiento)
REFERENCES public.paso_procedimiento (id_paso_procedimiento) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_paso_por_parte_paso_procedimiento | type: CONSTRAINT --
-- ALTER TABLE public.paso_procedimiento DROP CONSTRAINT IF EXISTS fk_paso_por_parte_paso_procedimiento CASCADE;
ALTER TABLE public.paso_procedimiento ADD CONSTRAINT fk_paso_por_parte_paso_procedimiento FOREIGN KEY (id_paso_parte)
REFERENCES public.paso_por_parte (id_paso_parte) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_procedimiento_paso_procedimiento | type: CONSTRAINT --
-- ALTER TABLE public.paso_procedimiento DROP CONSTRAINT IF EXISTS fk_procedimiento_paso_procedimiento CASCADE;
ALTER TABLE public.paso_procedimiento ADD CONSTRAINT fk_procedimiento_paso_procedimiento FOREIGN KEY (id_procedimiento)
REFERENCES public.procedimiento (id_procedimiento) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_parte_paso_por_parte | type: CONSTRAINT --
-- ALTER TABLE public.paso_por_parte DROP CONSTRAINT IF EXISTS fk_parte_paso_por_parte CASCADE;
ALTER TABLE public.paso_por_parte ADD CONSTRAINT fk_parte_paso_por_parte FOREIGN KEY (id_parte)
REFERENCES public.parte (id_parte) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_paso_paso_por_parte | type: CONSTRAINT --
-- ALTER TABLE public.paso_por_parte DROP CONSTRAINT IF EXISTS fk_paso_paso_por_parte CASCADE;
ALTER TABLE public.paso_por_parte ADD CONSTRAINT fk_paso_paso_por_parte FOREIGN KEY (id_paso)
REFERENCES public.paso (id_paso) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


