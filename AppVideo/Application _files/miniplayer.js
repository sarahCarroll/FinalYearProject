(function(g){var window=this;var W3=function(a){g.LB.call(this,{C:"div",G:"ytp-miniplayer-ui"});this.player=a;this.H=!1;this.F=this.A=this.l=void 0;this.K(a,"minimized",this.VI);this.K(a,"onStateChange",this.SL)},X3=function(a){g.QJ.call(this,a);
this.g=new W3(this.player);this.g.hide();g.CJ(this.player,this.g.element,4);a.app.F.g&&(this.load(),g.M(a.getRootNode(),"ytp-player-minimized",!0))};
g.t(W3,g.LB);g.h=W3.prototype;
g.h.show=function(){this.l=new g.ao(this.oF,null,this);this.l.start();if(!this.H){this.D=new g.nV(this.player,this);g.I(this,this.D);g.CJ(this.player,this.D.element,4);this.D.A=.6;this.O=new g.rU(this.player);g.I(this,this.O);this.B=new g.U({C:"div",G:"ytp-miniplayer-scrim"});g.I(this,this.B);this.B.g(this.element);this.K(this.B.element,"click",this.Cy);var a=new g.U({C:"button",W:["ytp-miniplayer-close-button","ytp-button"],L:{"aria-label":"Close"},J:[g.KO()]});g.I(this,a);a.g(this.B.element);this.K(a.element,
"click",this.Yw);this.u=new g.U({C:"div",G:"ytp-miniplayer-controls"});g.I(this,this.u);this.u.g(this.B.element);this.K(this.u.element,"click",this.Cy);var b=new g.U({C:"div",G:"ytp-miniplayer-button-container"});g.I(this,b);b.g(this.u.element);a=new g.U({C:"div",G:"ytp-miniplayer-play-button-container"});g.I(this,a);a.g(this.u.element);var c=new g.U({C:"div",G:"ytp-miniplayer-button-container"});g.I(this,c);c.g(this.u.element);this.M=new g.tS(this.player,this,!1);g.I(this,this.M);this.M.g(b.element);
b=new g.qS(this.player,this);g.I(this,b);b.g(a.element);this.I=new g.tS(this.player,this,!0);g.I(this,this.I);this.I.g(c.element);this.F=new g.LT(this.player,this);g.I(this,this.F);this.F.g(this.B.element);this.A=new g.zS(this.player,this);g.I(this,this.A);g.CJ(this.player,this.A.element,4);this.o=new g.U({C:"div",G:"ytp-miniplayer-buttons"});g.I(this,this.o);g.CJ(this.player,this.o.element,4);this.o.hide();a=new g.U({C:"button",W:["ytp-miniplayer-close-button","ytp-button"],L:{"aria-label":"Close"},
J:[g.KO()]});g.I(this,a);a.g(this.o.element);this.K(a.element,"click",this.Yw);a=new g.U({C:"button",W:["ytp-miniplayer-replay-button","ytp-button"],L:{"aria-label":"Close"},J:[g.XO()]});g.I(this,a);a.g(this.o.element);this.K(a.element,"click",this.VJ);this.K(this.player,"presentingplayerstatechange",this.pF);this.K(this.player,"appresize",this.ib);this.K(this.player,"fullscreentoggled",this.ib);this.ib();this.H=!0}0!=this.player.getPlayerState()&&g.LB.prototype.show.call(this);this.A.show();this.player.unloadModule("annotations_module")};
g.h.hide=function(){this.l&&(this.l.dispose(),this.l=void 0);g.LB.prototype.hide.call(this);this.player.app.F.g||(this.H&&this.A.hide(),this.player.loadModule("annotations_module"))};
g.h.T=function(){this.l&&(this.l.dispose(),this.l=void 0);g.LB.prototype.T.call(this)};
g.h.Yw=function(){this.player.stopVideo();this.player.ma("onCloseMiniplayer")};
g.h.VJ=function(){this.player.playVideo()};
g.h.Cy=function(a){if(a.target==this.B.element||a.target==this.u.element)g.R(g.W(this.player).experiments,"kevlar_miniplayer_scrim_pause")?2==this.player.getPlayerState()?this.player.playVideo():this.player.pauseVideo():this.player.ma("onExpandMiniplayer")};
g.h.VI=function(){g.M(this.player.getRootNode(),"ytp-player-minimized",this.player.app.F.g);this.player.app.F.g&&0==this.player.getPlayerState()?this.o.show():this.o.hide()};
g.h.oF=function(){this.A.pd();this.F.pd();this.l&&this.l.start()};
g.h.pF=function(a){g.V(a.state,32)&&this.D.hide()};
g.h.ib=function(){var a=this.A,b=g.mJ(this.player).getPlayerSize().width;a.Oa=0;a.A=b;a.D=!1;g.BS(a)};
g.h.SL=function(a){this.player.app.F.g&&(0==a?(this.hide(),this.o.show()):(this.show(),this.o.hide()))};
g.h.fb=function(){return this.D};
g.h.Bc=function(){return!1};
g.h.mg=function(){return!1};
g.h.Xh=function(){return!1};
g.h.Lz=function(){};
g.h.dj=function(){};
g.h.Fl=function(){};
g.h.Im=function(){return null};
g.h.Jq=function(){return new g.jh(0,0,0,0)};
g.h.handleGlobalKeyDown=function(){return!1};
g.h.handleGlobalKeyUp=function(){return!1};
g.h.en=function(a,b,c,d,e){a.style.left="";a.style.top="";a.style.bottom="";d=g.Oh(a);var f=g.mJ(this.player).getPlayerSize().width;b&&["ytp-prev-button","ytp-next-button"].some(function(k){return g.Tn(b,k)})?(c=12,a.style.top=12+(e||0)+"px"):(c-=d.width/2,a.style.bottom=25+(e||0)+"px");
a.style.left=g.rd(c,0,f-d.width)+"px"};
g.h.showControls=function(){};
g.h.Kq=function(){};
g.h.Jh=function(){};g.t(X3,g.QJ);X3.prototype.init=function(){};
X3.prototype.load=function(){this.player.hideControls();this.g.show()};
X3.prototype.unload=function(){this.player.showControls();this.g.hide()};g.nU.miniplayer=X3;})(_yt_player);
