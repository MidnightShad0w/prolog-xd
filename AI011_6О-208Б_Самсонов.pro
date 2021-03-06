/* ????? ???? ??????? ?? ?????????? ??????? ? ???? ???????: 

???????????      
            5-? ????? "A"            5-? ????? "?" 

1-? ????    ???????? ????              ????????? 
2-? ????    ???????                    ???????? ???? 
3-? ????    ???????????                ??????
4-? ????    ?????????                  ????????? 
5-? ????    ??????                     ?????????? 
6-? ????    ?????????                  ????????

???????    
            5-? ????? "A"              5-? ????? "?" 

1-? ????    ??????                      ???????? ???? 
2-? ????    ??????????                  ?????? 
3-? ????    ??????????                  ??????????? 
4-? ????    ???????? ????               ?????????? 
5-? ????    ????????                    ???????? ???? 
6-? ????    ???????????                 -------------

??????????, ????? ???????? ??????????? ???? ????????, ???? ????????, ??????? ???????, ???? ???????? ????????? : 
	?) ?????? ??????? ????? ?? 2 ????????. 
	?) ?????? ??????? ????????? ??? ????? ???????? ? ? 5-?? ???, ? ? 5-?? ???. 
	?) ??????? ????? ?????? ?? ????????? ? ? 5-?? ??? ? ? 5-?? ??? ?????? ?? ?????? 2-? ??????. 
	?) ? ????? ????????? ?? ????????? ???????????? ????, ????????? ?? ?????? ?? ??????? ????????? ???????????. 
	?) ???? ???????? ???????? ?? ????????????? ?????? 2 ????? ? 5-?? ???, ? ? ????????? ????? ?? ????? ????? ? ???????????. 
	?) ? ??????? ?????? ??????? ???? ?? ????????????? ?????????? ? ???????? ?????.		*/

DOMAINS
	???=symbol
	????=symbol
	????=integer
	?????=symbol
	???????=symbol
	???????? = ???????*
	???????=???????(???,???????,???????)
% ????? ?????? ?????????????? ?? ???????? ???? ????????? -  ???????(???,???????,???????)
	??????_????????=???????*
% ???? ????????? ??????????
	??????????=??????????(????,????,?????,???????)
    
PREDICATES
	nondeterm ?????????_??????????(??????????)
% ??? ??????? ?? ?????? ???-?? ?????????
	nondeterm ?????????_???????(???????)
	nondeterm ?????????_????????(??????_????????)
% ??? ???????????? ???????
	nondeterm ?????????_???????(???????)
	nondeterm ????????(???????)
% ??? ??????? ??????
	nondeterm ?????_???????(???????,???????)
	nondeterm ????_??(???????,????????)
	nondeterm ????_??(???????,??????_????????)
	nondeterm ???_????????(????????)
	nondeterm ??????????_??????????_??????????????????(????????)
    
CLAUSES
	????_??(Name,[Name|_]).
	????_??(Name,[_|?????]):-????_??(Name,?????).

% ? ?????? ?????? ??? ????????, ?????????? ??? ?????????? ????????
	???_????????([]).
% ???????? 1-??? ???????? ?????? ?? ?? ? ?????
% ???? ???? ?? ??????? ?????????????
% ???? ??? ?? ????????? ??????? ?????????
	???_????????([Name|?????]) :-
		NOT(????_??(Name, ?????)),
		???_????????(?????).

% ????????? ????????? ?????????? ?????
	??????????_??????????_??????????????????([Name1, Name2]):-
		Name1 > Name2.
% ?????????????????? ????????? ??? ???????? ???????? ??????????
	??????????_??????????_??????????????????([Name1, Name2|?????]):-
		Name1 > Name2,
		??????????_??????????_??????????????????(?????).

% ???????????? ????????? ?????????	    
	?????????_???????(???????) :-
		??????? = "???????? ????";
		??????? = "?????????";
		??????? = "???????";
		??????? = "???????????";
		??????? = "??????";
		??????? = "?????????";
		??????? = "????????";
		??????? = "??????????".
% ?????????? ?????????? ??? ??????    
	?????????_??????????(??????????) :-
		?????????? = ??????????("???????????",1,"5? ?????","???????? ????");
		?????????? = ??????????("???????????",1,"5? ?????","?????????");
		?????????? = ??????????("???????????",2,"5? ?????","???????");
		?????????? = ??????????("???????????",2,"5? ?????","???????? ????");
		?????????? = ??????????("???????????",3,"5? ?????","???????????");
		?????????? = ??????????("???????????",3,"5? ?????","??????");
		?????????? = ??????????("???????????",4,"5? ?????","?????????");
		?????????? = ??????????("???????????",4,"5? ?????","?????????");
		?????????? = ??????????("???????????",5,"5? ?????","??????");
		?????????? = ??????????("???????????",5,"5? ?????","??????????");
		?????????? = ??????????("???????????",6,"5? ?????","?????????");
		?????????? = ??????????("???????????",6,"5? ?????","????????");
		?????????? = ??????????("???????",1,"5? ?????","??????");
		?????????? = ??????????("???????",1,"5? ?????","???????? ????");
		?????????? = ??????????("???????",2,"5? ?????","??????????");
		?????????? = ??????????("???????",2,"5? ?????","??????");
		?????????? = ??????????("???????",3,"5? ?????","??????????");
		?????????? = ??????????("???????",3,"5? ?????","???????????");
		?????????? = ??????????("???????",4,"5? ?????","???????? ????");
		?????????? = ??????????("???????",4,"5? ?????","??????????");
		?????????? = ??????????("???????",5,"5? ?????","????????");
		?????????? = ??????????("???????",5,"5? ?????","???????? ????");
		?????????? = ??????????("???????",6,"5? ?????","???????????");
		?????????? = ??????????("???????",6,"5? ?????","-").
    
% ? ????? ????????? ?? ????????? ???????????? ????.
	?????????_???????(???????("????????",???????1,???????2)):-
		not(?????????_??????????(??????????("???????",_,_,???????1))), not(?????????_??????????(??????????("???????",_,_,???????2))).
  
% ???? ???????? ???????? ?? ????????????? ?????? 2 ????? ? ?????? ?.
	?????????_???????(???????("????????",???????1,???????2)):-
		not(?????????_??????????(??????????("???????????",_,"5? ?????",???????1))), not(?????????_??????????(??????????("???????????",_,"5? ?????",???????2))).

% ??????? ????? ?????? ?? ????????? ? ? ? ? ? ? ?????? ?????? ??? ?????.
	?????????_???????(???????("?????",???????1,???????2)):- 
		not(?????????_??????????(??????????("???????",3,"5? ?????",???????1))),
		not(?????????_??????????(??????????("???????",4,"5? ?????",???????1))),
		not(?????????_??????????(??????????("???????",5,"5? ?????",???????1))),
		not(?????????_??????????(??????????("???????",6,"5? ?????",???????1))),
		not(?????????_??????????(??????????("???????",3,"5? ?????",???????2))),
		not(?????????_??????????(??????????("???????",4,"5? ?????",???????2))),
		not(?????????_??????????(??????????("???????",5,"5? ?????",???????2))),
		not(?????????_??????????(??????????("???????",6,"5? ?????",???????2))).

% ? ??????? ?????? ??????? ???? ?? ????????????? ?????????? ? 3 ?????.
	????????(???????(???,???????1,???????2)):-    
		?????_???????(???????(???,???????1,???????2),"??????"),
		not(?????????_??????????(??????????("???????????",1,_,???????1))),
		not(?????????_??????????(??????????("???????????",1,_,???????2))),
		not(?????????_??????????(??????????("???????????",2,_,???????1))),
		not(?????????_??????????(??????????("???????????",2,_,???????2))).

% "???????" ????? "???????"
	?????_???????(???????(_,???????1,???????2),???????):-
		???????1=???????;???????2=???????.

% ????????? ????????       
	?????????_????????(??????_????????):-
	% ????????? ?????? ????????? ?? ??????????
		?????????_???????(???????1),
		?????????_???????(???????2),
		?????????_???????(???????3),
		?????????_???????(???????4),
		?????????_???????(???????5),
		?????????_???????(???????6),
		?????????_???????(???????7),
		?????????_???????(???????8),

		???????? = [???????1, ???????2, ???????3, ???????4, ???????5, ???????6, ???????7, ???????8],

		???_????????(????????),
		??????????_??????????_??????????????????(????????),
	
	% ????????? ???????? ? ?? ?????????
		????????=???????("????????",???????1,???????2),
		????????=???????("????????",???????3,???????4),
		?????=???????("?????",???????5,???????6),
		???????=???????("???????",???????7,???????8),

		??????_????????=[????????,????????,?????,???????],
	
	% ???????? ??????? ?? ????????
		?????????_???????(????????),
		?????????_???????(????????),
		?????????_???????(?????),  
	% ???????? ??????? ??????? ??????
		????_??(???????,??????_????????),
		????????(???????).
		
GOAL
	?????????_????????(??????_????????).