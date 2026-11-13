/*
PROYECTO: SISTEMA DE GESTIÓN OPERATIVA DE PEMEX
AUTOR: ISRAEL REYES
FECHA: 20261112
DESCRIPCIÓN: CREACIÓN DE LA BASE DE DATOS
*/

IF NOT EXISTS ( SELECT
	name from master.sys.sysdatabases WHERE NAME = 'CyssPosBd'
	)
	BEGIN
		CREATE DATABASE CyssPosBd
		PRINT 'Base de datos CyssPosBd creada correctamente';
	END
ELSE
	BEGIN
		PRINT 'La base de datos CyssPosBd ya existe';
	END