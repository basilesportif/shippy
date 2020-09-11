::  shippy.hoon
::  current ship status
::  basically a port of trouble to Gall
::
/+  srv=server, default-agent, dbug
|%
+$  versioned-state
    $%  state-zero
    ==
::
+$  state-zero
$:  [%0 val=@ud]
    ==
::
+$  card  card:agent:gall
::
--
::  NEUTERED: re-implemented with a generator
::
%-  agent:dbug
=|  state=versioned-state
^-  agent:gall
|_  =bowl:gall
+*  this      .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  '%shippy initialized successfully '
  `this(state [%0 0])
++  on-save
  ^-  vase
  !>(state)
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  ~&  >  '%shippy disabled successfully'
  :_  this
  ~[[%pass /bind %arvo %e %disconnect [~ /'~shippy']]]
++  on-poke   on-poke:def
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
