return(function(...)local x={"\084\068\076\076\070\088\118\117\084\068\085\061","\055\088\104\118\055\047\061\061";"\051\099\106\052\070\068\112\076\075\084\107\061";"\106\074\104\090\056\122\078\068\119\109\116\118\106\084\051\067\119\054\111\111\106\074\048\111\069\084\116\054\119\098\090\118\055\122\047\115\055\074\065\049\106\109\073\067\106\088\104\090";"\099\049\050\087\075\068\113\052\071\110\061\061","\075\074\050\076\055\102\106\111\070\068\052\101\055\108\061\061","\051\088\051\067\086\074\050\100\086\108\061\061";"\120\102\113\111\070\048\078\052\078\110\061\061","\086\102\113\111\070\102\119\080\069\054\050\090\065\099\073\077\070\088\106\054\086\099\105\111\070\054\112\109\070\074\104\098\055\120\050\067\075\074\050\072\055\121\073\049\086\099\047\061";"\078\084\112\108\065\084\106\077";"\099\049\050\121\065\108\061\061";"\119\098\076\119\084\084\050\097\119\111\112\104\119\104\052\114";"\099\049\050\085\055\084\072\061"}for e,w in ipairs({{1,13},{1,5};{6,13}})do while w[1]<w[2]do x[w[1]],x[w[2]],w[1],w[2]=x[w[2]],x[w[1]],w[1]+1,w[2]-1 end end local function e(e)return x[e-5355]end do local e=table.insert local w=table.concat local C=string.sub local S=string.char local g=string.len local H=type local P=math.floor local G=x local W={["\051"]=21,["\052"]=37;L=33,y=39,["\057"]=10;T=22,V=26,x=18,v=45;I=9,f=7;D=38;C=34,a=15;e=46,K=27;S=63,p=57,B=19,["\048"]=4;Y=59,h=5;d=47;G=30;H=56;n=0,t=8,O=32,l=48;Q=2;R=49,g=60,Z=36;c=23,k=20;o=52;["\050"]=61,["\056"]=14,i=1,P=58;r=40;["\047"]=16,b=35;U=44,M=43,m=51;["\049"]=53,W=41;E=11;s=55;J=6,A=24,["\055"]=25,u=31;["\054"]=50,z=3,F=28,X=54,["\053"]=62;["\043"]=42,N=29;q=17;j=13;w=12}for x=1,#G,1 do local A=G[x]if H(A)=="\115\116\114\105\110\103"then local H=g(A)local z={}local f=1 local Y=0 local O=0 while f<=H do local x=C(A,f,f)local w=W[x]if w then Y=Y+w*64^(3-O)O=O+1 if O==4 then O=0 local x=P(Y/65536)local w=P((Y%65536)/256)local C=Y%256 e(z,S(x,w,C))Y=0 end elseif x=="\061"then e(z,S(P(Y/65536)))if f>=H or C(A,f+1,f+1)~="\061"then e(z,S(P((Y%65536)/256)))end break end f=f+1 end G[x]=w(z)end end end return(function(x,C,S,g,H,P,G,A,O,w,Y,z,I,s,W,f)A,z,Y,I,O,s,f,W,w={},function()f=f+1 A[f]=1 return f end,function(x)for e=1,#x,1 do A[x[e]]=1+A[x[e]]end if S then local w=S(true)local C=H(w)C[e(5365)],C[e(5358)],C[e(5360)]=x,O,function()return 801633 end return w else return g({},{[e(5358)]=O,[e(5365)]=x,[e(5360)]=function()return 801633 end})end end,function(x,e)local C=Y(e)local S=function(...)return w(x,{...},e,C)end return S end,function(x)local e,w=1,x[1]while w do A[w],e=A[w]-1,1+e if A[w]==0 then A[w],W[w]=nil,nil end w=x[e]end end,function(x)A[x]=A[x]-1 if 0==A[x]then A[x],W[x]=nil,nil end end,0,{},function(w,S,g,H)local G,W,s,O,z,A,f,Y while w do s=e(5368)w=e(5361)G=e(5363)W=S A=e(5367)f=e(5362)x[G]=w G=e(5364)w=x[e(5359)]z=e(5366)x[A]=G A=x[z]Y=x[f]s=Y[s]G={}O=e(5356)f={s(Y,O)}z=A(C(f))A=z()end w=#H return C(G)end return(I(7049347,{}))(C(G))end)(getfenv and getfenv()or _ENV,unpack or table[e(5357)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
