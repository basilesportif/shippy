/+  *server
|=  [[now=@da eny=@ bek=beak] *]
|=  [authorized=? =request:http]
|^  ^-  simple-payload:http
%-  json-response:gen
%-  pairs:enjs:format
:~
  [%ship [%s (scot %p p.bek)]]
  [%base-hash [%s (scot %uv base-hash)]]
  [%home-hash [%s (scot %uv .^(@uv %cz (pathify ~.home ~)))]]
  [%kids-hash [%s (scot %uv .^(@uv %cz (pathify ~.kids ~)))]]
==
++  pathify
  |=  [a=@ta b=(unit ship)]
  ^-  path
  =/  o=@ta  (scot %p p.bek)
  =/  n=@ta  (scot %da now)
  ?~  b  ~[o a n]
  ~[o a n (scot %p u.b)]
++  base-hash
  =/  parent  (scot %p (sein:title p.bek now p.bek))
  =+  .^(=cass:clay %cs /[parent]/kids/1/late/foo)
  .^(@uv %cz /[parent]/kids/(scot %ud ud.cass))
--
