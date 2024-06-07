// Función de impuesto;
Función impuesto (nt,Salario)
	Definir vacaciones, Dias_vac, i, vacacionesd Como Entero
	Definir aguinaldo, INNS_Lab, INNS_Patr, IR, Salario_neto Como Real
	Definir vacd Como Real
	Dimensionar vacacionesd(nt), Dias_vac(nt), aguinaldo(nt), INNS_Lab(nt), INNS_Patr(nt), IR(nt), Salario_neto(nt), vacd(nt)
	vacaciones <- 30
	Para i<-1 Hasta nt Con Paso 1 Hacer
		aguinaldo[i] <- Salario[i]
		Escribir 'Ingrese cantidad de dias tomados hasta ahora'
		Leer Dias_vac[i]
		vacacionesd[i] <- vacaciones-Dias_vac[i]
		vacd[i] <- vacacionesd[i]*(Salario[i]/30)
		INNS_Lab[i] <- Salario[i]*0.07
		Si nt<50 Entonces
			INNS_Patr[i] <- Salario[i]*0.22
		SiNo
			INNS_Patr[i] <- Salario[i]*0.225
		FinSi
		Si (Salario[i] * 12 > 100000) Y (Salario[i] * 12 <= 200000) Entonces
            IR[i] <- Salario[i] * 0.15
        SiNo
            Si (Salario[i] * 12 > 200000) Y (Salario[i] * 12 <= 350000) Entonces
                IR[i] <- Salario[i] * 0.2
            SiNo
                Si (Salario[i] * 12 > 350000) Y (Salario[i] * 12 <= 500000) Entonces
                    IR[i] <- Salario[i] * 0.25
                SiNo
                    Si (Salario[i] * 12 > 500000) Entonces
                        IR[i] <- Salario[i] * 0.3
                    SiNo
                        IR[i] <- 0
                    FinSi
                FinSi
            FinSi
        FinSi
	FinPara
FinFunción

// Función de capto de nóminas
Función nom
	Definir nt, edad, A_trabajados, Horas_mes, Horas_trabajadas, ANO_CONTRATACION, i Como Entero
	Definir N_trabajador, Apellido, opci, Identificacion Como Cadena
	Definir Salario, Sal_hora, Sal_hextra, Salmen Como Real
	Escribir 'Ingrese el número de trabajadores'
	Leer nt
	Definir cod1, cod2 Como Cadena
	Dimensionar N_trabajador(nt), Apellido(nt), edad(nt), A_trabajados(nt), Horas_mes(nt), Horas_trabajadas(nt), Identificacion(nt), ANO_CONTRATACION(nt)
	Dimensionar Sal_hora(nt), Sal_hextra(nt), Salario(nt), Salmen(nt), cod1(nt), cod2(nt)
	Para i<-1 Hasta nt Con Paso 1 Hacer
		Escribir 'ingrese el nombre del trabajador'
		Leer N_trabajador[i]
		Escribir 'Apellido del trabajador'
		Leer Apellido[i]
		Escribir 'Edad del trabajador'
		Leer edad[i]
		Escribir 'Año de contratación'
		Leer ANO_CONTRATACION(i)
		cod1[i] <- ConvertirATexto(ANO_CONTRATACION(i))
		cod2[i] <- ConvertirATexto(edad[i])
		Identificacion[i] <- cod1[i]+Apellido[i]+N_trabajador[i]+cod2[i]
		Escribir '¿Presenta salario fijo?'
		Leer opci
		Si opci=='Si' O opci=='si' O opci=='SI' Entonces
			Escribir 'Ingrese salario mensual'
			Leer Salario[i]
		SiNo
			Escribir 'Ingrese horas mensuales establecidas'
			Leer Horas_mes[i]
			Escribir 'Ingrese salario por hora'
			Leer Sal_hora[i]
			Escribir 'Ingrese valor de hora extra'
			Leer Sal_hextra[i]
			Escribir 'Ingrese horas trabajadas en el mes'
			Leer Horas_trabajadas[i]
			Salmen[i] <- (Horas_mes[i]*Sal_hora[i])+((Horas_trabajadas[i]-Horas_mes[i])*Sal_hextra[i])
			Salario[i] <- (Horas_mes[i]*Sal_hora[i])
		FinSi
	FinPara
	impuesto(nt,Salario)
FinFunción

// Funcion para calcular balance
Función balance (act,pas)
	Definir ele, tip_capital Como Cadena
	Definir val_cap, cap Como Real
	Definir nc, i Como Entero
	Escribir '¿Ya has realizado el balance general?'
	Escribir 'Escriba si o no'
	Leer ele
	Si ele=='Si' O ele=='si' O ele=='SI' Entonces
		Escribir 'Ingrese el número de tipos de capital'
		Leer nc
		Dimensionar tip_capital(nc), val_cap(nc)
		cap <- 0
		Para i<-1 Hasta nc Con Paso 1 Hacer
			Escribir 'Ingrese tipo de capital'
			Leer tip_capital[i]
			Escribir 'Ingrese valor del capital'
			Leer val_cap[i]
			cap <- cap+val_cap[i]
		FinPara
		Si (cap+pas)==act Entonces
			Escribir 'Balance general realizado correctamente'
		SiNo
			Escribir 'Revise valores, balance no correcto'
		FinSi
	SiNo
		Escribir 'El valor del capital total es el siguiente: '
		cap <- act-pas
		Escribir cap
	FinSi
FinFunción

// funcion para recolectar datos de balance
Función act_pas
	Definir na, np, i Como Entero
	Definir tip_activo Como Cadena
	Definir val_activo Como Real
	Definir tip_pasivo Como Cadena
	Definir val_pasivo Como Real
	Definir act Como Real
	Definir pas Como Real
	Escribir 'Ingrese número de activos'
	Leer na
	Dimensionar tip_activo(na), val_activo(na)
	act <- 0
	Para i<-1 Hasta na Con Paso 1 Hacer
		Escribir 'Ingrese el tipo de activo ', i
		Leer tip_activo[i]
		Escribir 'Ingrese valor del activo'
		Leer val_activo[i]
		act <- act+val_activo[i]
	FinPara
	Escribir 'Ingrese cantidad de pasivos'
	Leer np
	Dimensionar tip_pasivo(np), val_pasivo(np)
	pas <- 0
	Para i<-1 Hasta np Con Paso 1 Hacer
		Escribir 'Ingrese el tipo de pasivo ', i
		Leer tip_pasivo[i]
		Escribir 'Ingrese valor del pasivo'
		Leer val_pasivo[i]
		pas <- pas+val_pasivo[i]
	FinPara
	balance(act,pas)
FinFunción

// Función principal
Algoritmo programas
	Definir gerente Como Cadena
	Definir nombre_emp Como Cadena
	Definir Ser_pro Como Cadena
	Definir op Como Entero
	Escribir 'Ingrese el nombre de la empresa'
	Leer nombre_emp
	Escribir 'Ingrese nombre del gerente'
	Leer gerente
	Escribir 'Ingrese el producto o servicio que ofrece'
	Leer Ser_pro
	Repetir
		Escribir 'Menú de opciones'
		Escribir '1.	Balance general'
		Escribir '2.	Nóminas de trabajador'
		Escribir '3.	Salir'
		Leer op
	Hasta Que op==1 O op==2 O op==3
	Si op==1 Entonces
		act_pas()
	SiNo
		Si op==2 Entonces
			nom()
		FinSi
	FinSi
FinAlgoritmo
