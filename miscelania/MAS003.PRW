#INCLUDE "PROTHEUS.CH"
#include "fileio.ch"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWLIBVERSION.CH"

STATIC __cProcPrinc := "FINA474"
STATIC __oQry474    := NIL
STATIC __lUpdated	:= NIL
STATIC __nTamHora 	:= NIL
STATIC __lIsBlind	:= .F.
STATIC __lF474EFT	:= NIL
STATIC __lF474CTA 	:= NIL
STATIC __lEfetTrf	:= NIL


//-------------------------------------------------------------------
/*/{Protheus.doc} MAS003
Rotina de Importacao  dos dados da conciliacao Bancária Automática 

Rotina de Conciliação Bancária atualizada, utilizando tabela para gravação da conciliação.

Essa rotina permite realizar importar o extrato bancário e conciliar num momento posterior.

@author	Alvaro MARCIO SILVA
@since		05/09/2024
@version	MP11.90

/*/
//-------------------------------------------------------------------
User Function MAS003()
	Local aConfig1 := {}
	Local aConfig2 := {}
	Local aLog     := {}
	Local aLogLanc := {}
	Local nOpc     := 3
	local sErro    := ''
	RpcSetEnv('01', '060101', Nil, Nil, Nil, "FIN")

	dbSelectArea("SA6")
	SA6->(DbSetOrder(1))
	If SA6->(dbSeek(xFilial("SA6")+'033'+'4168 '+'13026474'))
		dbSelectArea("SEE")
		SEE->(DbSetOrder(1))
		iF !dbSeek(xFilial("SEE")+SA6->A6_COD+SA6->A6_AGENCIA+SA6->A6_NUMCON+'001')
			sErro := 'Parametro Bancario Nao Encontrado!'	
		EndIf
	Else 
		sErro := 'Banco Nao Encontrado!'	
	EndIf
	If Empty(sErro)
		aConfig1 := {'c00001',SEE->EE_CODIGO,SEE->EE_AGENCIA,SEE->EE_CONTA,SEE->EE_SUBCTA, 'CONCILIACAO AUTOMATICA SANTANDER'}

		aConfig2 := {Alltrim(SEE->EE_EXTDIRC)+Alltrim(SEE->EE_EXTARQC), Alltrim(SEE->EE_EXTDIRA)+'001RET.RET'}
		//Abre arquivo de configuracao
		//cArqConf:=aConfig2[1]
		//Abre arquivo enviado pelo banco
		//cArqEnt:= aConfig2[2]
	EndIf

	u_MAS003A(aConfig1, aConfig2, nOpc, aLog, aLogLanc)


	RpcClearEnv()
//Next nEmpresa
Return




//-------------------------------------------------------------------
/*/{Protheus.doc} MAS003A
Rotina de Importacao  dos dados da conciliacao Bancária Automática 

Rotina de Conciliação Bancária atualizada, utilizando tabela para gravação da conciliação.

Essa rotina permite realizar importar o extrato bancário e conciliar num momento posterior.

@author	Alvaro Camillo Neto
@since		30/09/2013
@version	MP11.90
/*/
//-------------------------------------------------------------------

User Function MAS003A(aConfig1 As Array, aConfig2 As Array, nOpc As Numeric, aLog As Array,aLogLanc As Array)

	Local cPosAge   as Character
	Local cPosBco   as Character
	Local cPosCta   as Character
	Local cPosData  as Character
	Local cPosDescr as Character
	Local cPosDif   as Character
	Local cPosNum   as Character
	Local cPosOcor  as Character
	Local cPosValor as Character
	Local lFebraban as Logical
	Local lRet      as Logical
	Local nLenAge   as Numeric
	Local nLenBco   as Numeric
	Local nLenCta   as Numeric
	Local nLenData  as Numeric
	Local nLenDescr as Numeric
	Local nLenDif   as Numeric
	Local nLenNum   as Numeric
	Local nLenOcor  as Numeric
	Local nLenValor as Numeric
	Local nTamDet   as Numeric
	Local lF474Auto  := .T.
	Default aConfig1 := {}
	Default aConfig2 := {}
	Default nOpc     := 0
	Default aLog     := {}
	Default aLogLanc := {}
	Default aLog     := {}


	cPosAge   := ""
	cPosBco   := ""
	cPosCta   := ""
	cPosData  := ""
	cPosDescr := ""
	cPosDif   := ""
	cPosNum   := ""
	cPosOcor  := ""
	cPosValor := ""
	lFebraban := .F.
	lRet      := .T.
	nLenAge   := 0
	nLenBco   := 0
	nLenCta   := 0
	nLenData  := 0
	nLenDescr := 0
	nLenDif   := 0
	nLenNum   := 0
	nLenOcor  := 0
	nLenValor := 0
	nTamDet   := 0

	dbSelectArea("SA6")
	SA6->(DBSetOrder(1))

	dbSelectArea("SIG")
	SIG->(DBSetOrder(1))

	dbSelectArea("SIF")
	SIF->(DBSetOrder(1))

	//Posiciona no Banco indicado 
	dbSelectArea("SEE")
	dbSetOrder(1)	//"EE_FILIAL+EE_CODIGO+EE_AGENCIA+EE_CONTA+EE_SUBCTA"
	If lF474Auto .or. MsSeek(xFilial("SEE") + aConfig1[2] + aConfig1[3] + aConfig1[4] + aConfig1[5])
		lFebraban := IF(SEE->EE_BYTESXT > 200 , .T., .f.)
		nTamDet	  := IF(SEE->EE_BYTESXT > 0, SEE->EE_BYTESXT + 2, 202 )
		nTipoDat  := SEE->EE_TIPODAT
	Else
		aAdd(aLog,{0,"Verifique os parametros digitados, pois não foi possível, localizar o registro das parametrizaçães de transmissão(SEE)."})	//"Verifique os parametros digitados, pois não foi possível, localizar o registro das parametrizaçães de transmissão(SEE)."
		lRet := .F.
	Endif

	If lRet
		//Leitura do arquivo de configuracao
		lRet := u_xF474LeCfg(aConfig2[1] , aLog ,@cPosNum ,@cPosData ,@cPosValor ,@cPosOcor ,@cPosDescr ,@cPosDif ,@cPosBco ,@cPosAge ,@cPosCta , ;
					 @nLenNum ,@nLenData ,@nLenValor ,@nLenOcor ,@nLenDescr ,@nLenDif ,@nLenBco ,@nLenAge ,@nLenCta )

		If lRet
			//Leitura do arquivo de extrato
			lRet := u_xF474LeExt( aConfig1 ,aConfig2 , aLog, aLogLanc, cPosNum ,cPosData ,cPosValor ,cPosOcor ,cPosDescr ,cPosDif ,cPosBco ,cPosAge ,cPosCta , ;
								nLenNum ,nLenData ,nLenValor ,nLenOcor ,nLenDescr ,nLenDif ,nLenBco ,nLenAge ,nLenCta , nTipoDat, nTamDet, lFebraban )
			
		Endif
	Endif

Return lRet


//-------------------------------------------------------------------
/*/{Protheus.doc} F474LeCfg
	Realiza a Leitura do arquivo de configuração do extrato

	@type  Function
	@author pequim
	@since 21/07/2022
	@version 12.1.2310
	@param aConfig2, Array, Dados do arquivo de configuração
	@return lRetr, Logical, Informa se foi possivel realizar a leitura do arquigo de configuração do extrato
	@example
	(examples)
	@see (links_or_references)
/*/
//-------------------------------------------------------------------
User Function xF474LeCfg(cArqConf As Character,aLog As Array , ;
					cPosNum As Character,cPosData As Character,cPosValor As Character,cPosOcor As Character,cPosDescr As Character,cPosDif As Character,cPosBco As Character,cPosAge As Character,cPosCta As Character, ;
					nLenNum As Numeric  ,nLenData As Numeric  ,nLenValor As Numeric  ,nLenOcor As Numeric  ,nLenDescr As Numeric  ,nLenDif As Numeric  ,nLenBco As Numeric  ,nLenAge As Numeric  ,nLenCta As Numeric )

	Local cBuffer   as Character
	Local cPosDCI   as Character
	Local cPosDSI   as Character
	Local cPosVSI   as Character
	Local lPosAge   as Logical
	Local lPosBco   as Logical
	Local lPosCta   as Logical
	Local lPosData  as Logical
	Local lPosDCI   as Logical
	Local lPosDescr as Logical
	Local lPosDif   as Logical
	Local lPosDSI   as Logical
	Local lPosNum   as Logical
	Local lPosOcor  as Logical
	Local lPosValor as Logical
	Local lPosVSI   as Logical
	Local lRet      as Logical
	Local nHdlConf  as Numeric
	Local nLenDCI   as Numeric
	Local nLenDSI   as Numeric
	Local nLenVSI   as Numeric
	Local nLidos    as Numeric
	Local nTamArq   as Numeric
	
	cBuffer   := ""
	cPosDCI   := ""
	cPosDSI   := ""
	cPosVSI   := ""
	lPosAge   := .F.
	lPosBco   := .F.
	lPosCta   := .f.
	lPosData  := .F.
	lPosDCI   := .F.
	lPosDescr := .F.
	lPosDif   := .F.
	lPosDSI   := .F.
	lPosNum   := .F.
	lPosOcor  := .F.
	lPosValor := .F.
	lPosVSI   := .F.
	lRet      := .T.
	nHdlConf  := 0
	nLenDCI   := 0
	nLenDSI   := 0
	nLenVSI   := 0
	nLidos    := 0
	nTamArq   := 0

	If !FILE(cArqConf)
		aAdd(aLog,{0,"Arquivo de Configuração não encontrado"}) // 
		lRet := .F.
	Else
		nHdlConf:=FOPEN(cArqConf,0+64)
	EndIf

	//Leitura do arquivo de configuracao
	If lRet
		nLidos := 0
		FSEEK(nHdlConf,0,0)
		nTamArq:=FSEEK(nHdlConf,0,2)
		FSEEK(nHdlConf,0,0)

		While nLidos <= nTamArq
			
			//Verifica o tipo de qual registro foi lido
			cBuffer := Space(85)
			FREAD(nHdlConf,@cBuffer,85)
			
			If SubStr(cBuffer,1,1) == CHR(1)  // Header
				nLidos+=85
				Loop
			EndIF
			
			If SubStr(cBuffer,1,1) == CHR(4) // Saldo Final
				nLidos+=85
				Loop
			EndIf
			
			//Dados do Saldo Inicial (Bco/Ag/Cta) 
			If !lPosBco  //Nro do Banco
				cPosBco := Substr(cBuffer,17,10)
				nLenBco := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosBco := .T.
				nLidos+=85
				Loop
			EndIf
			If !lPosAge  //Agencia
				cPosAge := Substr(cBuffer,17,10)
				nLenAge := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosAge := .T.
				nLidos+=85
				Loop
			EndIf
			If !lPosCta  //Nro Cta Corrente
				cPosCta := Substr(cBuffer,17,10)
				nLenCta := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosCta := .T.
				nLidos+=85
				Loop
			Endif
			If !lPosDif   // Diferencial de Lancamento
				cPosDif := Substr(cBuffer,17,10)
				nLenDif := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosDif := .T.
				nLidos+=85
				Loop
			EndIf

			//Os dados abaixo não são utilizados na reconciliacao.
			//Estao ai apenas p/leitura do arquivo de configuracao.
			If !lPosVSI   // Valor Saldo Inicial
				cPosVSI := Substr(cBuffer,17,10)
				nLenVSI := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosVSI := .T.
				nLidos+=85
				Loop
			EndIf
			If !lPosDSI   // Data Saldo Inicial
				cPosDSI :=Substr(cBuffer,17,10)
				nLenDSI :=1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosDSI :=.T.
				nLidos+=85
				Loop
			EndIf
			If !lPosDCI   // Identificador Deb/Cred do Saldo Inicial
				cPosDCI := Substr(cBuffer,17,10)
				nLenDCI := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosDCI := .T.
				nLidos+=85
				Loop
			EndIf
			
			//Dados dos Movimentos 
			If !lPosNum  // Nro do Lancamento no Extrato
				cPosNum := Substr(cBuffer,17,10)
				nLenNum := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosNum := .T.
				nLidos+=85
				Loop
			EndIf
			
			If !lPosData  // Data da Movimentacao
				cPosData := Substr(cBuffer,17,10)
				nLenData := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosData := .T.
				nLidos+=85
				Loop
			EndIf
			
			If !lPosValor  // Valor Movimentado
				cPosValor := Substr(cBuffer,17,10)
				nLenValor := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosValor = .T.
				nLidos+=85
				Loop
			EndIf
			
			If !lPosOcor // Ocorrencia do Banco
				cPosOcor := Substr(cBuffer,17,10)
				nLenOcor := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosOcor :=.T.
				nLidos+=85
				Loop
			EndIf
			
			If !lPosDescr  // Descricao do Lancamento
				cPosDescr := Substr(cBuffer,17,10)
				nLenDescr := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosDescr := .T.
				nLidos+=85
				Loop
			EndIf
			
			If !lPosDif   // Diferencial de Lancamento
				cPosDif  := Substr(cBuffer,17,10)
				nLenDif  := 1+Int(Val(Substr(cBuffer,20,3)))-Int(Val(Substr(cBuffer,17,3)))
				lPosDif  := .T.
				nLidos+=85
				Loop
			EndIf
			
			Exit
		Enddo

		//fecha arquivo de configuracao
		Fclose(nHdlConf)
	Endif

Return lRet



//---------------------------------------------------------------------------------
/*/{Protheus.doc} F474LeExt
	
	Leitura do arquivo de extrato bancário

	@type  Function
	@author pequim
	@since 21/07/2022
	@version 12.1.2310

	@param aConfig2[2], param_type, param_descr
	@return return_var, return_type, return_description

*/
//---------------------------------------------------------------------------------
User Function xF474LeExt(aConfig1 As Array,aConfig2 As Array, aLog As Array, aLogLanc As Array, ;
					cPosNum As Character,cPosData As Character,cPosValor As Character,cPosOcor As Character,cPosDescr As Character,cPosDif As Character,cPosBco As Character,cPosAge As Character,cPosCta As Character,;
					nLenNum As Numeric  ,nLenData As Numeric  ,nLenValor As Numeric  ,nLenOcor As Numeric  ,nLenDescr As Numeric  ,nLenDif As Numeric  ,nLenBco As Numeric  ,nLenAge As Numeric  ,nLenCta As Numeric  ,;
					nTipoDat As Numeric ,nTamDet As Numeric   ,lFebraban As Logical )

	Local aConta    As Array
	Local cAgencia  As Character
	Local cArqEnt   As Character
	Local cBanco    As Character
	Local cBuffer   As Character
	Local cChkSum   As Character
	Local cCodMov   As Character
	Local cConta    As Character
	Local cDataBco  As Character
	Local cDebCred  As Character
	Local cDescMov  As Character
	Local cDescrMov As Character
	Local cDifer    As Character
	Local cErro     As Character
	Local cItem     As Character
	Local cNumMov   As Character
	Local cTipoMov  As Character
	Local dDataMov  As Date
	Local lGravaSIF as Logical
	Local lRet      As Logical
	Local lTemLacto As Logical
	Local nContReg  As Numeric
	Local nHdlBco   As Numeric
	Local nLidos    As Numeric
	Local nLinha    As Numeric
	Local nPosAge   as Numeric
	Local nPosBco   as Numeric
	Local nPosCta   as Numeric
	Local nPosData  as Numeric
	Local nPosDescr as Numeric
	Local nPosDIf   as Numeric
	Local nPosNum   as Numeric
	Local nPosOcor  as Numeric
	Local nPosValor as Numeric
	Local nTamA6Agn As Numeric
	Local nTamA6Cod As Numeric
	Local nTamA6Num As Numeric
	Local nTamArq   As Numeric
	Local nValorMov As Numeric
	Local lFina475	:= FwIsInCallStack("FINA475") As Logical
	Local oData     := JsonObject():New() as Json

	aConta    := {}
	nContReg  := 0
	nHdlBco   := 0
	nLidos    := 0
	nLinha    := 0
	nTamArq   := 0
	nValorMov := 0
	nTamA6Agn := TamSX3( "A6_AGENCIA" )[1]
	nTamA6Cod := TamSX3( "A6_COD" )[1]
	nTamA6Num := TamSX3( "A6_NUMCON" )[1]
	cAgencia  := Space(nTamA6Agn)
	cBanco    := Space(nTamA6Cod)
	cConta    := Space(nTamA6Num)
	cArqEnt   := ""
	cBuffer   := ""
	cChkSum   := ""
	cCodMov   := ""
	cDataBco  := ""
	dDataMov  := CTOD("//")
	cDebCred  := ""
	cDescMov  := ""
	cDescrMov := ""
	cDifer    := ""
	cErro     := ""
	cItem     := Replicate("0",TamSx3("IG_ITEM")[1])
	cNumMov   := ""
	cTipoMov  := ""
	lRet      := .T.
	lTemLacto := .F.
	lGravaSIF := .T.

	If __lF474Cta == NIL
		__lF474Cta := ExistBlock("F474CTA")
	Endif	

	cArqEnt := aConfig2[2]

	If Empty(nTipoDat)
		nTipoDat := IF(nTamDet > 202, 4,1)		//1 = ddmmaa		4= ddmmaaaa
	EndIf

	//Abre arquivo enviado pelo banco
	IF !FILE(cArqEnt)
		aAdd(aLog,{0,"Arquivo do Banco não encontrado"}) //
		lRet := .F.
	Else
		nHdlBco:=FOPEN(cArqEnt,0+64)
	EndIF

	If lRet 
		// Ler arquivo enviado pelo banco
		nLidos:=0
		FSEEK(nHdlBco,0,0)
		nTamArq:=FSEEK(nHdlBco,0,2)
		FSEEK(nHdlBco,0,0)

		cChkSum := F474CHKSUM(nHdlBco)

		SIF->(dbSetOrder(3))//IF_FILIAL + IF_ARQSUM
		If SIF->(dbSeek(xFilial("SIF") + cChkSum ) )
			aAdd(aLog,{0,"Arquivo de Extrato já importado"}) //
			Fclose(nHdlBco)
			lRet := .F.
		EndIf

		If lRet
			// Desenha o cursor e o salva para poder movimenta-lo
			nLidos 	:= 0

			nPosDIf   := Int(Val(Substr(cPosDif, 1,3)))
			nPosBco   := Int(Val(Substr(cPosBco, 1,3)))
			nPosAge   := Int(Val(Substr(cPosAge, 1,3)))
			nPosCta   := Int(Val(Substr(cPosCta, 1,3)))
			nPosNum   := Int(Val(Substr(cPosNum ,1,3)))
			nPosData  := Int(Val(Substr(cPosData,1,3)))
			nPosValor := Int(Val(Substr(cPosValor,1,3)))
			nPosOcor  := Int(Val(Substr(cPosOcor,1,3)))
			nPosDescr := Int(Val(Substr(cPosDescr,1,3)))

			While nLidos <= nTamArq
				nLinha++
				
				// Tipo qual registro foi lido
				cBuffer := Space(nTamDet)
				FREAD(nHdlBco,@cBuffer,nTamDet)
				
				// Verifica o diferencial do registro de Lancamento
				If !lFebraban  // 200 posicoes
					cDifer :=Substr(cBuffer,nPosDIf ,nLenDif )
				Else
					cDifer := "xx"  // 240 posicoes
				Endif
				
				// Header do arquivo
				IF (SubStr(cBuffer,1,1) == "0" .and. !lFebraban).or. ;  // 200 posicoes
					(Substr(cBuffer,8,1) == "0" .and. lFebraban)		// 240 posicoes
					nLidos+=nTamDet
					Loop
				EndIF
				
				//Trailer do arquivo
				IF (SubStr(cBuffer,1,1) == "9" .and. !lFebraban) .or. ;  //200 posicoes
					(Substr(cBuffer,8,1) == "9" .and. lFebraban)		 //240 posicoes
					nLidos+=nTamDet
					Exit
				EndIF
				
				// Saldo Inicial
				IF (SubStr(cBuffer,1,1) == "1" .and. cDifer == "0" .and. !lFebraban) .Or. (SubStr(cBuffer,8,1) == "1" .and. lFebraban)

					cBanco   := Substr(cBuffer,nPosBco ,nLenBco )
					cAgencia := Substr(cBuffer,nPosAge ,nLenAge )
					cConta   := Substr(cBuffer,nPosCta ,nLenCta )
					If __lF474Cta
						aConta   := ExecBlock("F474CTA", .F., .F., {cBanco, cAgencia, cConta} )
						cBanco   := aConta[1]
						cAgencia := aConta[2]
						cConta   := aConta[3]
					EndIf

					If cBanco != AllTrim(aConfig1[2])
						aADD(aLog,{0 , "Arquivo de Extrato não pertence ao banco informado. Verifique arquivo de configuração e extrato."} )// 
						lTemLacto := .T.
						lRet := .F.
						Exit
					EndIf	
						
					cBanco 		:= PadR( cBanco   , nTamA6Cod )
					cAgencia 	:= PadR( cAgencia , nTamA6Agn )
					cConta 		:= PadR( cConta   , nTamA6Num )

					u_xA474VldBco(@cBanco , @cAgencia , @cConta, @nLinha, @aLog, @lRet)
							
					If !lRet
						aADD(aLog,{nLinha, "Banco não cadastrado" } ) //
						lRet := .F.
						Exit
					Endif

					nLidos+=nTamDet
					Loop
				EndIF

				If lRet
					// Saldo Final
					IF (SubStr(cBuffer,1,1) == "1" .and. cDifer == "2" .and. !lFebraban) .or. ;
							(Substr(cBuffer,8,1) == "5" .and. lFebraban)
						nLidos+=nTamDet
						Loop
					EndIF
					
					// Lancamentos
					IF (SubStr(cBuffer,1,1) == "1" .and. cDifer == "1" .and. !lFebraban) .or. ;
							(Substr(cBuffer,8,1) == "3" .and. lFebraban)
						
						lTemLacto := .T.	
						If !__lF474Cta
							cBanco   := Substr(cBuffer,nPosBco,nLenBco )
							cAgencia := Substr(cBuffer,nPosAge,nLenAge )
							cConta   := Substr(cBuffer,nPosCta,nLenCta )
						Endif

						cBanco 		:= PadR( cBanco   , nTamA6Cod )
						cAgencia 	:= PadR( cAgencia , nTamA6Agn )
						cConta 		:= PadR( cConta   , nTamA6Num )

						u_xA474VldBco( @cBanco , @cAgencia , @cConta, @nLinha, @aLog, @lRet )

						If lRet	

							cNumMov  := Substr(cBuffer,nPosNum,nLenNum)
							cDataBco := Substr(cBuffer,nPosData,nLenData)
							cDataBco := ChangDate(cDataBco,nTipoDat)
							dDataMov := Ctod(Substr(cDataBco,1,2)+"/"+Substr(cDataBco,3,2)+"/"+Substr(cDataBco,5,2),"ddmmyy")

							nValorMov := Round(Val(Substr(cBuffer,nPosValor,nLenValor))/100,2)
							cCodMov   := Substr(cBuffer,nPosOcor,nLenOcor)
							cDescrMov := Substr(cBuffer,nPosDescr,nLenDescr)
							
							dbSelectArea("SEJ")
							If dbSeek(xFilial("SEJ")+cBanco+cCodMov)
								cTipoMov := SEJ->EJ_OCORSIS
								cDescMov := SEJ->EJ_DESCR
								cDebCred := SEJ->EJ_DEBCRE
							Else
								aADD(aLog,{nLinha , "Ocorrencia Não Encontrada" + " - " + cCodMov } ) //
								lRet 	:= .F.
							Endif

							If lRet
								// Grava dados no arquivo de trabalho
								If lGravaSIF
									u_xF474GRVSIF(aConfig1, aConfig2 , dDataMov , '1', cChkSum)
									lGravaSIF:= .F.
								EndIf

								//Grava se não tiver inconsistência
								If SA6->(MsSeek(xFilial("SA6")+cBanco+cAgencia+cConta)) .And. SA6->A6_BLOCKED != "1" 	//A6_FILIAL+A6_COD+A6_AGENCIA+A6_NUMCON
									// Grava SIG
									cItem := Soma1(cItem)
									u_x1F474GRVSIG(aConfig1[1], cItem, '1', dDataMov, cNumMov, nValorMov, cCodMov, cDebCred, cBanco, cAgencia, cConta, cDescrMov, "")
									nContReg++
									If __lEfetTrf .and. lFina475 .and. SEE->EE_EFTTRF != '2' .and. cCodMov $ '102|105|109|110'  //102 = Encargos, '105' = Tarifas, '109' = CPMF, '110' = IOF 
										lRet := F475GrDes(oData,@cErro,.T.)
									Endif
								Else
									aADD(aLog,{nLinha , "Banco: "  + cBanco + " Agencia: " + cAgencia + " Conta: " + cConta + " não existe." } )		//"Banco: "##" Agencia: "##" Conta: "##" não existe."
									lRet := .F.
								EndIf
							Endif
						EndIf
					Endif
				Endif
				nLidos += nTamDet
			Enddo

			If nContReg <= 0
				If !lTemLacto	
					aADD(aLogLanc,{0 , "Este arquivo de extrato não possui lançamentos. " } )	//
					lRet := .F.
				ElseIf lRet
					aADD(aLog,{0 , "Arquivo de Extrato Inválido. Verifique arquivo de configuração e extrato." } )		//
					lRet := .F.
				EndIf
			EndIf

			//Fecha arquivo do Banco 
			Fclose(nHdlBco)
		Endif
	Endif

Return lRet



//-------------------------------------------------------------------
/*/{Protheus.doc} F474CHKSUM

	Retorna o CheckSum do Arquivo.

	@type  Function
	@author pequim
	@since 20/07/2022
	@version 12.1.2310
	@param nHdlBco, Numeric, Alias da tabela
		
/*/
//-------------------------------------------------------------------
Static Function F474CHKSUM(nHdlBco)

	Local cBuffer   as Character
	Local cIdArq    as Character
	Local cRet      as Character
	Local cTrailler as Character
	Local nOffSet   as Numeric
	Local nTamArq   as Numeric

	cRet      := ""
	cBuffer   := Space(402)
	nOffSet   := fSeek(nHdlBco,0,FS_RELATIVE) // Sera utilizado para retornar o ponteiro do arquivo a posicao original
	nTamArq   := fSeek(nHdlBco,0,FS_END) // Obtem o tamanho do arquivo
	cIdArq    := ""
	cTrailler := ""

	fSeek(nHdlBco,-804,FS_END) // Volta 804 bytes para compor o CheckSum

	// Le o arquivo ate final
	While fReadLn(nHdlBco,@cBuffer,402)
		cRet += cBuffer
	Enddo

	fSeek(nHdlBco,nOffSet,FS_SET) // Retorna o ponteiro para a posicao original

	cTrailler := cRet+Transform(nTamArq,"")

	cIdArq	 := Str(MsCrc32(cTrailler),10) 

Return cIdArq


//-------------------------------------------------------------------
/*/{Protheus.doc} A474VldBco
	Valida o banco, agencia e conta 
	@type  Function
	@author pequim
	@since 20/07/2022
	@version 12.1.2310
/*/
//-------------------------------------------------------------------
User Function xA474VldBco( cBanco As Character, cAgencia As Character, cConta As Character, nLinha As Numeric, aLog As Array, lRet As Logical )

	Local aAreaATU as Array
	Local aAreaSA6 as Array
	Local cFilSA6  as Character
	Local lStop    as Logical
	Local nSubAge  as Numeric
	Local nSubCon  as Numeric

	aAreaATU := GetArea()
	aAreaSA6 := SA6->( GetArea() )
	cFilSA6  := xFilial( 'SA6' )
	lStop    := .F.
	nSubAge  := 0
	nSubCon  := 0

	If !SA6->( MsSeek( cFilSA6 + cBanco + cAgencia + cConta ) )
		SA6->( MsSeek( cFilSA6 + cBanco ) )

		While !SA6->( Eof() ) .And. cFilSA6 == SA6->A6_FILIAL .And. cBanco == AllTrim(SA6->A6_COD) .And. !lStop
			
			If SA6->A6_BLOCKED = '1' //Se banco estiver bloqueado deverá ser pulado
				SA6->( DbSkip() )
				Loop
			EndIf
				
			nSubAge := At( Alltrim( SA6->A6_AGENCIA ) , cAgencia )
			nSubCon := At( Alltrim( SA6->A6_NUMCON  ) , cConta   )
			If nSubAge > 0 .And. nSubCon > 0
				If ( SubStr( cAgencia , 1 , nSubAge-1 ) == StrZero( 0 , nSubAge-1 ) .Or. ;// Valida 0 a esquerda: Agencia 
					Alltrim( SA6->A6_AGENCIA ) == AllTrim( cAgencia ) ) ;
				.And. ;
				( SubStr( cConta   , 1 , nSubCon-1 ) == StrZero( 0 , nSubCon-1 ) .Or. ;// Valida 0 a esquerda: Conta Corrente
					Alltrim( SA6->A6_NUMCON  ) == AllTrim( cConta   ) )
					cAgencia := SA6->A6_AGENCIA
					cConta   := SA6->A6_NUMCON
					cBanco   := SA6->A6_COD
					lStop    := .T.
				EndIf
			EndIf
			SA6->( DbSkip() )
		EndDo
		
		If Empty(nSubAge) .or. Empty(nSubCon)  
			aADD(aLog,{nLinha , "Banco: "  + cBanco + " Agencia: " + cAgencia + " Conta: " + cConta + " não existe." } )		//"Banco: "##" Agencia: "##" Conta: "##" não existe."
			lRet := .F.		
		EndIf
	
	EndIf

	RestArea( aAreaSA6 )
	RestArea( aAreaATU )
	FWFreeArray(aAreaSA6)
	FWFreeArray(aAreaATU)

Return





//----------------------------------------------------------------------------------------------------
/*/{Protheus.doc} F474GRVSIF
	
	Gravação de registro na tabela SIF
	@type  Function
	@author Pequim
	@since 09/08/2022
	@version 12.1.2310

	@param cIdProc, Character, Id do processo de importação do extrato
	@param dDataMov, Date, Data do Movimento (Extrato)
	@param cBanco, Character, Código do banco
	@param cDescr, Character, Descrição informativa do processo
	@param cStatus, Character, Status do registro a ser gravado
	@param cArqCfg, Character, Arquivo de Configuração
	@param cArqImp, Character, Arquivo de Extrato
	@param cChkSum, Character, CheckSum do arquivo importado

/*/
//----------------------------------------------------------------------------------------------------
User Function xF474GRVSIF(aConfig1 as Array, aConfig2 as Array, dDataMov as Date, cStatus as Character, cChkSum as Character)

	Default cCHkSum = ""

	If __nTamHora == NIL
		__nTamHora := TamSx3("CV8_HORA")[1]
	Endif

	SIF->(DbSetOrder(1))		//IF_FILIAL + IF_IDPROC
	If SIF->(MsSeek(xFilial("SIF") + aConfig1[1]))
		RecLock("SIF",.F.)
		SIF->IF_ARQSUM	:= cChkSum
		SIF->IF_STATUS	:= cStatus
	Else
		RecLock("SIF",.T.)
		SIF->IF_FILIAL 	:= xFilial("SIF")
		SIF->IF_IDPROC  := aConfig1[1]
		SIF->IF_DTPROC  := dDataMov
		SIF->IF_BANCO	:= aConfig1[2]
		SIF->IF_AGENCIA	:= aConfig1[3]
		SIF->IF_CONTA	:= aConfig1[4]
		SIF->IF_SUBCTA	:= aConfig1[5]
		SIF->IF_DESC	:= aConfig1[6]
		SIF->IF_STATUS 	:= cStatus
		SIF->IF_ARQCFG	:= aConfig2[1]
		SIF->IF_ARQIMP	:= aConfig2[2]
		SIF->IF_ARQSUM	:= cChkSum
		SIF->IF_HORA	:= SubStr(Time(),1,__nTamHora)
	Endif
	SIF->(MsUnlock())

Return .T.

//----------------------------------------------------------------------------------------------------
/*/{Protheus.doc} F474GRVSIG
	Gravação de registro na tabela SIF
	@type  Function
	@author pequim
	@since 09/08/2022
	@version 12.1.2310

	@param cIdProc, Character, Id do processo de importação do extrato
	@param cItem, Character, Item do Extrato
	@param cStatus, Character, Status do registro a ser gravado
	@param dDataMov, Date, Data do Movimento (Extrato)
	@param cNumMov, Character, Número do movimento do extrato
	@param nValorMov, Numeric, Valor do movimento do extrato
	@param cCodMov, Character, Código do movimento do extrato
	@param cDebCred, Character, Débito/Crédito
	@param cBanco, Character, Banco do extrato
	@param cAgencia, Character, Agência do extrato
	@param cConta, Character, Conta corrente do extrato
	@param cDescrMov, Character, Descrição do movimento do extrato
	@param cDescFail, Character, Descrição da falha do processo

/*/
//----------------------------------------------------------------------------------------------------
User Function x1F474GRVSIG(cIdProc as Character, cItem as Character, cStatus as Character, dDataMov as Date, cNumMov as Character, nValorMov as Numeric,;
				  cCodMov as Character, cDebCred as Character, cBanco as Character, cAgencia as Character, cConta as Character , cDescrMov as Character, cDescFail as Character, jRespAPI as Json)


	Default jRespAPI := JsonObject():New()

	If __lF474EFT == NIL
		__lF474EFT := ExistBlock("F474EFT")
	Endif	

	RecLock("SIG",.T.)
	SIG->IG_FILIAL 	:= xFilial("SIG")
	SIG->IG_IDPROC	:= cIdProc
	SIG->IG_ITEM	:= cItem
	SIG->IG_STATUS	:= cStatus
	SIG->IG_DTEXTR	:= dDataMov
	SIG->IG_DOCEXT	:= cNumMov
	SIG->IG_SEQMOV  := u_xF474ProxNum("SIG")
	SIG->IG_VLREXT 	:= nValorMov
	SIG->IG_TIPEXT	:= cCodMov
	SIG->IG_CARTER	:= IF(cDebCred=="D","2","1")
	SIG->IG_BCOEXT  := cBanco
	SIG->IG_AGEEXT  := cAgencia
	SIG->IG_CONEXT  := cConta
	SIG->IG_HISTEXT := cDescrMov
	SIG->IG_FILORIG := cFilAnt
	SIG->IG_DESCRFA	:= cDescFail
	SIG->(MsUnlock())

	//Ponto de entrada utilizado para 
	// - Gravação complementar da SIG
	// - Possibilidade de gerar na SE5/FK5 os movimentos que existam na SIG mas não no Protheus
	// - Caso o extrato tenha sido importao por API envia o Json de resposta
	If __lF474EFT
		ExecBlock("F474EFT", .F., .F., { jRespAPI })
	Endif

Return .T.



//-------------------------------------------------------------------
/*/{Protheus.doc} F474ProxNum

	Retorna o próximo número da chave

	@type  Function
	@author pequim
	@since 20/07/2022
	@version 12.1.2310
	@param cTab, Character, Alias da tabela		
/*/
//-------------------------------------------------------------------
User Function XF474ProxNum(cTab As Character) As Character

	Local aArea   as Array
	Local cCampo  as Character
	Local cChave  as Character
	Local cNewKey as Character
	Local nIndex  as Numeric

	aArea   := GetArea()
	cCampo  := ""
	cChave  := ""
	cNewKey := ""
	nIndex  := 0

	If cTab == "SIF"
		SIF->(dbSetOrder(1))//IF_FILIAL+IF_IDPROC
		cCampo := "IF_IDPROC"
		nIndex := 1	
	Else
		SIG->(dbSetOrder(2))//IG_FILIAL+IG_SEQMOV
		cCampo := "IG_SEQMOV"
		cChave := "IG_SEQMOV"+cEmpAnt
		nIndex := 2
	EndIf

	While .T.
		(cTab)->(dbSetOrder(nIndex))
		cNewKey := GetSXEnum(cTab,cCampo,cChave,nIndex)
		ConfirmSX8()
		If cTab == "SIF" 
			If (cTab)->(!dbSeek(xFilial(cTab) + cNewKey) )
				Exit
			EndIf
		Else
			If (cTab)->(!dbSeek(cNewKey) )
				Exit
			EndIf
		EndIf
	EndDo

	RestArea(aArea)
	FWFreeArray(aArea)

Return cNewKey

//-------------------------------------------------------------------
/*/{Protheus.doc} MAS003B
Gera a consiliacao na tabela SE5/SEK
@author	Marcio Da Silva
@since		06/09/2024
@version	MP11.90
/*/
//-------------------------------------------------------------------
User Function MAS003B(aConfig1)

Local cSeqCon	:= ""
Local nRECSE5	:= 0
Local lAtuDtDisp:= .T.
Local lDesconc	:= .F.
Local dDataExt	:= CTOD("")
Local dDataMov	:= CTOD("")
Local dDataNova	:= CTOD("")
Local lFK5		:= .F.
Local lFKs		:= .T.
Local cFilFKA	:= ''
Local cIdOrig	:= ''

Local cTrb		:= GetNextAlias()
Local cQuery    := ''

DbSelectArea("FKA")
DbSelectArea("FK5")
FK5->( DbSetOrder(1) )
SIF->( DbSetOrder(1) ) //IF_FILIAL+IF_IDPROC
SIG->( DbSetOrder(2) ) //IG_SEQMOV
SE5->( DbSetOrder(20)) //E5_FILIAL+E5_SEQCON
SA6->( DbSetOrder(1) )


DbSelectArea("SIF")
DbSetOrder(1)
DbSeek(xFilial("SIF") + aConfig1[1],.T.)

DbSelectArea("SIG")
DbSetOrder(1)
DbSeek(xFilial("SIG") + aConfig1[1],.T.)

While !Eof() .And. xFilial("SIG") + aConfig1[1] == SIG->IG_FILIAL + SIG->IG_IDPROC

	cQuery += " SELECT SE5.R_E_C_N_O_ SE5_RECNO , SE5.* " 
	cQuery += " FROM "+RetSqlName("SE5") + " SE5"

	cQuery += " WHERE E5_DATA > = '"+dTos(SIF->IF_DTPROC)+"' "
	cQuery += " AND E5_BANCO = '"+SIF->IF_BANCO+"' "
	cQuery += " AND E5_AGENCIA = '"+SIF->IF_AGENCIA+"' "
	cQuery += " AND E5_CONTA = '"+Alltrim(SIF->IF_CONTA)+"' "
	cQuery += " AND E5_VALOR = "+ Alltrim(STR(SIG->IG_VLREXT))
	cQuery := ChangeQuery(cQuery)		

	If Select(cTRB) > 0
		dbSelectArea(cTRB)
		(cTRB)->(dbCloseArea())
	Endif

	dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cTRB,.T.,.F.)
	dbSelectArea(cTRB)
	DbGoTop()
	If !Eof()
		nRECSE5 := (cTRB)->SE5_RECNO
		RecLock("SIG", .F. )
			SIG->IG_VLRMOV	:= SIG->IG_VLREXT
			SIG->IG_DTMOVI	:= SIG->IG_DTEXTR
			SIG->IG_DOCMOV	:= SIG->IG_DOCEXT
			SIG->IG_AGEMOV	:= SIG->IG_AGEEXT
			SIG->IG_CONMOV	:= SIG->IG_CONEXT
			SIG->IG_STATUS	:= '3'
			SIG->IG_HISMOV	:= SIG->IG_HISTEXT
			SIG->IG_NATMOV	:= (cTRB)->E5_NATUREZ
			SIG->IG_EFETIVA	:= '1'
		MsUnLock("SIG") 

//Atualiza SE5 e atualiza o Saldo
		SE5->(DbGoTo(nRECSE5))
		FKA->(DbSetOrder(3))

		If SE5->E5_TABORI == "FK1"
			FKA->( DbSeek( SE5->E5_FILIAL + "FK1" + SE5->E5_IDORIG ) )
			lFK5 := .F. // Precisa fazer o loop na FKA procurando o registro de Movimentação Bancaria
			lFKs := .T. // Possui dados migrados
		ElseIf SE5->E5_TABORI == "FK2"
			FKA->( DbSeek( SE5->E5_FILIAL + "FK2" + SE5->E5_IDORIG ) )
			lFK5 := .F. // Precisa fazer o loop na FKA procurando o registro de Movimentação Bancaria
			lFKs := .T. // Possui dados migrados
		ElseIf SE5->E5_TABORI == "FK5"
			FKA->( DbSeek( SE5->E5_FILIAL + "FK5" + SE5->E5_IDORIG ) )
			lFK5 := .T. // NÃO PRECISA fazer o loop na FKA procurando o registro de Movimentação Bancaria, pois esse é o registro de movimentação
			lFKs := .T. // Possui dados migrados
			cIdOrig := FKA->FKA_IDORIG
			cFilFKA := FKA->FKA_FILIAL
		ElseIf Empty(SE5->E5_TABORI)
			lFKs := .F. // NÃO POSSUI dados migrados
		EndIf

		If lFKs //Possui dados migrados
			cIdProc := FKA->FKA_IDPROC

			If !lFK5 // Precisa fazer o loop na FKA procurando o registro de Movimentação Bancaria
				FKA->( DbSetOrder(2) )
				FKA->( DbSeek( FKA->FKA_FILIAL + cIdProc ) )

				While FKA->(!EoF()) .And. FKA->FKA_IDPROC == cIdProc
					If FKA->FKA_TABORI == "FK5"
						cIdOrig := FKA->FKA_IDORIG
						cFilFKA := FKA->FKA_FILIAL
					EndIf
					FKA->(DbSkip())
				Enddo
			EndIf

			If FK5->(DbSeek(cFilFKA + cIdOrig ) )
				If !lDesconc //Conciliou
					Reclock("SE5", .F.)
						SE5->E5_RECONC := 'x'
						SE5->E5_SEQCON := cSeqCon
					SE5->( MsUnLock() )

					Reclock("FK5", .F.)
						FK5->FK5_DTCONC	:= dDataBase
						FK5->FK5_SEQCON	:= cSeqCon
					FK5->( MsUnLock() )
				Else //Desconciliou
					Reclock("SE5", .F.)
						SE5->E5_RECONC	:= ' '
						SE5->E5_SEQCON	:= ' '
					SE5->( MsUnLock() )

					Reclock("FK5", .F.)
						FK5->FK5_DTCONC	:= CTOD("")
						FK5->FK5_SEQCON	:= ""
					FK5->( MsUnLock() )
				EndIf
			Else
				cLog := "Registro não localizado na tabela FK5. Filial: '" + cFilFKA + "' " + cIdOrig + "' " //"Registro não localizado na tabela FK5. Filial: '"
			EndIf
		Else //Registro da SE5 não possui dados nas Tabelas FKs, não foi migrado.
			If !lDesconc //Conciliou
				Reclock( "SE5", .F. )
					SE5->E5_RECONC	:= 'x'
					SE5->E5_SEQCON	:= cSeqCon
				SE5->( MsUnLock() )
			Else //Desconciliou
				Reclock( "SE5", .F. )
					SE5->E5_RECONC	:= ' '
					SE5->E5_SEQCON	:= ' '
				SE5->( MsUnLock() )
			EndIf
		EndIf

		If lDesconc
			dDataNova := dDataMov
		Else
			dDataNova := dDataExt
		EndIf

		//Acerto E5_DTDISPO dos titulos baixados
		If dDataNova !=  SE5->E5_DTDISPO .and. lAtuDtDisp
			dOldDispo := SE5->E5_DTDISPO

			If lFKs // Possui dados migrados
				//Posiciona a FK5 com base no IDORIG da SE5 posicionada
				DbSelectArea("FK5")
				FK5->( DbSetOrder(1) )

				If FK5->(DbSeek(xFilial("SE5")+cIdOrig))
					Reclock("FK5", .F.)
						FK5->FK5_DTDISP	:= SE5->E5_DTDISPO
					FK5->(MsUnlock())

					If SE5->E5_RECPAG == "P"
						AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, dOldDispo, SE5->E5_VALOR, "+", lDesconc )
						AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, SE5->E5_DTDISPO, SE5->E5_VALOR, "-", !lDesconc )
					Else
						AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, dOldDispo, SE5->E5_VALOR, "-", lDesconc )
						AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, SE5->E5_DTDISPO, SE5->E5_VALOR, "+", !lDesconc )
					EndIf

				Else
					cLog := "Registro não localizado na tabela FK5. Filial: '" + cFilFKA + "' " + cIdOrig + "' " //"Registro não localizado na tabela FK5. Filial: '"
				EndIf

			Else // Registro da SE5 não possui dados nas Tabelas FKs, dados não foram migrados.
				If SE5->E5_RECPAG == "P"
					AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, dOldDispo, SE5->E5_VALOR, "+", lDesconc )
					AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, SE5->E5_DTDISPO, SE5->E5_VALOR, "-", !lDesconc )
				Else
					AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, dOldDispo, SE5->E5_VALOR, "-", lDesconc )
					AtuSalBco( SE5->E5_BANCO, SE5->E5_AGENCIA, SE5->E5_CONTA, SE5->E5_DTDISPO, SE5->E5_VALOR, "+", !lDesconc )
				EndIf
			EndIf

		Else
			//Atualiza apenas o saldo reconciliado
			If lDesconc	    //Desconciliou
				AtuSalBco(SE5->E5_BANCO,SE5->E5_AGENCIA,SE5->E5_CONTA,SE5->E5_DTDISPO,SE5->E5_VALOR,If(SE5->E5_RECPAG == "P","+","-"),.T.,.F.)
			Else //Conciliou
				AtuSalBco(SE5->E5_BANCO,SE5->E5_AGENCIA,SE5->E5_CONTA,SE5->E5_DTDISPO,SE5->E5_VALOR,If(SE5->E5_RECPAG == "P","-","+"),.T.,.F.)
			EndIf
		EndIf


	EndIf 
	DbSelectArea("SIG")
	Dbskip()
EndDo 
Return .T.
