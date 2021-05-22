CREATE DEFINER=`root`@`localhost` FUNCTION `fcn_validacpf`(cpf VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
  DECLARE CPF_NUMEROS varchar(14);
  DECLARE N1 INTEGER;
  DECLARE N2 INTEGER;
  DECLARE N3 INTEGER;
  DECLARE N4 INTEGER;
  DECLARE N5 INTEGER;
  DECLARE N6 INTEGER;
  DECLARE N7 INTEGER;
  DECLARE N8 INTEGER;
  DECLARE N9 INTEGER;
  DECLARE N10 INTEGER;
  DECLARE N11 INTEGER;
  DECLARE NUM1 INTEGER;
  DECLARE NUM2 INTEGER;
  SET CPF_NUMEROS = fcn_sonumero(cpf);
  
   if (length(CPF_NUMEROS)<>11) THEN
    RETURN 'QTD DE CARACTERES Diferente de 11';    
   END IF;
  
  if (CPF_NUMEROS = '11111111111') THEN
    RETURN 'Não pode repetir números no CPF';
  END IF;
	
	SET N1 = cast(substring(CPF_NUMEROS, 1, 1) as UNSIGNED);
	SET N2 = cast(substring(CPF_NUMEROS, 2, 1) as UNSIGNED);
	SET N3 = cast(substring(CPF_NUMEROS, 3, 1) as UNSIGNED);
	SET N4 = cast(substring(CPF_NUMEROS, 4, 1) as UNSIGNED);
	SET N5 = cast(substring(CPF_NUMEROS, 5, 1) as UNSIGNED);
	SET N6 = cast(substring(CPF_NUMEROS, 6, 1) as UNSIGNED);
	SET N7 = cast(substring(CPF_NUMEROS, 7, 1) as UNSIGNED);
	SET N8 = cast(substring(CPF_NUMEROS, 8, 1) as UNSIGNED);
	SET N9 = cast(substring(CPF_NUMEROS, 9, 1) as UNSIGNED);
	SET N10 = cast(substring(CPF_NUMEROS, 10, 1) as UNSIGNED);
	SET N11 = cast(substring(CPF_NUMEROS, 11, 1) as UNSIGNED);
  
	SET NUM1 = ((N1 * 10 + N2 * 9 + N3 * 8 + N4 * 7 + N5 * 6 + N6 * 5 + N7 * 4 + N8 * 3 + N9 * 2)*10)%11;  

	
	IF(NUM1 = 10) THEN
		SET NUM1 = 0;
	END IF;

	
	IF(NUM1 <> N10) THEN
		RETURN "DIGITO VERIFICADOR 1 ESTÁ INVÁLIDO";
	END IF;

	SET NUM2 = ((N1 * 11 + N2 * 10 + N3 * 9 + N4 * 8 + N5 * 7 + N6 * 6 + N7 * 5 + N8 * 4 + N9 * 3 + N10 * 2)*10)%11;
	IF(NUM2 <> N11) THEN
		RETURN "DIGITO VERIFICADOR 2 ESTÁ INVÁLIDO";
	END IF;
	RETURN "CPF VÁLIDO";
	
END