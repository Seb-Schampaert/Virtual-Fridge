CREATE PROCEDURE DBA."ajouterProduit"(@produit VARCHAR(30),@unite VARCHAR(30))
--Delannoit Grégoire
BEGIN
    call sa_set_http_header('Access-Control-Allow-Origin', '*');
    INSERT INTO tbProduits values
    (DEFAULT, @produit, @unite);
END

CREATE SERVICE "ajouterProduit"
    TYPE 'RAW'
    AUTHORIZATION OFF 
    USER "DBA"
    URL ON
    METHODS 'GET'
AS call DBA.ajouterProduit(:produit,:unite)
