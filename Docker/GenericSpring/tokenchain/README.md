    Una semplice applicazione che effettua una comunicazione tra più container attraverso un ring logico di comunicazione tra 3 (o più) diversi container che si trovano 
    su un singolo host. La comunicazione è token-based. Il client non deve fare altro che scegliere il servizio che immetterà il token all'interno della rete
    e il numero di salti che il token effettuerà all'interno di essa. Riceverà un token di risposta nel caso tutto sia andato a buon fine dall'ultimo container ad aver
    ricevuto il token.
    
-> Singolo ENDPOINT ==> GET: http://localhost:[uno tra 2222, 3333 o 4444]/token/run/nome_casuale_del_token/numero_casuale_di_salti

-> E' possibile verificare grazie a phpmyadmin ==> http://localhost:8080 ==> il percorso del token.
