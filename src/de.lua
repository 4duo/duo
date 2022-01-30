#!/usr/bin/env lua
--      _      
--   __| | ___ 
--  / _` |/ _ \
-- | (_| |  __/
--  \__,_|\___|
--             
local F=require"fun"; local the=F.options[[

./de.lua [OPTIONS]
(c)2022 Tim Menzies, MIT license

Data miners using/used by optimizers.
Understand N items after log(N) probes, or less.

OPTIONS:
  -np          20
  -generations 30
  -f           .3
  -cf          .5]]

NUM={}
function NUM.about(meta)
  i={cols={}, x={},y={}}
  i.cols = {}
  for n,x in pairs(t) do 
    now = push(i.cols, (x:find"^[A-Z]" and NUM or SYM):new(n,x))
    if not x:find":" then 
      push((x:find"+" or x:find"-") and i.y or i.x, now) end end 
  return i end


function de(meta,x,y)
  local pop,a,b,c,j,now,keep={}
  for p=1,the.np do push(pop,x()) end
  for g=1,the.generations do
    for m,b4 in pairs(pop) do
      a,b,c,keep = any(pop), any(pop), any(pop), math.random(#t)
      now = copy(a)
      for n,_ in pairs(now) do 
        if n ~= keep and cf < math.random() then
          now[n] = a[n] + f*(b[n] - c[n]) end end
      now = y(now)
      if better(now,b4) then pop[m] = now end  end end end

--the(go)
