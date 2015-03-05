Private Sub Class_Initialize()

    pLastExecutionStatus = True
    pLastErrorMessage = "Ok"
    pName = "DelegadoCalculador"
    
    On Error GoTo errorHandler
    
    If useADO Then
        Set pDb = New ADODB.Connection
        pDb.Open conn
    End If
    
errorHandler:
    pLastExecutionStatus = False
    pLastErrorMessage = pName + ": no se pudo establecer conexión con la base de datos."

End Sub