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
%-  agent:dbug
=|  state=versioned-state
^-  agent:gall
|_  =bowl:gall
+*  this      .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  '%shippy initialized successfully'
  =.  state  [%0 0]
  :_  this
  :~  [%pass /bind %arvo %e %connect [~ /'~shippy'] %shippy]
  ==
++  on-save
  ^-  vase
  !>(state)
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  ~&  >  '%shippy recompiled successfully'
  `this(state !<(versioned-state old-state))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  =^  cards  state
    ?+    mark  (on-poke:def mark vase)
        %handle-http-request
      =+  !<([id=@ta =inbound-request:eyre] vase)
      `state
    ==
  [cards this]
  ::
  ++  ship-info
    ^-  json
    =,  enjs:format
    %-  pairs
    :~
      [%ship [%s (scot %p our.bowl)]]
      [%base-hash [%s (scot %uv base-hash)]]
      [%home-hash [%s (scot %uv .^(@uv %cz (pathify ~.home ~)))]]
      [%kids-hash [%s (scot %uv .^(@uv %cz (pathify ~.kids ~)))]]
    ==
  ++  pathify
    |=  [a=@ta b=(unit ship)]
    ^-  path
    =/  o=@ta  (scot %p our.bowl)
    =/  n=@ta  (scot %da now.bowl)
    ?~  b  ~[o a n]
    ~[o a n (scot %p u.b)]
  ++  base-hash
    =/  parent  (scot %p (sein:title our.bowl now.bowl our.bowl))
    =+  .^(=cass:clay %cs /[parent]/kids/1/late/foo)
    .^(@uv %cz /[parent]/kids/(scot %ud ud.cass))
  --
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?:  ?=([%http-response *] path)
    `this
  (on-watch:def path)
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?:  ?=(%e -.sign-arvo)
    `this
  (on-arvo:def wire sign-arvo)
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-fail   on-fail:def
--
