﻿Function URLEncoding(vstrIn)
    dim  strReturn
	dim i,ThisChr,innerCode,Hight8,Low8
    strReturn = ""
    For i = 1 To Len(vstrIn)
        ThisChr = Mid(vstrIn,i,1)
        If Abs(Asc(ThisChr)) < &HFF Then
            strReturn = strReturn & ThisChr
        Else
            innerCode = Asc(ThisChr)
            If innerCode < 0 Then
                innerCode = innerCode + &H10000
            End If
            Hight8 = (innerCode  And &HFF00)\ &HFF
            Low8 = innerCode And &HFF
            strReturn = strReturn & "%" & Hex(Hight8) &  "%" & Hex(Low8)
        End If
    Next
    URLEncoding = strReturn
End Function

Function bytes2BSTR(vIn)
    dim  strReturn
	dim i,ThisCharCode,NextCharCode
	strReturn = ""
    For i = 1 To LenB(vIn)
        ThisCharCode = AscB(MidB(vIn,i,1))
        If CLng(ThisCharCode) < 128 Then
            strReturn = strReturn & Chr(ThisCharCode)
        Else
            NextCharCode = AscB(MidB(vIn,i+1,1))
            strReturn = strReturn & Chr(CLng(ThisCharCode) * 256 + CInt(NextCharCode))
            i = i + 1
        End If
    Next
    bytes2BSTR = strReturn
End Function
