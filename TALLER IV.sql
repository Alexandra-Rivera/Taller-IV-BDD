USE TALLER3; 

GO
CREATE PROCEDURE Obtener_Datos 
  @id_Clínica INT,
  @id_Cliente INT, 
  @fecha VARCHAR (32)
  AS
  BEGIN
    --DECLARE @Cantidad_Citas INT; 

    SELECT ct.id, ct.id_clinica, ct.id_cliente, ct.fecha
    FROM CLINICA cl 
    INNER JOIN CITA ct 
     ON cl.id = ct.id_clinica
    WHERE ct.id_clinica = @id_Clínica AND ct.fecha = @fecha  
  END;
GO

EXEC Obtener_Datos 1, 19, '20-05-2022 09:00:00.000';

DROP PROCEDURE Obtener_Datos;
SELECT cl.id, cl.nombre, ctr.id, ctr.id_clinica, ctr.id_medico, ctr.horario, ctr.salario FROM CLINICA cl
INNER JOIN CONTRATO ctr
 ON cl.id = ctr.id_Clinica; 

SELECT ct.id, ct.id_clinica, ctr.id_medico, ctr.horario, ctr.fecha_contrato ,ctr.salario FROM CLINICA cl 
INNER JOIN CITA ct
 ON cl.id = ct.id_clinica
RIGHT JOIN CONTRATO ctr
 ON cl.id = ctr.id_clinica;


SELECT ctr.id, COUNT (id_medico) FROM CONTRATO ctr
GROUP BY (ctr.id); 

SELECT * FROM CONTRATO;