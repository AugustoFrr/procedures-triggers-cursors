--Exemplo de Procedure para deleção incluindo as entradas em outras tabelas
CREATE PROCEDURE DeletarDependencias
    @CPF VARCHAR(11)
AS
BEGIN

    DECLARE @ID INT
    SET @ID = (SELECT ID
    FROM Funcionario
    WHERE CPF = @CPF)

    DELETE FROM Dependentes WHERE IDFunc = @ID
    DELETE FROM Cadastro WHERE IDFunc = @ID
    DELETE FROM Funcionario WHERE ID = @ID

END