
#INCLUDE "PROTHEUS.CH"
#include "fileio.ch"
#include "totvs.ch"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWLIBVERSION.CH"

User Function MAS004()

    Local cURL := "https://trust-sandbox.api.santander.com.br/auth/oauth/v2/token"
    Local nTimeOut := 120
    Local aHeadStr := {}
    Local cPostRet := ""
    Local cCertPath := "C:\Cert\Cert.pfx" // Caminho do certificado PFX
    Local cClientId := "yTogoe1bO2K0s6u40f80MHOMRyIN6Efm"
    Local cClientSecret := "5Pto3Rq1nKhR4QrB"
    Local cCertPassword := "26595181000130" // Senha do certificado
	Local cHeaderRet := ""
	Local cPOSTParms := ""
	Local cKey   := ""

    // Cabeçalhos HTTP
    AAdd(aHeadStr, "Content-Type: application/x-www-form-urlencoded")


    // Corpo da requisição (formato x-www-form-urlencoded)
   // cPOSTParms := "client_id=" + cClientId + "& client_secret=" + cClientSecret+"& grant_type=client_credentials"
 cPOSTParms := "client_id=yTogoe1bO2K0s6u40f80MHOMRyIN6Efm&client_secret=5Pto3Rq1nKhR4QrB&grant_type=client_credentials"

    // Realizando o POST com HTTPS
   // cPostRet := HTTPSPost(cURL, cBody, cCertPath, cCertPath, cCertPassword, nTimeOut, aHeadOut, @cHeadRet)

//    cPostRet := HTTPSPost(cURL, cCertPath, cKey, cCertPassword, cGETParms, cPOSTParms, nTimeOut, aHeadStr, cHeaderRet, .T.)	


    // Corpo da requisição (formato x-www-form-urlencoded)
  //  cPOSTParms := "client_id=" + cClientId + "&client_secret=" + cClientSecret+"&grant_type=client_credentials"

    // Realizando o POST com HTTPS
    cPostRet := HTTPSPost(cURL, cCertPath, "", cCertPassword, "", cPOSTParms, nTimeOut, aHeadStr, cHeaderRet, .F.)


	//cPostRet := HTTPSPost(cURL, cCert,      cKey, cPassPhrase ,          , cXml      ,120      , aHeadOut, @cHeadRet, .T. )	
	
    If Empty(cPostRet)
        Conout("Falha ao realizar HTTPSPost")
    Else
        Conout("Sucesso ao realizar HTTPSPost")
      //  VarInfo("Resposta", cPostRet) // Mostra a resposta com o token
    EndIf

    //VarInfo("Header", cHeadRet) // Mostra os cabeçalhos retornados

Return


/*
    Local cUrlToken := "https://trust-sandbox.api.santander.com.br/auth/oauth/v2/token" // URL do Santander para Sandbox
    Local cClientId := "yTogoe1bO2K0s6u40f80MHOMRyIN6Efm"
    Local cClientSecret := "secret 5Pto3Rq1nKhR4QrB"
    Local cCertPath := "C:\Certificado\Certificiado.pfx" // Caminho do seu certificado
    Local cCertPassword := "26595181000130" // Senha do certificado
    Local oHttpClient := nil
    Local cResponse := ""
    Local cPostData := ""
    Local oCert := nil

    cPostData := "grant_type=client_credentials&client_id=" + cClientId + "&client_secret=" + cClientSecret

    // Criação do objeto HTTP
    oHttpClient := HttpClient():New(cUrlToken)

    // Configuração do certificado
    oCert := TLSClientCertificate():New(cCertPath, cCertPassword)

    // Configura o certificado para a requisição
    oHttpClient:SetTLSCertificate(oCert)

    // Envia a requisição POST com os parâmetros
    oHttpClient:Post(cPostData, "application/x-www-form-urlencoded")

    // Verifica se houve sucesso na requisição
    If oHttpClient:nStatusCode == 200
        cResponse := oHttpClient:cBody
        Conout("Token gerado com sucesso: " + cResponse)
    Else
        Conout("Erro ao gerar token. Status: " + Str(oHttpClient:nStatusCode))
        Conout("Resposta: " + oHttpClient:cBody)
    EndIf
a:= 1



	Local sCgc      := "39496739000160"
	Local sAgencia  := "4257"
	Local sConta    := "000000002696"
	Local cURI      := ""
	Local sParam    := ""
	Local dData     := Date()-1
	Local cResource := ""
	Local aHeader   := {}


	cURI      := "https://trust-sandbox.api.santander.com.br"

	cResource := "/auth/oauth/v2/token"

	oRest := FwRest():New(cURI)

	oRest:SetPath(cResource)

	aAdd(aHeader, 'Content-Type: application/x-www-form-urlencode')

	cSend := 'grant_type=client_credentials&scope=cobrancas.boletos-requisicao cobrancas.boletos-info'

oRest:SetPostParams(cSend)
oRest:Post(aHeader)


	sErro  := u_AGRMIS18(cURI,"POST","") 

	cURI      := "https://trust-sandbox.api.santander.com.br/bank_account_information/v1/banks/"+sCgc+"/statements/"+sAgencia+"."+sConta+"?"

	While Empty(sParam) 
		If DataValida(dData) == dData
			sParam    := "initialDate="+FWTimeStamp(3, dData, "")+"&finalDate ="+FWTimeStamp(3, dData, "")+"&_limit=49&_offset =1"
		Else 
			dData := dData - 1
		EndIf 
	EndDo
	sErro  := u_AGRMIS18("Z12",'POST',"/api/AlvoBiologico",sBody_API)  // Rotina API para OPENK - Sistema Portal CLientes / Representantes


  
***********************************************************
User Function AGRMIS18(cURI,sMetodo)  // Rotina para fazer a transmferencia de dados via API
*************
Local sErro     := ""
Local aCabHea   := {}

    AAdd(aCabHea, "Content-Type: application/json; charset=UTF-8")
    aadd(aCabHea, "Authorization: Bearer")
    aadd(aCabHea, "access-token:"  + sTokOpenK)
    oRest := FwRest():New(cURI)  
    jJson := JsonObject():new()
    oRest:SetPath(cResource)
    If sMetodo == 'POST'
        oRest:SetPostParams(fAGRMS19(sBody))
        If !(oRest:Post(aCabHea))
            sErro := cResource + ' - ' + Alltrim(oRest:getResult())
        EndIf
    ElseIf sMetodo == 'PUT'    
        If !(oRest:put(aCabHea,fAGRMS19(sBody))) // quando retorno .t. pq o produto nao esta liberado
            sErro := cResource + ' - ' + Alltrim(oRest:getResult())
        EndIf     
    EndIf  
    If !Empty(sErro)   
        u_AGRMIS45(sBody, cURI, cResource, sErro)
    EndIf 
Return(sErro)

*/

Return()
