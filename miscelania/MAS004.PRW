#INCLUDE "PROTHEUS.CH"
#include "fileio.ch"
#include "totvs.ch"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWLIBVERSION.CH"

#INCLUDE	"DIRECTRY.CH"
#INCLUDE	"AUTODEF.CH"
#INCLUDE	"STBFISCALMENU.CH"
#INCLUDE	"TOTVS.CH"
#INCLUDE	"XMLXFUN.CH"
#Include 'Tbiconn.ch'
#Include 'Tbicode.ch'
#Include 'TOTVS.CH'

User Function MAS004()

//    Local cURL := "https://trust-sandbox.api.santander.com.br/auth/oauth/v2/token"
    Local cURL := "https://trust-sandbox.api.santander.com.br/auth/oauth/v2/token"
    Local nTimeOut := 120
    Local aHeadStr := {}
    Local cPostRet := ""
    //Local cCertPath := "\system\cert\certif_ca.pem" 
    Local cCertPath := "\system\cert\certifcert.pem" 
    Local cCertKEY  := "\system\cert\certifkey.pem" 
    Local cClientSecret := "5Pto3Rq1nKhR4QrB"
    Local cClientId := "yTogoe1bO2K0s6u40f80MHOMRyIN6Efm"
    Local cCertPassword := "26595181000130" // Senha do certificado
    Local cHeaderRet := ""
    Local cPOSTParms := ""

  IF TYPE("CEMPANT")=="U"
		PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01'
	ENDIF

    // Cabe alhos HTTP
    AAdd(aHeadStr, 'Content-Type: application/x-www-form-urlencoded')
    //AAdd(aHeadStr, 'Cookie: _abck=217057DB16811D48F457F47834C1BFD2~-1~YAAQR/vSF1/vkOGRAQAAQ9RBBQyW9E6LHOGgILgvGJa0kZUxdh+NMuYI1KhKUtP/0UQup7biUbpkxIo9A4Ty4lmv9+Lw0bBzK5ZJ/DCERqgRtfaQ8/5LQIblXmrrERC3ROLLQw9PzLzRrIroAHQhj68m5Gh7dBGSDEyaHyrU3OhSE4duiAMXLKM4o6JlCj/+/6/jbwy1XzgHe8/GqukXCmsEp/DPbydnjvfE7nSfjiPQvErjf/piKC946pQ9KAZ9/vCN7Vk18DaFiPyvIym5UaIl+UUQiHJVEjk4CmDcjLaG5r2j8rit4Nc3G3X0lK4qhJS21ZgQL3H3/FnJrBNvkDGqcB1LQvao+/GpEkTEvCTW5aW2vqykI7KTYVrzKE7cef8PizoqqzqJ8kiV4xn3ddNRFEcviby3mz8Y0S6Pe6g9HxLPPkxk0C8qaJSsBQ==~-1~-1~-1; bm_sz=9FC8A775EAEE224A27100F3FAE98621D~YAAQR/vSF2DvkOGRAQAAQ9RBBRlqG0ZuBE9KujJTUcgLF0+PNGxXp15kKuqWA7x8aSjO2VmYAQGE0C6xqjC88EweMURKEb7TwfeJllOEJTte6MkJqx7SRKLIeCRBfGuax2VSN/dHIMv25TIZfpARusmsM4ZKvoVObGnRGRFlbXOgSLoCpF8OLk1JAn2H6ORoaG4E6l0abWxtiKy6Ypd6DSZU6gbAepWgrOGyDN9KUVW81moPxaMTY1rqsLiW2Ijvp9qOR7qY+A63Zpb7KrAKP1WfAPHMIL4z2VzUVlkMZwUXnFvjPVTrCA+iaVMp2T7DXd+nSdKWeYrccn4552lwL80/TRmmiQ7e6vDZgVOJOuvnzcAbAA==~4469043~4474168')

    // Par metros de POST
    cPOSTParms := "grant_type=client_credentials&client_id=" + cClientId + "&client_secret=" + cClientSecret 
    //cPOSTParms := 'grant_type=client_credentials&client_id=yTogoe1bO2K0s6u40f80MHOMRyIN6Efm&client_secret=5Pto3Rq1nKhR4QrB'

    // Realiza a requisi  o HTTPS POST com o certificado
    cPostRet := HTTPSPost(cURL, cCertPath, cCertKEY , cCertPassword  , "", cPOSTParms, nTimeOut, aHeadStr, cHeaderRet)

    // Verifica o retorno
    If Empty(cPostRet)
        Conout("Falha ao realizar HTTPSPost")
    Else
        oParser := Nil // private
        FwJsonDeserialize(cPostRet,@oParser)    
        u_MAS004A(Alltrim(oParser:access_token))
    EndIf

Return

User Function MAS004A(cToken)

    Local cUrl   := "https://trust-sandbox.api.santander.com.br/bank_account_information/v1/banks/39496739000160/statements/4257.000000002696"
    Local cParam := "initialDate=2024-01-01&finalDate=2024-09-18&limit=3&offset=1"

    Local aHeadStr := {}

    Local cCertPath := "\system\cert\certifcert.pem" 
    Local cCertKEY  := "\system\cert\certifkey.pem" 
    Local cCertPassword := "26595181000130" // Senha do certificado

    nTimeOut 	:= 300
    cHeaderGet 	:= ""

    aHeadStr:= {}

    AAdd( aHeadStr, "Authorization: Bearer " + cToken)
	aadd( aHeadStr, "Content-Type: application/json")
	aadd( aHeadStr, "X-application-Key: yTogoe1bO2K0s6u40f80MHOMRyIN6Efm")

    cUrl   := "https://trust-sandbox.api.santander.com.br/bank_account_information/v1/banks/39496739000160/statements/4257.000000002696?initialDate=2024-01-01&finalDate=2024-09-18&limit=3&offset=1"

   	cRetorno := HTTPSGet( cUrl, cCertPath, cCertKEY , cCertPassword, cParam, nTimeOut, aHeadStr,@cHeaderGet)
Return
