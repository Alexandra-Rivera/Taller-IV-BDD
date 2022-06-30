USE TALLER3; 

GO
CREATE PROCEDURE agendar_cita 
  @id_Clínica INT,
  @id_Cliente INT, 
  @fecha VARCHAR (32)
  AS
  BEGIN
    SELECT /* ct.id,*/ COUNT(ct.id_clinica) 'Cantidad de citas ',/* ct.id_cliente, */ct.fecha 
    FROM CLINICA cl 
    INNER JOIN CITA ct 
     ON cl.id = ct.id_clinica
    WHERE ct.id_clinica = @id_Clínica AND ct.fecha = @fecha
    GROUP BY ct.fecha /*ct.id, ct.id_cliente*/ ;
    
    DECLARE @num_Consultorios INT;
    SELECT @num_Consultorios = COUNT(con.id_clinica) FROM CLINICA cl 
    INNER JOIN CONSULTORIO con 
      ON cl.id = con.id_clinica
    GROUP BY cl.nombre; 
      
    IF @num_Consultorios < COUNT(@id_Clínica) 
    BEGIN
      PRINT 'ERROR, no hay medicos disponibles'
    END

    /* INSERT INTO CITA 
        VALUES (@id_Clínica, @id_Cliente, @fecha);*/
    /*DECLARE @Cantidad_Consultorios INT; 
    SELECT ct.id, ct.id_clinica, ctr.id_medico, ctr.horario, ctr.fecha_contrato ,ctr.salario FROM CLINICA cl 
    INNER JOIN CITA ct
      ON cl.id = ct.id_clinica
    RIGHT JOIN CONTRATO ctr
      ON cl.id = ctr.id_clinica;
    IF @Cantidad_Consultorios = 0 
    BEGIN
    PRINT 'No se puede registrar la cita porque no hay médico disponible'
    END 
    ELSE IF @Cantidad_Consultorios = */

  END;
GO

EXEC agendar_cita 1, 19, '20-05-2022 09:00:00.000';

DROP PROCEDURE Obtener_Datos;

--Datos sobre los médicos 
SELECT ct.id, ct.id_clinica, ctr.id_medico, ctr.horario, ctr.fecha_contrato ,ctr.salario FROM CLINICA cl 
INNER JOIN CITA ct
 ON cl.id = ct.id_clinica
RIGHT JOIN CONTRATO ctr
 ON cl.id = ctr.id_clinica;

 
 -- Cantidad de consultorios por clínica
SELECT cl.nombre 'Nombre de la clínica', COUNT(con.id_clinica) 'Número de consultorios' FROM CLINICA cl 
INNER JOIN CONSULTORIO con 
 ON cl.id = con.id_clinica
GROUP BY cl.nombre; 