-- Exemplo de Trigger e Cursor para múltiplas deleções
-- incluindo as entradas em outras tabelas
CREATE TRIGGER DeletarDependenciasPlus
    ON Funcionario
    INSTEAD OF DELETE
    AS
    BEGIN

    DECLARE @ID INT
    DECLARE Lista CURSOR
            FOR SELECT ID
    FROM DELETED

    OPEN Lista

    FETCH NEXT FROM Lista INTO @ID

    WHILE @@FETCH_STATUS = 0
        BEGIN

        DELETE FROM Dependentes WHERE IDFunc = @ID
        DELETE FROM Cadastro WHERE IDFunc = @ID
        DELETE FROM Funcionario WHERE ID = @ID

        FETCH NEXT FROM Lista INTO @ID

    END

    CLOSE Lista
    DEALLOCATE Lista
END