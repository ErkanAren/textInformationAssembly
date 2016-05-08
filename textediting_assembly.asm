TITLE B083361 

KODIKAS SEGMENT PUBLIC
    
    ASSUME CS:KODIKAS,DS:DATAS  
    
    MAIN:
           
           MOV AX,DATA
           MOV DS,AX 
           
           MOV SI,0
           TOMIKOS:          ;THA YPOLOGISW TO MIKOS TOU KEIMENOU
           
                 CMP MES[SI],'!'    ;MEXRI NA BREI TO XARAKTIRA ! THA AYKSITHEI O METRITIS TOU MIKOUS
                 JE FT
           
                 INC SI
                 
                 JMP TOMIKOS
           FT:  
                 
                 INC SI
                 
                 MOV MIK,SI
                 
                 
                 LEA DX,MES1
                MOV AH,9
                INT 21H
                 
                 MOV DH,0
                 MOV DX,MIK
                 
                 CMP DL,9
                JA DIPSIFIO          ;AN EINAI DIPSIFIOS ARITHMOS EMFANISI DIPSIFIOU
                
                 ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
             
             DIPSIFIO:                 ;EMFANISI DIPSIFIOU
             MOV AX,0
             MOV AL,DL
             MOV CX,0
             MOV CL,10
             DIV CL
             MOV BH,AH
             MOV BL,AL
                MOV DL,BL
                
                
                ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
                 
                  MOV DL,BH
                 
                 
                   ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
                
                
                MOV SI,0
                
            SIMVOLA:            ;ELEGXOS SIMVOLWN,LATINIKWN GRAMMATWN KAI XARAKTIRA SPACE MAZI
            
            
            CMP MES[SI],'!'
            JE SIM
            
            CMP MES[SI],','
            JE SIM
            
            CMP MES[SI],'.'          ;AN EINAI ! , H . AYKSISE TO METRITI TOU SIMVOLOU STIKSIS
            JE SIM
            
            CMP MES[SI],' '          ; AN EINAI SPACE AYKSISE TO METRITI TOU SPACE
            JE SPACE 
            
            
  
           CMP MES[SI],65
           JAE GRAMMATAKEF           ;AN EINAI MEGALYTERO APO A KANE ELEGXO GIA KEFALAIA
            
     GRA:
            CMP MES[SI],97          ;ALLIWS AN EINAI MEGALYTERO APO a KANE ELEGXO GIA MIKRA
            JAE GRAMMATAMIK 
            INC SI 
            
            CMP SI,MIK               ;OSO O METRITIS TIS EPANALIPSIS DEN EINAI ISON TOU MIKOS
            JE TELOS
            
            JMP SIMVOLA
            SIM:
            
            INC SIMV
            INC SI 
             
             CMP SI,MIK                ;TELEIWSE O XRONOSSSSSSSSSSSS
            JE TELOS
            
            JMP SIMVOLA
           
           SPACE:
           INC SPA
            
            INC SI 
             
             CMP SI,MIK
            JE TELOS
            JMP SIMVOLA 
            
            
            
            GRAMMATAMIK:
            CMP MES[SI],122
            JBE INCGR
            
           GRAMMATAKEF:
            CMP MES[SI],90
            JA GRA
            
            
       
       INCGR:
               INC GR
            INC SI 
             
             CMP SI,MIK
            JE TELOS
            
            JMP SIMVOLA
            
           TELOS: 
           LEA DX,MES2
                MOV AH,9
                INT 21H
                MOV DH,0
               
                MOV DX,SIMV 
                ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
                
                
                LEA DX,MES3
                MOV AH,9
                INT 21H
                
                 MOV DH,0
                 MOV DX,GR
                 
                CMP DL,9
                JA DIPSIFIO2
                
                 ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
         SPA2:  
                 MOV S,1
                 
                LEA DX,MES4
                MOV AH,9
                INT 21H
                
                 MOV DH,0
                 MOV DX,SPA
                 
                CMP DL,9
                JA DIPSIFIO2
               
                 ADD DL,48
                 
          
                 MOV AH,02H
                 INT 21H
            SPA3:       
                   JMP TELOS1
           DIPSIFIO2:
             MOV AX,0
             MOV AL,DL
             MOV CX,0
             MOV CL,10
             DIV CL
             MOV BH,AH
             MOV BL,AL
                MOV DL,BL
                
                
                ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
                 
                  MOV DL,BH
                 
                 
                   ADD DL,48
                 
                 MOV AH,02H
                 INT 21H
                   
                   CMP S,1
                   JE SPA3
                           
                   JMP SPA2         
       TELOS1:
              MOV AH,4CH
              INT 21H
    
     KODIKAS ENDS


   DATA SEGMENT
    N DB 1
    S DB 0
    MIK DD 0  
    SIMV DD 0
    SPA DD 0
    GR DD 0
    BUFFER DB SI(0)   
  MES DB "This is a simple text, that I wrote as an example. Good luck!$"
  MES1 DB 10,13,"TO MIKOS TOU KEIMENOU EINAI: $"
  MES2 DB 10,13,"TO PLITHOS TWN SIMVOLWN STIKSIS (. , !): $"
  MES3 DB 10,13,"TO PLITHOS TWN GRAMMATWN TOU LATINIKOU ALFAVITOU: $"
  MES4 DB 10,13,"TO PLITHOS TOU XARAKTIRA SPACE: $"
       
DATA ENDS 

END MAIN