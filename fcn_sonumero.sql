CREATE DEFINER=`root`@`localhost` FUNCTION `fcn_sonumero`(string VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
    DECLARE ls INTEGER;
    DECLARE i INTEGER;
    DECLARE str varchar(100);
    
    SET ls = (SELECT length(string));
    SET i = 1;
    SET str = '';
    WHILE i <= ls DO
      IF (substring(string, i, 1) REGEXP '[0-9]' <> 0) THEN
          SET str = CONCAT(str, convert(substring(string, i, 1) USING UTF8 ));
      END IF;
     SET i = i + 1;
    END WHILE;
          
  RETURN str;
END