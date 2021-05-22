CREATE DEFINER=`root`@`localhost` FUNCTION `fcn_validacnpj`(cnpj VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
  DECLARE CNPJ_NUMEROS varchar(14);
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
  DECLARE N12 INTEGER;
  DECLARE N13 INTEGER;
  DECLARE N14 INTEGER;
  DECLARE NUM1 INTEGER;
  DECLARE NUM2 INTEGER;
  
  SET CNPJ_NUMEROS = fcn_sonumero(cnpj);
  
   if (length(CNPJ_NUMEROS)<>14) THEN
    RETURN 'QTD DE CARACTERES Diferente de 11';    
   END IF;
  
  if (CNPJ_NUMEROS = '11111111111') THEN
    RETURN 'Não pode repetir números no CPF';
  END IF;
	
	SET N1 = cast(substring(CNPJ_NUMEROS, 1, 1) as UNSIGNED);
	SET N2 = cast(substring(CNPJ_NUMEROS, 2, 1) as UNSIGNED);
	SET N3 = cast(substring(CNPJ_NUMEROS, 3, 1) as UNSIGNED);
	SET N4 = cast(substring(CNPJ_NUMEROS, 4, 1) as UNSIGNED);
	SET N5 = cast(substring(CNPJ_NUMEROS, 5, 1) as UNSIGNED);
	SET N6 = cast(substring(CNPJ_NUMEROS, 6, 1) as UNSIGNED);
	SET N7 = cast(substring(CNPJ_NUMEROS, 7, 1) as UNSIGNED);
	SET N8 = cast(substring(CNPJ_NUMEROS, 8, 1) as UNSIGNED);
	SET N9 = cast(substring(CNPJ_NUMEROS, 9, 1) as UNSIGNED);
	SET N10 = cast(substring(CNPJ_NUMEROS, 10, 1) as UNSIGNED);
	SET N11 = cast(substring(CNPJ_NUMEROS, 11, 1) as UNSIGNED);
    SET N12 = cast(substring(CNPJ_NUMEROS, 12, 1) as UNSIGNED);
    SET N13 = cast(substring(CNPJ_NUMEROS, 13, 1) as UNSIGNED);
    SET N14 = cast(substring(CNPJ_NUMEROS, 14, 1) as UNSIGNED);
  
	SET NUM1 = (N1 * 5 + N2 * 4 + N3 * 3 + N4 * 2 + N5 * 9 + N6 * 8 + N7 * 7 + N8 * 6 + N9 * 5 + N10 * 4 + N11 * 3 + N12 * 2)%11;  

	
	IF(NUM1 < 2) THEN
		SET NUM1 = 0;
	END IF;
    
    IF(!NUM1 < 2) THEN
		SET NUM1 = (11 - NUM1);
	END IF;

	
	IF(NUM1 <> N13) THEN
		RETURN "DIGITO VERIFICADOR 1 ESTÁ INVÁLIDO";
	END IF;

	SET NUM2 = (N1 * 6 + N2 * 5 + N3 * 4 + N4 * 3 + N5 * 2 + N6 * 9 + N7 * 8 + N8 * 7 + N9 * 6 + N10 * 5 + N11 * 4 + N12 * 3 + N13 * 2)%11;
	
    IF(NUM2 < 2) THEN
		SET NUM1 = 0;
	END IF;
    
    IF(!NUM2 < 2) THEN
		SET NUM2 = (11 - NUM2);
	END IF;
    
    IF(NUM2 <> N14) THEN
		RETURN "DIGITO VERIFICADOR 2 ESTÁ INVÁLIDO";
	END IF;
    
	RETURN "CNPJ VÁLIDO";
    
END