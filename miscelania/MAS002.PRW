#include "protheus.ch"
#include "fina435.ch"
#Include "AP5MAIL.CH"
#include "FINA205.ch"



/*/{Protheus.doc} FINA435
Retorno de comunica��o banc�ria a pagar - via Job.

@param   cParm01    C�digo da empresa.
@param   cParm02    C�digo da filial.

@author  Aldo Barbosa dos Santos
@since   31/05/2011
/*/
User Function MAS002()
Local aEmpresa  := {}
Local nEmpresa  := 0 
Private lExecJob := .T.
Private aMsgSch  := {}
Private aFA205R  := {}

//aAdd(aEmpresa,{"01","02","03","04","05","06","07","08","09","10","11","12","13","30","40","60","98"})


//For nEmpresa := 1 to Len(aEmpresa)
	lExecJob := .T.
	aMsgSch  := {}
	aFA205R  := {}
	RpcSetEnv('01', '050101', Nil, Nil, Nil, "FIN")
		FA435JOB() 
	RpcClearEnv()
//Next nEmpresa
Return

/*/{Protheus.doc} FA435JOB
Retorno de comunica��o banc�ria a pagar - via Job.

@author  Aldo Barbosa dos Santos
@since   31/05/2011
/*/
Static Function FA435JOB()

Local cPerg	:= "AFI430"
Local tRetPg:= .T.
//Local aVetPar // vetor das perguntas
Local cQuery  // query de bancos que serao executados automaticamente
Local cAlias  // alias temporario dos banco que serao executados
Local cBarra := If(IsSrvUnix(), "/", "\")
Local nA
local nI		:= 0 

Local aArq
Local cArquivo
Local cDirArq
Local cDirBkp

Local cPathArq := ""
Local cPathBkp := ""

Local lDirInc  := .F.
Local cDirInc  := ""

SEE->(dbsetorder(1))  // EE_FILIAL, EE_CODIGO, EE_AGENCIA, EE_CONTA, EE_SUBCTA.

lDirInc	:= SEE->(ColumnPos("EE_INCPAG")) > 0

// L� as perguntas do FINA430 que ser�o modificadas de acordo com os novos campos da tabela de bancos.
// Pergunte(cPergunta,lAsk,cTitle,lOnlyView,oDlg,lUseProf,aPerg,lBreakLine,lHasHelp)
Pergunte(cPerg, .F., Nil, Nil, Nil, .F.)

// Seleciona todas as contas que est�o programadas para recebimento autom�tico.
cQuery := "SELECT R_E_C_N_O_ REGSEE "
cQuery += "FROM " + RetSqlName("SEE") + " SEE "
cQuery += "WHERE EE_FILIAL = '" + xFilial("SEE") + "' "
cQuery += "AND EE_RETAUT IN ('2', '3') " // 1.recebimento; 2.pagamento; 3.ambos
cQuery += "AND EE_DIRPAG <> ' ' " // Somente contas com diret�rio preenchido.
cQuery += "AND SEE.D_E_L_E_T_ = ' ' "
//cQuery += "ORDER BY EE_DIRREC"

cAlias := MPSysOpenQuery(ChangeQuery(cQuery))
Do While (cAlias)->(!Eof())
	// Mant�m posicionado pois o FINA430 vai utilizar estas informa��es.

	SEE->(dbGoto((cAlias)->REGSEE))

	// Verifica se todos os par�metros necess�rios foram preechindos e grava no log.
	If !fFA205ERRO()

		// le os arquivos do diretorio configurado
		cDirArq := Alltrim(SEE->EE_DIRPAG)
		cDirBkp := Alltrim(SEE->EE_BKPPAG)

		// Verifica se os diret�rios est�o com a barra no final.
		If right(cDirArq, 1) <> cBarra
			cDirArq += cBarra
		Endif
		If !empty(cDirBkp) .and. right(cDirBkp, 1) <> cBarra
			cDirBkp += cBarra
		Endif
		sEE_EXTRET := 'RET'  //SEE->EE_EXTRET 
		// L� os arquivos a serem processados.
		aArq := Directory(cDirArq + "*." + AllTrim(sEE_EXTRET) + "*")

		For nA := 1 to Len(aArq)

			// Armazena o nome do arquivo nos par�metros.
			cArquivo := aArq[nA, 1]

			//����������������������������������������������������Ŀ
			//� Verifica as perguntas selecionadas                 �
			//�                                                    �
			//� Parametros                                         �
			//�                                                    �
			//� MV_PAR01: Mostra Lanc. Contab  ? Sim Nao           �
			//� MV_PAR02: Aglutina Lanc. Contab? Sim Nao           �
			//� MV_PAR03: Arquivo de Entrada   ?                   �
			//� MV_PAR04: Arquivo de Config    ?                   �
			//� MV_PAR05: Banco                ?                   �
			//� MV_PAR06: Agencia              ?                   �
			//� MV_PAR07: Conta                ?                   �
			//� MV_PAR08: SubConta             ?                   �
			//� MV_PAR09: Contabiliza          ?                   �
			//� MV_PAR10: Padrao Cnab          ? Modelo1 Modelo 2  �
			//� MV_PAR11: Processa filiais     ? Modelo1 Modelo 2  �
			//������������������������������������������������������
			// Atualiza o pergunte do FINA200 de acordo com a tabela de bancos
			aVet650 := {{'mv_par01', 2					},; // 01	Mostra Lanc Contab ?
						{'mv_par02', Val(SEE->EE_AGLCTB)},; // 02	Aglut Lancamentos ?
						{'mv_par03', cDirArq + cArquivo	},; // 03	Arquivo de Entrada ?
						{'mv_par04', SEE->EE_CFGPAG		},; // 04	Arquivo de Config ?
						{'mv_par05', SEE->EE_CODIGO		},; // 05	Codigo do Banco ?
						{'mv_par06', SEE->EE_AGENCIA	},; // 06	Codigo da Agencia ?
						{'mv_par07', SEE->EE_CONTA		},; // 07	Codigo da Conta ?
						{'mv_par08', SEE->EE_SUBCTA		},; // 08	Codigo da Sub-Conta ?
						{'mv_par09', 2					},; // 09	Contabiliza On Line ?
						{'mv_par10', Val(SEE->EE_CNABPG)},; // 10	Configuracao CNAB ?
						{'mv_par11', Val(SEE->EE_PROCFL)},; // 11	Processa Filial?
						{'mv_par12', 2					}}  // 12	Considera Multiplas naturezas ?


			// Controle de mensagens de erro.
			aMsgSch := {}


			// Executa a consist�ncia antes de executar o recebimento.
			//FINR650(aVet650)

			// Executa o programa de recebimento.
			tRetPg := u_MAS001(1,aVet650)

			// Envia e-mail (FINA205) das mensagens de erro
			u_zFA205MAIL("Retorno Bancario Automatico (Pagar)", cDirArq + cArquivo, aMsgSch) // 


//ee_incpag = C:\CNAB\ERR_TAU     
//ee_bkppag = C:\CNAB\BKP_ITAU                                  
//ee_cfgpag = itau.2pr
//ee_dirpag = C:\CNAB\RET_ITAU                                                              

			If lDirInc
				cDirInc := Alltrim(SEE->EE_INCPAG)
			EndIf

			If Len(aMsgSch) == 0
				If !Empty(cDirBkp)
					cPathArq := cDirArq + cArquivo
					cPathBkp := cDirBkp + cArquivo
					If !_CopyFile(cPathArq, cPathBkp) //copia o arquivo para o diretorio de backup
						ConOut("N�o foi poss�vel copiar o arquivo " + cPathArq + " para o diret�rio " + cDirBkp) // "N�o foi poss�vel copiar o arquivo " # " para o diret�rio "
					Else
						// Exclui o arquivo processado.
						If FErase(cPathArq) < 0
							ConOut("N�o foi poss�vel excluir o arquivo " + cPathArq) // "N�o foi poss�vel excluir o arquivo "
							ConOut("fErase: " + "Erro " + cValToChar(FError()))  // "Erro "
						EndIf
					EndIf
				EndIf
			Else
				If lDirInc
					//Gera aquivo com erros encontrados
					nHandle := FCreate(cDirInc+left(alltrim(cArquivo),len(alltrim(cArquivo))-3)+'ERR')
					For nI := 1 to Len(aMsgSch)
						FWrite(nHandle, aMsgSch[nI])
					Next nI
					FClose(nHandle)
					cPathArq := cDirArq + cArquivo
					cPathInc := cDirInc + cArquivo		
					If !_CopyFile(cPathArq, cPathInc) //copia o arquivo para o diretorio de Inconsistencia.
						ConOut("N�o foi poss�vel copiar o arquivo " + cPathArq + " para o diret�rio " + cDirInc) // "N�o foi poss�vel copiar o arquivo " # " para o diret�rio "
					Else
						FErase(cPathArq)
					EndIf	
				EndIf
			EndIf
		Next nA
	EndIf

	(cAlias)->(DbSkip())
EndDo

(cAlias)->(DbCloseArea())

Return



/*
??????????????????????????????????????
???????????????????????????????????????
???????????????????????????????????????
??un?o    ?A205Erro ?Autor ?Aldo Barbosa dos Santos        ?9/06/11??
???????????????????????????????????????
??escricao ?e os dados do pergunte												  ??
???????????????????????????????????????
???????????????????????????????????????
??????????????????????????????????????/
*/
Static Function fFA205ERRO()
Local aCpoVld := {}		// vetor com as validacoes dos campos necess?ios para o processamento
Local lErrVld := .F.		// controle de mensagem de alerta na validacao dos campos
Local nA

//If __lDirPag == Nil
	__lDirPag	:= SEE->(ColumnPos("EE_INCPAG")) > 0
//EndIf

//If __lDirRec == Nil
	__lDirRec	:= SEE->(ColumnPos("EE_INCREC")) > 0
//EndIf

// validacao dos campos necessarios para o processamento automatico
if SEE->EE_RETAUT $ '1|3' // receber ou ambos
	AAdd(aCpoVld,{'EE_ATUMOE',	{|| SEE->EE_ATUMOE <> ' ' }	,.F.})	// Atualiza Moeda
	AAdd(aCpoVld,{'EE_DIRREC',	{|| SEE->EE_DIRREC <> ' ' }	,.F.})	// Diretorio de Importacao Recebimento
	AAdd(aCpoVld,{'EE_CFGREC',	{|| SEE->EE_CFGREC <> ' ' }	,.F.})	// Diretorio de Configuracao Recebimento
	AAdd(aCpoVld,{'EE_BKPREC',	{|| SEE->EE_BKPREC <> ' ' }	,.F.})	// Diretorio de Backup Recebimento
	AAdd(aCpoVld,{'EE_DESCOM',	{|| SEE->EE_DESCOM <> ' ' }	,.F.})	// Abate desconto da Comissao
	AAdd(aCpoVld,{'EE_CNABRC',	{|| SEE->EE_CNABRC <> ' ' }	,.F.})	// Configuracao CNAB Recebimento
	AAdd(aCpoVld,{'EE_PROCFL',	{|| SEE->EE_PROCFL <> ' ' }	,.F.})	// Processa Filial

	If __lDirRec
		AAdd(aCpoVld,{'EE_INCREC',	{|| SEE->EE_INCREC <> ' ' }	,.F.})	// Diretorio de Arquivo Inconsistente
	EndIf

Endif	
if SEE->EE_RETAUT $ '2|3'  // pagar ou ambos
	AAdd(aCpoVld,{'EE_DIRPAG',	{|| SEE->EE_DIRPAG <> ' ' }	,.F.})	// Diretorio de Importacao Recebimento
	AAdd(aCpoVld,{'EE_CFGPAG',	{|| SEE->EE_CFGPAG <> ' ' }	,.F.})	// Diretorio de Configuracao Recebimento
	AAdd(aCpoVld,{'EE_BKPPAG',	{|| SEE->EE_BKPPAG <> ' ' }	,.F.})	// Diretorio de Backup Recebimento
	AAdd(aCpoVld,{'EE_CNABPG',	{|| SEE->EE_CNABPG <> ' ' }	,.F.})	// Configuracao CNAB Recebimento

	If __lDirPag
		AAdd(aCpoVld,{'EE_INCPAG',	{|| SEE->EE_INCPAG <> ' ' }	,.F.})	// Diretorio de Arquivo Inconsistente
	EndIf

Endif
if SEE->EE_RETAUT == '3'  //  ambos
	AAdd(aCpoVld,{'EE_AGLCTB',	{|| SEE->EE_AGLCTB <> ' ' }	,.F.})	// Aglutina lancamento contabil
	AAdd(aCpoVld,{'EE_MULTNT',	{|| SEE->EE_MULTNT <> ' ' }	,.F.})	// Considera Multiplas naturezas
Endif

lErrVld := .F.
For nA := 1 to Len(aCpoVld)
	if ! Eval(aCpoVld[nA,2])
		aCpoVld[nA,3] := .T.  // marca o campo com erro
		lErrVld := .T.
	Endif
Next

// se existe campos que nao atendam a validacao deve gravar o problema no log
if lErrVld
	ProcLogAtu("INICIO","Retorno Bancario Automatico (Receber) - Parametros de Bancos - Banco:"+SEE->EE_CODIGO+" "+SEE->EE_AGENCIA+" "+SEE->EE_CONTA+" "+SEE->EE_SUBCTA) // "Retorno Bancario Automatico (Receber) # "Parametros de Bancos - Banco:"
	For nA := 1 to Len(aCpoVld)
		if aCpoVld[nA,3]
			ProcLogAtu("ALERTA","Campo:"+aCpoVld[nA,1]+" com conteudo invalido ou nao informado.") // "Campo:" # " com conteudo invalido ou nao informado."
		Endif
	Next
	ProcLogAtu("FIM","Retorno Bancario Automatico (Receber) - Parametros de Bancos - Banco:"+SEE->EE_CODIGO+" "+SEE->EE_AGENCIA+" "+SEE->EE_CONTA+" "+SEE->EE_SUBCTA) // "Retorno Bancario Automatico (Receber) # "Parametros de Bancos - Banco:"
Endif		

Return( lErrVld )


**********************************************************
User Function zFA205MAIL(cTitulo,cArq, aMsgSch, lEnvAtch) // Envia email
*************
Local aArea			:= GetArea()
Local lSendMail	:= .F.
Local nAux			:= 0
Local cSubject		:= ""
Local cBody			:= ""
Local	cMsgErr     := ""
Local aDestE		:= {}
Local cDestE      := GetMv("MV_RETMAIL") // destinatarios do email de retorno automatico via schedule
Local cAttach     := ""
Local cFile		  := ""				

Default cTitulo := "Retorno Bancario Automatico"
Default cArq    := "ARQ.NAO.INFORMADO"
Default lEnvAtch:= .T.  // envia ou nao o arquivo como attach

// se o parametro de destinatarios de envio de email estiver vazio ignora o envio
If ValType(cDestE) <> "C" .or. Empty(cDestE)
	Return Nil
EndIf

aDestE := StrTokArr(cDestE,";")
If Len(aDestE) == 0
	Return Nil
EndIf

cSubject	:= cTitulo + ' - Arquivo: '+cArq + '  Processamento: ' +Dtoc(dDataBase) + ' - ' + Time()

// corpo principal do email com o resumo do emvio
cBody	:= '<HTML>'
cBody	+= ' <HEAD>'
cBody	+= '  <TITLE>'+cTitulo+' - Arquivo: '+cArq+'</TITLE>'
cBody	+= ' </HEAD>'
cBody	+= ' <BODY>'
cBody	+= '  <H1>'
cBody	+= '   <FONT SIZE="4" COLOR="#000099">'
cBody	+= '    <B>'+cTitulo+'</B>'
cBody	+= '   </FONT>'
cBody	+= '  </H1>'
cBody += '  <BR>
cBody	+= '   <FONT SIZE="3" COLOR="#000099">'
cBody	+= '    <B>Arquivo: '+cArq+'</B>'
cBody	+= '   </FONT>'
cBody	+= '  <H1><HR></H1>'

// adiciona as mensagens contidas no vetor
If Len(aMsgSch) >= 0
	cBody	+= '  <H1>'
	cBody	+= '   <FONT SIZE="3" COLOR="#000000">'
	cBody	+= '    Mensagens do Processamento : '
	cBody	+= '   </FONT>'
	cBody	+= '  </H1>'

	//??????????
	//?ONTAGEM DO E-MAIL?
	//??????????
	if Len(aMsgSch) == 0
		cBody += '<BR>&nbsp;&nbsp;-&nbsp;Processamento sem inconsistencias'
	Else
		For nAux := 1 To Len(aMsgSch)
			cBody += '<BR>&nbsp;&nbsp;-&nbsp;' + aMsgSch[nAux]
		Next
	Endif	
	cBody	+= '  <H1><HR></H1>'
EndIf

cBody	+= '  <H1>'
cBody	+= '   <FONT SIZE="2" COLOR="#FF0000">'
cBody	+= '    '+cSubject
cBody	+= '   </FONT>'
cBody	+= '  </H1>'
cBody	+= ' </BODY>'
cBody	+= '</HTML>'


// processa o relatorio de processamento e grava fisicamente no disco retornando o nome com o caminho
if lEnvAtch
	cPath		:=ALLTRIM(GETMV('MV_RELT'))
	cFile	 	:= Substr(cArq,rat("\",cArq)+1,len(cArq))          
	cFile		:= Substr(cFile,1, rat(".",cFile)-1)
	if File(cPath+cFile+".PDF")
		cAttach := cPath+cFile+".PDF"
	Endif	
Endif
// se nao tem assunto, ou corpo, ou destinatario - nao envia email para nao dar erro
If ! Empty(cSubject) .and. !Empty(cBody) .and. !Empty(aDestE)

     lSendMail := U_GEnvMail(cDestE, "RETORNO CNAB ITAU" , cBody , {}, /*MsgLog*/.F. , /*lTLS*/ .T. )

//	lSendMail 	:= FA205SENDMAIL(aDestE, cSubject, cBody, cAttach)

  	If !lSendMail .And. !Empty(cMsgErr)
  		ConOut(cMsgErr)  //-- Ocorreu um problema no envio do e-mail:
  	EndIf
EndIf

RestArea(aArea)

Return Nil


