create view vw_ListConduc as select MiniBuses.NroPlaca, concat(Personal.Nombre,' ',Personal.Apellido)as 'Nombre y apellidos', Dni, TipodeLicen, TipoPersonal, Ruta, Estado from MiniBuses
inner join Personal on MiniBuses.idminiBus = Personal.idChoferes
inner join Turnos on Personal.idChoferes = Turnos.idTurnos where Personal.TipoPersonal='C'
go

select * from vw_ListConduc
go
