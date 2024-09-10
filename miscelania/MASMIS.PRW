#INCLUDE "PROTHEUS.CH"
#include "fileio.ch"
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWLIBVERSION.CH"



User Function xFA474W()
	
	Local lRet := .F. As Logical
    Local __lExtAPI	:= NIL

	If __lExtAPI == NIL
		__lExtAPI := SEE->(ColumnPos("EE_EXTAPI")) > 0
	EndIf

	If M->EE_EXTJOB == '1' .And. (!__lExtAPI .or.  (__lExtAPI .And.  M->EE_EXTAPI != '2'))
		lRet := .T.
	Endif

Return lRet
