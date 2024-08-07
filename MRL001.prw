#INCLUDE "CTBR510.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "CTBXSAL.CH"
 
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±
±±³Fun‡…o	 ³ Ctbr510	³ Autor ³ Wagner Mobile Costa	 ³ Data ³ 15.10.01 ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±
±±³Descri‡…o ³ Demonstracao de Resultados                 			  	   ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±
±±³Retorno	 ³ Nenhum       											   ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±
±±³Parametros³ Nenhum													   ³±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MRL001()          

Private dFinalA
Private dFinal
Private nomeprog	:= "CTBR510"    
Private dPeriodo0
Private cRetSX5SL 	:= ""
Private aSelFil	 	:= {}


If TRepInUse() 
	u_MRL001A()
Else
	Return u_MRL001B()
EndIf

//Limpa os arquivos temporários 
CTBGerClean()

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³ MRL001A ³ Autor³ Daniel Sakavicius		³ Data ³ 17/08/06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Demostrativo de balancos patrimoniais - R4		          ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe	 ³ CTBR115R4												  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ SIGACTB                                    				  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MRL001A()                           

PRIVATE CPERG	   	:= "CTR510"        

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Interface de impressao                                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ            

Pergunte( CPERG, .T. )

// faz a validação do livro
if ! VdSetOfBook( mv_par02 , .T. )
   return .F.
endif

oReport := ReportDef()      

If VALTYPE( oReport ) == "O"
	oReport :PrintDialog()      
EndIf

oReport := nil

Return                                

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ReportDef ³ Autor ³ Daniel Sakavicius		³ Data ³ 17/08/06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³Esta funcao tem como objetivo definir as secoes, celulas,   ³±±
±±³          ³totalizadores do relatorio que poderao ser configurados     ³±±
±±³          ³pelo relatorio.                                             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ SIGACTB                                    				  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß    
/*/          
Static Function ReportDef()     

Local aSetOfBook	:= CTBSetOf(mv_par02)
Local aCtbMoeda		:= {}
Local cDescMoeda 	:= ""
local aArea	   		:= GetArea()   
Local CREPORT		:= "CTBR510"
Local CTITULO		:= OemToAnsi(STR0001)				// DEMONSTRACAO DE RESULTADOS
Local CDESC			:= OemToAnsi(STR0014) + ; 			//"Este programa irá imprimir a Demonstração de Resultados, "
	   					OemToAnsi(STR0015) 				//"de acordo com os parâmetros informados pelo usuário."
Local aTamDesc		:= TAMSX3("CTS_DESCCG")
Local aTamVal		:= TAMSX3("CT2_VALOR")                       
Local aTamCompl     := TAMSX3("CTS_DETHCG")
Local nDivide 		:= 1

//Colocado pela criacao das perguntas no PERU e nos demais paises serem diferentes a ordem das perguntas.
//Somente será feito a funcionalidade de Divide Por, se existir o Parâmetro criado.
If cPaisloc == "PER"  .AND. ValType(mv_par23) == "N"
	nDivide := mv_par23
Else
	If ValType(mv_par21) == "N"
		nDivide := mv_par21
	Endif
Endif

//para verificar por quanto sera dividido e adicionar ao o titulo da moeda.
If nDivide == 2			// Divide por cem
	nDivide := 100
ElseIf nDivide == 3		// Divide por mil
	nDivide := 1000
ElseIf nDivide == 4		// Divide por milhao
	nDivide := 1000000
EndIf

aSetOfBook[9] := nDivide

aCtbMoeda := CtbMoeda(mv_par03, aSetOfBook[9])
cDescMoeda 	:= AllTrim(aCtbMoeda[3])

If Empty(aCtbMoeda[1])                       
	Help(" ",1,"NOMOEDA")
    Return .F.
Endif


//Filtra Filiais
If mv_par19 == 1 .And. Len( aSelFil ) <= 0
	aSelFil := AdmGetFil()
EndIf 

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se usa Set Of Books + Plano Gerencial (Se usar Plano³
//³ Gerencial -> montagem especifica para impressao)				  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If !ct040Valid(mv_par02)
	Return
EndIf	
             
lMovPeriodo	:= (mv_par13 == 1)

If mv_par09 == 1												/// SE DEVE CONSIDERAR TODO O CALENDARIO
	CTG->(DbSeek(xFilial() + mv_par01))
	
	If Empty(mv_par08)
		While CTG->CTG_FILIAL = xFilial("CTG") .And. CTG->CTG_CALEND = mv_par01
			dFinal	:= CTG->CTG_DTFIM
			CTG->(DbSkip())
		EndDo
	Else
		dFinal	:= mv_par08
	EndIf
	
	//Data do periodo anterior
	If !Empty(MV_PAR20)
		If CTG->(DbSeek(xFilial() + mv_par01))
			dFinalA		:= MV_PAR20
		EndIf         
	Else	
		dFinalA   	:= Ctod(Left(Dtoc(dFinal), 6) + Str(Year(dFinal) - 1, 4))
		If Empty ( dFinalA )
			If MONTH(dFinal) == 2
				If Day(dFinal) > 28 .and. Day(dFinal) == 29
					dFinalA := Ctod(Left( STRTRAN ( Dtoc(dFinal) , "29" , "28" ), 6) + Str(Year(dFinal) - 1, 4))
				EndIf
			EndIf
		EndIf	
	EndIf
	
	mv_par01    := dFinal
	If lMovPeriodo
		dPeriodo0 	:= Ctod(Left(Dtoc(dFinal), 6) + Str(Year(dFinal) - 2, 4)) + 1
	EndIf
Else															/// SE DEVE CONSIDERAR O PERIODO CONTABIL
	If Empty(mv_par08)
		MsgInfo(STR0008,STR0009)//"É necessário informar a data de referência !"#"Parametro Considera igual a Periodo."
		Return
	Endif
    
	dFinal		:= mv_par08
	dFinalA		:= CTOD("  /  /  ")
	dbSelectArea("CTG")
	dbSetOrder(1)

	//Data do periodo anterior
	If !Empty(MV_PAR20)
		If MsSeek(xFilial("CTG")+mv_par01)
			dFinalA		:= MV_PAR20
		EndIf         
	Else	
		MsSeek(xFilial("CTG")+mv_par01,.T.)
		While CTG->CTG_FILIAL == xFilial("CTG") .And. CTG->CTG_CALEND == mv_par01
			//dFinalA		:= CTG->CTG_DTINI		
			If dFinal >= CTG->CTG_DTINI .and. dFinal <= CTG->CTG_DTFIM
				dFinalA		:= CTG->CTG_DTINI	
				If lMovPeriodo
					nMes			:= Month(dFinalA)
					nAno			:= Year(dFinalA)
					dPeriodo0	:= CtoD(	StrZero(Day(dFinalA),2)							+ "/" +;
												StrZero( If(nMes==1,12		,nMes-1	),2 )	+ "/" +;
												StrZero( If(nMes==1,nAno-1,nAno		),4 ) )
					dFinalA		:= dFinalA - 1
				EndIf
				Exit
			Endif
			CTG->(DbSkip())
		EndDo
	EndIf
    
	If Empty(dFinalA)
		MsgInfo(STR0010,STR0011)//"Data fora do calendário !"#"Data de referência."
		Return
	Endif
Endif

CTITULO		:= If(! Empty(aSetOfBook[10]), aSetOfBook[10], CTITULO)		// Titulo definido SetOfBook
If Valtype(mv_par16)=="N" .And. (mv_par16 == 1)
	cTitulo := CTBNomeVis( aSetOfBook[5] )
EndIf
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Criacao do componente de impressao                                      ³
//³                                                                        ³
//³TReport():New                                                           ³
//³ExpC1 : Nome do relatorio                                               ³
//³ExpC2 : Titulo                                                          ³
//³ExpC3 : Pergunte                                                        ³
//³ExpB4 : Bloco de codigo que sera executado na confirmacao da impressao  ³
//³ExpC5 : Descricao                                                       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oReport	:= TReport():New( CREPORT,CTITULO,CPERG, { |oReport| ReportPrint( oReport, nDivide  ) }, CDESC ) 
oReport:SetCustomText( {|| CtCGCCabTR(,,,,,dDataBase,ctitulo,,,,,oReport,,,,,,,,,,mv_par08) } )                                        
oReport:ParamReadOnly()

IF GETNEWPAR("MV_CTBPOFF",.T.)
	oReport:SetEdit(.F.)
ENDIF	

oReport:nFontBody := 6
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Criacao da secao utilizada pelo relatorio                               ³
//³                                                                        ³
//³TRSection():New                                                         ³
//³ExpO1 : Objeto TReport que a secao pertence                             ³
//³ExpC2 : Descricao da seçao                                              ³
//³ExpA3 : Array com as tabelas utilizadas pela secao. A primeira tabela   ³
//³        sera considerada como principal para a seção.                   ³
//³ExpA4 : Array com as Ordens do relatório                                ³
//³ExpL5 : Carrega campos do SX3 como celulas                              ³
//³        Default : False                                                 ³
//³ExpL6 : Carrega ordens do Sindex                                        ³
//³        Default : False                                                 ³
//³                                                                        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ           
If cPaisLoc == "COS"
	aTamDesc[1] += aTamCompl[1]
EndIf
	
oSection1  := TRSection():New( oReport, STR0012, {"cArqTmp"},, .F., .F. )        //"Contas/Saldos"

TRCell():New( oSection1, "ATIVO"	,"",STR0013+cDescMoeda+")"	/*Titulo*/,/*Picture*/,aTamDesc[1]+50	/*Tamanho*/,/*lPixel*/,/*CodeBlock*//*,,,,,,.T.*/)	//"(Em "
TRCell():New( oSection1, "SALDOATU"	,"",						/*Titulo*/,/*Picture*/,aTamVal[1]+25	/*Tamanho*/,/*lPixel*/,/*CodeBlock*/,"RIGHT",,"RIGHT"/*,,,.T.*/)
TRCell():New( oSection1, "SALDOANT"	,"",						/*Titulo*/,/*Picture*/,aTamVal[1]+25   /*Tamanho*/,/*lPixel*/,/*CodeBlock*/,"RIGHT",,"RIGHT"/*,,,.T.*/)

oSection1:SetTotalInLine(.F.) 

Return(oReport)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ReportPrint³ Autor ³ Daniel Sakavicius	³ Data ³ 17/08/06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³Imprime o relatorio definido pelo usuario de acordo com as  ³±±
±±³          ³secoes/celulas criadas na funcao ReportDef definida acima.  ³±±
±±³          ³Nesta funcao deve ser criada a query das secoes se SQL ou   ³±±
±±³          ³definido o relacionamento e filtros das tabelas em CodeBase.³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ ReportPrint(oReport)                                       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³EXPO1: Objeto do relatório                                  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ReportPrint( oReport, nDivide )  

Local oSection1 	:= oReport:Section(1) 
Local aSetOfBook	:= CTBSetOf(mv_par02)
Local aCtbMoeda		:= {}
Local lin 			:= 3001
Local cArqTmp
Local cTpValor		:= GetMV("MV_TPVALOR")
Local cPicture
Local cDescMoeda
Local lFirstPage	:= .T.               
Local nTraco		:= 0
Local nSaldo
Local nTamLin		:= 2350
Local aPosCol		:= { 1740, 2045 }
Local nPosCol		:= 0
Local lImpTrmAux	:= Iif(mv_par10 == 1,.T.,.F.)
Local cArqTrm		:= ""
Local lVlrZerado	:= Iif(mv_par12==1,.T.,.F.)
Local lMovPeriodo
Local aTamVal		:= TAMSX3("CT2_VALOR")
Local cMoedaDesc	:= iif( empty( mv_par14 ) , mv_par03 , mv_par14 )
Local lPeriodoAnt 	:= (mv_par06 == 1)
Local cSaldos     	:= CT510TRTSL() 
Local lAutomato   	:= FWIsInCallStack("UTSTARTRPT") .And. cPerg == "CTR510"
Local aDemJson      := {}
Local lRelato 		:= .T.
Local lJson 		:= .F.
Local lPrimeiro		:= .T.
Local cContas		:= ""
Local cCtbJson		:= ""		
Local cFindSX1 		:= Padr("CTR510", Len(SX1->X1_GRUPO), " ")
Local lIndividual	:= .T.
Local cDt1			:= ""
Local cDt2			:= ""
Local cNmDemonst	:= ""
Local nBloco		:= 0

aDemJson := CTBDEMJSON()

If Len(aDemJson)>0
	If aDemJson[1] == 2
		lJson := .T.
		lRelato := .F.
	ElseIf aDemJson[1] == 3
		lJson := .T.
	EndIf
	If aDemJson[5] == 2
		lIndividual := .F.
	EndIf
	
	nBloco := aDemJson[6]

	cNmDemonst := CTNmDemon(nBloco,aDemJson[5])

	If Empty(cNmDemonst)
		cNmDemonst := "DemonstracaoDoResultado"
		nBloco := 0
	
		If !lIndividual	
			cNmDemonst += "Consolidada"
		EndIf
	EndIf
EndIf

aSetOfBook[9] := nDivide

aCtbMoeda	:= CtbMoeda(mv_par03, aSetOfBook[9])
If Empty(aCtbMoeda[1])                       
	Help(" ",1,"NOMOEDA")
    Return .F.
Endif

cDescMoeda 	:= AllTrim(aCtbMoeda[3])
nDecimais 	:= DecimalCTB(aSetOfBook,mv_par03)
cPicture 	:= aSetOfBook[4]

If Empty(cPicture)
	cPicture := "@E "+TmContab(0,aTamVal[1]+8,nDecimais)
ElseIf ! Empty(cPicture) .And. Len(Trans(0, cPicture)) > 17
	cPicture := ""
Endif

lMovPeriodo	:= (mv_par13 == 1)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta Arquivo Temporario para Impressao					     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgMeter({|	oMeter, oText, oDlg, lEnd | ;
			u_xCTGerPlan(	oMeter, oText, oDlg, @lEnd, @cArqTmp, dFinalA+1, dFinal;
					  , "", "", "", Repl( "Z", Len( CT1->CT1_CONTA )), ""; 
					  , Repl( "Z", Len(CTT->CTT_CUSTO)), "", Repl("Z", Len(CTD->CTD_ITEM));
					  , "", Repl("Z", Len(CTH->CTH_CLVL)), mv_par03, /*MV_PAR15*/cSaldos, aSetOfBook, Space(2);
					  , Space(20), Repl("Z", 20), Space(30),,,,, mv_par04=1, mv_par05;
					  , nDivide,lVlrZerado,,,,,,,,,,,,,,,,,,,,,,,,,cMoedaDesc,lMovPeriodo,aSelFil,,.T.,MV_PAR17==1,,,,,,,,,,!Empty(MV_PAR20),dFinalA)};
			,STR0006, STR0001) //"Criando Arquivo Temporario..."

dbSelectArea("cArqTmp")           
dbGoTop()

oReport:SetPageNumber(mv_par07) //mv_par07 - Pagina Inicial

oSection1:Cell("ATIVO"   ):lHeaderSize := .F.
oSection1:Cell("SALDOANT"):lHeaderSize := .F.
oSection1:Cell("SALDOATU"):lHeaderSize := .F.
 		
oSection1:Init()
While ! Eof()

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³indica se a entidade gerencial sera impressa/visualizada em ³
	//³um relatorio ou consulta apos o processamento da visao      ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	iF Alltrim(cArqTmp->CONTA) == '1150'

		If lRelato
			If cArqTmp->VISENT == "2"
				cArqTmp->( DbSkip() )
				Loop
			EndIf
			//Imprime cabeçalho saldo atual e anterior
			oSection1:Cell("SALDOATU"     ):SetTitle(Dtoc(dFinal)) 
			If lPeriodoAnt
				oSection1:Cell("SALDOANT" ):SetTitle(Dtoc(dFinalA))
			Else
				oSection1:Cell("SALDOANT" ):Disable()
			EndIf

			oSection1:Cell("ATIVO"):SetBlock( { || Iif(cArqTmp->COLUNA<2,Iif(cArqTmp->TIPOCONTA=="2",cArqTmp->DESCCTA,cArqTmp->DESCCTA),AllTrim(cArqTmp->DESCCTA)+AllTrim(Posicione("CTS",1,xFilial("CTS")+aSetOfBook[5]+cArqTmp->ORDEM,"CTS_DETHCG")))} )		

			//Imprime Saldo para as contas diferentes de Linha sem Valor
			If cArqTmp->IDENTIFI < "5"
				oSection1:Cell("SALDOATU"     ):SetBlock( { || ValorCTB( If(lMovPeriodo,cArqTmp->(SALDOATU-SALDOANT),cArqTmp->SALDOATU),,,aTamVal[1],nDecimais,.T.,cPicture,;
																cArqTmp->NORMAL,cArqTmp->CONTA,,,cTpValor,,,.F. ) } )

				If lPeriodoAnt
					oSection1:Cell("SALDOANT" ):SetBlock( { || ValorCTB( If(lMovPeriodo,cArqTmp->MOVPERANT,cArqTmp->SALDOANT),,,aTamVal[1],nDecimais,.T.,cPicture,;
																cArqTmp->NORMAL,cArqTmp->CONTA,,,cTpValor,,,.F. ) } )
				EndIf

			//Somente para Linha Sem Valor
			ElseIf cArqTmp->IDENTIFI == "5"
				oSection1:Cell("SALDOATU"     ):SetBlock( { || " " } )

				If lPeriodoAnt
					oSection1:Cell("SALDOANT" ):SetBlock( { || " " } )
				EndIf	
			EndIf    

			oSection1:PrintLine()
		EndIf

		If lJson
			If cArqTmp->VISENT == "2"
				cArqTmp->( DbSkip() )
				Loop
			EndIf

			If !lPrimeiro
				cContas	+= ","
			EndIf

			//O usuário deverá selecionar saldo zerado ="não"
			//Não posso tratar valores zerados no fonte, pois o cálculo de nível ficaria incorreto

			cContas += '{"@id": "'+AllTrim(cArqTmp->CONTA)+'",'+;
						'"@nivel": "'+AllTrim(cArqTmp->NIVJSON)+'",'+;
						'"@descricao": "'+AllTrim(cArqTmp->DESCCTA)+'",'+;
						'"@contapai": "'+AllTrim(cArqTmp->SUPERIOR)+'",'
						
			If lIndividual
				cContas += '"valoresIndividualizados": '
			Else
				cContas += '"valoresConsolidados": '
			EndIf

			cContas += '[{"@dtBase": "CTBR51'+cValToChar(nBloco)+'DT1","@valor": "'+cValToChar(IIf(lMovPeriodo,cArqTmp->(SALDOATU-SALDOANT),cArqTmp->SALDOATU))+'"}'

			If lPeriodoAnt					
				cContas += ',{"@dtBase": "CTBR51'+cValToChar(nBloco)+'DT2","@valor": "'+cValToChar(IIf(lMovPeriodo,cArqTmp->MOVPERANT,cArqTmp->SALDOANT))+'"}]}'
			Else
				cContas += ']}'
			EndIf

			lPrimeiro := .F.		
		EndIf
	EndIf 
	
	dbSkip()
EndDo             

If cPaisloc == "PER" 
	If MV_PAR21 == 1 
		If MV_PAR06 == 2 .and. MV_PAR13 == 1
			If MSGYESNO(STR0016) 
				Processa({|| GerArq(AllTrim(MV_PAR22))},,STR0017)
			EndIf	
		Else
			If MSGYESNO(STR0016) 
				Alert(STR0018)
			EndIf	
		EndIf	
	EndIf				
EndIf   
oSection1:Finish()

If !lAutomato

	If lImpTrmAux
		cArqTRM 	:= mv_par11
	    aVariaveis  := {}
		
	    // Buscando os parâmetros do relatorio (a partir do SX1) para serem impressaos do Termo (arquivos *.TRM)
		SX1->( dbSeek("CTR510"+"01") )
		SX1->( dbSeek( padr( "CTR510" , Len( X1_GRUPO ) , ' ' ) + "01" ) )
		While SX1->X1_GRUPO == padr( "CTR510" , Len( SX1->X1_GRUPO ) , ' ' )
			AADD(aVariaveis,{Rtrim(Upper(SX1->X1_VAR01)),&(SX1->X1_VAR01)})
			SX1->( dbSkip() )
		End
	
		If !File(cArqTRM)
			aSavSet:=__SetSets()
			cArqTRM := CFGX024(cArqTRM,STR0007) // "Responsáveis..."
			__SetSets(aSavSet)
			Set(24,Set(24),.t.)
		Endif
	
		If cArqTRM#NIL
			ImpTerm2(cArqTRM,aVariaveis,,,,oReport)
		Endif	 
	
	Endif
EndIf

If lJson     
	Pergunte(cFindSX1,.F.)
	If DateDiffMonth(dFinalA,dFinal) == 6 		
		cDt1 := "S"+Month2Str(dFinal)+Year2Str(dFinal)
		cDt2 := "S"+Month2Str(dFinalA)+Year2Str(dFinalA)
	Else
		cDt1 := "A"+Month2Str(dFinal)+Year2Str(dFinal)
		cDt2 := "A"+Month2Str(dFinalA)+Year2Str(dFinalA)
	EndIf

	cCtbJson  += '{"PergunteRel": { "CTBR510": ['+CtLstPerg(Alltrim(cFindSX1))+'] }, '+;
  				 '"ParametrosJson": {'+;
				 '"PergunteJson": ['+CtLstPerg("CTBJSON", aDemJson )+'],'+;
    			 '"DatasJson": [{"CTBR51'+cValToChar(nBloco)+'DT1":"'+cDt1+'"'
	If lPeriodoAnt
	 	cCtbJson +=',"CTBR51'+cValToChar(nBloco)+'DT2":"'+cDt2+'"'		 
	EndIf
	cCtbJson += '}]},'
		
	cCtbJson  += '"'+cNmDemonst+'": {"contas": ['+cContas+']}}'
	
	MemoWrite(aDemJson[4], cCtbJson)
EndIf

DbSelectArea("cArqTmp")
Set Filter To
dbCloseArea()
 
If Select("cArqTmp") == 0
	FErase(cArqTmp+GetDBExtension())
	FErase(cArqTmp+OrdBagExt())
EndIF	

Return lRelato


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³ fTrataSlds³ Autor ³Elton da Cunha Santana       ³ 13.10.09 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Tratamento do retorno do parametro                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe	 ³ CT510TRTSL                                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso		 ³ SIGACTB                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function CT510TRTSL()

Local cRet := ""

If MV_PAR17 == 1
	cRet := MV_PAR18
Else
	cRet := MV_PAR15
EndIf

Return(cRet)

/*
-------------------------------------------------------- RELEASE 3 -------------------------------------------------------------
*/
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±
±±³Fun‡…o	 ³ Ctbr510	³ Autor ³ Wagner Mobile Costa	 ³ Data ³ 15.10.01 ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±
±±³Descri‡…o ³ Demonstracao de Resultados                 			  	   ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±
±±³Retorno	 ³ Nenhum       											   ³±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±
±±³Parametros³ Nenhum													   ³±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
USer Function MRL001B()

Local titulo 		:= ""
Local nMes
Local nAno
Local lMovPeriodo
Local aSetOfBook	:= CTBSetOf(mv_par02)

PRIVATE nLastKey 	:= 0
PRIVATE cPerg	 	:= "CTR510"
PRIVATE nomeProg 	:= "CTBR510"
STATIC dFinal		:= Ctod("  /  /  ")


If ! Pergunte("CTR510",.T.)
	Return
EndIf
	
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Variaveis utilizadas para parametros					  		³
//³ mv_par01				// Exercicio contabil             		³
//³ mv_par02				// Configuracao de livros				³
//³ mv_par03				// Moeda?          			     	    ³
//³ mv_par04				// Posicao Ant. L/P? Sim / Nao         	³
//³ mv_par05				// Data Lucros/Perdas?                 	³
//³ mv_par06				// Dem. Periodo Anterior?               ³
//³ mv_par07				// Folha Inicial        ?             	³
//³ mv_par08				// Data de Referencia   ?             	³
//³ mv_par09				// Periodo ? (Calendario/Periodo) 		³
//³ mv_par10				// Imprime Arq. Termo Auxiliar?			³
//³ mv_par11				// Arq.Termo Auxiliar ?					³ 
//³ mv_par12				// Saldos Zerados ? Sim / Nao	   		³
//³ mv_par13				// Considerar ? Mov. Periodo / Saldo Acumulado		³
//³ mv_par14				// Descrição na moeda					³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se usa Set Of Books + Plano Gerencial (Se usar Plano³
//³ Gerencial -> montagem especifica para impressao)			 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

//Filtra Filiais
If mv_par19 == 1 .And. Len( aSelFil ) <= 0
	aSelFil := AdmGetFil()
EndIf 

// faz a validação do livro
if ! VdSetOfBook( mv_par02 , .T. )
   return .F.
endif
             
lMovPeriodo	:= (mv_par13 == 1)

If mv_par09 == 1												/// SE DEVE CONSIDERAR TODO O CALENDARIO
	CTG->(DbSeek(xFilial() + mv_par01))

	If Empty(mv_par08)
		While CTG->CTG_FILIAL = xFilial("CTG") .And. CTG->CTG_CALEND = mv_par01
			dFinal	:= CTG->CTG_DTFIM
			CTG->(DbSkip())
		EndDo
	Else
		dFinal	:= mv_par08
	EndIf

	//Data do periodo anterior
	If !Empty(MV_PAR20)
		If CTG->(DbSeek(xFilial() + mv_par01))
			dFinalA		:= MV_PAR20
		EndIf         
	Else	
		dFinalA   	:= Ctod(Left(Dtoc(dFinal), 6) + Str(Year(dFinal) - 1, 4))
		If Empty ( dFinalA )
			If MONTH(dFinal) == 2
				If Day(dFinal) > 28 .and. Day(dFinal) == 29
					dFinalA := Ctod(Left( STRTRAN ( Dtoc(dFinal) , "29" , "28" ), 6) + Str(Year(dFinal) - 1, 4))
				EndIf
			EndIf
		EndIf	
	EndIf
	mv_par01    := dFinal

	If lMovPeriodo
		dPeriodo0 	:= Ctod(Left(Dtoc(dFinal), 6) + Str(Year(dFinal) - 2, 4)) + 1
	EndIf
Else															/// SE DEVE CONSIDERAR O PERIODO CONTABIL
	If Empty(mv_par08)
		MsgInfo(STR0008,STR0009)//"É necessário informar a data de referência !"#"Parametro Considera igual a Periodo."
		Return
	Endif
    
	dFinal		:= mv_par08
	dFinalA		:= CTOD("  /  /  ")

	dbSelectArea("CTG")
	dbSetOrder(1)

	//Data do periodo anterior
	If !Empty(MV_PAR20)
		If MsSeek(xFilial("CTG")+mv_par01)
			dFinalA		:= MV_PAR20
		EndIf         
	Else	
		MsSeek(xFilial("CTG")+mv_par01,.T.)
		While CTG->CTG_FILIAL == xFilial("CTG") .And. CTG->CTG_CALEND == mv_par01
			If dFinal >= CTG->CTG_DTINI .and. dFinal <= CTG->CTG_DTFIM
				dFinalA		:= CTG->CTG_DTINI	
				If lMovPeriodo
					nMes			:= Month(dFinalA)
					nAno			:= Year(dFinalA)
					dPeriodo0	:= CtoD(	StrZero(Day(dFinalA),2)							+ "/" +;
												StrZero( If(nMes==1,12		,nMes-1	),2 )	+ "/" +;
												StrZero( If(nMes==1,nAno-1,nAno		),4 ) )
					dFinalA		:= dFinalA - 1
				EndIf
				Exit
			Endif
			CTG->(DbSkip())
		EndDo
	EndIf
	    
	If Empty(dFinalA)
		MsgInfo(STR0010,STR0011)//"Data fora do calendário !"#"Data de referência."
		Return
	Endif
Endif

wnrel 		:= "CTBR510"            //Nome Default do relatorio em Disco
titulo 		:= STR0001 //"DEMONSTRACAO DE RESULTADOS"

/*MsgRun(	STR0002,"",; //"Gerando relatorio, aguarde..."
		{|| CursorWait(), Ctr500Cfg(@titulo, "Ctr510Det", STR0001, .F.) ,CursorArrow()}) //"Demonstracao de resultados"*/
RptStatus({|| Ctr500Cfg(@titulo, "u_xCtr510Det", STR0001, .F.)})
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³Ctr510Det ³ Autor ³ Simone Mie Sato       ³ Data ³ 28.06.01 ³±±
±±³ÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³Detalhe do Relatorio                                        ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³Ctr510Det(ExpO1,ExpN1)                                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO1 = Objeto oPrint                                      ³±±
±±³          ³ ExpN1 = Contador de paginas                                ³±±
±±³          ³ ParC1 = Titulo do relatorio                                ³±±
±±³          ³ ParC2 = Titulo da caixa do processo                        ³±±
±±³          ³ ParL1 = Indica se imprime em Paisagem (.T.) ou Retrato .F. ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ SIGACTB                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function xCtr510Det(oPrint,i,titulo,cProcesso,lLandScape)

Local aSetOfBook	:= CTBSetOf(mv_par02)
Local aCtbMoeda		:= {}
Local lin 			:= 3001
Local cArqTmp
Local cTpValor		:= GetMV("MV_TPVALOR")
Local cPicture
Local cDescMoeda
Local lFirstPage	:= .T.               
Local nTraco		:= 0
Local nSaldo
Local nTamLin		:= 2350
Local aPosCol		:= { 1740, 2045 }
Local nPosCol		:= 0
Local lImpTrmAux	:= Iif(mv_par10 == 1,.T.,.F.)
Local cArqTrm		:= ""
Local lVlrZerado	:= Iif(mv_par12==1,.T.,.F.)
Local lMovPeriodo
Local cMoedaDesc	:= iif( empty( mv_par14 ) , mv_par03 , mv_par14 ) 
Local cSaldos     	:= CT510TRTSL()
Local nDivide 		:= 1

//Colocado pela criacao das perguntas no PERU e nos demais paises serem diferentes a ordem das perguntas.
//Somente será feito a funcionalidade de Divide Por, se existir o Parâmetro criado.
If cPaisloc == "PER"  .AND. ValType(mv_par23) == "N"
	nDivide := mv_par23
Else
	If ValType(mv_par21) == "N"
		nDivide := mv_par21
	Endif
Endif

//para verificar e buscar o titulo dividido por
If nDivide == 2			// Divide por cem
	nDivide := 100
ElseIf nDivide == 3		// Divide por mil
	nDivide := 1000
ElseIf nDivide == 4		// Divide por milhao
	nDivide := 1000000
EndIf

aSetOfBook[9] := nDivide

aCtbMoeda := CtbMoeda(mv_par03, aSetOfBook[9])
If Empty(aCtbMoeda[1])
	Help(" ",1,"NOMOEDA")
    Return .F.
Endif

Titulo		:= If(! Empty(aSetOfBook[10]), aSetOfBook[10], Titulo)		// Titulo definido SetOfBook
If (mv_par16 == 1)
	titulo := CTBNomeVis( aSetOfBook[5] )
EndIf
cDescMoeda 	:= AllTrim(aCtbMoeda[3])
nDecimais 	:= DecimalCTB(aSetOfBook,mv_par03)

cPicture 	:= aSetOfBook[4]
If ! Empty(cPicture) .And. Len(Trans(0, cPicture)) > 17
	cPicture := ""
Endif

lMovPeriodo	:= (mv_par13 == 1)

m_pag := mv_par07
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Monta Arquivo Temporario para Impressao					     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
MsgMeter({|	oMeter, oText, oDlg, lEnd | ;
			u_xCTGerPlan(	oMeter, oText, oDlg, @lEnd, @cArqTmp, ;
						dFinalA+1, dFinal, "", "", "", Repl("Z", Len(CT1->CT1_CONTA)),;
						"", Repl("Z", Len(CTT->CTT_CUSTO)), "", Repl("Z", Len(CTD->CTD_ITEM)), ;
						"",Repl("Z", Len(CTH->CTH_CLVL)),mv_par03,;
						/*MV_PAR15*/cSaldos, aSetOfBook, Space(2), Space(20), Repl("Z", 20), Space(30) ,,,,,;
						mv_par04 = 1, mv_par05,nDivide,lVlrZerado,,,,,,,,,,,,,,,,,,,,,,,,,;
						cMoedaDesc,lMovPeriodo,aSelFil,,.T.,MV_PAR17==1,,,,,,,,,,!Empty(MV_PAR20),dFinalA)};
			,STR0006, cProcesso) //"Criando Arquivo Temporario..."

dbSelectArea("cArqTmp")           
dbGoTop()

While ! Eof()

	If lin > 3000
		If !lFirstPage
			oPrint:Line( ntraco,150,ntraco,nTamLin )   	// horizontal
		EndIf	
		i++                                                
		oPrint:EndPage() 	 								// Finaliza a pagina
		CtbCbcDem(oPrint,titulo,lLandScape)					// Funcao que monta o cabecalho padrao 
		If mv_par06 == 2									// Demonstra periodo anterior = Nao
			u_xCtr510Atu(oPrint, cDescMoeda,aPosCol,nTamLin)	// Cabecalho de impressão do Saldo atual.
		Else
			u_xCtr510Esp(oPrint, cDescMoeda,aPosCol,nTamLin)
		EndIf
		lin := 304        
		lFirstPage := .F.		
	End
    
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³indica se a entidade gerencial sera impressa/visualizada em ³
	//³um relatorio ou consulta apos o processamento da visao      ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If cArqTmp->VISENT == "2"
		cArqTmp->( DbSkip() )
		Loop
	EndIf
    
	If DESCCTA = "-"
		oPrint:Line(lin,150,lin,nTamLin)   	// horizontal
	Else

		oPrint:Line( lin,150,lin+50, 150 )   	// vertical

// Negrito caso Sub-Total/Total/Separador (caso tenha descricao) e Igual (Totalizador)

		oPrint:Say(lin+15,195,DESCCTA, If(IDENTIFI $ "3469", oCouNew08N, oFont08))

		
		For nPosCol := 1 To Len(aPosCol)
			If mv_par06 == 2 .And. nPosCol == 1
				aPosCol := {1940}
			Else
				aPosCol	:= { 1540, 1940 }	           
			EndIf
   			oPrint:Line(lin,aPosCol[nPosCol],lin+55,aPosCol[nPosCol] )	// Separador vertical    			
    	  
    		If IDENTIFI < "5"
    			If mv_par06 == 1 .Or. (mv_par06 == 2 .And. nPosCol == 1)
					If !lMovPeriodo
						nSaldo := If(nPosCol = 1, SALDOATU, SALDOANT)
					Else
						nSaldo := If(nPosCol = 1, SALDOATU-SALDOANT,MOVPERANT)
					EndIf
				       
		            ValorCTB(nSaldo,lin+15,aPosCol[nPosCol],15,nDecimais,.T.,cPicture,;
					NORMAL,CONTA,.T.,oPrint,cTpValor,IIf(IDENTIFI $ "4","1",IDENTIFI))
				EndIf					 
			Endif 
			
		Next

		oPrint:Line(lin,nTamLin,lin+50,nTamLin)   	// Separador vertical
		lin +=47

	Endif

	nTraco := lin + 1
	DbSkip()
EndDo
oPrint:Line(lin,150,lin,nTamLin)   	// horizontal

lin += 10             

If lImpTrmAux
	If lin > 3000
		If !lFirstPage
			oPrint:Line( ntraco,150,ntraco,nTamLin )   	// horizontal
		EndIf	
		i++                                                
		oPrint:EndPage() 	 								// Finaliza a pagina
		CtbCbcDem(oPrint,titulo,lLandScape)					// Funcao que monta o cabecalho padrao 
		If mv_par06 == 2									// Demonstra periodo anterior = Nao
			u_xCtr510Atu(oPrint, cDescMoeda,aPosCol,nTamLin)	// Cabecalho de impressão do Saldo atual.
		Else
			u_xCtr510Esp(oPrint, cDescMoeda,aPosCol,nTamLin)
		EndIf
		lin := 304        
		lFirstPage := .F.		
	Endif
	cArqTRM 	:= mv_par11
    aVariaveis  := {}
	
    // Buscando os parâmetros do relatorio (a partir do SX1) para serem impressaos do Termo (arquivos *.TRM)
	SX1->( dbSeek( padr( "CTR510" , Len( X1_GRUPO ) , ' ' ) + "01" ) )

	While SX1->X1_GRUPO == padr( "CTR510" , Len( SX1->X1_GRUPO ) , ' ' )
		AADD(aVariaveis,{Rtrim(Upper(SX1->X1_VAR01)),&(SX1->X1_VAR01)})
		SX1->( dbSkip() )
	End

	If !File(cArqTRM)
		aSavSet:=__SetSets()
		cArqTRM := CFGX024(cArqTRM,STR0007) // "Responsáveis..."
		__SetSets(aSavSet)
		Set(24,Set(24),.t.)
	Endif

	If cArqTRM#NIL
		ImpTerm(cArqTRM,aVariaveis,"",.T.,{oPrint,oFont08,Lin})
	Endif	 
Endif

DbSelectArea("cArqTmp")
Set Filter To
dbCloseArea() 
If Select("cArqTmp") == 0
	FErase(cArqTmp+GetDBExtension())
	FErase(cArqTmp+OrdBagExt())
EndIF	
dbselectArea("CT2")

Return lin


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³CTR500ESP ³ Autor ³ Simone Mie Sato       ³ Data ³ 27.06.01 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³Cabecalho Especifico do relatorio CTBR041.                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³CTR500ESP(ParO1,ParC1)			                          ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO1 = Objeto oPrint                                      ³±±
±±³          ³ ExpC1 = Descricao da moeda sendo impressa                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ SIGACTB                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function xCTR510Esp(oPrint,cDescMoeda,aPosCol,nTamLin)

Local cColuna  		:= "(Em " + cDescMoeda + ")"
Local aCabecalho    := { Dtoc(dFinal, "ddmmyyyy"), Dtoc(dFinalA, "ddmmyyyy") }
Local nPosCol

oPrint:Line(250,150,300,150)   	// vertical

oPrint:Say(260,195,cColuna,oArial10)

For nPosCol := 1 To Len(aCabecalho)
	If nPosCol < Len(aCabecalho)
		oPrint:Say(260,aPosCol[nPosCol] - 60,aCabecalho[nPosCol],oArial10)
	Else
		oPrint:Say(260,aPosCol[nPosCol] + 30,aCabecalho[nPosCol],oArial10)
	EndIf
Next

oPrint:Line(250,nTamLin,300,nTamLin)   	// vertical

oPrint:Line(300,150,300,nTamLin)   	// horizontal

Return Nil

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³CTR510ATU ³ Autor ³ Lucimara Soares       ³ Data ³ 03.02.03 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³Cabecalho para impressao apenas da coluna de Saldo Atual.   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³CTR510ESP(ParO1,ParC1)			                          ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpO1 = Objeto oPrint                                      ³±±
±±³          ³ ExpC1 = Descricao da moeda sendo impressa                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ SIGACTB                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function xCTR510ATU(oPrint,cDescMoeda,aPosCol,nTamLin)

Local cColuna  		:= "(Em " + cDescMoeda + ")"
Local aCabecalho    := { Dtoc(dFinal, "ddmmyyyy") }
Local nPosCol       := 1

oPrint:Line(250,150,300,150)   	// vertical

oPrint:Say(260,195,cColuna,oArial10)

oPrint:Say(260,aPosCol[nPosCol+1] + 30,aCabecalho[nPosCol],oArial10)


oPrint:Line(250,nTamLin,300,nTamLin)   	// vertical

oPrint:Line(300,150,300,nTamLin)   	// horizontal

Return Nil  
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿±±
±±³ Funcao     ³ GerArq                                 ³ Data ³ 26.04.2016 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Descricao  ³ Gera o arquivo magnético                                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Parametros ³ cDir - Diretorio de criacao do arquivo.                    ³±±
±±³            ³ cArq - Nome do arquivo com extensao do arquivo.            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Retorno    ³ Nulo                                                       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso        ³ 10.1 REGISTRO DE COSTOS - ESTADO DE COSTO DE VENTAS ANUAL   ±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function GerArq(cDir)

Local nHdl    := 0
Local cLin    := ""
Local cSep    := "|"
Local cArq    := ""
Local nCont   := 0

cArq += "LE"                          // Fixo 'LE'
cArq +=  AllTrim(SM0->M0_CGC)         // Ruc
If MV_PAR09 == 1
	cArq +=  AllTrim(Str(Year(MV_PAR01))) // Ano
Else
	cArq +=  AllTrim(Str(Year(MV_PAR08))) // Ano
EndIf	
cArq +=  "00"                         // Mes Fixo '00'
cArq +=  "00"                         // Dia Fixo '00'
cArq += "100100"                      // Fixo '100100'
cArq += "00"                          // Fixo '00'
cArq += "1"
cArq += "1"
cArq += "1"
cArq += "1"
cArq += ".TXT" // Extensao

FOR nCont:=LEN(ALLTRIM(cDir)) TO 1 STEP -1
   IF SUBSTR(cDir,nCont,1)=='\' 
      cDir:=Substr(cDir,1,nCont)
      EXIT
   ENDIF   
NEXT 

nHdl := fCreate(cDir+cArq)
If nHdl <= 0
	ApMsgStop(STR0019)
Else
		//10.1 REGISTRO DE COSTOS - ESTADO DE COSTO DE VENTAS ANUAL. Colunas impressas do arquivo temporário "cArqTmp"
		// 01 - Costo del inventario inicial de productos terminados contable
		// 02 - Costo de producción de productos terminados contable
		// 03 - Costos del inventario final de productos terminados disponibles para la venta contable
		// 04 - Ajustes diversos contables
		// 05 - Indica el estado de la operación
			
		dbSelectArea("cArqTmp")
		cArqTmp ->(dbGoTop())
		If MV_PAR09 == 1
			cLin += SubStr(DTOS(mv_par01),1,4)+"0000" // Data final informada no exercício(CTG_DTFIM)
		Else
			cLin += SubStr(DTOS(mv_par08),1,4)+"0000"
		EndIF	
		cLin += cSep
		
		Do While cArqTmp->(!EOF())
				
			cLin += AllTrim(StrTran(Transform(SALDOATU,"@E 999999999.99"),",","."))
		    cLin += cSep
		    																			
			cArqTmp->(dbSkip())
		EndDo
			cLin += "1" // [1][8] - Indica el estado de la operación
			cLin += cSep
			
	fWrite(nHdl,cLin)				
	fClose(nHdl)
	
MsgAlert(STR0020)
EndIf
Return Nil



//-------------------------------------------------------------------
/*/{Protheus.doc} CtGerPlan
Gerar Arquivo Temporario para Balancetes.

@author Alvaro Camillo Neto

@param oMeter       Controle da regua
@param oText        Controle da regua
@param oDlg         Janela
@param lEnd         Controle da regua @param > finalizar
@param cArqTmp      Arquivo temporario
@param dDataIni     Data Inicial de Processamento
@param dDataFim     Data Final de Processamento
@param cAlias       Alias do Arquivo
@param cIdent       Identificador do arquivo a ser processado
@param cContaIni    Conta Inicial
@param cContaFim	 Conta Final
@param cCCIni       Centro de Custo Inicial
@param cCCFim       Centro de Custo Final
@param cItemIni     Item Inicial
@param cItemFim     Item Final
@param cClvlIni     Classe de Valor Inicial
@param cClvlFim     Classe de Valor Final
@param cMoeda       Moeda
@param cSaldos      Tipos de Saldo a serem processados
@param aSetOfBook   Matriz de configuracao de livros
@param cSegmento    Indica qual o segmento sera filtrado
@param cSegIni      Conteudo Inicial do segmento
@param cSegFim      Conteudo Final do segmento
@param cFiltSegm    Filtra por Segmento
@param lNImpMov     Se Imprime Entidade sem movimento
@param lImpConta    Se Imprime Conta
@param nGrupo       Grupo
@param cHeader      Identifica qual a Entidade Principal
@param lImpAntLP    Se imprime lancamentos Lucros e Perdas
@param dDataLP      Data da ultima Apuracao de Lucros e Perdas
@param nDivide      Divide valores por (100,1000,1000000)
@param lVlrZerado   Grava ou nao valores zerados no arq temporario
@param cFiltroEnt   Entidade Gerencial que servira de filtro dentro
              		 de outra Entidade Gerencial. Ex.: Centro de Custo
              		 sendo filtrado por Item Contabil (CTH)
@param cCodFilEnt   Codigo da Entidade Gerencial utilizada como filtro
@param cSegmentoG   Filtra por Segmento Gerencial (CC/Item ou ClVl)
@param cSegIniG     Segmento Gerencial Inicial
@param cSegFimG     Segmento Gerencial Final
@param cFiltSegmG   Segmento Gerencial Contido em
@param lUsGaap      Se e Balancete de Conversao de moeda
@param cMoedConv    Moeda para a qual buscara o criterio de conversao
              		 no Pl.Contas
@param cConsCrit    Criterio de conversao utilizado: 1@param Diario, 2@param Medio,
              		 3@param Mensal, 4@param Informada, 5@param Plano de Contas
@param dDataConv    Data de Conversao
@param nTaxaConv    Taxa de Conversao
@param aGeren       Matriz que armazena os compositores do Pl. Ger.
			       	 para efetuar o filtro de relatorio.
@param lImpMov      Nao utilizado
@param lImpSint     Se atualiza sinteticas
@param cFilUSU      Filtro informado pelo usuario
@param lRecDesp0    Se imprime saldo anterior do periodo anterior
               		zerado
@param cRecDesp     Grupo de receitas e despesas
@param dDtZeraRD    Data de zeramento de receitas e despesas
@param lImp3Ent     Se e Balancete C.Custo / Conta / Item
@param lImp4Ent     Se e Balancete por CC x Cta x Item x Cl.Valor
@param lImpEntGer   Se e Balancete de Entidade (C.Custo/Item/Cl.Vlr
               		por Entid. Gerencial)
@param lFiltraCC    Se considera o filtro das perguntas para C.Custo
@param lFiltraIt    Se considera o filtro das perguntas para Item
@param lFiltraCV    Se considera o filtro das perguntas para Cl.Valor
@param cMoedaDsc    Codigo da moeda para descricao das entidades
@param lMovPeriodo  Se imprime movimento do periodo anterior
@param aSelFil      Array de filiais
@param dDtCorte     Data de Corte para calculo do saldo anterior
@param lPlGerSint   Imprime visao gerencial sintetica? Padrao .F.
@param lConsSaldo   Consolida saldo ? Padrao .F.
@param lCompEnt     Consolida saldo entre entidades? Padrao .F.
@param cArqAux      Arquivo auxiliar permitindo a recursividade
@param lUsaNmVis    Usa nome da visao gerencial ? Padrao .F.
@param cNomeVis     Nome da visao gerencial (retorno, passar por ref.)
@param lCttSint     Indica se imprime ou n o C.Custo Sint ticos
@param cQuadroCTB   CODIGO DO QUADRO CONTABIL
@param aEntidades   Array com as entidades de inicio e fim
        				 Ex. {'Cta Ent. 05 Inicio','Cta. Ent. 05 Final'}
@param cCodEntidade Codigo da Entidade


@version P12
@since   20/02/2014
@return  Nil
@obs
/*/
//-------------------------------------------------------------------

User Function xCTGerPlan(	oMeter,oText,oDlg,lEnd,cArqtmp,dDataIni,dDataFim,cAlias,cIdent,cContaIni,cContaFim,;
					cCCIni,cCCFim,cItemIni,cItemFim,cClvlIni,cClVlFim,cMoeda,cSaldos,aSetOfBook,cSegmento,;
					cSegIni,cSegFim,cFiltSegm,lNImpMov,lImpConta,nGrupo,cHeader,lImpAntLP,dDataLP,;
					nDivide,lVlrZerado,cFiltroEnt,cCodFilEnt,cSegmentoG,cSegIniG,cSegFimG,cFiltSegmG,;
					lUsGaap,cMoedConv,cConsCrit,dDataConv,nTaxaConv,aGeren,lImpMov,lImpSint,cFilUSU,lRecDesp0,;
					cRecDesp,dDtZeraRD,lImp3Ent,lImp4Ent,lImpEntGer,lFiltraCC,lFiltraIt,lFiltraCV,cMoedaDsc,;
					lMovPeriodo,aSelFil,dDtCorte,lPlGerSint,lConsSaldo,lCompEnt,cArqAux,lUsaNmVis,cNomeVis,lCttSint,;
					lTodasFil,cQuadroCTB,aEntidades,cCodEntidade,lDemDRE , dFinalA)

Local aTamConta		:= TAMSX3("CT1_CONTA")
Local aTamCtaRes	:= TAMSX3("CT1_RES")
Local aTamCC        := TAMSX3("CTT_CUSTO")
Local aTamCCRes 	:= TAMSX3("CTT_RES")
Local aTamItem  	:= TAMSX3("CTD_ITEM")
Local aTamItRes 	:= TAMSX3("CTD_RES")
Local aTamClVl  	:= TAMSX3("CTH_CLVL")
Local aTamCvRes 	:= TAMSX3("CTH_RES")
Local aTamVal		:= TAMSX3("CT2_VALOR")

Local aCtbMoeda		:= {}
Local aSaveArea 	:= GetArea()
Local aCampos
Local cChave
Local nTamCta 		:= Len(CriaVar("CT1->CT1_DESC"+cMoeda))
Local nTamItem		:= Len(CriaVar("CTD->CTD_DESC"+cMoeda))
Local nTamCC  		:= Len(CriaVar("CTT->CTT_DESC"+cMoeda))
Local nTamClVl		:= Len(CriaVar("CTH->CTH_DESC"+cMoeda))
Local nTamGrupo		:= Len(CriaVar("CT1->CT1_GRUPO"))
Local nDecimais		:= 0
Local cCodigo		:= ""
Local cCodGer		:= ""
Local cEntidIni		:= ""
Local cEntidFim		:= ""
Local cEntidIni1	:= ""
Local cEntidFim1	:= ""
Local cEntidIni2	:= ""
Local cEntidFim2	:= ""
Local cArqTmp1		:= ""
Local cMascaraG 	:= ""
Local lCusto		:= CtbMovSaldo("CTT")//Define se utiliza C.Custo
Local lItem 		:= CtbMovSaldo("CTD")//Define se utiliza Item
Local lClVl			:= CtbMovSaldo("CTH")//Define se utiliza Cl.Valor
Local lAtSldBase	:= Iif(GetMV("MV_ATUSAL")== "S",.T.,.F.)
Local lAtSldCmp		:= Iif(GetMV("MV_SLDCOMP")== "S",.T.,.F.)
Local nInicio		:= Val(cMoeda)
Local nFinal		:= Val(cMoeda)
Local nCampoLP		:= 0
Local cFilDe		:= xFilial(cAlias)
Local cFilAte		:= xFilial(cAlias), nOrdem := 1
Local cCodMasc		:= ""
Local cMensagem		:= OemToAnsi(STR0002)// O plano gerencial ainda nao esta disponivel nesse relatorio.
Local nPos			:= 0
Local nCont			:= 0
Local lTemQuery		:= .F.
Local nX
Local lCriaInd		:= .F.
Local nTamFilial 	:= 8//IIf( lFWCodFil, FWGETTAMFILIAL, 2 )
Local lCT1EXDTFIM	:= CtbExDtFim("CT1")
Local lCTTEXDTFIM	:= CtbExDtFim("CTT")
Local lCTDEXDTFIM	:= CtbExDtFim("CTD")
Local lCTHEXDTFIM	:= CtbExDtFim("CTH")

Local nSlAntGap		:= 0	// Saldo Anterior
Local nSlAntGapD	:= 0	// Saldo anterior debito
Local nSlAntGapC	:= 0	// Saldo anterior credito
Local nSlAtuGap		:= 0	// Saldo Atual
Local nSlAtuGapD	:= 0	// Saldo Atual debito
Local nSlAtuGapC	:= 0	// Saldo Atual credito
Local nSlDebGap		:= 0	// Saldo Debito
Local nSlCrdGap		:= 0	// Saldo Credito

Local aEntidIni		:= {}
Local aEntidFim		:= {}

Local aStruTmp		:= {}
Local lTemQry		:= .F.
Local nTrb			:= 0

Local nDigitos		:= 0
Local nMeter		:= 0
Local nPosG			:= 0
Local nDigitosG		:= 0
Local aAreaAnt		:= Nil

Local _lCtbIsCube	:= FindFunction( "CtbIsCube" ) .And. CtbIsCube()
Local aTmpFil		:= {}

Local cMvPar01Ant	:= mv_par01

Local cTableNam1 	:= ""
Local aChave		:= {}
Local nTamCt		:= aTamConta[1]

Local cEntid_de		:= ""
Local cEntid_ate	:= ""
Local lEntSint		:= .F.

Local lCT1DTEXSF 	:= .F.
Local lCTTDTEXSF 	:= .F.
Local lCTDDTEXSF 	:= .F.
Local lCTHDTEXSF 	:= .F.
Local lSLDANTCTDB 	:= .F.
Local lSLDANTCTCR 	:= .F.
Local lSLLPATCTDB 	:= .F.
Local lSLLPATCTCR 	:= .F.

Local lGrvJson		:= CTB_IsJSON()

//Verifica  o se a chamada   do CTBR140 ou teste automatizado do CTBR140
Local lCtbr140		:= IIf(FwIsInCallStack('CTBR140') .or. (FunName() == 'CTBR140'), .T., .F.)

//Variaveis para atualizar a regua desde as rotinas de geracao do arquivo temporario
Private oMeter1 		:= oMeter
Private oText1 		:= oText
Private cPlanoRef	:= aSetOfBook[11]
Private cVersao		:= aSetOfBook[12]

DEFAULT lConsSaldo   := .F.
DEFAULT lPlGerSint   := .F.
DEFAULT cSegmentoG 	:= ""
DEFAULT lUsGaap		:=.F.
DEFAULT cMoedConv	:= ""
DEFAULT	cConsCrit	:= ""
DEFAULT dDataConv	:= CTOD("  /  /  ")
DEFAULT nTaxaConv	:= 0
DEFAULT lImpSint	:= .T.
DEFAULT lImpMov		:= .T.
DEFAULT cSegmento	:= ""
DEFAULT cFilUsu		:= ".T."
DEFAULT lRecDesp0	:= .F.
DEFAULT cRecDesp 	:= ""
DEFAULT dDtZeraRD	:= CTOD("  /  /  ")
DEFAULT lImp3Ent	:= .F.
DEFAULT lImp4Ent	:= .F.
DEFAULT lImpEntGer	:= .F.
DEFAULT lImpConta	:= .T.
DEFAULT lFiltraCC	:= .F.
DEFAULT lFiltraIt	:= .F.
DEFAULT lFiltraCV	:= .F.
DEFAULT cMoedaDsc	:= '01'
DEFAULT lMovPeriodo := .F.
DEFAULT aSelFil 	:= {}
DEFAULT dDtCorte 	:= CTOD("  /  /  ")
DEFAULT lCompEnt	:= .F.
DEFAULT cArqAux		:= "cArqTmp"
DEFAULT cArqTmp 	:= ""
DEFAULT lUsaNmVis	:= .F.
DEFAULT lCttSint	:= .F.
DEFAULT cQuadroCTB:= ""
DEFAULT lTodasFil   := .F.
DEFAULT aEntidades  := {}
DEFAULT cCodEntidade:= ""
DEFAULT lDemDRE:=.F.
DEFAULT dFinalA 	:= CTOD("  /  /  ")
DEFAULT nDivide := 1

//If __lCOLUN2 == NIL
	__lCOLUN2 := Iif( CTS->(FieldPos("CTS_COLUN2")) > 0, .T., .F.)
//Endif
If FunName() == "CTBR561" .Or. FunName() == "CTBR502"
	nTamCta := 100
Endif

__aTmpTCFil	:=	{}

If lRecDesp0 .And. ( Empty(cRecDesp) .Or. Empty(dDtZeraRD) )
	lRecDesp0 := .F.
EndIf

cIdent		:=	Iif(cIdent == Nil,'',cIdent)
nGrupo		:=	Iif(nGrupo == Nil,2,nGrupo)
cHeader		:= Iif(cHeader == Nil,'',cHeader)
cFiltroEnt	:= Iif(cFiltroEnt == Nil,"",cFiltroEnt)
cCodFilEnt	:= Iif(cCodFilEnt == Nil,"",cCodFilEnt)
Private nMin			:= 0
Private nMax			:= 0

// Retorna Decimais
aCtbMoeda := CTbMoeda(cMoeda)
nDecimais := aCtbMoeda[5]
dMinData := CTOD("")

//Se utiliza o plano referencial, desconsidera os filtros das entidades dos relat rios.
If !Empty(cPlanoRef) .And. !Empty(cVersao)
	//Se o relat rio n o possuir conta, o plano referencial e a vers o ser o desconsiderados.
	//Ser  considerado c d. config. livros em branco.
	If cAlias $ "CTU/CTV/CTW/CTX/CTY/CVY" .Or. FunName() == "CTBR245"
		Help("  ",1,"CTBNOPLREF",,STR0048,1,0) //"Plano referencial n o dispon vel nesse relat rio. O relat rio ser  processado desconsiderando a configura  o de livros."
		cPlanoRef		:= ""
		cVersao			:= ""
		//aSetOfBook[1]	:= ""
		aSetOfBook		:= CTBSetOf("")
	Else
		cContaIni	:= Space(aTamConta[1])
		cContaFim	:= Replicate("Z",aTamConta[1])

		If FunName() != "CTBR040"
			lRecDesp0	:= .F.
		EndIf
	EndIf
Endif


If ExistBlock("ESPGERPLAN")
	ExecBlock("ESPGERPLAN",.F.,.F.,{oMeter,oText,oDlg,lEnd,cArqtmp,dDataIni,dDataFim,cAlias,cIdent,cContaIni,cContaFim,;
		cCCIni,cCCFim,cItemIni,cItemFim,cClvlIni,cClVlFim,cMoeda,cSaldos,aSetOfBook,cSegmento,cSegIni,;
		cSegFim,cFiltSegm,lNImpMov,lImpConta,nGrupo,cHeader,lImpAntLP,dDataLP,nDivide,lVlrZerado,;
		cFiltroEnt,cCodFilEnt,cSegmentoG,cSegIniG,cSegFimG,cFiltSegmG,lUsGaap,cMoedConv,;
		cConsCrit,dDataConv,nTaxaConv,aGeren,lImpMov,lImpSint,cFilUSU,lRecDesp0,;
		cRecDesp,dDtZeraRD,lImp3Ent,lImp4Ent,lImpEntGer,lFiltraCC,lFiltraIt,lFiltraCV,aSelFil,dDtCorte,cQuadroCTB })


		Return(cArqTmp)
EndIf

If cAlias == 'CTY'	//Se for Balancete de 2 Entidades filtrando pela 3a Entidade.
	aCampos := {{ "ENTID1"		, "C", aTamConta[1], 0 },;  			// Codigo da Conta
	{ "ENTRES1"	, "C", aTamCtaRes[1],0 },;  			// Codigo Reduzido da Conta
	{ "DESCENT1"	, "C", nTamCta		, 0 },;  			// Descricao da Conta
	{ "TIPOENT1"  	, "C", 01			, 0 },;				// Centro de Custo Analitico / Sintetico
	{ "ENTSUP1"	, "C", aTamCC[1]	, 0 },;				// Codigo do Centro de Custo Superior
	{ "ENTID2"		, "C", aTamCC[1]	, 0 },; 	 		// Codigo do Centro de Custo
	{ "ENTRES2"	, "C", aTamCCRes[1], 0 },;  			// Codigo Reduzido do Centro de Custo
	{ "DESCENT2"	, "C", nTamCC		, 0 },;  			// Descricao do Centro de Custo
	{ "TIPOENT2"	, "C", 01			, 0 },;				// Item Analitica / Sintetica
	{ "ENTSUP2"	, "C", aTamItem[1]	, 0 },; 			// Codigo do Item Superior
	{ "NORMAL"		, "C", 01			, 0 },;				// Situacao
	{ "SALDOANT"	, "N", aTamVal[1]+2, nDecimais},; 		// Saldo Anterior
	{ "SALDOANTDB"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Debito
	{ "SALDOANTCR"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Credito
	{ "SALDODEB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Debito
	{ "SALDOCRD"	, "N", aTamVal[1]+2	, nDecimais },;  	// Credito
	{ "SALDOATU"	, "N", aTamVal[1]+2, nDecimais },;  	// Saldo Atual
	{ "SALDOATUDB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Debito
	{ "SALDOATUCR"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Credito
	{ "MOVIMENTO"	, "N", aTamVal[1]+2	, nDecimais },;  	// Movimento do Periodo
	{ "ORDEM"		, "C", 10			, 0 },;				// Ordem
	{ "GRUPO"		, "C", nTamGrupo	, 0 },;				// Grupo Contabil
	{ "IDENTIFI"	, "C", 01			, 0 },;
		{ "TOTVIS"		, "C", 01			, 0 },;
		{ "SLDENT"		, "C", 01			, 0 },;
		{ "FATSLD"		, "C", 01			, 0 },;
		{ "VISENT"		, "C", 01			, 0 },;
		{ "NIVEL1"		, "L", 01			, 0 }}				// Logico para identificar se eh de nivel 1 -> usado como totalizador do relatorio

ElseIf cAlias == 'CVY'	//Se for Balancete por cubo contabil

	If cPaisLoc $ "COL|PER" .And. FunName() == "CTBR048"
		aTamCC := TAMSX3("CV0_CODIGO")						// Redefine longitud entidad (05)
	EndIf

	aCampos := { { "ECX"		, "C", aTamConta[1], 0 },;  // Codigo da Conta
	{ "ECXSUP"		, "C", aTamConta[1], 0 },;				// Conta Superior
	{ "ECXNORMAL"	, "C", 01			, 0 },;				// Situacao
	{ "ECXRES"		, "C", aTamCtaRes[1], 0 },;  			// Codigo Reduzido da Conta
	{ "ECXDESC"	, "C", nTamCta		, 0 },;  			// Descricao da Conta
	{ "ECY"		, "C", aTamCC[1]	, 0 },; 	 		// Codigo do Centro de Custo
	{ "ECYSUP"		, "C", aTamConta[1], 0 },;				// Conta Superior
	{ "ECYNORMAL"	, "C", 01			, 0 },;				// Situacao
	{ "ECYRES"		, "C", aTamCCRes[1], 0 },;  			// Codigo Reduzido do Centro de Custo
	{ "ECYDESC" 	, "C", nTamCC		, 0 },;  			// Descricao do Centro de Custo
	{ "SALDOANT"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior
	{ "SALDOANTDB"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Debito
	{ "SALDOANTCR"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Credito
	{ "SALDODEB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Debito
	{ "SALDOCRD"	, "N", aTamVal[1]+2	, nDecimais },;  	// Credito
	{ "SALDOATU"	, "N", aTamVal[1]+1	, nDecimais },;  	// Saldo Atual
	{ "SALDOATUDB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Debito
	{ "SALDOATUCR"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Credito
	{ "MOVIMENTO"	, "N", aTamVal[1]+2	, nDecimais },;  	// Movimento do Periodo
	{ "TIPOECX"	, "C", 01			, 0 },;				// Conta Analitica / Sintetica
	{ "TIPOECY"  	, "C", 01			, 0 },;				// Centro de Custo Analitico / Sintetico
	{ "ORDEM"		, "C", 10			, 0 },;				// Ordem
	{ "GRUPO"		, "C", nTamGrupo	, 0 },;				// Grupo Contabil
	{ "IDENTIFI"	, "C", 01			, 0 },;
		{ "TOTVIS"		, "C", 01			, 0 },;
		{ "SLDENT"		, "C", 01			, 0 },;
		{ "FATSLD"		, "C", 01			, 0 },;
		{ "VISENT"		, "C", 01			, 0 },;
		{ "ESTOUR" 	, "C", 01			, 0 },;			 	//Define se a conta esta estourada ou nao
	{ "NIVEL1"		, "L", 01			, 0 },;
		{ "NATCTA"     , "C", 02           , 0 }}             //NATCTA -campo de natureza da conta para relatorio CTBR047

	// totalizador do relatorio
Else
	If !Empty(cPlanoRef) .And. !Empty(cVersao)
		nTamCt	:= 70
	Else
		nTamCt	:= aTamConta[1]
	Endif
	aCampos := { { "CONTA"		, "C", nTamCt, 0 },;  			// Codigo da Conta
	{ "SUPERIOR"	, "C", nTamCt, 0 },;				// Conta Superior
	{ "NORMAL"		, "C", 01			, 0 },;				// Situacao
	{ "CTARES"		, "C", aTamCtaRes[1], 0 },;  			// Codigo Reduzido da Conta
	{ "DESCCTA"	, "C", nTamCta		, 0 },;  			// Descricao da Conta
	{ "CUSTO"		, "C", aTamCC[1]	, 0 },; 	 		// Codigo do Centro de Custo
	{ "CCRES"		, "C", aTamCCRes[1], 0 },;  			// Codigo Reduzido do Centro de Custo
	{ "DESCCC" 	, "C", nTamCC		, 0 },;  			// Descricao do Centro de Custo
	{ "ITEM"		, "C", aTamItem[1]	, 0 },; 	 		// Codigo do Item
	{ "ITEMRES" 	, "C", aTamItRes[1], 0 },;  			// Codigo Reduzido do Item
	{ "DESCITEM" 	, "C", nTamItem		, 0 },;  			// Descricao do Item
	{ "CLVL"		, "C", aTamClVl[1]	, 0 },; 	 		// Codigo da Classe de Valor
	{ "CLVLRES"	, "C", aTamCVRes[1], 0 },; 		 	// Cod. Red. Classe de Valor
	{ "DESCCLVL"   , "C", nTamClVl		, 0 },;  			// Descricao da Classe de Valor
	{ "SALDOANT"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior
	{ "SALDOANTDB"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Debito
	{ "SALDOANTCR"	, "N", aTamVal[1]+2	, nDecimais},; 		// Saldo Anterior Credito
	{ "SALDODEB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Debito
	{ "SALDOCRD"	, "N", aTamVal[1]+2	, nDecimais },;  	// Credito
	{ "SALDOATU"	, "N", aTamVal[1]+1	, nDecimais },;  	// Saldo Atual
	{ "SALDOATUDB"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Debito
	{ "SALDOATUCR"	, "N", aTamVal[1]+2	, nDecimais },;  	// Saldo Atual Credito
	{ "MOVIMENTO"	, "N", aTamVal[1]+2	, nDecimais },;  	// Movimento do Periodo
	{ "TIPOCONTA"	, "C", 01			, 0 },;				// Conta Analitica / Sintetica
	{ "TIPOCC"  	, "C", 01			, 0 },;				// Centro de Custo Analitico / Sintetico
	{ "TIPOITEM"	, "C", 01			, 0 },;				// Item Analitica / Sintetica
	{ "TIPOCLVL"	, "C", 01			, 0 },;				// Classe de Valor Analitica / Sintetica
	{ "CCSUP"		, "C", aTamCC[1]	, 0 },;				// Codigo do Centro de Custo Superior
    { "CCNORMAL"  	, "C", 01			, 0 },;				// Situacao
	{ "ITSUP"		, "C", aTamItem[1]	, 0 },;				// Codigo do Item Superior
    { "ITNORMAL"  	, "C", 01			, 0 },;				// Situacao
	{ "CLSUP"	    , "C", aTamClVl[1] , 0 },;				// Codigo da Classe de Valor Superior
    { "CLNORMAL"  	, "C", 01			, 0 },;				// Situacao
	{ "ORDEM"		, "C", 10			, 0 },;				// Ordem
	{ "GRUPO"		, "C", nTamGrupo	, 0 },;				// Grupo Contabil
	{ "IDENTIFI"	, "C", 01			, 0 },;
		{ "TOTVIS"		, "C", 01			, 0 },;
		{ "SLDENT"		, "C", 01			, 0 },;
		{ "FATSLD"		, "C", 01			, 0 },;
		{ "VISENT"		, "C", 01			, 0 },;
		{ "ESTOUR" 	, "C", 01			, 0 },;			 	//Define se a conta esta estourada ou nao
	{ "NIVEL1"		, "L", 01			, 0 },;
		{ "NATCTA"     , "C", 02           , 0 }}             //NATCTA -campo de natureza da conta para relatorio CTBR047
	// Logico para identificar se
	// eh de nivel 1 -> usado como
	// totalizador do relatorio]

	If _lCtbIsCube
		aAreaAnt := GetArea()
		DbSelectArea('CT0')
		DbSetOrder(1)
		If DbSeek( xFilial('CT0') + '05' )
			While CT0->(!Eof()) .And. CT0->CT0_FILIAL == xFilial('CT0')

				AADD( aCampos,{ "CODENT"+CT0->CT0_ID	, "C", TamSx3(CT0->CT0_CPOCHV)[1]	, 0 } )
				AADD( aCampos,{ "DESCENT"+CT0->CT0_ID  	, "C", TamSx3(CT0->CT0_CPODSC)[1]	, 0 } )
				AADD( aCampos,{ "TIPOENT"+CT0->CT0_ID  	, "C", 01	, 0 } )

				CT0->(DbSkip())
			EndDo
		EndIf
		RestArea(aAreaAnt)
	EndIf

	// Usado no mutacoes de patrimonio liquido inclui campo que alem da descricao da entidade
	// Que esta no DESCCTA tem tambem a descricao da conta inicial CTS_CT1INI
	If 	Type("lTRegCts") # "U" .And. ValType(lTRegCts) = "L" .And. lTRegCts
		Aadd(aCampos, { "DESCORIG"	, "C", nTamCta		, 0 } )	// Descricao da Origem do Valor
	Endif
	Aadd( aCampos, { "DESCCONT", "C", 200, 0 } ) //Descri  o da origem do valor
EndIf

Aadd(aCampos, { "FILIAL"	, "C", nTamFilial, 0 } )	// Cria Filial do Sistema

If CTS->(FieldPos("CTS_COLUNA")) > 0
	Aadd(aCampos, { "COLUNA"   	, "N", 01			, 0 })
EndIf

If CTS->(FieldPos("CTS_IMPSAL")) > 0
	Aadd(aCampos, { "IMPSAL"   	, "C", 01			, 0 })
EndIf

If 	Type("dSemestre") # "U" .And. ValType(dSemestre) = "D"
	Aadd(aCampos, { "SALDOSEM"	, "N", 17		, nDecimais }) 	// Saldo semestre
Endif

If Type("dPeriodo0") # "U" .And. ValType(dPeriodo0) = "D"
	Aadd(aCampos, { "SALDOPER"	, "N", 17		, nDecimais }) 	// Saldo Periodo determinado
	Aadd(aCampos, { "MOVIMPER"	, "N", 17		, nDecimais }) 	// Saldo Periodo determinado
Endif

If Type("lComNivel") # "U" .And. ValType(lComNivel) = "L"
	Aadd(aCampos, { "NIVEL"   	, "N", 02			, 0 })		// Nivel hieraquirco - Quanto maior mais analitico
Endif

If ( cAlias = "CT7" .And. SuperGetMv("MV_CTASUP") = "S" ) .Or. ;
		( cAlias = "CT3" .And. SuperGetMv("MV_CTASUP") = "S" ) .Or. ;
		(cAlias == "CTU" .And. cIdent == "CTT" .And. GetNewPar("MV_CCSUP","")  == "S")  .Or. ;
		(cAlias == "CTU" .And. cIdent == "CTD" .And. GetNewPar("MV_ITSUP","") == "S") .Or. ;
		(cAlias == "CTU" .And. cIdent == "CTH" .And. GetNewPar("MV_CLSUP","") == "S")
	Aadd(aCampos, { "ORDEMPRN" 	, "N", 06			, 0 })		// Ordem para impressao
Endif

If cPaisLoc =="RUS"
	Aadd(aCampos, { "INIBALANCE"		, "N" , 17			, nDecimais })
EndIf

If lMovPeriodo
	Aadd(aCampos, { "MOVPERANT"		, "N" , 17			, nDecimais }) 	// Saldo Periodo Anterior
EndIf

If lGrvJson
	Aadd(aCampos, { "NIVJSON"		, "C" , 30			, 0 }) 	// N vel para exportacao dos arquivos JSON
EndIf

///// TRATAMENTO PARA ATUALIZA  O DE SALDO BASE
//Se os saldos basicos nao foram atualizados na dig. lancamentos
If !lAtSldBase .And. !__IsCtbJob
	dIniRep := ctod("")
	If Need2Reproc(dDataFim,cMoeda,cSaldos,@dIniRep)
		//Chama Rotina de Atualizacao de Saldos Basicos.
		oProcess := MsNewProcess():New({|lEnd|	CTBA190(.T.,dIniRep,dDataFim,cFilAnt,cFilAnt,cSaldos,.T.,cMoeda) },"","",.F.)
		oProcess:Activate()
	EndIf
Endif

//// TRATAMENTO PARA ATUALIZA  O DE SALDOS COMPOSTOS ANTES DE EXECUTAR A QUERY DE FILTRAGEM
Do Case
Case cAlias == 'CTU'
	//Verificar se tem algum saldo a ser atualizado por entidade
	If cIdent == "CTT"
		cOrigem := 	'CT3'
	ElseIf cIdent == "CTD"
		cOrigem := 	'CT4'
	ElseIf cIdent == "CTH"
		cOrigem := 	'CTI'
	Else
		cOrigem := 	'CTI'
	Endif
Case cAlias == 'CTV'
	cOrigem := "CT4"
	//Verificar se tem algum saldo a ser atualizado
Case cAlias == 'CTW'
	cOrigem		:= 'CTI'	/// HEADER POR CLASSE DE VALORES
	//Verificar se tem algum saldo a ser atualizado
Case cAlias == 'CTX'
	cOrigem		:= 'CTI'
EndCase

Do Case
	/************************************
	Consulta saldo pelo cubo contabil
	//************************************/
Case cAlias  == "CVY"
	cEntidIni	:= cContaIni
	cEntidFim	:= cContaFim
	cCodMasc	:= aSetOfBook[2]
	cChave 		:= "ECX+ECY"
	aChave  	:= {"ECX","ECY"}

	//Se nao tiver plano gerencial.
	If Empty(aSetOfBook[5])
		/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
		If cFilUsu == ".T."
			cFilUsu := ""
		EndIf
		CtbRunCube(dDataIni,dDataFim,cAlias,cEntidIni,cEntidFim,cCCIni,cCCFim,cMoeda,;
			cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUsu,cMoedaDsc,aSelFil,dDtCorte,lTodasFil,aTmpFil)

		If Empty(cFilUSU)
			cFILUSU := ".T."
		Endif
		lTemQuery := .T.
	Endif


Case cAlias  == "CT7"
	cEntidIni	:= cContaIni
	cEntidFim	:= cContaFim
	cCodMasc		:= aSetOfBook[2]
	If nGrupo == 1
		cChave 	:= "CONTA+GRUPO"
		aChave	:= {"CONTA","GRUPO"}
	Else									// Indice por Grupo -> Totaliza por grupo
		cChave 	:= "CONTA"
		aChave	:= {"CONTA"}
	EndIf

	//Se nao tiver plano gerencial.
	If Empty(aSetOfBook[5])
		/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
		If cFilUsu == ".T."
			cFilUsu := ""
		EndIf
		CT7BlnQry(dDataIni,dDataFim,cAlias,cEntidIni,cEntidFim,cMoeda,;
			cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUsu,cMoedaDsc,aSelFil,dDtCorte,lTodasFil,aTmpFil)
		If Empty(cFilUSU)
			cFILUSU := ".T."
		Endif
		lTemQuery := .T.
	Endif


Case cAlias == 'CT3'
	cEntidIni	:= cCCIni
	cEntidFim	:= cCCFim

	If lImpConta
		If cHeader == "CT1"
			cChave		:= "CONTA+CUSTO"
			aChave		:=  {"CONTA","CUSTO"}
			cCodMasc	:= aSetOfBook[6]
		Else
			If nGrupo == 2
				cChave   := "CUSTO+CONTA"
				aChave   := {"CUSTO","CONTA"}
			Else									// Indice por Grupo -> Totaliza por grupo
				cChave 	:= "CUSTO+CONTA+GRUPO"
				aChave  := {"CUSTO","CONTA","GRUPO"}
			EndIf
			cCodMasc	:= aSetOfBook[2]
			cMascaraG	:= aSetOfBook[6]
			lEntSint	:= lCttSint
			cEntid_de	:= cEntidIni
			cEntid_ate	:= cEntidFim
		Endif
	Else		//Balancete de Centro de Custo (filtrando por conta)
		cChave		:= "CUSTO"
		aChave   	:= {"CUSTO"}
		cCodMasc:= aSetOfBook[6]
	EndIf


	If  Empty(aSetOfBook[5])
		If cFilUsu == ".T."
			cFilUsu := ""
		EndIf
		If lImpConta
			IF !lCompEnt
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CT3BlnQry(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cMoeda,;
					cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUSU,aSelFil,lTodasFil,aTmpFil)
			Else
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CT3BlnQryC(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cMoeda,;
					cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUSU,aSelFil,,aTmpFil)
			Endif
		Else
			Ct3Bln1Ent(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cMoeda,;
				cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLP,dDataLP,cFilUsu,;
				lRecDesp0,cRecDesp,dDtZeraRD,aSelFil,lTodasFil,aTmpFil)
		EndIf
		lTemQuery := .T.
		If Empty(cFilUSU)
			cFILUSU := ".T."
		Endif
	EndIf


Case cAlias =='CT4'
	If lImp3Ent	//Balancete CC / Conta / Item
		If cHeader == "CTT"
			If  Empty(aSetOfBook[5])
				If cFilUsu == ".T."
					cFilUsu := ""
				EndIf
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CT4Bln3Ent(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cItemIni,cItemFim,cMoeda,;
					cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUSU,aSelFil,lTodasFil,aTmpFil)
				lTemQuery := .T.
				If Empty(cFilUSU)
					cFILUSU := ".T."
				Endif
			EndIf

			cEntidIni	:= cCCIni
			cEntidFim	:= cCCFim
			cChave		:= "CUSTO+CONTA+ITEM"
			//cChave		:= "(cArqTmpAnt)->CUSTO+cContaRef+(cArqTmpAnt)->CUSTO"
			aChave 		:= {"CUSTO","CONTA","ITEM"}
			cCodMasc	:= aSetOfBook[2]
		EndIf
	Else
		cEntidIni	:= cItemIni
		cEntidFim	:= cItemFim
		If lImpConta
			If cHeader == "CT1"	//Se for for Balancete Conta x Item
				cChave			:= "CONTA+ITEM"
				aChave   		:= {"CONTA","ITEM"}
				cCodMasc		:= aSetOfBook[7]
			Else
				cChave   		:= "ITEM+CONTA"
				aChave   		:= {"ITEM","CONTA"}
				cCodMasc		:= aSetOfBook[2]
				cMascaraG		:= aSetOfBook[7]
				lEntSint		:= lCttSint
				cEntid_de		:= cEntidIni
				cEntid_ate		:= cEntidFim
			EndIf
		Else	//Balancete de Item filtrando por conta
			cChave			:= "ITEM"
			aChave  	 	:= {"ITEM"}
			cCodMasc		:= aSetOfBook[7]
		EndIf

		If  Empty(aSetOfBook[5])
			If cFilUsu == ".T."
				cFilUsu := ""
			EndIf
			If lImpConta
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CT4BlnQry(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cItemIni,cItemFim,cMoeda,;
					cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUSU,aSelFil,lTodasFil,aTmpFil)
			Else
				Ct4Bln1Ent(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cItemIni,cItemFim,;
					cMoeda,cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLP,dDataLP,cFilUsu,;
					lRecDesp0,cRecDesp,dDtZeraRD,aSelFil,lTodasFil,aTmpFil)
			EndIf
			lTemQuery := .T.
			If Empty(cFilUSU)
				cFILUSU := ".T."
			Endif
		EndIf

	EndIf
Case cAlias == 'CTI'
	If lImp4Ent	//Balancete CC x Cta x Item x Cl.Valor
		If cHeader == "CTT"

			If  Empty(aSetOfBook[5]) .and. !lImpAntLP
				If cFilUsu == ".T."
					cFilUsu := ""
				EndIf
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CTIBln4Ent(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cItemIni,cItemFim,;
					cClVlIni,cClVlFim,cMoeda,cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,aSelFil,lTodasFil,aTmpFil)
				lTemQuery := .T.
				If Empty(cFilUSU)
					cFILUSU := ".T."
				Endif
			EndIf
			cChave		:= "CUSTO+CONTA+ITEM+CLVL"
			aChave   	:= {"CUSTO","CONTA","ITEM","CLVL"}
			cEntidIni	:= cCCIni
			cEntidFim	:= cCCFim
			cCodMasc	:= aSetOfBook[2]
		EndIf
	Else
		cEntidIni	:= cClVlIni
		cEntidFim	:= cClvlFim

		lEntSint	:= lCttSint
		cEntid_de	:= cEntidIni
		cEntid_ate	:= cEntidFim

		If lImpConta
			If cHeader == "CT1"
				cChave		:= "CONTA+CLVL"
				aChave   	:= {"CONTA","CLVL"}
				cCodMasc	:= aSetOfBook[2]
			Else
				cChave   	:= "CLVL+CONTA"
				aChave   	:= {"CLVL","CONTA"}
				cCodMasc		:= aSetOfBook[2]
				cMascaraG		:= aSetOfBook[8]
			EndIf

			If Empty(aSetOfBook[5])
				If cFilUsu == ".T."
					cFilUsu := ""
				EndIf
				/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
				CTIBlnQry(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cClVlIni,cClVlFim,cMoeda,;
					cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLp,dDataLP,cFilUSU,aSelFil,lTodasFil,aTmpFil)
				lTemQuery := .T.
				If Empty(cFilUSU)
					cFILUSU := ".T."
				Endif
			EndIf
		Else	//Balancete de Cl.Valor filtrando por conta
			cChave   := "CLVL"
			aChave   := {"CLVL"}
			cCodMasc := aSetOfBook[8]
			If  Empty(aSetOfBook[5])
				If cFilUsu == ".T."
					cFilUsu := ""
				EndIf
				CtIBln1Ent(dDataIni,dDataFim,cAlias,cContaIni,cContaFim,cCCIni,cCCFim,cItemIni,cItemFim,;
					cClVlIni,cClVlFim,cMoeda,cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLP,dDataLP,cFilUsu,;
					lRecDesp0,cRecDesp,dDtZeraRD,aSelFil,lTodasFil,aTmpFil)
				lTemQuery := .T.
				If Empty(cFilUSU)
					cFILUSU := ".T."
				Endif
			EndIf
		EndIf
	EndIf
Case cAlias == 'CTU'
	If cIdent == 'CTT'
		cEntidIni	:= cCCIni
		cEntidFim	:= cCCFim
		cChave		:= "CUSTO"
		aChave  	:= {"CUSTO"}
		cCodMasc		:= aSetOfBook[6]
	ElseIf cIdent == 'CTD'
		cEntidIni	:= cItemIni
		cEntidFim	:= cItemFim
		cChave   	:= "ITEM"
		aChave   	:= {"ITEM"}
		cCodMasc		:= aSetOfBook[7]
	ElseIf cIdent == 'CTH'
		cEntidIni	:= cClVlIni
		cEntidFim	:= cClvlFim
		cChave  	:= "CLVL"
		aChave   	:= {"CLVL"}
		cCodMasc		:= aSetOfBook[8]
	Endif

	If  Empty(aSetOfBook[5])
		/// EXECUTA QUERY RETORNANDO A ESTRUTURA E SALDOS NO ALIAS TRBTMP
		If cFilUsu == ".T."
			cFilUsu := ""
		EndIf
		CTUBlnQry(dDataIni,dDataFim,cAlias,cIdent,cEntidIni,cEntidFim,cMoeda,cSaldos,aSetOfBook,lImpMov,lVlrZerado,lImpAntLP,dDataLP,cFilUsu,aSelFil,lTodasFil,aTmpFil)
		lTEmQuery := .T.
		If Empty(cFilUSU)
			cFILUSU := ".T."
		Endif
	EndIf
Case cAlias == 'CTV'
	If cHeader == 'CTT'
		cChave   	:= "CUSTO+ITEM"
		aChave   	:= {"CUSTO","ITEM"}
		cEntidIni1	:= cCCIni
		cEntidFim1	:= cCCFim
		cEntidIni2	:= cItemIni
		cEntidFim2	:= cItemFim
	ElseIf cHeader == 'CTD'
		cChave   	:= "ITEM+CUSTO"
		aChave   	:= {"ITEM","CUSTO"}
		cEntidIni1	:= cItemIni
		cEntidFim1	:= cItemFim
		cEntidIni2	:= cCCIni
		cEntidFim2	:= cCCFim
	EndIf
Case cAlias == 'CTW'
	If cHeader	== 'CTT'
		cChave   	:= "CUSTO+CLVL"
		aChave   	:= {"CUSTO","CLVL"}
		cEntidIni1	:=	cCCIni
		cEntidFim1	:=	cCCFim
		cEntidIni2	:=	cClVlIni
		cEntidFim2	:=	cClVlFim
	ElseIf cHeader == 'CTH'
		cChave   	:= "CLVL+CUSTO"
		aChave   	:= {"CLVL","CUSTO"}
		cEntidIni1	:=	cClVlIni
		cEntidFim1	:=	cClVlFim
		cEntidIni2	:=	cCCIni
		cEntidFim2	:=	cCCFim
	EndIf
Case cAlias == 'CTX'
	If cHeader == 'CTD'
		cChave  	:= "ITEM+CLVL"
		aChave		:=  {"ITEM","CLVL"}
		cEntidIni1	:= 	cItemIni
		cEntidFim1	:= 	cItemFim
		cEntidIni2	:= 	cClVlIni
		cEntidFim2	:= 	cClVlFim
	ElseIf cHeader == 'CTH'
		cChave  	:= "CLVL+ITEM"
		aChave		:= {"CLVL","ITEM"}
		cEntidIni1	:= 	cClVlIni
		cEntidFim1	:= 	cClVlFim
		cEntidIni2	:= 	cItemIni
		cEntidFim2	:= 	cItemFim
	EndIf
Case cAlias	== 'CTY'
	cChave			:="ENTID1+ENTID2"
	aChave			:= {"ENTID1","ENTID2"}
	If cHeader == 'CTT' .And. cFiltroEnt == 'CTD'
		cEntidIni1	:= cCCIni
		cEntidFim1	:= cCCFim
		cEntidIni2	:= cClVlIni
		cEntidFim2	:= cClvlFim
	ElseIf cHeader == 'CTT' .And. cFiltroEnt == 'CTH'
		cEntidIni1	:= cCCIni
		cEntidFim1	:= cCCFim
		cEntidIni2	:= cItemIni
		cEntidFim2	:= cItemFim
	ElseIf cHeader == 'CTD' .And. cFiltroEnt == 'CTT'
		cEntidIni1	:= cItemIni
		cEntidFim1	:= cItemFim
		cEntidIni2	:= cClVlIni
		cEntidFim2	:= cClVlFim
	ElseIf cHeader == 'CTD' .And. cFiltroEnt == 'CTH'
		cEntidIni1	:= cItemIni
		cEntidFim1	:= cItemFim
		cEntidIni2	:= cCCIni
		cEntidFim2	:= cCCFim
	ElseIf cHeader == 'CTH' .And. cFiltroEnt == 'CTT'
		cEntidIni1	:= cClVlIni
		cEntidFim1	:= cClVlFim
		cEntidIni2	:= cItemIni
		cEntidFim2	:= cItemFim
	ElseIf cHeader == 'CTH' .And. cFiltroEnt == 'CTD'
		cEntidIni1	:= cClVlIni
		cEntidFim1	:= cClVlFim
		cEntidIni2	:= cCCIni
		cEntidFim2	:= cCCFim
	EndIf
EndCase

If !Empty(aSetOfBook[5])				// Indica qual o Plano Gerencial Anexado
	If cAlias $ "CT3/CT4/CTI"		//Se for Balancete Entidade/Entidade Gerencial
		Do Case
		Case cAlias == "CT3"
			cChave	:= "CUSTO+CONTA"
			aChave  := {"CUSTO","CONTA"}
		Case cAlias == "CT4"
			cChave	:= "ITEM+CONTA"
			aChave  := {"ITEM","CONTA"}
		Case cAlias == "CTI"
			cChave	:= "CLVL+CONTA"
			aChave  := {"CLVL","CONTA"}
		EndCase
	ElseIf cAlias = 'CTU'
		Do Case
		Case cIdent = 'CTT'
			cChave	:= "CUSTO"
			aChave  := {"CUSTO"}
		Case cIdent = 'CTD'
			cChave	:= "ITEM"
			aChave  := {"ITEM"}
		Case cIdent = 'CTH'
			cChave	:= "CLVL"
			aChave  := {"CLVL"}
		EndCase
	ElseIf cAlias  == "CVY"
		cChave := "ECX+ECY"
		aChave  := {"ECX","ECY"}
	Else
		If _lCtbIsCube
			If !Empty(cCodEntidade)
				cChave	:= "CODENT"+cCodEntidade
				aChave  := {"CODENT",cCodEntidade}
			Else
				cChave	:= "CONTA"
				aChave  := {"CONTA"}
			EndIf
		Else
			cChave	:= "CONTA"
			aChave  := {"CONTA"}
		EndIF
	EndIf
Endif

If Empty( aCampos )
	ConOutR("Erro na criacao da tabela temporaria")
	Return .F.
EndIf

//-------------------
//Cria  o do objeto
//-------------------
_oTempTable := FWTemporaryTable():New(cArqAux)
_oTempTable:SetFields( aCampos )

lCriaInd := .T.
_oTempTable:AddIndex("1", aChave)
If !Empty(aSetOfBook[5])				// Indica qual o Plano Gerencial Anexado
	_oTempTable:AddIndex("2", {"ORDEM"})
Endif

If Ascan(aCampos,{|x|Upper(Alltrim(x[1])) == "ORDEMPRN"}) > 0
	_oTempTable:AddIndex("3", {"ORDEMPRN"})
	If cAlias == "CT7" .OR. cAlias == "CT3"
		If Alltrim(Upper(FunName())) == "CTBR180"
			_oTempTable:AddIndex("4", {"CUSTO","SUPERIOR","CONTA"})
		Else
			_oTempTable:AddIndex("4", {"SUPERIOR","CONTA"})
		EndIf
	ElseIf cAlias == "CTU"
		If cIdent == "CTT"
			_oTempTable:AddIndex("4", {"CCSUP","CUSTO"})
		ElseIf cIdent == "CTD"
			_oTempTable:AddIndex("4", {"ITSUP","ITEM"})
		ElseIf cIdent == "CTH"
			_oTempTable:AddIndex("4", {"CLSUP","CLVL"})
		EndIf
	EndIf
EndIf
//------------------
//Cria  o da tabela
//------------------
_oTempTable:Create()

cTableNam1 		:= _oTempTable:GetRealName()

DbSelectarea(cArqAux)
_oHashCt1 := Nil

If _oHashCt1 == Nil;
	.And. ((cArqAux)->( FieldPos( "NATCTA" ) ) > 0;
	.AND.	(cAlias == "CT3" .AND. cHeader $ "CT1|CTT");
	.OR.	(cAlias == "CT4" .And. cHeader == "CTD");
	.OR.	(cAlias == "CTI" .And. cHeader == "CTH");
	.OR.	cAlias == "CT7")

	CtbLoadHash(cContaIni,cContaFim)
EndIf

If !Empty(cPlanoRef) .Or. !Empty(cVersao)
	If !VldPlRef(aSetOfBook[1],cPlanoRef, cVersao)
		Return(cArqTmp)
	EndIf
Endif

//                                                              ?
//  Cria Indice Temporario do Arquivo de Trabalho 1.              
//                                                                
If lCriaInd
	dbSelectArea(cArqAux)
Endif

If FunName() <> "CTBR195" .or. (FunName() == "CTBR195" .and. !lImpAntLP)

	If lTemQuery .and. Select("TRBTMP") > 0 	/// E O ALIAS TRBTMP ESTIVER ABERTO (INDICANDO QUE A QUERY FOI EXECUTADA)
		If !Empty(cSegmento)
			If Len(aSetOfBook) == 0 .or. Empty(aSetOfBook[1])
				Help("CTN_CODIGO")
				Return(cArqTmp)
			Endif
			dbSelectArea("CTM")
			dbSetOrder(1)
			If MsSeek(xFilial()+cCodMasc)
				While !Eof() .And. CTM->CTM_FILIAL == xFilial() .And. CTM->CTM_CODIGO == cCodMasc
					nPos += Val(CTM->CTM_DIGITO)
					If CTM->CTM_SEGMEN == strzero(val(cSegmento),2)
						nPos -= Val(CTM->CTM_DIGITO)
						nPos ++
						nDigitos := Val(CTM->CTM_DIGITO)
						Exit
					EndIf
					dbSkip()
				EndDo
			Else
				Help("CTM_CODIGO")
				Return(cArqTmp)
			EndIf
		EndIf

		If !Empty(cMascaraG) .And. ;
		((cAlias == "CT3" .And. cHeader == "CTT") .Or. (cAlias == "CT4" .And. cHeader == "CTD") .Or.(cAlias == "CTI" .And. cHeader == "CTH"))
			If !Empty(cSegmentoG)
				dbSelectArea("CTM")
				dbSetOrder(1)
				If MsSeek(xFilial()+cMascaraG)
					While !Eof() .And. CTM->CTM_FILIAL == xFilial() .And. CTM->CTM_CODIGO == cMascaraG
						nPosG += Val(CTM->CTM_DIGITO)
						If CTM->CTM_SEGMEN == cSegmentoG
							nPosG -= Val(CTM->CTM_DIGITO)
							nPosG ++
							nDigitosG := Val(CTM->CTM_DIGITO)
							Exit
						EndIf
						dbSkip()
					EndDo
				EndIf
			EndIf
		EndIf

		dbSelectArea("TRBTMP")
		aStruTMP := dbStruct()			/// OBTEM A ESTRUTURA DO TMP

		nCampoLP	 := Ascan(aStruTMP,{|x| x[1]=="SLDLPANTDB"})
		dbSelectArea("TRBTMP")
		If ValType(oMeter) == "O"
			oMeter:SetTotal(TRBTMP->(RecCount()))
			oMeter:Set(0)
		EndIf

		lCT1DTEXSF := Type('TRBTMP->CT1DTEXSF') <> 'U'
		lCTTDTEXSF := Type('TRBTMP->CTTDTEXSF') <> 'U'
		lCTDDTEXSF := Type('TRBTMP->CTDDTEXSF') <> 'U'
		lCTHDTEXSF := Type('TRBTMP->CTHDTEXSF') <> 'U'

		lSLDANTCTDB := Type('(cArqAux)->SLDANTCTDB') <> 'U'
		lSLDANTCTCR := Type('(cArqAux)->SLDANTCTCR') <> 'U'
		lSLLPATCTDB := Type('(cArqAux)->SLLPATCTDB') <> 'U'
		lSLLPATCTCR := Type('(cArqAux)->SLLPATCTCR') <> 'U'


		dbGoTop() // POSICIONA NO 1  REGISTRO DO TMP
		While TRBTMP->(!Eof())			/// REPLICA OS DADOS DA QUERY (TRBTMP) PARA P/ O TEMPORARIO EM DISCO

			//Se nao considera apuracao de L/P sera verificado na propria query
			dbSelectArea("TRBTMP")
			If !lVlrZerado .And. lImpAntLP
				If TRBTMP->((SALDOANTDB - SLDLPANTDB) - (SALDOANTCR - SLDLPANTCR)) == 0 .And. ;
						TRBTMP->(SALDODEB-MOVLPDEB) == 0 .And. TRBTMP->(SALDOCRD-MOVLPCRD) == 0
					TRBTMP->(dbSkip())
					Loop
				EndIf
			ElseIf !lVlrZerado
				If TRBTMP->(SALDOANTDB - SALDOANTCR) == 0 .And. TRBTMP->SALDODEB == 0 .And. TRBTMP->SALDOCRD == 0
					TRBTMP->(dbSkip())
					Loop
				EndIf
			EndIf

			//Verificacao da  Data Final de Existencia da Entidade somente se imprime saldo zerado
			// e se realemten nao tiver saldo e movimento para a entidade. Caso tenha algum movimento
			//ou saldo devera imprimir.
			If lVlrZerado
				If lImpAntLP
					If ((SALDOANTDB - SLDLPANTDB) == 0 .And. (SALDOANTCR - SLDLPANTCR) == 0 .And. ;
							(SALDODEB-MOVLPDEB) == 0 .And. (SALDOCRD-MOVLPCRD) == 0)
						//Se a data de existencia final  da entidade estiver preenchida e a data inicial do
						//relatorio for maior, nao ira imprimir a entidade.
						If  cAlias $ "CT7/CT3/CT4/CTI"
							If lCT1EXDTFIM .And. lCT1DTEXSF
								IF !Empty(TRBTMP->CT1DTEXSF) .And. (dDataIni > TRBTMP->CT1DTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								EndIf
							EndIf
						Endif

						If cAlias == "CT3" .Or. ( cAlias == "CTU" .And. cIdent == "CTT")  .Or. ( cAlias == "CTI" .And. lImp4Ent)
							If lCTTEXDTFIM .And. lCTTDTEXSF
								If !Empty(TRBTMP->CTTDTEXSF) .And. (dDataIni > TRBTMP->CTTDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								EndIf
							Endif
						EndIf

						If cAlias == "CT4" .Or. ( cAlias == "CTU" .And. cIdent == "CTD") .Or. ( cAlias == "CTI" .And. lImp4Ent)
							If lCTDEXDTFIM .And. lCTDDTEXSF
								IF !Empty(TRBTMP->CTDDTEXSF) .And. (dDataIni > TRBTMP->CTDDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								EndIf
							EndIf
						Endif

						If cAlias == "CTI"	.Or. ( cAlias == "CTU" .And. cIdent == "CTH")
							If lCTHEXDTFIM .And. lCTHDTEXSF
								If !Empty(TRBTMP->CTHDTEXSF) .And. (dDataIni > TRBTMP->CTHDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								Endif
							EndIf
						EndIf
					EndIf
				Else
					If (SALDOANTDB  == 0 .And. SALDOANTCR  == 0 .And. SALDODEB == 0 .And. SALDOCRD == 0)
						If cAlias $ "CT7/CT3/CT4/CTI" .And. lCT1DTEXSF
							If lCT1EXDTFIM .AND. !Empty(TRBTMP->CT1DTEXSF) .And. (dDataIni > TRBTMP->CT1DTEXSF)
								dbSelectArea("TRBTMP")
								TRBTMP->(dbSkip())
								Loop
							EndIf
						EndIf

						If cAlias == "CT3" .Or. ( cAlias == "CTU" .And. cIdent == "CTT") .Or. ( cAlias == "CTI" .And. lImp4Ent)
							If lCTTEXDTFIM .And. lCTTDTEXSF
								IF !Empty(TRBTMP->CTTDTEXSF) .And. (dDataIni > TRBTMP->CTTDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								Endif
							EndIf
						EndIf

						If cAlias == "CT4" .Or. ( cAlias == "CTU" .And. cIdent == "CTD")  .Or. ( cAlias == "CTI" .And. lImp4Ent)
							If lCTDEXDTFIM .And. lCTDDTEXSF
								IF !Empty(TRBTMP->CTDDTEXSF) .And. (dDataIni > TRBTMP->CTDDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								EndIf
							Endif
						EndIf

						If cAlias == "CTI"	.Or. ( cAlias == "CTU" .And. cIdent == "CTH")
							If lCTHEXDTFIM .And. lCTHDTEXSF
								IF !Empty(TRBTMP->CTHDTEXSF) .And. (dDataIni > TRBTMP->CTHDTEXSF)
									dbSelectArea("TRBTMP")
									TRBTMP->(dbSkip())
									Loop
								EndIf
							Endif
						EndIf
					EndIf
				EndIf
			EndIf

			If cAlias == "CTU"
				Do Case
				Case cIdent	== "CTT"
					cCodigo	:= TRBTMP->CUSTO
				Case cIdent	== "CTD"
					cCodigo	:= TRBTMP->ITEM
				Case cIdent	== "CTH"
					cCodigo	:= TRBTMP->CLVL
				EndCase
			Else
				If lImpConta .Or. cAlias == "CT7"
					If cHeader == "CT1"
						If cAlias == "CT4"
							cCodigo	:= TRBTMP->ITEM
						ElseIf cAlias == "CT3"
							cCodigo	:= TRBTMP->CUSTO
						EndIf
					Else
						cCodigo	:= TRBTMP->CONTA
					EndIf
				Else
					If cAlias == "CT3"
						cCodigo	:= TRBTMP->CUSTO
					ElseIf cAlias == "CT4"
						cCodigo	:= TRBTMP->ITEM
					ElseIf cAlias == "CTI"
						cCodigo	:= TRBTMP->CLVL
					EndIf
				EndIf
				If cAlias == "CT3" .And. cHeader == "CTT"
					cCodGer	:= TRBTMP->CUSTO
				ElseIf cAlias == "CT4" .And. cHeader == "CTD"
					cCodGer	:= TRBTMP->ITEM
				ElseIf cAlias == "CTI" .And. cHeader == "CTH"
					cCodGer	:= TRBTMP->CLVL
				EndIf
			EndIf

			If Empty(cPlanoRef) .Or. Empty(cVersao)	//Verifica o segmento somente se nao for com plano referencial.
				If !Empty(cSegmento)
					If Empty(cSegIni) .And. Empty(cSegFim) .And. !Empty(cFiltSegm)
						If  !(Substr(cCodigo,nPos,nDigitos) $ (cFiltSegm) )
							TRBTMP->(dbSkip())
							Loop
						EndIf
					Else
						If Substr(cCodigo,nPos,nDigitos) < Alltrim(cSegIni) .Or. ;
								Substr(cCodigo,nPos,nDigitos) > Alltrim(cSegFim)
							TRBTMP->(dbSkip())
							Loop
						EndIf
					Endif
				EndIf


				//Caso faca filtragem por segmento gerencial,verifico se esta dentro
				//da solicitacao feita pelo usuario.
				If ( cAlias == "CT3" .And. cHeader == "CTT" ) .Or. ( cAlias == "CT4" .And. cHeader == "CTD" ) .Or.  ;
						 ( cAlias == "CTI" .And. cHeader == "CTH" )
					If !Empty(cSegmentoG)
						If Empty(cSegIniG) .And. Empty(cSegFimG) .And. !Empty(cFiltSegmG)
							If  !(Substr(cCodGer,nPosG,nDigitosG) $ (cFiltSegmG) )
								TRBTMP->(dbSkip())
								Loop
							EndIf
						Else
							If Substr(cCodGer,nPosG,nDigitosG) < Alltrim(cSegIniG) .Or. ;
								Substr(cCodGer,nPosG,nDigitosG) > Alltrim(cSegFimG)
								TRBTMP->(dbSkip())
								Loop
							EndIf
						Endif
					EndIf
				EndIf
			EndIf

			If &("TRBTMP->("+cFILUSU+")")
				RecLock(cArqAux,.T.)

				For nTRB := 1 to Len(aStruTMP)
					Field->&(aStruTMP[nTRB,1]) := TRBTMP->&(aStruTMP[nTRB,1])
					If Subs(aStruTmp[nTRB][1],1,6) $ "SALDODEB/SALDOCRD/SALDOANTDB/SALDOANTCR/SLDLPANTCR/SLDLPANTDB/MOVLPDEB/MOVLPCRD" .And. nDivide > 1
						Field->&(aStruTMP[nTRB,1])	:=((TRBTMP->&(aStruTMP[nTRB,1])))/ndivide
					EndIf
				Next

				If Alltrim(Upper(FunName())) <> "CTBR210"
					(cArqAux)->FILIAL	:= cFilAnt
				Endif

				If cAlias	== "CTU"
					Do Case
					Case cIdent	== "CTT"
						If Empty(TRBTMP->DESCCC)
							(cArqAux)->DESCCC		:= TRBTMP->DESCCC01
						EndIf
					Case cIdent == "CTD"
						If Empty(TRBTMP->DESCITEM)
							(cArqAux)->DESCITEM	:= TRBTMP->DESCIT01
						EndIf
					Case cIdent == "CTH"
						If Empty(TRBTMP->DESCCLVL)
							(cArqAux)->DESCCLVL	:= TRBTMP->DESCCV01
						EndIf
					EndCase
				Else
					If lCtbr140
						CT1->(dbSetOrder(1))
						If CT1->(dbSeek(xFilial("CT1")+TRBTMP->CONTA))
							(cArqAux)->DESCCTA := CT1->CT1_DESC01
						Else
							(cArqAux)->DESCCTA := " "
						EndIf
					Else
						If lImpConta .or. cAlias == "CT7"
							If Empty(TRBTMP->DESCCTA) .AND. TRBTMP->(FieldPos( "DESCCTA01" )) > 0 .AND. !Empty(TRBTMP->DESCCTA01)
								(cArqAux)->DESCCTA	:= TRBTMP->DESCCTA01
							EndIf
						EndIf
					EndIf

					If cAlias == "CT4"
						If !lImp3Ent
							If lCtbr140
								CTD->(dbSetOrder(1))
								If CTD->(dbSeek(xFilial("CTD")+TRBTMP->ITEM))
									(cArqAux)->DESCITEM	:= CTD->CTD_DESC01
								Else
									(cArqAux)->DESCITEM	:= " "
								EndIf
							Else
								If cMoeda <> '01' .And. Empty(TRBTMP->DESCITEM)
									(cArqAux)->DESCITEM	:= TRBTMP->DESCIT01
								EndIf
							EndIf
						EndIf

						If lImp3Ent	//Balancete CC / Conta / Item
							If Empty(TRBTMP->DESCCC)
								(cArqAux)->DESCCC	:= TRBTMP->DESCCC01
							EndIf

							If TRBTMP->ALIAS == 'CT4'
								If Empty(TRBTMP->DESCITEM)
									(cArqAux)->DESCITEM	:= TRBTMP->DESCIT01
								EndIf
							EndIf
						EndIf
					EndIf

					If cAlias == "CTI" .And. lImp4Ent
						If !Empty(CLVL)
							If Empty(TRBTMP->DESCCLVL)
								(cArqAux)->DESCCLVL	:= TRBTMP->DESCCV01
							EndIf
						EndiF

						If !Empty(ITEM)
							If Empty(TRBTMP->DESCITEM)
								(cArqAux)->DESCITEM	:= TRBTMP->DESCIT01
							EndIf
						Endif

						If !Empty(CUSTO)
							If Empty(TRBTMP->DESCCC)
								(cArqAux)->DESCCC		:= TRBTMP->DESCCC01
							EndIf
						EndIf
					EndIf
				EndIf

				//Se for Relatorio US Gaap
				If lUsGaap

					nSlAntGap	:= TRBTMP->(SALDOANTDB - SALDOANTCR)	// Saldo Anterior
					nSlAntGapD	:= TRBTMP->(SALDOANTDB)					// Saldo anterior debito
					nSlAntGapC	:= TRBTMP->(SALDOANTCR)					// Saldo anterior credito
					nSlAtuGap	:= TRBTMP->((SALDOANTDB+SALDODEB)- (SALDOANTCR+SALDOCRD))	// Saldo Atual
					nSlAtuGapD	:= TRBTMP->(SALDOANTDB+SALDODEB)					// Saldo Atual debito
					nSlAtuGapC	:= TRBTMP->(SALDOANTCR+SALDOCRD)					// Saldo Atual credito

					nSlDebGap	:= TRBTMP->((SALDOANTDB+SALDODEB) - SALDOANTDB)		// Saldo Debito
					nSlCrdGap	:= TRBTMP->((SALDOANTCR+SALDOCRD) - SALDOANTCR)		// Saldo Credito

					If cConsCrit $ "123" .Or. (cConsCrit == "5" .And. cCritPlCta $ "123")
						If cConsCrit == "5"
							(cArqAux)->SALDOANT	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAntGap)
							(cArqAux)->SALDOANTDB	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAntGapD)
							(cArqAux)->SALDOANTCR	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAntGapC)
							(cArqAux)->SALDOATU	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAtuGap)
							(cArqAux)->SALDOATUDB	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAtuGapD)
							(cArqAux)->SALDOATUCR	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlAntGapC)
							(cArqAux)->SALDODEB	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlDebGap)
							(cArqAux)->SALDOCRD	:= CtbConv(cCritPlCta,dDataConv,cMoedConv,nSlCrdGap)
						Else
							(cArqAux)->SALDOANT	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAntGap)
							(cArqAux)->SALDOANTDB	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAntGapD)
							(cArqAux)->SALDOANTCR	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAntGapC)
							(cArqAux)->SALDOATU	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAtuGap)
							(cArqAux)->SALDOATUDB	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAtuGapD)
							(cArqAux)->SALDOATUCR	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlAntGapC)
							(cArqAux)->SALDODEB	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlDebGap)
							(cArqAux)->SALDOCRD	:= CtbConv(cConsCrit,dDataConv,cMoedConv,nSlCrdGap)
						EndIf
					ElseIf cConsCrit == "4" .Or. (cConsCrit == "5" .And. cCritPlCta == "4")
						(cArqAux)->SALDOANT	:= nSlAntGap/nTaxaConv
						(cArqAux)->SALDOANTDB	:= nSlAntGapD/nTaxaConv
						(cArqAux)->SALDOANTCR	:= nSlAntGapC/nTaxaConv
						(cArqAux)->SALDOATU	:= nSlAtuGap/nTaxaConv
						(cArqAux)->SALDOATUDB	:= nSlAtuGapD/nTaxaConv
						(cArqAux)->SALDOATUCR	:= nSlAtuGapC/nTaxaConv
						(cArqAux)->SALDODEB	:= nSlDebGap/nTaxaConv
						(cArqAux)->SALDOCRD	:= nSlCrdGap/nTaxaConv
					EndIf
				EndIf

				If Empty( dDtCorte )
					If nCampoLP > 0
						(cArqAux)->SALDOANTDB	-= TRBTMP->SLDLPANTDB
						(cArqAux)->SALDOANTCR	-= TRBTMP->SLDLPANTCR
						(cArqAux)->SALDODEB		-= Iif(nDivide > 1, Round(NoRound(TRBTMP->MOVLPDEB,3)/nDivide, 2), TRBTMP->MOVLPDEB)
						(cArqAux)->SALDOCRD		-= Iif(nDivide > 1, Round(NoRound(TRBTMP->MOVLPCRD,3)/nDivide, 2), TRBTMP->MOVLPCRD)
					EndIf

					(cArqAux)->SALDOANT	 	:= (cArqAux)->(SALDOANTCR - SALDOANTDB)
					(cArqAux)->SALDOATUDB	:= (cArqAux)->(SALDOANTDB + SALDODEB)
					(cArqAux)->SALDOATUCR	:= (cArqAux)->(SALDOANTCR) + (cArqAux)->(SALDOCRD)
					(cArqAux)->SALDOATU		:= (cArqAux)->(SALDOATUCR - SALDOATUDB)
					(cArqAux)->MOVIMENTO	:= (cArqAux)->(SALDOCRD   - SALDODEB)
				Else
					nSaldoCrt := 0

					If lImpAntLP .And. nCampoLP > 0
						If lSLLPATCTDB .And. lSLLPATCTCR
							nSaldoCrt := ((cArqAux)->SLLPATCTDB - (cArqAux)->SLLPATCTCR)
						EndIf

						(cArqAux)->SALDOANTDB	:= (cArqAux)->((SALDOANTDB - SLDLPANTDB) ) + iif( nSaldoCrt > 0 , Abs( nSaldoCrt ) , 0 )
						(cArqAux)->SALDOANTCR	:= (cArqAux)->((SALDOANTCR - SLDLPANTCR) ) + iif( nSaldoCrt < 0 , Abs( nSaldoCrt ) , 0 )
						(cArqAux)->SALDODEB		-= TRBTMP->MOVLPDEB
						(cArqAux)->SALDOCRD		-= TRBTMP->MOVLPCRD
					Else
						If lSLDANTCTDB .And. lSLDANTCTCR
							nSaldoCrt := ((cArqAux)->SLDANTCTDB - (cArqAux)->SLDANTCTCR)
						EndIf

						(cArqAux)->SALDOANTDB	:= (cArqAux)->(SALDOANTDB) + iif( nSaldoCrt > 0 , Abs( nSaldoCrt ) , 0 )
						(cArqAux)->SALDOANTCR	:= (cArqAux)->(SALDOANTCR) + iif( nSaldoCrt < 0 , Abs( nSaldoCrt ) , 0 )
					EndIf

					(cArqAux)->SALDOANT		:= (cArqAux)->(SALDOANTCR - SALDOANTDB)
					(cArqAux)->SALDOATUDB	:= (cArqAux)->(SALDOANTDB + SALDODEB)
					(cArqAux)->SALDOATUCR	:= (cArqAux)->(SALDOANTCR + SALDOCRD)
					(cArqAux)->SALDOATU		:= (cArqAux)->(SALDOATUCR - SALDOATUDB)
					(cArqAux)->MOVIMENTO	:= (cArqAux)->(SALDOCRD   - SALDODEB)

				Endif


				//Se imprime saldo anterior do periodo anterior zerado, verificar o saldo atual da data de zeramento.
				If ( lImpConta .Or. cAlias == "CT7") .And. lRecDesp0 .And. Subs(TRBTMP->CONTA,1,1) $ cRecDesp

					If cAlias == "CT7" .Or. ( cAlias == "CT3" .And. cHeader == "CT1" )
						aSldRecDes	:= SaldoCT7Fil(TRBTMP->CONTA,dDtZeraRD,cMoeda,cSaldos,'CTBXFUN',.F.,nil,aSelFil,nil,lTodasFil)
					ElseIf cAlias == "CT3" .And. cHeader == "CTT"
						aSldRecDes	:= SaldoCT3Fil(TRBTMP->CONTA,TRBTMP->CUSTO,dDtZeraRD,cMoeda,cSaldos,'CTBXFUN',.F.,Nil,aSelFil,lTodasFil)
					ElseIf cAlias == "CT4" .And. cHeader == "CTD"
						cCusIni		:= Space(aTamCC[1])
						cCusFim		:= Repl("Z",aTamCC[1])
						aSldRecDes	:= SaldTotCT4(TRBTMP->ITEM,TRBTMP->ITEM,cCusIni,cCusFim,TRBTMP->CONTA,TRBTMP->CONTA,dDtZeraRD,cMoeda,cSaldos,aSelFil,,,,,,,,lTodasFil)
					Elseif cAlias == "CTI" .And. cHeader == "CTH"
						cCusIni		:= SPace(aTamCC[1])
						cCusFim		:= Repl("Z",aTamCC[1])

						cItIni  	:= Space(aTamItem[1])
						cItFim   	:= Repl("z",aTamItem[1])

						aSldRecDes := SaldTotCTI(TRBTMP->CLVL,TRBTMP->CLVL,cItIni,cItFim,cCusIni,cCusFim,;
							TRBTMP->CONTA,TRBTMP->CONTA,dDtZeraRD,cMoeda,cSaldos,aSelFil,,,,,,,,lTodasFil)
					EndIf

					If nDivide > 1
						For nCont := 1 To Len(aSldRecDes)
							aSldRecDes[nCont] := Round(NoRound((aSldRecDes[nCont]/nDivide),3),2)
						Next nCont
					EndIf

					nSldRDAtuD	:=	aSldRecDes[4]
					nSldRDAtuC	:=	aSldRecDes[5]
					nSldAtuRD	:= nSldRDAtuC - nSldRDAtuD

					(cArqAux)->SALDOANT		-= nSldAtuRD
					(cArqAux)->SALDOANTDB	-= nSldRDAtuD
					(cArqAux)->SALDOANTCR	-= nSldRDAtuC
					(cArqAux)->SALDOATU		-= nSldAtuRD
					(cArqAux)->SALDOATUDB	-= nSldRDAtuD
					(cArqAux)->SALDOATUCR	-= nSldRdAtuC
				EndIf

				IF (cArqAux)->( FieldPos( "NATCTA" ) ) > 0;
				.AND.	(cAlias == "CT3" .AND. cHeader $ "CT1|CTT");
				.OR.	(cAlias == "CT4" .And. cHeader == "CTD");
				.OR.	(cAlias == "CTI" .And. cHeader == "CTH");
				.OR.	cAlias == "CT7"
					(cArqAux)->NATCTA := CtbSXNatCta(TRBTMP->CONTA)   // Faz retorno do campo CT1_NATCTA
				Endif

				(cArqAux)->(MsUnlock())
			EndIf
			TRBTMP->(dbSkip())
			nMeter++
			if nMeter%1000 = 0
				If ValType(oMeter) == "O"
					oMeter:Set(nMeter)
				EndIf
			Endif
		Enddo

		dbSelectArea("TRBTMP")
		dbCloseArea()					/// FECHA O TRBTMP (RETORNADO DA QUERY)
		lTemQry := .T.
	Endif
EndIf

dbSelectArea(cArqAux)
dbSetOrder(1)

If cAlias $ 'CT3/CT4/CTI' //Se imprime CONTA+ ENTIDADE
	If !Empty(aSetOfBook[5])
		If !lImpConta	//Se for balancete de 1 entidade filtrada por conta
			If cAlias == "CT3"
				cIdent	:= "CTT"
			ElseIf cAlias == "CT4"
				cIdent	:= "CTD"
			ElseIf cAlias == "CTI"
				cIdent 	:= "CTH"
			EndIf
			// Monta Arquivo Lendo Plano Gerencial
			// Neste caso a filtragem de entidades contabeis   desprezada!
			u_xCtbPlGeren(	oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cMoeda,aSetOfBook,"CTU",;
				cIdent,lImpAntLP,dDataLP,lVlrZerado,cEntidIni,cEntidFim,aGeren,lImpSint,lRecDesp0,cRecDesp,dDtZeraRD,,cSaldos,lPlGerSint,lConsSaldo,,lUsaNmVis,@cNomeVis)
			dbSetOrder(2)
		Else
			If lImpEntGer	//Se for balancete de Entidade (C.Custo/Item/Cl.Vlr por Entid. Gerencial)
				CtPlEntGer(	oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cMoeda,aSetOfBook,cAlias,cHeader,;
					lImpAntLP,dDataLP,lVlrZerado,cEntidIni,cEntidFim,cContaIni,cContaFim,;
					cCCIni,cCCFim,cItemIni,cItemFim,cClVlIni,cClVlFim,lImpSint,;
					lRecDesp0,cRecDesp,dDtZeraRD,nDivide,lFiltraCC,lFiltraIt,lFiltraCV, cSaldos )
			Else
				MsgAlert(cMensagem)
				Return
			EndIf
		EndIf
	Else
		If cHeader == "CT1"	//Se for Balancete Conta/Entidade
			//Atualizacao de sinteticas
			If lImpSint	//Se atualiza sinteticas
				CtCtEntSup(oMeter,oText,oDlg,cAlias,lNImpMov,cMoeda)
				If AllTrim(funname()) $ "CTBR140/CTBR145"
					CtContaSup(oMeter,oText,oDlg,lNImpMov,cMoeda,cMoedaDsc)
				Endif
			EndIf
		Else
			If !lImp3Ent	.And. !lImp4Ent //Se n o for Balancete CC / Conta / Item
				If lImpConta


					If lImpSint	//Se atualiza sinteticas
						CtEntCtSup(oMeter,oText,oDlg,cAlias,lNImpMov,cMoeda,,cEntidIni,cEntidFim,lCttSint)
					EndIf

				Else
					If lImpSint
						If cAlias == "CT3"
							cIdent := "CTT"
						ElseIf cAlias == "CT4"
							cIdent := "CTD"
						ElseIf cAlias == "CTI"
							cIdent := "CTH"
						EndIf
						CtbCTUSup(oMeter,oText,oDlg,lNImpMov,cMoeda,cIdent)
					EndIf

				EndIf
			Else	//Se for Balancete CC / Conta / Item
				If lImp3Ent
					If lImpSint
						Ctb3CtaSup(oMeter,oText,oDlg,cAlias,lNImpMov,cMoeda,cHeader)
					Endif
				ElseIf cAlias == "CTI" .And. lImp4Ent .And. cHeader == "CTT"

					If  lImpAntLP
						CtbCta3Ent(oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cContaIni,;
							cContaFim,cCCIni,cCCFim,cItemIni,cItemFim,cClvlIni,cClVlFim,cMoeda,;
							cSaldos,aSetOfBook,nTamCta,cSegmento,cSegIni,cSegFim,cFiltSegm,lNImpMov,cAlias,cHeader,;
							lCusto,lItem,lClvl,lAtSldBase,nInicio,nFinal,cFilDe,cFilAte,lImpAntLP,dDataLP,;
							nDivide,lVlrZerado)
					EndIf
					If lImpSint
						Ctb4CtaSup(oMeter,oText,oDlg,cAlias,lNImpMov,cMoeda,cHeader)
					Endif
				EndIf
			EndIf
		EndIf
	EndIf
Else
	If cAlias $ 'CTU/CT7' .Or. (!Empty(aSetOfBook[5]) .And. Empty(cAlias))		//So Imprime Entidade ou demonstrativos
		If !Empty(aSetOfBook[5])				// Indica qual o Plano Gerencial Anexado
			// Monta Arquivo Lendo Plano Gerencial
			// Neste caso a filtragem de entidades contabeis   desprezada!
			u_xCtbPlGeren(	oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cMoeda,aSetOfBook,cAlias,;
				cIdent,lImpAntLP,dDataLP,lVlrZerado,cEntidIni,cEntidFim,aGeren,lImpSint,lRecDesp0,cRecDesp,dDtZeraRD,;
				lMovPeriodo,cSaldos,lPlGerSint,lConsSaldo, cArqAux, lUsaNmVis,@cNomeVis,aSelfil,cQuadroCTB,lDemDRE , dFinalA)
			dbSetOrder(2)
		Else
			//Se nao for for Top Connect
			If lImpSint	//Se atualiza sinteticas
				Do Case
				Case cAlias =="CT7"
					//Atualizacao de sinteticas para codebase e topconnect
					CtContaSup(oMeter,oText,oDlg,lNImpMov,cMoeda,cMoedaDsc)
				Case cAlias == "CTU"
					CtbCTUSup(oMeter,oText,oDlg,lNImpMov,cMoeda,cIdent)
				EndCase
			EndIf
		EndIf
	Else    	//Imprime Relatorios com 2 Entidades
		If !Empty(aSetOfBook[5])
			MsgAlert(cMensagem)
			Return
		Else
			If cAlias == 'CTY'		//Se for Relatorio de 2 Entidades filtrado pela 3a Entidade
				Ct2EntFil(oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cEntidIni1,cEntidFim1,cEntidIni2,;
					cEntidFim2,cHeader,cMoeda,cSaldos,aSetOfBook,cSegmento,cSegIni,cSegFim,cFiltSegm,;
					lNImpMov,cAlias,lCusto,lItem,lClVl,lAtSldBase,lAtSldCmp,nInicio,nFinal,;
					cFilDe,cFilAte,lImpAntLP,dDataLP,nDivide,lVlrZerado,cFiltroEnt,cCodFilEnt,aSelFil,lTodasFil)
			ElseIf  cAlias <> 'CVY'
				CtEntComp(oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cEntidIni1,cEntidFim1,cEntidIni2,;
					cEntidFim2,cHeader,cMoeda,cSaldos,aSetOfBook,cSegmento,cSegIni,cSegFim,cFiltSegm,;
					lNImpMov,cAlias,lCusto,lItem,lClVl,lAtSldBase,lAtSldCmp,nInicio,nFinal,;
					cFilDe,cFilAte,lImpAntLP,dDataLP,nDivide,lVlrZerado,cFiltroEnt,cCodFilEnt,cFilUsu,aSelFil,lTodasFil,aTmpFil)
			EndIf
		EndIf
	Endif
EndIf

dbSelectArea(cArqAux)

If FieldPos("ORDEMPRN") > 0

	dbSelectArea(cArqAux)
	DbSetOrder(1)
	DbGoTop()
	While ! Eof()

		If Alltrim(Upper(FunName())) == "CTBR180"
			If Empty(SUPERIOR)
				CtGerSup(CONTA, @nOrdem, cAlias,,CUSTO)
			EndIf

		ElseIf cAlias == "CT7" .OR. cAlias == "CT3"
			If Empty(SUPERIOR)
				CtGerSup(CONTA, @nOrdem, cAlias)
			EndIf
		ElseIf cAlias == "CTU"
			If cIdent == "CTT"
				If Empty(CCSUP)
					CtGerSup(CUSTO, @nOrdem,"CTU","CTT")
				EndIf
			ElseIf cIdent == "CTD"
				If Empty(ITSUP)
					CtGerSup(ITEM, @nOrdem,"CTU","CTD")
				EndIf
			ElseIf cIdent == "CTH"
				If Empty(CLSUP)
					CtGerSup(CLVL, @nOrdem,"CTU","CTH")
				Endif
			EndIf
		EndIf
		DbSkip()

	Enddo
	DbSetOrder(2)

Endif
//Se utiliza plano referencial
If !Empty(cPlanoRef) .And. !Empty(cVersao)

	If IsBlind()
		mv_par01	:= ""
	Else
		Pergunte("CTBPLREF2",.T.)
		MakeSqlExpr("CTBPLREF2")
	EndIf
	cArqTmp	:= CtGerPlRef(cTableNam1,cArqTmp,cChave,aChave,aCampos,cPlanoRef,cVersao,lImpSint,lNimpMOv,lImp3Ent,lImp4Ent,cArqAux,cAlias,cHeader,cMoeda,,cEntid_de,cEntid_Ate,lEntSint,;
	lImpConta,nPos,nPosG,nDigitos,nDigitosG,cSegmento, cSegmentoG, cSegIni, cSegIniG, cSegFim, cSegFimG,  cFiltSegm, cFiltSegmG, @_oTempTbPLRef)
	mv_par01	:= cMvPar01Ant


EndIf

If lGrvJson // Grava o campo NIVJSON no arquivo tempor rio
	CTBNivTmp(cTableNam1,"CONTA","SUPERIOR",cArqTmp)
EndIf

CTDelTmpFil()
For nX := 1 TO Len(aTmpFil)
	CtbTmpErase(aTmpFil[nX])
Next
_oHashCt1 := Nil
If _oHashCt1 <> Nil;
	.And. ((cArqAux)->( FieldPos( "NATCTA" ) ) > 0;
	.AND.	(cAlias == "CT3" .AND. cHeader $ "CT1|CTT");
	.OR.	(cAlias == "CT4" .And. cHeader == "CTD");
	.OR.	(cAlias == "CTI" .And. cHeader == "CTH");
	.OR.	cAlias == "CT7")
	_oHashCt1:Clean()
	_oHashCt1 := Nil
EndIf



RestArea(aSaveArea)

If Select(cArqTmp)> 0
	cArqTmp->(dbGoTop())
EndIf

Return cArqTmp


User Function xCtbPlGeren(oMeter,oText,oDlg,lEnd,dDataIni,dDataFim,cMoeda,aSetOfBook,;
					cAlias,cIdent,lImpAntLP,dDataLP,lVlrZerado,cEntFil1,cEntFil2,aGeren,lImpSint,;
					lRecDesp0,cRecDesp,dDtZeraRD,lMovPeriodo,cSaldos,lPlGerSint,lConsSaldo,cCTAlias,lUsaNmVis,cNomeVis,aSelfil,cQuadroCTB,lDemDRE , dFinalA)


Local aSaveArea := GetArea()
Local aSaldoAnt
Local aSaldoAtu
Local aSaldoSEM
Local aSaldoPER

Local cConta
Local cCodNor
Local cNormal
Local cContaSup
Local cDesc
Local cPlanGer := aSetOfBook[5]
Local cZZZCT1	:= Repl("Z",Len(Criavar("CT1_CONTA")))
Local cZZZCTT	:= Repl("Z",Len(Criavar("CTT_CUSTO")))
Local cZZZCTD	:= Repl("Z",Len(Criavar("CTD_ITEM")))
Local cZZZCTH	:= Repl("Z",Len(Criavar("CTH_CLVL")))
Local cContaIni	:= Space(Len(Criavar("CT1_CONTA")))
Local cContaFim	:= cZZZCT1
Local cCustoIni	:= Space(Len(Criavar("CTT_CUSTO")))
Local cCustoFim	:= cZZZCTT
Local cItemIni	:= Space(Len(Criavar("CTD_ITEM")))
Local cItemFim	:= cZZZCTD
Local cClvlIni	:= Space(Len(Criavar("CTH_CLVL")))
Local cClVlFim	:= cZZZCTH

Local cCtaFil1
Local cCtaFil2
Local cCCFil1
Local cCCFil2
Local cItemFil1
Local cItemFil2
Local cCLVLFil1
Local cCLVLFil2
Local lConta 	:= .F.
Local lCusto	:= .F.
Local lItem		:= .F.
Local lClasse	:= .F.

Local nReg
Local nFator	 := 1
Local nPos		:= 0
Local nSaldoAnt := 0
Local nSaldoDeb := 0
Local nSaldoCrd := 0

Local nSaldoAtu := 0		// Saldo ate a data final
Local nSaldoSEM := 0		// Saldo ate a variavel dSemestre
Local nSaldoPER := 0		// Saldo ate a variavel dPeriodo0
Local nMOVIMPER	:= 0
Local nMovPerAnt	:= 0	//	Movimento do periodo anterior
Local nIniBalance := 0

Local nSaldoAntD:= 0
Local nSaldoAntC:= 0
Local nSaldoAtuD:= 0
Local nSaldoAtuC:= 0
Local lSemestre := FieldPos("SALDOSEM") > 0		// Saldo por semestre
Local lPeriodo0 := FieldPos("SALDOPER") > 0		// Saldo dois periodos anteriores

Local lComNivel := FieldPos("NIVEL") > 0		// Nivel hierarquico
Local lColuna	:= FieldPos("COLUNA") > 0
Local lContDesc	:= FieldPos("DESCCONT") > 0
Local lImpSal   := FieldPos("IMPSAL") > 0
Local lTpValor	:= FieldPos("TPVALOR") > 0 .And. cPaisLoc $ "BRA|PAD|RUS"
Local lPicture	:= FieldPos("PICTURE") > 0 .And. cPaisLoc $ "BRA|PAD|RUS"
Local nNivel	:= 0
Local nContador	:= 0
Local cFilCTS	:= xFilial("CTS")
Local lMovCusto := CtbMovSaldo("CTT")
Local lMovItem	:= CtbMovSaldo("CTD")
Local lMovClass := CtbMovSaldo("CTH")
Local nA:=1
Local aFator:={}
Local nFatorS:=1
Local aAreaCTS:={}
Local cTpSaldo		:= ""
Local cMoedaDesc 	:= ""
Local cCodVis		:= ""
Local cEntidade		:= ""
Local nAt			:= 0
Local nAt2			:= 0
Local aSaldoAux		:= {}
Local xFator
Local aParamCVQ:= {}
Local cArqQuadro
Local aArqQuadro:= {}
Local xCVQ		:= ""
Local lT			:= .T.
Local aRegCT0
Local nTamEntAd		:= TamSx3("CV0_CODIGO")[1]

Local cZZZEnt05   := Replicate("Z",nTamEntAd)
Local cEntid05Ini := Space(1)
Local cEntid05Fim := Replicate("Z",nTamEntAd)
Local lMovEnt05	  := .F.
Local cEnt05Fil1
Local cEnt05Fil2

Local cZZZEnt06   := Replicate("Z",nTamEntAd)
Local cEntid06Ini := Space(1)
Local cEntid06Fim := Replicate("Z",nTamEntAd)
Local lMovEnt06   := .F.
Local cEnt06Fil1
Local cEnt06Fil2

Local cZZZEnt07   := Replicate("Z",nTamEntAd)
Local cEntid07Ini := Space(1)
Local cEntid07Fim := Replicate("Z",nTamEntAd)
Local lMovEnt07   := .F.
Local cEnt07Fil1
Local cEnt07Fil2

Local cZZZEnt08   := Replicate("Z",nTamEntAd)
Local cEntid08Ini := Space(1)
Local cEntid08Fim := Replicate("Z",nTamEntAd)
Local lMovEnt08   := .F.
Local cEnt08Fil1
Local cEnt08Fil2

Local cZZZEnt09   := Replicate("Z",nTamEntAd)
Local cEntid09Ini := Space(1)
Local cEntid09Fim := Replicate("Z",nTamEntAd)
Local lMovEnt09   := .F.
Local cEnt09Fil1
Local cEnt09Fil2

Local lEnt05	:= .F.
Local lEnt06	:= .F.
Local lEnt07	:= .F.
Local lEnt08	:= .F.
Local lEnt09	:= .F.

Local cCodigoEnt := ""

Local aEntidIni	:= {}
Local aEntidFim	:= {}
Local dDataFinal
Local dDataBegin
Local aEntVazio 	  	:= {}

DEFAULT lConsSaldo:= .F.
DEFAULT lPlGerSint:= .F.
DEFAULT lImpSint	:= .T.
DEFAULT lRecDesp0	:= .F.
DEFAULT cRecDesp 	:= ""
DEFAULT dDtZeraRD	:= CTOD("  /  /  ")
DEFAULT lMovPeriodo := .F.
DEFAULT cCTAlias	:= "cArqTmp"
DEFAULT lUsaNmVis	:= .F.
DEFAULT cSaldos		:= " "
DEFAULT aSelfil		:= {}
DEFAULT cQuadroCTB:= ""
DEFAULT lDemDRE :=.f.
DEFAULT dFinalA := CTOD("  /  /  ")
DEFAULT dDataFinal := dDataBase

//If __lCOLUN2 == NIL
	__lCOLUN2 := Iif( CTS->(FieldPos("CTS_COLUN2")) > 0, .T., .F.)
//EndiF

//If __lPlGeren == NIL
	__lPlGeren := If(ExistBlock("PLGERARQ"), .T., .F. )
//Endif

//Disponibilizacao dos parametros da CtbPlGeren() como PARAMIXB para uso nas fun  es
//chamadas pelas sintaxes SALDO= e ROTINA=
//IMPORTANTE: N o incluir chamadas de ponto de entrada na CtbPlGeren(), pois a PARAMIXB ser  sobreposta
Private PARAMIXB := {}
Private PARAMIXC := {}
AADD(PARAMIXB,oMeter)
AADD(PARAMIXB,oText)
AADD(PARAMIXB,oDlg)
AADD(PARAMIXB,lEnd)
AADD(PARAMIXB,dDataIni)
AADD(PARAMIXB,dDataFim)
AADD(PARAMIXB,cMoeda)
AADD(PARAMIXB,aSetOfBook)
AADD(PARAMIXB,cAlias)
AADD(PARAMIXB,cIdent)
AADD(PARAMIXB,lImpAntLP)
AADD(PARAMIXB,dDataLP)
AADD(PARAMIXB,lVlrZerado)
AADD(PARAMIXB,cEntFil1)
AADD(PARAMIXB,cEntFil2)
AADD(PARAMIXB,aGeren)
AADD(PARAMIXB,lImpSint)
AADD(PARAMIXB,lRecDesp0)
AADD(PARAMIXB,cRecDesp)
AADD(PARAMIXB,dDtZeraRD)
AADD(PARAMIXB,lMovPeriodo)
AADD(PARAMIXB,cSaldos)
AADD(PARAMIXB,lPlGerSint)
AADD(PARAMIXB,lConsSaldo)
AADD(PARAMIXB,cCTAlias)
AADD(PARAMIXB,lUsaNmVis)
AADD(PARAMIXB,cNomeVis)
AADD(PARAMIXB,aSelfil)
AADD(PARAMIXB,cQuadroCTB)

//If nQtdEntid == NIL
	nQtdEntid:= If(FindFunction("CtbQtdEntd"),CtbQtdEntd(),4) //sao 4 entidades padroes -> conta /centro custo /item contabil/ classe de valor
//EndIf

//               ?
// Novas entidades 
//                 
If CtbIsCube()

	//1-CT0->CT0_ALIAS ,2-CT0->CT0_ENTIDA,3-CT0->CT0_ID,4-CT0->CT0_CPOCHV,5-CT0->CT0_CPODSC,6-CT0->CT0_F3ENTI
	aRegCT0 := CtbRegCt0()	// Registros da tabela CT0

	If nQtdEntid >=	5
		cZZZEnt05	:= Repl("Z",Len(Criavar(aRegCT0[5][4])))
		cEntid05Ini	:= Space(Len(Criavar(aRegCT0[5][4])))
		cEntid05Fim	:= cZZZEnt05
		lMovEnt05 	:= CtbMovSaldo("CT0",,'05')
	EndIf

	If nQtdEntid >=	6
		cZZZEnt06	:= Repl("Z",Len(Criavar(aRegCT0[6][4])))
		cEntid06Ini	:= Space(Len(Criavar(aRegCT0[6][4])))
		cEntid06Fim	:= cZZZEnt06
		lMovEnt06 	:= CtbMovSaldo("CT0",,'06')
	EndIf

	If nQtdEntid >=	7
		cZZZEnt07	:= Repl("Z",Len(Criavar(aRegCT0[7][4])))
		cEntid07Ini	:= Space(Len(Criavar(aRegCT0[7][4])))
		cEntid07Fim	:= cZZZEnt07
		lMovEnt07 	:= CtbMovSaldo("CT0",,'07')
	EndIf

	If nQtdEntid >=	8
		cZZZEnt08	:= Repl("Z",Len(Criavar(aRegCT0[8][4])))
		cEntid08Ini	:= Space(Len(Criavar(aRegCT0[8][4])))
		cEntid08Fim	:= cZZZEnt08
		lMovEnt08 	:= CtbMovSaldo("CT0",,'08')
	EndIf

	If nQtdEntid == 9
		cZZZEnt09	:= Repl("Z",Len(Criavar(aRegCT0[9][4])))
		cEntid09Ini	:= Space(Len(Criavar(aRegCT0[9][4])))
		cEntid09Fim	:= cZZZEnt09
		lMovEnt09 	:= CtbMovSaldo("CT0",,'09')
	EndIf

EndIf

dbSelectArea("CVQ")
dbsetorder(1)
xCVQ		:= xfilial("CVQ")

// tratativa para o tipo de saldo maior que 1, consolida saldo
IF !Empty( cSaldos )
	cSaldos := Alltrim( StrTran( cSaldos,";","','") )
Endif

lTRegCts	:= Type("lTRegCts") # "U" .And. ValType(lTRegCts) = "L" .And. lTRegCts
cAlias		:= Iif(cAlias == Nil,"",cAlias)
cIdent		:= Iif(cIdent == Nil,"",cIdent)
lVlrZerado	:= Iif(lVlrZerado == Nil,.T.,lVlrZerado)

If aGeren != Nil
	cCtaFil1  :=	If(MsAscii(aGeren[1])== 13,"",aGeren[1])
	cCtaFil2  :=	If(MsAscii(aGeren[2])== 13,"",aGeren[2])
	cCCFil1   :=	If(MsAscii(aGeren[3])== 13,"",aGeren[3])
	cCCFil2   :=	If(MsAscii(aGeren[4])== 13,"",aGeren[4])
	cItemFil1 :=	If(MsAscii(aGeren[5])== 13,"",aGeren[5])
	cItemFil2 :=	If(MsAscii(aGeren[6])== 13,"",aGeren[6])
	cCLVLFil1 :=	If(MsAscii(aGeren[7])== 13,"",aGeren[7])
	cCLVLFil2 :=	If(MsAscii(aGeren[8])== 13,"",aGeren[8])
EndIf

lCT1Fil 	:= .F.
lCTTFil 	:= .F.
lCTDFil		:= .F.
lCTHFil		:= .F.
lEnt05Fil	:= .F.
lEnt06Fil	:= .F.
lEnt07Fil	:= .F.
lEnt08Fil	:= .F.
lEnt09Fil	:= .F.

// Filtragem da entidade compositora do Plano Gerencial (Centro de Custo da Getdados)
If !Empty(cCtaFil1) .Or. !Empty(cCtaFil2)
	lCT1Fil := .T.
	If cCtaFil1 > cContaIni
		cContaIni := cCtaFil1
	EndIf
	If cCtaFil2 < cContaFim
		cContaFim := cCtaFil2
	EndIf
EndIf

// Filtragem da entidade compositora do Plano Gerencial (Centro de Custo da Getdados)
If lMovCusto
	If !Empty(cCCFil1) .Or. !Empty(cCCFil2)
		lCTTFil := .T.
		If cCCFil1 > cCustoIni
			cCustoIni := cCCFil1
		EndIf
		If cCCFil2 < cCustoFim
			cCustoFim := cCcFil2
		EndIf
	EndIf
EndIf
/* Observacoes:
C.Custo do Plano Gerencial
001	002	003

C.Custo Informado no Filtro
000	001	002	003	004

O relatorio so podera imprimir: 001 002 003	*/

// Filtragem da entidade compositora do Plano Gerencial (Item Contabil da Getdados)
If lMovItem
	If !Empty(cItemFil1) .Or. !Empty(cItemFil2)
		lCTDFil := .T.
		If cItemFil1 > cItemIni
			cItemIni := cItemFil1
		EndIf
		If cItemFil2 < cItemFim
			cItemFim := cItemFil2
		EndIf
	EndIf
EndIf

// Filtragem da entidade compositora do Plano Gerencial (Classe de Valor da Getdados)
If lMovClass
	If !Empty(cCLVLFil1) .Or. !Empty(cCLVLFil2)
		lCTHFil := .T.
		If cCLVLFil1 > cClVlIni
			cClVlIni := cClVlFil1
		EndIf
		If cCLVLFil2 < cClVlFim
			cClVlFim := cClVlFil2
		EndIf
	EndIf
EndIf

// TRATAMENTOS NECESSARIOS PARA FUNCIONAR O "QUADROCTB=" na "formula" ( CTS->CTS_FORMUL ) da visao gerencial .
// NAO ESQUECER DE ADICIONAR O cQuadroCTB COMO PARAMETRO NA CTGERPLN() E COM DEFAULT cQuadroCTB := ""
// TRATAR NO .INI O PARAMETRO QUADRO CONTABIL E PASSA-LO PARA A CTGERPLN()

IF !EMPTY(cQuadroCTB)
	// copia do PARAMIXB
	PARAMIXC := aclone(PARAMIXB)

	aParamCVQ:= {}
	aadd(aParamCVQ , "")         // [01][C] := C digo do Exercicio Cont bil
	aadd(aParamCVQ , dDataFim )  // [02][D] := Data de referencia
	aadd(aParamCVQ , .T. )       // [03][L] := Demonstra per odo anteriord (S/N)  ?
	aadd(aParamCVQ , lImpAntLP ) // [04][L] := Posicao anterior a LP (S/N)
	aadd(aParamCVQ , dDataLP )   // [05][D] := Data de lucros e perdas
	aadd(aParamCVQ , cMoeda )    // [06][C] := Moeda
	aadd(aParamCVQ , cSaldos)    // [07][C] := Tipo de saldo
	aadd(aParamCVQ , lConsSaldo) // [08][L] := Consolidar Saldo (S/N)
	aadd(aParamCVQ , cSaldos )   // [09][C] := Saldos a Consolidar
	aadd(aParamCVQ , dDataIni )  // [10][D] := dDataIni
	aadd(aParamCVQ , dDataFim )  // [11][D] := dDataFin

	CTBGERQDO(cQuadroCTB,aParamCVQ,@cArqQuadro,oMeter,oText,oDlg,aSetOfBook, @lEnd)
	dbSelectArea(cArqQuadro)
	(cArqQuadro)->(dbgotop())
	IF Select("F101Q") > 0
		DbSelectArea("F101Q")
		dbCloseArea()
	Endif

	IF FILE("F101Q.DBF")
		FErase("F101Q.DBF")
	ENDIF

	/* --- O trecho abaixo ser  disponibilizado em ponto de entrada pois n o ser  poss vel ter arquivo do tipo .DBF no system pelo Padr o do sistema. Com o ponto de entrada
		o usu rio poder  continuar com o arquivo .Dbf ou criar um arquivo com a extens o que melhor lhe convier.
		COPY TO F101Q.DBF
	*/
	If __lPlGeren
		ExecBlock("PLGERARQ", .F.,.F. )
	endIf
	PARAMIXB := aclone(PARAMIXC)

ENDIF

dbSelectArea("CTS")
If ValType(oMeter) == "O"
	oMeter:nTotal := CTS->(RecCount())
EndIf
dbSetOrder(1)

MsSeek(cFilCTS+cPlanGer,.T.)

If lUsaNmVis
	cNomeVis := CTS->CTS_NOME
EndIf

If cPaisLoc == "RUS"
	dDataFinal:= dDataFim
	dDataBegin:= dDataIni
EndIf

While !Eof() .And. CTS->CTS_FILIAL == cFilCTS .And. CTS->CTS_CODPLA == cPlanGer

	// SOMENTE PODER O SER IMPRESSAS ENTIDADES SINTETICAS CUJO OS IDENTIFICADORES SEJAM
	// 5- LINHA SEM VALOR
	// 6- LINHA SEM VALOR EM NEGRITO
	// 7- TRACO / SEPARADOR
	// MOTIVO: ESTAS ENTIDADES SINTETICAS NAO SERAO FORMADAS PELAS ROTINA POIS NENHUMA ENTIDADE
	// A UTILIZARA COMO SUPERIOR.
	If cPaisLoc <> "RUS" .And. CTS->CTS_CLASSE == "1" .And. IIf( lPlGerSint , !(CTS->CTS_IDENT $ "567" ) , .T. )
		dbSkip()
		Loop
	EndIf

	// Recarrega vari veis
	lConta 	:= .F.
	lCusto	:= .F.
	lItem	:= .F.
	lClasse	:= .F.
	lEnt05	:= .F.
	lEnt06	:= .F.
	lEnt07	:= .F.
	lEnt08	:= .F.
	lEnt09	:= .F.
	If Alltrim(CTS->CTS_CONTAG) <> '1150'
		dbSkip()
		Loop
	EndIf 
	// Grava conta analitica
	cConta 	:= CTS->CTS_CONTAG
	cDesc	:= CTS->CTS_DESCCG
	cOrdem	:= CTS->CTS_ORDEM

	nSaldoAnt 	:= 0	// Zero as variaveis para acumular
	nSaldoDeb 	:= 0
	nSaldoCrd 	:= 0

	nSaldoAtu 	:= 0
	nSaldoSEM 	:= 0
	nSaldoPer	:= 0

	nSaldoAntD	:= 0
	nSaldoAntC	:= 0
	nSaldoAtuD	:= 0
	nSaldoAtuC	:= 0
	nMOVIMPER	:= 0
	nMovPerAnt	:= 0
	nIniBalance  := 0
	dbSelectArea("CTS")
	dbSetOrder(1)

	While !Eof() .And. CTS->CTS_FILIAL == cFilCTS .And.;
		CTS->CTS_CODPLA == cPlanGer  .And. CTS->CTS_ORDEM	== cOrdem
		aSaldoAnt	:= { 0, 0, 0, 0, 0, 0, 0, 0 }
		aSaldoAtu	:= { 0, 0, 0, 0, 0, 0, 0, 0 }
		aSaldoSEM	:= { 0, 0, 0, 0, 0, 0, 0, 0 }
		aSaldoPER	:= { 0, 0, 0, 0, 0, 0, 0, 0 }
		If cPaisLoc =="RUS"
			aIniBalance	:= { 0, 0, 0, 0, 0, 0, 0, 0 }
		EndIF

		lClasse := .F.
		lItem	:= .F.
		lCusto	:= .F.
		lConta	:= .F.
		/*
		                                                        ?
		  TRATATIVA DE TIPO DE SALDO NOS RELATORIOS DE DEMONSTRA- 
		  TIVOS (CTBR5XX)                                         
		                                                          
		*/
		// Tipo de saldo configurado na vis o gerencial
		cTpSaldo := Alltrim( CTS->CTS_TPSALD )

		// Caso o Tipo de saldo estiver configurado na vis o gerencial com asterisco
		// ou a rotina chamadora consolida os tipos de saldos, considero os parametros da tela (SX1)
		If ( cTpSaldo == "*" .And. cSaldos <> "*" ) .OR. lConsSaldo
			cTpSaldo := cSaldos
		ElseIf ( cTpSaldo <> "*" .And. cSaldos <> "*" ) .And.  cTpSaldo <> cSaldos
			nReg := Recno()
			dbSkip()
			Loop
		EndIf

		//Entidade 09
		If !lEnt09Fil .And. nQtdEntid >= 9
			If ( CTS->( FieldPos( "CTS_E09INI" ) ) > 0  .And. !Empty(CTS->CTS_E09INI) ) .Or. ;
				( CTS->( FieldPos( "CTS_E09FIM" ) ) > 0  .And. !Empty(CTS->CTS_E09FIM)	)	// Saldo a partir da entidade 09
				cEntid09Ini	:= CTS->CTS_E09INI
				cEntid09Fim	:= CTS->CTS_E09FIM
				lEnt09 := .T.
			Else
				cEntid09Ini	:= Space(Len(cZZZEnt09))
				cEntid09Fim	:= cZZZEnt09
			EndIf
		Else
			lEnt09 := .T.
		Endif

		//Entidade 08
		If !lEnt08Fil .And. nQtdEntid >= 8
			If ( CTS->( FieldPos( "CTS_E08INI" ) ) > 0  .And. !Empty(CTS->CTS_E08INI) ) .Or. ;
				( CTS->( FieldPos( "CTS_E08FIM" ) ) > 0  .And. !Empty(CTS->CTS_E08FIM)	)	// Saldo a partir da entidade 08
				cEntid08Ini	:= CTS->CTS_E08INI
				cEntid08Fim	:= CTS->CTS_E08FIM
				lEnt08 := .T.
			Else
				cEntid08Ini	:= Space(Len(cZZZEnt08))
				cEntid08Fim	:= cZZZEnt08
			EndIf
		Else
			lEnt08 := .T.
		Endif

		//Entidade 07
		If !lEnt07Fil .And. nQtdEntid >= 7
			If ( CTS->( FieldPos( "CTS_E07INI" ) ) > 0  .And. !Empty(CTS->CTS_E07INI) ) .Or. ;
				( CTS->( FieldPos( "CTS_E07FIM" ) ) > 0  .And. !Empty(CTS->CTS_E07FIM)	)	// Saldo a partir da entidade 07
				cEntid07Ini	:= CTS->CTS_E07INI
				cEntid07Fim	:= CTS->CTS_E07FIM
				lEnt07 := .T.
			Else
				cEntid07Ini	:= Space(Len(cZZZEnt07))
				cEntid07Fim	:= cZZZEnt07
			EndIf
		Else
			lEnt07 := .T.
		Endif

		//Entidade 06
		If !lEnt06Fil .And. nQtdEntid >= 6
			If ( CTS->( FieldPos( "CTS_E06INI" ) ) > 0  .And. !Empty(CTS->CTS_E06INI) ) .Or. ;
				( CTS->( FieldPos( "CTS_E06FIM" ) ) > 0  .And. !Empty(CTS->CTS_E06FIM)	)	// Saldo a partir da entidade 06
				cEntid06Ini	:= CTS->CTS_E06INI
				cEntid06Fim	:= CTS->CTS_E06FIM
				lEnt06 := .T.
			Else
				cEntid06Ini	:= Space(Len(cZZZEnt06))
				cEntid06Fim	:= cZZZEnt06
			EndIf
		Else
			lEnt06 := .T.
		Endif

		//Entidade 05
		If !lEnt05Fil .And. nQtdEntid >= 5
			If ( CTS->( FieldPos( "CTS_E05INI" ) ) > 0  .And. !Empty(CTS->CTS_E05INI) ) .Or. ;
				( CTS->( FieldPos( "CTS_E05FIM" ) ) > 0  .And. !Empty(CTS->CTS_E05FIM)	)	// Saldo a partir da entidade 05
				cEntid05Ini	:= CTS->CTS_E05INI
				cEntid05Fim	:= CTS->CTS_E05FIM
				lEnt05 := .T.
			Else
				cEntid05Ini	:= Space(Len(cZZZEnt05))
				cEntid05Fim	:= cZZZEnt05
			EndIf
		Else
			lEnt05 := .T.
		Endif

		If !lCTHFil
			If !Empty(CTS->CTS_CTHINI) .Or. !Empty(CTS->CTS_CTHFIM)		// Saldo a partir da classe
				cClVlIni	:= CTS->CTS_CTHINI
				cClVlFim	:= CTS->CTS_CTHFIM
				lClasse := .T.
			Else
				cCLVLIni	:= Space(Len(cZZZCTH))
				cCLVLFim	:= cZZZCTH
			EndIf
		Else
			lClasse := .T.
		Endif

		If !lCTDFil
			If !Empty(CTS->CTS_CTDINI) .Or. !Empty(CTS->CTS_CTDFIM)	// Saldo a partir do Item
				cItemIni	:= CTS->CTS_CTDINI
				cItemFim	:= CTS->CTS_CTDFIM
				lItem := .T.
			Else
				cItemIni	:= Space(Len(cZZZCTD))
				cItemFim	:= cZZZCTD
			EndIf
		Else
			lItem	:= .T.
		Endif

		If !lCTTFil
			If !Empty(CTS->CTS_CTTINI) .Or. !Empty(CTS->CTS_CTTFIM)	// Saldo a partir do C.Custo
				cCustoIni	:= CTS->CTS_CTTINI
				cCustoFim	:= CTS->CTS_CTTFIM
				lCusto := .T.
			Else
				cCustoIni	:= Space(Len(cZZZCTT))
				cCustoFim	:= cZZZCTT
			EndIf
		Else
			lCusto	:= .T.
		Endif

		If !lCT1Fil
			If !Empty(CTS->CTS_CT1INI) .Or. !Empty(CTS->CTS_CT1FIM)	// Saldo a partir da Conta
				cContaIni	:= CTS->CTS_CT1INI
				cContaFim	:= CTS->CTS_CT1FIM
				lConta := .T.
			Else
				cContaIni	:= Space(Len(cZZZCT1))
				cContaFim	:= cZZZCT1
			EndIf
		Else
			lConta	:= .T.
		EndIf

		If lEnt09 .and. lMovEnt09

			cCodigoEnt	:= '09'
			aEntidIni	:= {}
			aEntidFim	:= {}

			AADD( aEntidIni	,cContaIni )
			AADD( aEntidIni	,cCustoIni )
			AADD( aEntidIni	,cItemIni )
			AADD( aEntidIni	,cClVlIni )
			AADD( aEntidIni	,cEntid05Ini)
			AADD( aEntidIni	,cEntid06Ini)
			AADD( aEntidIni	,cEntid07Ini)
			AADD( aEntidIni	,cEntid08Ini)
			AADD( aEntidIni	,cEntid09Ini)

			AADD( aEntidFim	,cContaFim )
			AADD( aEntidFim	,cCustoFim)
			AADD( aEntidFim	,cItemFim)
			AADD( aEntidFim	,cClVlFim)
			AADD( aEntidFim	,cEntid05Fim)
			AADD( aEntidFim	,cEntid06Fim)
			AADD( aEntidFim	,cEntid07Fim)
			AADD( aEntidFim	,cEntid08Fim)
			AADD( aEntidFim	,cEntid09Fim)

			aEntVazio := Ctb_Vazio(aEntidIni)

			aSaldoAnt := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			aSaldoAtu := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataFim,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			If lSemestre
				aSaldoSem := CtbSldCubo(aEntidIni,aEntidFim,StoD(Left(DtoS(dSemestre),4)+"0101"),dSemestre,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If lPeriodo0
				aSaldoPer := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dPeriodo0,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			EndIf

		ElseIf lEnt08 .and. lMovEnt08

			cCodigoEnt	:= '08'
			aEntidIni	:= {}
			aEntidFim	:= {}

			AADD( aEntidIni	,cContaIni )
			AADD( aEntidIni	,cCustoIni )
			AADD( aEntidIni	,cItemIni )
			AADD( aEntidIni	,cClVlIni )
			AADD( aEntidIni	,cEntid05Ini)
			AADD( aEntidIni	,cEntid06Ini)
			AADD( aEntidIni	,cEntid07Ini)
			AADD( aEntidIni	,cEntid08Ini)

			AADD( aEntidFim	,cContaFim )
			AADD( aEntidFim	,cCustoFim)
			AADD( aEntidFim	,cItemFim)
			AADD( aEntidFim	,cClVlFim)
			AADD( aEntidFim	,cEntid05Fim)
			AADD( aEntidFim	,cEntid06Fim)
			AADD( aEntidFim	,cEntid07Fim)
			AADD( aEntidFim	,cEntid08Fim)

			aEntVazio := Ctb_Vazio(aEntidIni)

			aSaldoAnt := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			aSaldoAtu := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataFim,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			If lSemestre
				aSaldoSem := CtbSldCubo(aEntidIni,aEntidFim,StoD(Left(DtoS(dSemestre),4)+"0101"),dSemestre,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If lPeriodo0
				aSaldoPer := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dPeriodo0,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			EndIf

		ElseIf lEnt07 .and. lMovEnt07

			cCodigoEnt	:= '07'
			aEntidIni	:= {}
			aEntidFim	:= {}

			AADD( aEntidIni	,cContaIni )
			AADD( aEntidIni	,cCustoIni )
			AADD( aEntidIni	,cItemIni )
			AADD( aEntidIni	,cClVlIni )
			AADD( aEntidIni	,cEntid05Ini)
			AADD( aEntidIni	,cEntid06Ini)
			AADD( aEntidIni	,cEntid07Ini)

			AADD( aEntidFim	,cContaFim )
			AADD( aEntidFim	,cCustoFim)
			AADD( aEntidFim	,cItemFim)
			AADD( aEntidFim	,cClVlFim)
			AADD( aEntidFim	,cEntid05Fim)
			AADD( aEntidFim	,cEntid06Fim)
			AADD( aEntidFim	,cEntid07Fim)

			aEntVazio := Ctb_Vazio(aEntidIni)

			aSaldoAnt := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			aSaldoAtu := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataFim,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			If lSemestre
				aSaldoSem := CtbSldCubo(aEntidIni,aEntidFim,StoD(Left(DtoS(dSemestre),4)+"0101"),dSemestre,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If lPeriodo0
				aSaldoPer := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dPeriodo0,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			EndIf

		ElseIf lEnt06 .and. lMovEnt06

			cCodigoEnt	:= '06'
			aEntidIni	:= {}
			aEntidFim	:= {}

			AADD( aEntidIni	,cContaIni )
			AADD( aEntidIni	,cCustoIni )
			AADD( aEntidIni	,cItemIni )
			AADD( aEntidIni	,cClVlIni )
			AADD( aEntidIni	,cEntid05Ini)
			AADD( aEntidIni	,cEntid06Ini)

			AADD( aEntidFim	,cContaFim )
			AADD( aEntidFim	,cCustoFim)
			AADD( aEntidFim	,cItemFim)
			AADD( aEntidFim	,cClVlFim)
			AADD( aEntidFim	,cEntid05Fim)
			AADD( aEntidFim	,cEntid06Fim)

			aEntVazio := Ctb_Vazio(aEntidIni)

			aSaldoAnt := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			aSaldoAtu := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataFim,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			If lSemestre
				aSaldoSem := CtbSldCubo(aEntidIni,aEntidFim,StoD(Left(DtoS(dSemestre),4)+"0101"),dSemestre,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If lPeriodo0
				aSaldoPer := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dPeriodo0,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			EndIf

		ElseIf lEnt05 .and. lMovEnt05

			cCodigoEnt	:= '05'
			aEntidIni	:= {}
			aEntidFim	:= {}

			AADD( aEntidIni	,cContaIni )
			AADD( aEntidIni	,cCustoIni )
			AADD( aEntidIni	,cItemIni )
			AADD( aEntidIni	,cClVlIni )
			AADD( aEntidIni	,cEntid05Ini)

			AADD( aEntidFim	,cContaFim )
			AADD( aEntidFim	,cCustoFim)
			AADD( aEntidFim	,cItemFim)
			AADD( aEntidFim	,cClVlFim)
			AADD( aEntidFim	,cEntid05Fim)

			aEntVazio := Ctb_Vazio(aEntidIni)

			aSaldoAnt := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			aSaldoAtu := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataFim,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			If lSemestre
				aSaldoSem := CtbSldCubo(aEntidIni,aEntidFim,StoD(Left(DtoS(dSemestre),4)+"0101"),dSemestre,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If lPeriodo0
				aSaldoPer := CtbSldCubo(aEntidIni,aEntidFim,Ctod("//"),dPeriodo0,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := CtbSldCubo(aEntidIni,aEntidFim,dDataIni,dDataIni-1,cMoeda,cTpSaldo,aSelFil,/*lMantemTmp*/,/*lBuscaExata*/, aEntVazio)
			EndIf

		ElseIf lClasse .and. lMovClass

			aSaldoAnt := SaldTotCTI(cClVlIni,cClVlFim,cItemIni,;
			cItemFim,cCustoIni,cCustoFim,cContaIni,;
			cContaFim,dDataIni,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)

			aSaldoAtu := SaldTotCTI(cClVlIni,cClVlFim,cItemIni,;
			cItemFim,cCustoIni,cCustoFim,cContaIni,;
			cContaFim,dDataFim,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)
			If lSemestre
				aSaldoSem := SaldTotCTI(cClVlIni,cClVlFim,cItemIni,;
				cItemFim,cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dSemestre,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif
			If lPeriodo0
				aSaldoPer := SaldTotCTI(cClVlIni,cClVlFim,cItemIni,;
				cItemFim,cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dPeriodo0,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := SaldTotCTI(cClVlIni,cClVlFim,cItemIni,cItemFim,cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dDataIni-1,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)
			EndIf

		ElseIf lItem .and. lMovItem

			aSaldoAnt := SaldTotCT4(cItemIni,cItemFim,cCustoIni,;
			cCustoFim,cContaIni,cContaFim,;
			dDataIni,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)

			aSaldoAtu := SaldTotCT4(cItemIni,cItemFim,cCustoIni,;
			cCustoFim,cContaIni,cContaFim,;
			dDataFim,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)
			If lSemestre
				aSaldoSem := SaldTotCT4(cItemIni,cItemFim,cCustoIni,;
				cCustoFim,cContaIni,cContaFim,;
				dSemestre,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif
			If lPeriodo0
				aSaldoPEr := SaldTotCT4(cItemIni,cItemFim,cCustoIni,;
				cCustoFim,cContaIni,cContaFim,;
				dPeriodo0,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := SaldTotCT4(cItemIni,cItemFim,cCustoIni,cCustoFim,cContaIni,cContaFim,;
					dDataIni-1,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo,,.F.)
			EndIf

		ElseIf lCusto .and. lMovCusto

			aSaldoAnt := SaldTotCT3(cCustoIni,cCustoFim,cContaIni,;
			cContaFim,dDataIni,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)
			aSaldoAtu := SaldTotCT3(cCustoIni,cCustoFim,cContaIni,;
			cContaFim,dDataFim,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)

			If lSemestre
				aSaldoSem := SaldTotCT3(cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dSemestre,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif
			If lPeriodo0
				aSaldoPer := SaldTotCT3(cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dPeriodo0,cMoeda,cTpSaldo,aSelFil,,,,lImpAntLP,dDataLP,,lConsSaldo)
			Endif

			If cPaisLoc =="RUS"
				aIniBalance := SaldTotCT3(cCustoIni,cCustoFim,cContaIni,;
				cContaFim,dDataIni-1,cMoeda,cTpSaldo,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),,lConsSaldo)
			EndIf
		ElseIf lConta

			aSaldoAnt := u_xSaldTotCT7(cContaIni,cContaFim,dDataIni,cMoeda,cTpSaldo,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,,lConsSaldo)
			aSaldoAtu := u_xSaldTotCT7(cContaIni,cContaFim,dDataFim,cMoeda,cTpSaldo,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,,lConsSaldo)
			If lSemestre
				aSaldoSem := u_xSaldTotCT7(cContaIni,cContaFim,dSemestre,cMoeda,cTpSaldo,lImpAntLP,dDataLP,aSelFil,,,,,lConsSaldo)
			Endif
			If lPeriodo0
				aSaldoPer := u_xSaldTotCT7(cContaIni,cContaFim,dPeriodo0,cMoeda,cTpSaldo,lImpAntLP,dDataLP,aSelFil,,,,,lConsSaldo)
			Endif
			If cPaisLoc =="RUS"
				aIniBalance := u_xSaldTotCT7(cContaIni,cContaFim,dDataFim,cMoeda,cTpSaldo,lImpAntLP,iif(lDemDRE,dFinalA,dDataLP),aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,,lConsSaldo)
			EndIf
		EndIf

		If aSetOfBook[9] > 1	// Divisao por fator
			nLSldAnt := Len(aSaldoAnt)
			nLSldAtu := Len(aSaldoAtu)
			nLSldSem := Len(aSaldoSem)
			nLSldPer := Len(aSaldoPer)
			For nPos := 1 To nLSldAnt
				aSaldoAnt[nPos] := Round(NoRound((aSaldoAnt[nPos]/aSetOfBook[9]),3),2)
			Next
			For nPos := 1 To nLSldAtu
				aSaldoAtu[nPos] := Round(NoRound((aSaldoAtu[nPos]/aSetOfBook[9]),3),2)
			Next
			If lSemestre
				For nPos := 1 To nLSldSem
					aSaldoSem[nPos] := Round(NoRound((aSaldoSem[nPos]/aSetOfBook[9]),3),2)
				Next
			Endif
			If lPeriodo0
				For nPos := 1 To nLSldPer
					aSaldoPer[nPos] := Round(NoRound((aSaldoPer[nPos]/aSetOfBook[9]),3),2)
				Next
			Endif
		Endif

		If Left(CTS->CTS_FORMUL, 7) == "ROTINA="
			nLSldAnt := Len(aSaldoAnt)
			nLSldAtu := Len(aSaldoAtu)
			nLSldSem := Len(aSaldoSem)
			nLSldPer := Len(aSaldoPer)
			nFator := &(Subs(CTS->CTS_FORMUL, 8))
			For nPos := 1 To nLSldAnt
				aSaldoAnt[nPos] *= nFator
			Next
			For nPos := 1 To nLSldAtu
				aSaldoAtu[nPos] *= nFator
			Next
			If lSemestre
				For nPos := 1 To nLSldSem
					aSaldoSem[nPos] *= nFator
				Next
			Endif
			If lPeriodo0
				For nPos := 1 To nLSldPer
					aSaldoPer[nPos] *= nFator
				Next
			Endif
		ElseIf Left(CTS->CTS_FORMUL, 6) == "FATOR="
			nLSldAnt := Len(aSaldoAnt)
			nLSldAtu := Len(aSaldoAtu)
			nLSldSem := Len(aSaldoSem)
			nLSldPer := Len(aSaldoPer)
			nFator := &(Subs(CTS->CTS_FORMUL, 7))
			For nPos := 1 To nLSldAnt
				aSaldoAnt[nPos] *= nFator
			Next
			For nPos := 1 To nLSldAtu
				aSaldoAtu[nPos] *= nFator
			Next
			If lSemestre
				For nPos := 1 To nLSldSem
					aSaldoSem[nPos] *= nFator
				Next
			Endif
			If lPeriodo0
				For nPos := 1 To nLSldPer
					aSaldoPer[nPos] *= nFator
				Next
			Endif
		Elseif Left(CTS->CTS_FORMUL,6 ) == "SALDO="
			nLSldAnt := Len(aSaldoAnt)
			nLSldAtu := Len(aSaldoAtu)
			nLSldSem := Len(aSaldoSem)
			nLSldPer := Len(aSaldoPer)

			xFator := &(Subs(CTS->CTS_FORMUL, 7))

			IF ValType(xFator) == "N"

				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := xFator
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := xFator
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := xFator
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := xFator
					Next
				Endif

			ELSEIF ValType(xFator) == "A" .AND. Len(xFator) >= 8

				//                                                      ?
				//  Conte do padrao do array de saldos                    
				//  [1] Saldo Atual (com sinal)                           
				//  [2] Debito na Data                                    
				//  [3] Credito na Data                                   
				//  [4] Saldo Atual Devedor                               
				//  [5] Saldo Atual Credor                                
				//  [6] Saldo Anterior (com sinal)                        
				//  [7] Saldo Anterior Devedor                            
				//  [8] Saldo Anterior Credor                             
				//                                                        

				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := xFator[nPos]
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := xFator[nPos]
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := xFator[nPos]
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := xFator[nPos]
					Next
				Endif
			ENDIF


		ElseIf Left(CTS->CTS_FORMUL,6 ) == "VISAO="
			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			cMoedaDesc 	:= IIf( Empty(mv_par14),mv_par03,mv_par14)
			nAt			:= At( ",", CTS->CTS_FORMUL )
			nAt2		:= At( "=", CTS->CTS_FORMUL )
			IF nAt > 0
				cCodVis		:= AllTrim( substr( CTS->CTS_FORMUL, 7, nAt - nAt2 - 1 ) )
				cEntidade	:= AllTrim( substr( CTS->CTS_FORMUL, nAt + 1 ) )
			ELSE
				cCodVis		:= AllTrim( substr( CTS->CTS_FORMUL,07) )
				cEntidade	:= ""
			ENDIF

			aSaldos  	:= GetSldVis( 	cCodVis, 0, oMeter, oText, oDlg, ;
			lEnd, dDataIni,dDataFim, cSaldos, lVlrZerado, ;
			cMoedaDesc, lMovPeriodo, aSetOfBook, cMoeda, ;
			lImpAntLP, dDataLP, lConsSaldo, cEntidade,aSelFil )

			If Len( aSaldos ) > 0
				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := aSaldos[nPos]
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := aSaldos[nPos]
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := aSaldos[nPos]
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := aSaldos[nPos]
					Next
				Endif
			EndIf

		ElseIf Left(CTS->CTS_FORMUL, 9) = "ENTIDADE="
			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			aSaldos	:= GetSldEnt( substr( CTS->CTS_FORMUL, 10 ) /*cEntidade*/,;
			/* cCodVis */,;
			/*cOrdVis*/,;
			0 /*nTpSaldo 0->RETORNA ARRAY*/ ,;
			cCTAlias /*cArqTmp*/;
			)

			If Len( aSaldos ) > 0
				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := aSaldos[nPos]
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := aSaldos[nPos]
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := aSaldos[nPos]
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := aSaldos[nPos]
					Next
				Endif
			EndIf

		ElseIf Left(CTS->CTS_FORMUL, 11) = "FTENTIDADE="
			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			nAt			:= At( ",", CTS->CTS_FORMUL )

			IF nAt > 0
				cEntidade	:= AllTrim( substr( CTS->CTS_FORMUL,12,nAt-12) )
				nFator		:= VAL(AllTrim( substr( CTS->CTS_FORMUL, nAt + 1 ) ) )
			ELSE
				cEntidade	:= AllTrim( substr( CTS->CTS_FORMUL,12) )
				nFator		:= 1
			ENDIF

			aSaldos 	:= GetSldEnt( cEntidade, /* cCodVis */, /*cOrdVis*/, 0 /* nTpSaldo 0->RETORNA ARRAY */, cCTAlias /*cArqTmp*/)

			If Len( aSaldos ) > 0
				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := aSaldos[nPos] * nFator
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := aSaldos[nPos] * nFator
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := aSaldos[nPos]  * nFator
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := aSaldos[nPos]  * nFator
					Next
				Endif
			EndIf

		ElseIf Left(CTS->CTS_FORMUL, 9) = "VARIACAO="

			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			aSaldos	:= GetSldEnt( substr( CTS->CTS_FORMUL, 10 ) /*cEntidade*/,;
			/* cCodVis */,;
			/*cOrdVis*/,;
			0 /*nTpSaldo 0->RETORNA ARRAY*/ ,;
			cCTAlias /*cArqTmp*/;
			)

			If Len( aSaldos ) > 0
				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := 0.00 // N o   realizado tratamento de valor de varia  o anterior
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := aSaldos[9] // Varia  o
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := aSaldos[nPos]
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := aSaldos[nPos]
					Next
				Endif
			EndIf

		ElseIf Left(CTS->CTS_FORMUL, 10) = "MOVIMENTO="
			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			aSaldoAux 	:= GetSldMov( substr( CTS->CTS_FORMUL, 11 ), dDataIni, dDataFim, cMoeda ,aSelFil )

			aSaldoAnt[6] += aSaldoAux[1] //Saldo Anterior
			aSaldoAtu[1] += aSaldoAux[2] + aSaldoAux[1] //Saldo Atual

			If aSaldoAux[1] >= 0
				aSaldoAnt[8] 	+= aSaldoAux[1] // Saldo credor
			Else
				aSaldoAnt[7] 	+= ABS(aSaldoAux[1])// Saldo devedor
			Endif

			If aSaldoAux[2] >= 0
				aSaldoAtu[5]	+= aSaldoAux[2] // Saldo credor
			Else
				aSaldoAtu[4] 	+= ABS(aSaldoAux[2]) // Saldo devedor
			Endif

			If lSemestre
				For nPos := 1 To nLSldSem
					aSaldoSem[nPos] += aSaldoAux[2]
				Next
			EndIf

			If lPeriodo0
				For nPos := 1 To nLSldPer
					aSaldoPer[nPos] += aSaldoAux[2]
				Next
			EndIf

		ElseIf Left(CTS->CTS_FORMUL, 10) = "QUADROCTB="
			nLSldAnt 	:= Len(aSaldoAnt)
			nLSldAtu 	:= Len(aSaldoAtu)
			nLSldSem 	:= Len(aSaldoSem)
			nLSldPer 	:= Len(aSaldoPer)
			// cItemQdro	:= SUBS(ALLTRIM(substr( CTS->CTS_FORMUL, 11 )) + SPACE(3), 1 , 3)
			cItemQdro	:= alltrim(substr( CTS->CTS_FORMUL, 11 ))
			//                                                      ?
			//  Conte do padrao do array de saldos                    
			//  [1] Saldo Atual (com sinal)                           
			//  [2] Debito na Data                                    
			//  [3] Credito na Data                                   
			//  [4] Saldo Atual Devedor                               
			//  [5] Saldo Atual Credor                                
			//  [6] Saldo Anterior (com sinal)                        
			//  [7] Saldo Anterior Devedor                            
			//  [8] Saldo Anterior Credor                             
			//                                                        
			aSaldos 	:= {0,0,0,0,0,0,0,0}
			dbSelectArea(cArqQuadro)
			(cArqQuadro)->(dbgotop())
			Do while ! (cArqQuadro)->(eof())
				if ( (cArqQuadro)->FILIAL == xCVQ ) .and. ( cItemQdro $ (cArqQuadro)->DESCRICAO )
					nPos := 0
					DO WHILE .T. .AND. nPos < 1000
						if Reclock((cArqQuadro), .F.)
							aSaldos[1] += (cArqQuadro)->SALDOATU
							aSaldos[6] += (cArqQuadro)->SALDOANT
							(cArqQuadro)->(msunlock())
							exit
						endif
						nPos++
					EndDo
					if nPos >= 1000
						// ERRO!
						__Quit()
					endif
				endif
				(cArqQuadro)->(dbskip())
			Enddo

			If Len( aSaldos ) > 0
				For nPos := 1 To nLSldAnt
					aSaldoAnt[nPos] := aSaldos[nPos]
				Next
				For nPos := 1 To nLSldAtu
					aSaldoAtu[nPos] := aSaldos[nPos]
				Next
				If lSemestre
					For nPos := 1 To nLSldSem
						aSaldoSem[nPos] := aSaldos[nPos]
					Next
				Endif
				If lPeriodo0
					For nPos := 1 To nLSldPer
						aSaldoPer[nPos] := aSaldos[nPos]
					Next
				Endif
			EndIf
			dbSelectArea("CTS")
		Endif

		// Calculos com os Fatores
		If CTS->CTS_IDENT = "1"				// Somo os saldos
			nSaldoAnt 	+= aSaldoAnt[6]		// Saldo Anterior
			nSaldoAtu 	+= aSaldoAtu[1]		// Saldo Atual
			If lSemestre
				nSaldoSem += aSaldoSEM[1]	// Saldo Semestre
			Endif
			If lPeriodo0
				nSaldoPer += aSaldoPER[1]	// Saldo variavel dPeriodo0
			Endif
			// Calculando o Movimento do periodo anterior
			If lMovPeriodo
				nMovPerAnt += ( (aSaldoAnt[8] - aSaldoAnt[7]) - (aSaldoPer[8] - aSaldoPer[7]) )
			EndIf
			If cPaisLoc =="RUS"
				nIniBalance +=aIniBalance[1]
			EndIf
			nSaldoAntD 	+= aSaldoAnt[7]
			nSaldoAntC 	+= aSaldoAnt[8]

			nSaldoAtuD 	+= aSaldoAtu[4]
			nSaldoAtuC 	+= aSaldoAtu[5]

			If Left(CTS->CTS_FORMUL, 10) = "MOVIMENTO="
				nSaldoDeb  	:= nSaldoAtuD
				nSaldoCrd  	:= nSaldoAtuC
			Else
				nSaldoDeb  	:= (nSaldoAtuD - nSaldoAntD)
				nSaldoCrd  	:= (nSaldoAtuC - nSaldoAntC)
			EndIf

		ElseIf CTS->CTS_IDENT = "2"			// Subtraio os saldos
			nSaldoAnt 	-= aSaldoAnt[6]		// Saldo Anterior
			nSaldoAtu 	-= aSaldoAtu[1]		// Saldo Atual
			If lSemestre
				nSaldoSem -= aSaldoSEM[1]	// Saldo Semestre
			Endif
			If lPeriodo0
				nSaldoPer -= aSaldoPER[1]	// Saldo Periodo determinado
			Endif
			// Calculando o Movimento do periodo anterior
			If lMovPeriodo
				nMovPerAnt -= ( (aSaldoAnt[8] - aSaldoAnt[7]) - (aSaldoPer[8] - aSaldoPer[7]) )
			EndIf

			If cPaisLoc =="RUS"
				nIniBalance -=aIniBalance[1]
			EndIf

			nSaldoAntD 	-= aSaldoAnt[7]
			nSaldoAntC 	-= aSaldoAnt[8]

			nSaldoAtuD 	-= aSaldoAtu[4]
			nSaldoAtuC 	-= aSaldoAtu[5]

			If Left(CTS->CTS_FORMUL, 10) = "MOVIMENTO="
				nSaldoDeb  	:= nSaldoAtuD
				nSaldoCrd  	:= nSaldoAtuC
			Else
				nSaldoDeb  	:= (nSaldoAtuD - nSaldoAntD)
				nSaldoCrd  	:= (nSaldoAtuC - nSaldoAntC)
			EndIf

		EndIf

		nMOVIMPER += (aSaldoAnt[5] - aSaldoPer[8]) - (aSaldoAnt[4] - aSaldoPer[7])

		dbSelectArea("CTS")
		dbSetOrder(1)
		nReg := Recno()
		dbSkip()

 		If lTRegCts .And. IIf( __lCOLUN2, CTS->CTS_COLUN2 > "0", GetCTSCol(CTS_COLUNA,'N') > 0 )	// A coluna 0 nao respeita desmembramento
			Exit
		Endif
	EnddO

	dbSelectArea("CTS")
	dbSetOrder(2)
	dbGoTo(nReg)
	cCodNor := CTS->CTS_NORMAL

	If !lVlrZerado .And. (nSaldoCrd-nSaldoDeb = 0 .And. nSaldoAnt == 0 .And. nSaldoAtu == 0) .And. ;
		(nSaldoDeb = 0 .And. nSaldoCRD = 0)
		///DbDelete()			/// RETIRADO DELETE

		dbSelectArea("CTS")
		dbSetOrder(1)
		dbGoTo(nReg)
		dbSkip()
		Loop					/// S  INCLUI NO TMP SE O SALDO N O ESTIVER ZERADO (NAO PRECISA ATUALIZAR SUPERIORES)
	EndIf

	dbSelectArea(cCTAlias)
	dbSetOrder(1)
	If !MsSeek(cConta)
		dbAppend()
		If cAlias = 'CTU'
			Do Case
				Case cIdent	= 'CTT'
					Replace CUSTO 	With  cConta
					Replace DESCCC	With cDesc
					Replace TIPOCC 	With CTS->CTS_CLASSE
				Case cIdent = 'CTD'
					Replace ITEM 		With cConta
					Replace DESCITEM    With cDesc
					Replace TIPOITEM	With CTS->CTS_CLASSE
				Case cIdent = 'CTH'
					Replace CLVL		With cConta
					Replace DESCCLVL	With cDesc
					Replace TIPOCLVL	With CTS->CTS_CLASSE
			EndCase
		Else
			Replace CONTA 		With cConta
			Replace DESCCTA    	With cDesc
			If !Empty(cCodigoEnt)
				Replace &("CODENT"+cCodigoEnt) With cConta
				Replace &("DESCENT"+cCodigoEnt)    	With cDesc
			EndIF
		EndIf
		Replace SUPERIOR  	With CTS->CTS_CTASUP
		Replace TIPOCONTA 	With CTS->CTS_CLASSE
		Replace NORMAL    	With CTS->CTS_NORMAL
		Replace ORDEM		With CTS->CTS_ORDEM
		Replace IDENTIFI	With CTS->CTS_IDENT
		Replace FILIAL		With xFilial( cCTAlias )
		Replace TOTVIS 		With CTS->CTS_TOTVIS
		Replace VISENT 		With CTS->CTS_VISENT
		Replace SLDENT 		With CTS->CTS_SLDENT
		Replace FATSLD 		With CTS->CTS_FATSLD


		If lColuna
			Replace COLUNA  With IIf(  __lCOLUN2, Val(CTS->CTS_COLUN2), GetCTSCol(CTS->CTS_COLUNA,'N',cCTAlias))
		EndIf

		If lTpValor
			Replace TPVALOR  With CTS->CTS_TPVALO
		EndIf

		If lPicture
			Replace PICTURE  With CTS->CTS_PICTUR
		EndIf

		If lImpSal
			Replace IMPSAL With CTS->CTS_IMPSAL
		EndIf

		If lTRegCts
			CT1->(DbSeek(xFilial("CT1") + CTS->CTS_CT1INI))
			Replace DESCORIG 	With &("CT1->CT1_DESC" + cMoeda),;
			TIPOCONTA 	With CT1->CT1_CLASSE,;
			NORMAL    	With CT1->CT1_NORMAL
		Endif

		If lContDesc
			Replace DESCCONT 	With CTS->CTS_DETHCG
		EndIf

	EndIf

	If cPaisLoc == "RUS"
		// when this register is group It was awlays empty, now i`m forcing this value
		If lContDesc
			Replace DESCCONT 	With CTS->CTS_DETHCG
		EndIf
	EndIf

	If Left(CTS->CTS_FORMUL, 6) = "TEXTO="		// Adiciona texto a descricao
		Replace (cCTAlias)->DESCCTA With 	AllTrim( (cCTAlias)->DESCCTA) + Space(1) +;
		&(Subs(CTS->CTS_FORMUL, 7))
	Elseif Left(CTS->CTS_FORMUL, 9) = "TEXTOVAR="		// Substitui a descricao pelo retornado pela macro-execucao
		Replace (cCTAlias)->DESCCTA With 	&(Subs(CTS->CTS_FORMUL, 10))

	Endif

	//                                                        ?
	// Inverte o saldo se assim a entidade estiver configurada  
	//                                                          
	If cArqTmp->FATSLD == "2"
		nSaldoAnt	*= -1
		nSaldoAtu	*= -1
		nSaldoAtuD	*= -1
		nSaldoAtuC	*= -1
		nSaldoDeb	*= -1
		nSaldoCrd	*= -1
		nMovPerAnt	*= -1
	EndIf

	dbSelectArea(cCTAlias)
	Replace	SALDOANT With SALDOANT+nSaldoAnt			// Saldo Anterior
	Replace SALDOATU With SALDOATU+nSaldoAtu			// Saldo Atual

	Replace SALDOATUDB With SALDOATUDB+nSaldoAtuD		//Saldo Atual Devedor
	Replace SALDOATUCR With SALDOATUCR+nSaldoAtuC		//Saldo Atual Credor

	If lSemestre
		Replace SALDOSEM With SALDOSEM+nSaldoSEM		// Saldo Semestre
	Endif

	If lPeriodo0	// Saldo periodo determinado
		Replace SALDOPER 	With SALDOPER+nSaldoPER
		Replace MOVIMPER  	With MOVIMPER+nMOVIMPER
	Endif

	If nSaldoDeb < 0 //.And. cCodNor == "1"
		Replace SALDOCRD	With SALDOCRD+nSaldoDeb
	ElseIf nSaldoDeb >= 0 //.And. cCodNor == "1"
		Replace SALDODEB	With SALDODEB+nSaldoDeb
	EndIf

	If nSaldoCrd < 0// .And. cCodNor == "2"
		Replace SALDODEB	With SALDODEB+nSaldoCrd
	ElseIf nSaldoCrd >= 0 //.And. cCodNor == "2"
		Replace SALDOCRD	With SALDOCRD+nSaldoCrd
	EndIf

	Replace MOVIMENTO With MOVIMENTO+(nSaldoCrd-nSaldoDeb)
	If cPaisLoc =="RUS"
		Replace INIBALANCE With INIBALANCE + nIniBalance
	EndIf

	If lMovPeriodo
		Replace MOVPERANT With MOVPERANT+nMovPerAnt
	EndIf
	If lComNivel
		aNivel := {}
		Aadd(aNivel, Recno())
	Endif

	If lImpSint
		dbSelectArea("CTS")
		dbSetOrder(2)
		// Grava contas sinteticas
		If !Empty(CTS->CTS_CTASUP)
			While !Eof() .And. 	CTS->CTS_FILIAL == cFilCTS .And. ;
				CTS->CTS_CODPLA == cPlanGer

				cContaSup 	:= CTS->CTS_CTASUP

				dbSelectArea("CTS")
				dbSetOrder(2)
				If MsSeek(cFilCTS+cPlanGer+cContaSup)
					cDesc 	:= CTS->CTS_DESCCG
					cNormal := CTS->CTS_NORMAL
				Else
					cNormal	:= cCodNor
				EndIf

				dbSelectArea(cCTAlias)
				dbSetOrder(1)
				If !MsSeek(cContaSup)
					dbAppend()
					If cAlias = 'CTU'
						Do Case
							Case cIdent = 'CTT'
								Replace CUSTO 		With cContaSup
								Replace DESCCC		With cDesc
								Replace TIPOCC		With CTS->CTS_CLASSE
							Case cIdent	= 'CTD'
								Replace ITEM 		With cContaSup
								Replace DESCITEM	With cDesc
								Replace TIPOITEM	With CTS->CTS_CLASSE
							Case cIdent = 'CTH'
								Replace CLVL 		With cContaSup
								Replace DESCCLVL	With cDesc
								Replace TIPOCLVL	With CTS->CTS_CLASSE
						EndCase
					Else
						Replace CONTA	With cContaSup
						Replace DESCCTA With cDesc
					EndIf
					Replace SUPERIOR  	With CTS->CTS_CTASUP
					Replace TIPOCONTA	With CTS->CTS_CLASSE
					Replace NORMAL   	With CTS->CTS_NORMAL
					Replace ORDEM		With CTS->CTS_ORDEM
					Replace IDENTIFI	With CTS->CTS_IDENT
					Replace FILIAL		With xFilial( cCTAlias )

					Replace TOTVIS 		With CTS->CTS_TOTVIS
					Replace VISENT 		With CTS->CTS_VISENT
					Replace SLDENT 		With CTS->CTS_SLDENT
					Replace FATSLD 		With CTS->CTS_FATSLD

					If lColuna
						Replace COLUNA  With IIf(  __lCOLUN2, Val(CTS->CTS_COLUN2), GetCTSCol(CTS->CTS_COLUNA,'N',Alias()))
					EndIf

					If lTpValor
						Replace TPVALOR  With CTS->CTS_TPVALO
					EndIf

					If lPicture
						Replace PICTURE  With CTS->CTS_PICTUR
					EndIf

					If lTRegCts
						CT1->(DbSeek(xFilial("CT1") + CTS->CTS_CT1INI))
						Replace DESCORIG 	With &("CT1->CT1_DESC" + cMoeda),;
						TIPOCONTA 	With CT1->CT1_CLASSE,;
						NORMAL    	With CT1->CT1_NORMAL
					Endif
					aAreaCTS:=CTS->(GetArea())
					While CTS->(!EOF()) .AND. cFilCTS+cPlanGer+cContaSup ==  xFilial("CTS")+CTS->CTS_CODPLA +CTS->CTS_CONTAG

						If Left(CTS->CTS_FORMUL, 7) == "ROTINA="
							nFatorS := &(Subs(CTS->CTS_FORMUL, 8))
							Aadd(aFator,{Recno(),nFatorS," ",.F.,0,.F.})
						ElseIf Left(CTS->CTS_FORMUL, 6) = "TEXTO="		// Adiciona texto a descricao
							Aadd(aFator,{Recno(),1,Alltrim(&(Subs(CTS->CTS_FORMUL, 7))),.F.,0,.F.})
						ElseIf Left(CTS->CTS_FORMUL, 9) = "TEXTOVAR="		// Adiciona texto a descricao
							Aadd(aFator,{Recno(),1,Alltrim(&(Subs(CTS->CTS_FORMUL, 10))),.F.,0,.T. })
						ElseIf Left(CTS->CTS_FORMUL,6 ) == "SALDO="
							nFatorS := &(Subs(CTS->CTS_FORMUL, 7))
							Aadd(aFator,{Recno(),1," ",.T.,nFatorS,.F.})
						EndIf

						CTS->(Dbskip())
					EndDo
					CTS->(RestArea(aAreaCTS))
				EndIf

				Replace	SALDOANT With SALDOANT + nSaldoAnt			// Saldo Anterior
				Replace SALDOATU With SALDOATU + nSaldoAtu			// Saldo Atual

				Replace SALDOATUDB With SALDOATUDB + nSaldoAtuD		//Saldo Atual Devedor
				Replace SALDOATUCR With SALDOATUCR + nSaldoAtuC		//Saldo Atual Credor

				If nSaldoDeb < 0 //.And. cNormal == "1"
					Replace SALDOCRD	With SALDOCRD + nSaldoDeb
				ElseIf nSaldoDeb >= 0 //.And. cNormal == "1"
					Replace SALDODEB	With SALDODEB + nSaldoDeb
				EndIf
				If nSaldoCrd < 0 //.And. cNormal == "2"
					Replace SALDODEB	With SALDODEB + nSaldoCrd
				ElseIf nSaldoCrd >= 0 //.And. cNormal == "2"
					Replace SALDOCRD	With SALDOCRD + nSaldoCrd
				EndIf

				//				Replace MOVIMENTO With nSaldoCrd-nSaldoDeb
				Replace MOVIMENTO With Iif(FwIsInCallStack('CTBR560P') .OR. FwIsInCallStack('CTBR560'),MOVIMENTO+(nSaldoCrd-nSaldoDeb),SALDOCRD-SALDODEB)

				If lSemestre		// Saldo por semestre
					Replace SALDOSEM With SALDOSEM + nSaldoSEM
				Endif
				If lPeriodo0		// Saldo periodo determinado
					Replace SALDOPER With SALDOPER + nSaldoPER
				Endif

				If lMovPeriodo		// Movimento periodo anterior
					Replace MOVPERANT With MOVPERANT + nMovPerAnt
				EndIf
				If lComNivel
					Aadd(aNivel, Recno())
				Endif

				If lContDesc
					Replace DESCCONT With CTS->CTS_DETHCG
				EndIf

				dbSelectArea("CTS")
				If !Eof() .And. Empty(CTS->CTS_CTASUP)
					dbSelectArea(cCTAlias)
					Replace NIVEL1 With .T.
					dbSelectArea("CTS")
					Exit
				EndIf
			EndDo

			If lComNivel
				dbSelectArea(cCTAlias)
				nContador 	:= 1
				For nNivel 	:= Len(aNivel) To 1 Step -1
					DbGoto(aNivel[nNivel])
					If nContador < 99
						Replace NIVEL With nContador ++
					Else
						Replace NIVEL With 99
					EndIf
				Next
			Endif

		EndIf
	Endif

	dbSelectArea("CTS")
	dbSetOrder(1)
	dbGoTo(nReg)
	dbSkip()

EndDo

dbSelectArea(cCTAlias)

If Len(aFator) >0
	For nA:=1 To Len(aFator)
		Dbgoto(aFator[Na][1])
		RecLock( cCTAlias, .f. )
		Replace	SALDOANT 	With SALDOANT * aFator[Na][2]
		Replace SALDOATU 	With SALDOATU * aFator[Na][2]
		Replace SALDOATUDB 	With SALDOATUDB * aFator[Na][2]
		Replace SALDOATUCR 	With SALDOATUCR * aFator[Na][2]
		Replace SALDOCRD	With SALDOCRD * aFator[Na][2]
		Replace SALDODEB	With SALDODEB * aFator[Na][2]
		Replace SALDOCRD	With SALDOCRD * aFator[Na][2]
		Replace MOVIMENTO 	With MOVIMENTO * aFator[Na][2]
		If lSemestre
			Replace SALDOSEM 	With SALDOSEM * aFator[Na][2]
		EndIf
		If lPeriodo0
			Replace SALDOPER 	With SALDOPER * aFator[Na][2]
			Replace MOVPERANT 	With MOVPERANT * aFator[Na][2]
		EndIf
		If aFator[Na][4]
			Replace	SALDOANT 	With aFator[Na][5]
			Replace SALDOATU 	With aFator[Na][5]
			Replace SALDOATUDB 	With aFator[Na][5]
			Replace SALDOATUCR 	With aFator[Na][5]
			Replace SALDOCRD	With aFator[Na][5]
			Replace SALDODEB	With aFator[Na][5]
			Replace SALDOCRD	With aFator[Na][5]
			Replace MOVIMENTO 	With aFator[Na][5]
			If lSemestre
				Replace SALDOSEM 	With aFator[Na][5]
			EndIf
			If lPeriodo0
				Replace SALDOPER 	With aFator[Na][5]
				Replace MOVPERANT 	With aFator[Na][5]
			EndIf
		EndIf

		If aFator[Na][6]
			Replace DESCCTA With 	Alltrim(aFator[Na][3])
		Else
			Replace DESCCTA With 	Alltrim(DESCCTA)+" "+Alltrim(aFator[Na][3])
		EndIf
		MsUnlock()
	Next
EndIf

RestArea(aSaveArea)

Return




//-------------------------------------------------------------------
/*{Protheus.doc} u_xSaldTotCT7
Retorna os saldos do intervalo da conta ate a conta

Redirecionada para a rotina SaldoTotCQ

@author Alvaro Camillo Neto

@version P12
@since   20/02/2014
@return  Nil
@obs
*/
//-------------------------------------------------------------------
User Function xSaldTotCT7(cContaIni,cContaFim,dData,cMoeda,cTpSald,lImpAntLP,dDataLP,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,cArqCt7,lConsSaldo)
Local aRet := {}

aRet := u_x1SaldoTotCQ("CT1",@cContaIni,@cContaFim,/*cCCustoIni*/,/*cCCustoFim*/,/*cItemIni*/,/*cItemFim*/,/*cClasseIni*/,/*cClasseFim*/,@dData,;
@cMoeda,@cTpSald,@lImpAntLP,@dDataLP,@aSelFil,@lRecDesp0,@cRecDesp,@dDtZeraRD)

Return aRet

User  Function x1SaldoTotCQ(cArqBase,cContaIni,cContaFim,cCCustoIni,cCCustoFim,cItemIni,cItemFim,cClasseIni,cClasseFim,dData,;
cMoeda,cTpSald,lImpAntLP,dDataLP,aSelFil,lRecDesp0,cRecDesp,dDtZeraRD,lTodasFil)

Local aArea		:= GetArea()
Local nSaldoAtu	:= 0
Local nDebito 	:= 0
Local nCredito	:= 0
Local nAtuDeb		:= 0
Local nAtuCrd		:= 0
Local nSaldoAnt	:= 0
Local nAntDeb		:= 0
Local nAntCrd		:= 0
Local cQuery		:= ""                    
Local nCont		:= 0 
Local nTamRecDes	:= Len(Alltrim(cRecDesp))
Local cQryFilDia	:= ''
Local cQryFilMes	:= ''
Local cTipoSaldo	:= ""
Local aTamVlr		:= TamSX3("CT2_VALOR")
Local cMesTmpFil
Local cDiaTmpFil
Local cTabMes		:= ""
Local cTabDia		:= ""
Local cTrb			:= GetNextAlias()
Local cIsNull		:= ""
Local cTipoDB		:= Alltrim(Upper(TCGetDB()))

Default cTpSald    := Iif(Empty(cTpSald),"1",cTpSald)
Default lImpAntLp  := .F.
Default dDataLp    := CTOD("  /  /  ")
Default lRecDesp0  := .F.
Default cRecDesp   := ""
Default dDtZeraRD  := CTOD("  /  /  ")
Default aSelFil    := {}
Default lTodasFil  := .F.


//-------------------------------------------------------
// Tratamento realizado devido ausência se ChangeQuery() 
//-------------------------------------------------------
If ("INFORMIX" $ cTipoDB) .Or. ("ORACLE" $ cTipoDB)
	cIsNull  := " NVL"
ElseIf ("DB2" $ cTipoDB)  .Or. ("POSTGRES" $ cTipoDB)
	cIsNull := " COALESCE"
Else
	cIsNull := " ISNULL"
EndIf
 

cTipoSaldo := FormatIn(cTpSald,";")

If lRecDesp0 .And. ( Empty(cRecDesp) .Or. Empty(dDtZeraRD) )
	lRecDesp0 := .F.
EndIf

If cArqBase $ "CT1/CT7"
	cArqBase := "CT1"
	dbSelectArea("CQ0")
	dbSelectArea("CQ1")
	cTabMes := "CQ0"
	cTabDia := "CQ1"
ElseIf cArqBase $ "CTT/CT3"
	cArqBase := "CTT"
	dbSelectArea("CQ2")
	dbSelectArea("CQ3")
	cTabMes := "CQ2"
	cTabDia := "CQ3"
ElseIf cArqBase$ "CTD/CT4"
	cArqBase := "CTD"
	dbSelectArea("CQ4")
	dbSelectArea("CQ5")
	cTabMes := "CQ4"
	cTabDia := "CQ5"
ElseIf cArqBase $ "CTH/CTI"
	cArqBase := "CTH"
	dbSelectArea("CQ6")
	dbSelectArea("CQ7")
	cTabMes := "CQ6"
	cTabDia := "CQ7"
EndIf

//³ Tratativa para o filtro de filiais           ³

cQryFilDia := GetRngFil( aSelFil,cTabMes, .T., @cMesTmpFil)
cQryFilMes := GetRngFil( aSelFil,cTabDia, .T., @cDiaTmpFil)

cQuery +=     " SELECT " +CRLF

cQuery +=     " " + cIsNull + "(SUM(SLDANTDEB),0) SLDANTDEB, " +CRLF
cQuery +=     " " + cIsNull + "(SUM(SLDANTCRD),0) SLDANTCRD, " +CRLF
cQuery +=     " " + cIsNull + "(SUM(SALDODEB),0) SALDODEB, " +CRLF
cQuery +=     " " + cIsNull + "(SUM(SALDOCRD),0) SALDOCRD " +CRLF
cQuery +=     " FROM    " +CRLF
cQuery +=     " ( " +CRLF
//		---------- Saldo atual ------

cQuery +=       " SELECT " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabDia+"_DEBITO),0) SALDODEB, " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabDia+"_CREDIT),0) SALDOCRD, " +CRLF
cQuery +=          " 0 SLDANTDEB, " +CRLF
cQuery +=          " 0 SLDANTCRD  " +CRLF
cQuery +=      " FROM "+RetSqlName(cTabDia) +CRLF
cQuery +=      " WHERE " +CRLF
cQuery +=          " D_E_L_E_T_ = ' ' " +CRLF

If !lTodasFil
	cQuery +=          " AND "+cTabDia+"_FILIAL " + cQryFilDia
EndIf

If cContaIni != Nil .And. cContaFim != Nil 
	cQuery +=   " AND "+cTabDia+"_CONTA >= '"+cContaIni+"' " +CRLF
	cQuery +=   " AND "+cTabDia+"_CONTA <= '"+cContaFim+"' " +CRLF
EndIf

If cCCustoIni != Nil .And. cCCustoFim != Nil 
	If  cArqBase $ 'CTT/CTD/CTH'
		cQuery +=   " AND "+cTabDia+"_CCUSTO >= '"+cCCustoIni+"' " +CRLF
		cQuery +=   " AND "+cTabDia+"_CCUSTO <= '"+cCCustoFim+"' " +CRLF
	EndIf
EndIf

If cItemIni != Nil .And. cItemFim != Nil
	If  cArqBase $ 'CTD/CTH'
		cQuery +=   " AND "+cTabDia+"_ITEM >= '"+cItemIni+"' " +CRLF
		cQuery +=   " AND "+cTabDia+"_ITEM <= '"+cItemFim+"' " +CRLF
	EndIf
EndIf

If cClasseIni != Nil .And. cClasseFim != Nil
	If  cArqBase $ 'CTH'
		cQuery +=   " AND "+cTabDia+"_CLVL >= '"+cClasseIni+"'" +CRLF
		cQuery +=   " AND "+cTabDia+"_CLVL <= '"+cClasseFim+"'" +CRLF
	EndIf
EndIf

cQuery +=          " AND "+cTabDia+"_MOEDA = '"+cMoeda+"' " +CRLF
cQuery +=          " AND "+cTabDia+"_TPSALD IN "+cTipoSaldo +CRLF
cQuery +=          " AND "+cTabDia+"_DATA = '"+DTOS(dData)+"' " +CRLF
If lImpAntLP
	cQuery +=      "  AND ("+cTabDia+"_LP <> 'Z' OR ("+cTabDia+"_LP = 'Z' AND "+cTabDia+"_DTLP <> ' ' AND "+cTabDia+"_DTLP <> '' AND "+cTabDia+"_DTLP < '"+DTOS(dDataLP)+"')) "  +CRLF
Endif
//------------------------------------------ Saldo anterior ------------------------------------
//------------------------------Mensal----------------------------------
cQuery +=       " UNION ALL	 " +CRLF

cQuery +=       " SELECT  " +CRLF
cQuery +=          " 0 SALDODEB, " +CRLF
cQuery +=          " 0 SALDOCRD, " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabMes+"_DEBITO),0) SLDANTDEB, " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabMes+"_CREDIT),0) SLDANTCRD " +CRLF
cQuery +=       " FROM " + RetSqlName(cTabMes) +CRLF
cQuery +=       " WHERE " +CRLF

cQuery +=          " D_E_L_E_T_ = ' ' " +CRLF

If !lTodasFil
	cQuery +=          " AND "+cTabMes+"_FILIAL " + cQryFilMes
EndIf

If cContaIni != Nil .And. cContaFim != Nil 
	cQuery +=   " AND "+cTabMes+"_CONTA >= '"+cContaIni+"' " +CRLF
	cQuery +=   " AND "+cTabMes+"_CONTA <= '"+cContaFim+"' " +CRLF
EndIf

If cCCustoIni != Nil .And. cCCustoFim != Nil 
	If  cArqBase $ 'CTT/CTD/CTH'
		cQuery +=   " AND "+cTabMes+"_CCUSTO >= '"+cCCustoIni+"' " +CRLF
		cQuery +=   " AND "+cTabMes+"_CCUSTO <= '"+cCCustoFim+"' " +CRLF
	EndIf
EndIf

If cItemIni != Nil .And. cItemFim != Nil
	If  cArqBase $ 'CTD/CTH'
		cQuery +=   " AND "+cTabMes+"_ITEM >= '"+cItemIni+"' " +CRLF
		cQuery +=   " AND "+cTabMes+"_ITEM <= '"+cItemFim+"' " +CRLF
	EndIf
EndIf

If cClasseIni != Nil .And. cClasseFim != Nil
	If  cArqBase $ 'CTH'
		cQuery +=   " AND "+cTabMes+"_CLVL >= '"+cClasseIni+"'" +CRLF
		cQuery +=   " AND "+cTabMes+"_CLVL <= '"+cClasseFim+"'" +CRLF
	EndIf
EndIf

cQuery +=          " AND "+cTabMes+"_MOEDA = '"+cMoeda+"' " +CRLF
cQuery +=          " AND "+cTabMes+"_TPSALD IN " + cTipoSaldo +CRLF
cQuery +=          " AND "+cTabMes+"_DATA <= '"+DTOS(FirstDay(dData)-1)+"' " +CRLF

If !lImpAntLP .And. lRecDesp0 
	For nCont	:= 1 to nTamRecDes
		If nCont == 1
			cQuery += "	 			AND ( ("+cTabMes+"_CONTA NOT LIKE '"+Substr(cRecDesp,nCont,1)+"%')"
		Else
			cQuery += "	 			AND  ("+cTabMes+"_CONTA NOT LIKE '"+Substr(cRecDesp,nCont,1)+"%')"
		EndIf
	Next
	cQuery += " OR "
	cQuery += " ( "
	For nCont	:= 1 to nTamRecDes
		If nTamRecDes == 1
			cQuery += " ( "+cTabMes+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%')  AND "
		Else
			If nCont == 1
				cQuery += " ( "+cTabMes+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%' OR "
			ElseIf nCont < nTamRecDes
				cQuery += "  "+cTabMes+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%' OR "
			ElseIf nCont == nTamRecDes
				cQuery += " "+cTabMes+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%') AND "
			EndIf
		EndIf
	Next
	cQuery += " "+cTabMes+"_DATA > '" +DTOS(dDtZeraRD)+"') "
	cQuery += " ) "
EndIf

If lImpAntLP
	cQuery += "  AND ("+cTabMes+"_LP <> 'Z' OR ("+cTabMes+"_LP = 'Z' AND "+cTabMes+"_DTLP <> ' ' AND "+cTabMes+"_DTLP <> '' AND "+cTabMes+"_DTLP < '"+DTOS(dDataLP)+"')) "
Endif


//-------------------------Diario Posterior--------------------------------------
cQuery +=   " UNION ALL " +CRLF

cQuery +=       " SELECT " +CRLF

cQuery +=          " 0 SALDODEB, " +CRLF
cQuery +=          " 0 SALDOCRD, " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabDia+"_DEBITO),0) SLDANTDEB, " +CRLF
cQuery +=          " " + cIsNull + "(SUM("+cTabDia+"_CREDIT),0) SLDANTCRD  " +CRLF
cQuery +=      " FROM "+RetSqlName(cTabDia) +CRLF
cQuery +=      " WHERE " +CRLF

cQuery +=          " D_E_L_E_T_ = ' ' " +CRLF

If !lTodasFil
	cQuery +=          " AND "+cTabDia+"_FILIAL " + cQryFilDia
EndIf

If cContaIni != Nil .And. cContaFim != Nil 
	cQuery +=   " AND "+cTabDia+"_CONTA >= '"+cContaIni+"' " +CRLF
	cQuery +=   " AND "+cTabDia+"_CONTA <= '"+cContaFim+"' " +CRLF
EndIf

If cCCustoIni != Nil .And. cCCustoFim != Nil 
	If  cArqBase $ 'CTT/CTD/CTH'
		cQuery +=   " AND "+cTabDia+"_CCUSTO >= '"+cCCustoIni+"' " +CRLF
		cQuery +=   " AND "+cTabDia+"_CCUSTO <= '"+cCCustoFim+"' " +CRLF
	EndIf
EndIf

If cItemIni != Nil .And. cItemFim != Nil
	If  cArqBase $ 'CTD/CTH'
		cQuery +=   " AND "+cTabDia+"_ITEM >= '"+cItemIni+"' " +CRLF
		cQuery +=   " AND "+cTabDia+"_ITEM <= '"+cItemFim+"' " +CRLF
	EndIf
EndIf

If cClasseIni != Nil .And. cClasseFim != Nil
	If  cArqBase $ 'CTH'
		cQuery +=   " AND "+cTabDia+"_CLVL >= '"+cClasseIni+"'" +CRLF
		cQuery +=   " AND "+cTabDia+"_CLVL <= '"+cClasseFim+"'" +CRLF
	EndIf
EndIf

cQuery +=          " AND "+cTabDia+"_MOEDA = '"+cMoeda+"' " +CRLF
cQuery +=          " AND "+cTabDia+"_TPSALD IN "+cTipoSaldo +CRLF

cQuery +=          " AND "+cTabDia+"_DATA >= '"+DTOS(FirstDay(dData))+"' " +CRLF
cQuery +=          " AND "+cTabDia+"_DATA < '"+DTOS(dData)+"' " +CRLF

If !lImpAntLP .And. lRecDesp0 
	For nCont	:= 1 to nTamRecDes
		If nCont == 1
			cQuery += "	 			AND ( ("+cTabDia+"_CONTA NOT LIKE '"+Substr(cRecDesp,nCont,1)+"%')"
		Else
			cQuery += "	 			AND  ("+cTabDia+"_CONTA NOT LIKE '"+Substr(cRecDesp,nCont,1)+"%')"
		EndIf
	Next
	cQuery += " OR "
	cQuery += " ( "
	For nCont	:= 1 to nTamRecDes
		If nTamRecDes == 1
			cQuery += " ( "+cTabDia+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%')  AND "
		Else
			If nCont == 1
				cQuery += " ( "+cTabDia+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%' OR "
			ElseIf nCont < nTamRecDes
				cQuery += "  "+cTabDia+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%' OR "
			ElseIf nCont == nTamRecDes
				cQuery += " "+cTabDia+"_CONTA LIKE '"+Substr(cRecDesp,nCont,1)+"%') AND "
			EndIf
		EndIf
	Next
	cQuery += " "+cTabDia+"_DATA > '" +DTOS(dDtZeraRD)+"') "
	cQuery += " ) "
EndIf

If lImpAntLP
	cQuery += "  AND ("+cTabDia+"_LP <> 'Z' OR ("+cTabDia+"_LP = 'Z' AND "+cTabDia+"_DTLP <> ' ' AND "+cTabDia+"_DTLP <> '' AND "+cTabDia+"_DTLP < '"+DTOS(dDataLP)+"')) "
Endif

cQuery +="		) SALDO " +CRLF


cQuery := ChangeQuery(cQuery)		


If Select(cTRB) > 0
	dbSelectArea(cTRB)
	(cTRB)->(dbCloseArea())
Endif

dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cTRB,.T.,.F.)

TcSetField(cTRB,"SLDANTDEB"  ,"N",aTamVlr[1],aTamVlr[2])
TcSetField(cTRB,"SLDANTCRD"  ,"N",aTamVlr[1],aTamVlr[2])
TcSetField(cTRB,"SALDODEB"  ,"N",aTamVlr[1],aTamVlr[2])
TcSetField(cTRB,"SALDOCRD"  ,"N",aTamVlr[1],aTamVlr[2])
// Movimentacao da data
nDebito	:= (cTRB)->SALDODEB
nCredito	:= (cTRB)->SALDOCRD

nAntDeb	:= (cTRB)->SLDANTDEB  
nAntCrd	:= (cTRB)->SLDANTCRD  

nAtuDeb := nAntDeb + nDebito
nAtuCrd := nAntCrd + nCredito

nSaldoAtu := nAtuCrd - nAtuDeb
nSaldoAnt := nAntCrd - nAntDeb

If Select(cTrb) > 0
	dbSelectArea(cTrb)
	(cTrb)->(dbCloseArea())
	CtbTmpErase(cMesTmpFil)
	CtbTmpErase(cDiaTmpFil)
Endif


RestArea(aArea)
aSize(aArea,0)
aArea := nil 
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Retorno:                                             ³
//³ [1] Saldo Atual (com sinal)                          ³
//³ [2] Debito na Data                                   ³
//³ [3] Credito na Data                                  ³
//³ [4] Saldo Atual Devedor                              ³
//³ [5] Saldo Atual Credor                               ³
//³ [6] Saldo Anterior (com sinal)                       ³
//³ [7] Saldo Anterior Devedor                           ³
//³ [8] Saldo Anterior Credor                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//      [1]       [2]     [3]      [4]     [5]     [6]       [7]     [8]
Return {nSaldoAtu,nDebito,nCredito,nAtuDeb,nAtuCrd,nSaldoAnt,nAntDeb,nAntCrd}
