--Exemplo de Trigger para inserção em uma tabela de Log
CREATE TRIGGER InserirLog 
    ON Aluno
    FOR INSERT
    AS
    BEGIN

    DECLARE @Nome VARCHAR(50)
    DECLARE @CPF VARCHAR(11)

    SET @Nome = (SELECT Nome
    FROM INSERTED)
    SET @CPF = (SELECT CPF
    FROM INSERTED)

    INSERT INTO TabelaLog
        (Nome, CPF)
    VALUES
        (@Nome, @CPF)

END