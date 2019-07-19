--Exemplo de Trigger e Cursor para múltiplas deleções simultâneas
CREATE TRIGGER DelecaoMultipla
    ON Aluno
    FOR DELETE
    AS
    BEGIN

    DECLARE @CPF VARCHAR(11)
    DECLARE Lista CURSOR
            FOR SELECT CPF
    FROM DELETED

    OPEN Lista

    FETCH NEXT FROM Lista INTO @CPF

    WHILE @@FETCH_STATUS = 0
        BEGIN

        DELETE FROM Cadastro WHERE CPF = @CPF
        FETCH NEXT FROM Lista INTO @CPF

    END

    CLOSE Lista
    DEALLOCATE Lista
END