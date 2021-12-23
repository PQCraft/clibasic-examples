#!/usr/bin/env clibasic

N=7

IF _ARGC()>0:N=VAL(_ARG$()):ENDIF

IF N<1:EXIT:ENDIF
ON=N
N=N+2
LN=INT(10*N/3)+16
ND=1
DIM A,LN
N9=0
PD=0

OC=-1
IF 0
    @OUT.OUT
        IF OC=ON&D>=5:OD=OD+1:ENDIF
        IF OND=0:PRINT OD;:RETURN:ENDIF
        IF OD=0:RETURN:ENDIF
        IF ON=1:PRINT OD;:ELSE:PRINT OD;".";:ENDIF
        ND=0
    RETURN
    @OUT
        IF OC>0:GOSUB OUT.OUT:ENDIF
        OND=ND
        OD=D
        OC=OC+1
        RETURN
    RETURN
ENDIF

FOR J,1,J<=LN,1
    A[J-1]=2
NEXT

T=0

FOR J,1,J<=N,1
    @LOOP
    Q=0
    FOR I,LN,I>0,-1
        X=10*A[I-1]+Q*I
        A[I-1]=X-(2*I-1)*INT(X/(2*I-1))
        Q=INT(X/(2*I-1))
    NEXT
    A[0]=Q-10*INT(Q/10)
    Q=INT(Q/10)
    IF Q=9
        N9=N9+1
        T=1
    ELSE
        IF Q=10
            D=PD+1
            GOSUB OUT
            IF NT=0
                FOR K,1,K<=N9,1
                    D=0
                    GOSUB OUT
                NEXT
            ENDIF
            NT=0
            PD=0
            N9=0
        ELSE
            D=PD
            GOSUB OUT
            PD=Q
            IF NT=0
                FOR K,1,K<=N9,1
                    D=9
                    GOSUB OUT
                NEXT
            ENDIF
            NT=0
            N9=0
        ENDIF
    ENDIF
    IF T:T=0:IF J=N:NT=1:ENDIF:J=J+1:%LOOP:ENDIF
NEXT

PRINT
