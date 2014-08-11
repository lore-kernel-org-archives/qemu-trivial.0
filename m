Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGwOL-0002zL-6B
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 16:40:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XGqBt-00061s-M8
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 10:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XGqBk-0008Nn-Th
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 10:03:13 -0400
Received: from nm7.bullet.mail.bf1.yahoo.com ([98.139.212.166]:49535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XGqBk-0008Ni-P4
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 10:03:04 -0400
Received: from [98.139.215.141] by nm7.bullet.mail.bf1.yahoo.com with NNFMP;
	11 Aug 2014 14:03:03 -0000
Received: from [98.139.212.198] by tm12.bullet.mail.bf1.yahoo.com with NNFMP;
	11 Aug 2014 14:03:03 -0000
Received: from [127.0.0.1] by omp1007.mail.bf1.yahoo.com with NNFMP;
	11 Aug 2014 14:03:03 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 334787.4480.bm@omp1007.mail.bf1.yahoo.com
Received: (qmail 40038 invoked by uid 60001); 11 Aug 2014 14:03:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1407765783; bh=CIfb0N+a5KkiyTPq/dBuHCanyufs5vF+U2njHAjbBSQ=;
	h=References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=NnA6lrRhJyXdjr2TQp0+Sh+UZWonEWwyd9gwEQcaRPbiqVdRFa2iI+8JUNozhoe3xreQcpigPvNnP+mWA89Z4jYF/DDaLnjAq7yATLFp7K7A+imcs3IKrPyf9etup4r+kBmgL36G4QCiwXUQVXV5z3ybT7JDmMC3X0MRPSiE6C0=
X-YMail-OSG: LhH1hMsVM1mIwvGgh4Y0xu1tB_qIqHTpaARKlcPjR._7n0p
	F.5Bw9z8e.MWsVE7durPXANHYLrfZwXzQxdHdLU77B0zBARis03dHOp5C5m2
	sbbplXf4kQaohagBqu4I94qBA2STY8dh6QZpSQwBw4uTzGJpOqTbwtTrgpjc
	ddsWhXqJS6b2fleeYUK9UKa9lxU7V_L5E11DB20Qdy4zIodazcz6B0oqKEpx
	VhSJ9dSpFqNlMXMnUqI8ix_Mq5kEgM3GOlNTES_tXV5_R00wD_n2P9oa7eAB
	.NmJf3HELrRwLk3VsEmF2GD1aD1igGJ_BroYw3SHU3ARRNpCAhndwpJ6T9q0
	0C_6vIq90TS7pwHKF1u_tXA6QzM9d1efjb7Jv_De19WWl6FmRgmB7tctlZ9W
	k0tDwb.RqjRYQfjsWHtP2FXAHA5bb9WvYuZVNDGySHg6.sdwDI7hWgUaRP57
	rO3nzYEzQJtEihZ9r_C4BEppq9PU.tlKF9Nf42x2yIdFUIlTSXvnx9yNpZrN
	qlTy6.RGhhDNnjnN72N6x0NDNjAnI3OarpXrL7fArhGoggSd4MqjaGN.W7eg
	l8ep2ARj_avWwjPT9CC1vuJo-
Received: from [50.184.68.153] by web140702.mail.bf1.yahoo.com via HTTP;
	Mon, 11 Aug 2014 07:03:03 PDT
X-Rocket-MIMEInfo: 002.001,
	SGksCgpIZXJlIGlzIG15IGVudmlyb25tZW50OgoKMS0gcWVtdSAxLjcuMQoyLSBNYWNPU1ggMTAuOS40CjMtIGdsaWIgJiBmcmllbmRzIDIuNDAuMAo0LSBjb25maWd1cmUgc3RhdGVtZW50IGFzIGNvcGllZCBmcm9tIGNvbmZpZy5zdGF0dXM6CmV4ZWMgJy4vY29uZmlndXJlJyAnLS1lbmFibGUtY29jb2EnICctLXRhcmdldC1saXN0PWFybS1zb2Z0bW11JyAnLS1kaXNhYmxlLXZuYycgJy0tZW5hYmxlLWRlYnVnJwo1LSBUaGUga2VybmVsIGltYWdlIGFuZCByb290ZnMgYXJlIGJ1aWx0IHZpYSB5b2N0by1wcm8BMAEBAQE-
X-Mailer: YahooMailWebService/0.8.201.700
References: 
Message-ID: <1407765783.39657.YahooMailNeo@web140702.mail.bf1.yahoo.com>
Date: Mon, 11 Aug 2014 07:03:03 -0700
From: New B <newbnz@yahoo.com>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-589800495-177128391-1407765783=:39657"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.139.212.166
X-Mailman-Approved-At: Mon, 11 Aug 2014 16:40:26 -0400
Subject: [Qemu-trivial] Black screen on qemu launch
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: New B <newbnz@yahoo.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 14:03:22 -0000

---589800495-177128391-1407765783=:39657
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,=0A=0AHere is my environment:=0A=0A1- qemu 1.7.1=0A2- MacOSX 10.9.4=0A3-=
 glib & friends 2.40.0=0A4- configure statement as copied from config.statu=
s:=0Aexec './configure' '--enable-cocoa' '--target-list=3Darm-softmmu' '--d=
isable-vnc' '--enable-debug'=0A5- The kernel image and rootfs are built via=
 yocto-project (standard, out of the box, no custom bitbake recipes or anyt=
hing)=0A6- the command line arguments passed to the executable are:=0A-kern=
el /Users/myhome/Projects/QEMU/FinalQEMUBuild/qemuarm/zImage--3.10.17-qemua=
rm.bin -M versatilepb -hda /Users/myhome/Projects/QEMU/FinalQEMUBuild/qemua=
rm/core-image-minimal-qemuarm.rootfs.ext3 -no-reboot -show-cursor -usb -usb=
device wacom-tablet --append "root=3D/dev/sda rw console=3DttyAMAO console=
=3Dtty ip=3D192.168.7.2::192.168.7.1:.55.255.255.0 mem=3D128M highres=3Doff=
"=0A=A0=0A=0A=3D=3D=3D=3D> Results:=0A- a cocoa window shows up entirely wh=
ite with absolutely nothing showing...=0A- when i refresh it (minimize, the=
n show), it turns entirely black=0A- when i gdb-attach to the process, this=
 is the stack trace:=0A=0A(gdb) bt=0A#0=A0 0x00007fff84a129aa in select$DAR=
WIN_EXTSN ()=0A#1=A0 0x00000001045a36d3 in g_poll ()=0A#2=A0 0x0000000103ae=
be69 in qemu_poll_ns (fds=3D0x7fd10eb00100, nfds=3D4, timeout=3D29021000) a=
t qemu-timer.c:319=0A#3=A0 0x0000000103a96bb3 in os_host_main_loop_wait (ti=
meout=3D29021000) at main-loop.c:228=0A#4=A0 0x0000000103a96a0c in main_loo=
p_wait (nonblocking=3D0) at main-loop.c:483=0A#5=A0 0x0000000103b34a86 in m=
ain_loop () at vl.c:2015=0A#6=A0 0x0000000103b2ee86 in qemu_main (argc=3D14=
, argv=3D0x7fff5c39c9c8, envp=3D0x7fff5c39ca40) at vl.c:4379=0A#7=A0 0x0000=
000103b1c629 in -[QemuCocoaAppController startEmulationWithArgc:argv:] (sel=
f=3D0x7fd10be0c580, _cmd=3D0x103d7110c, argc=3D14, argv=3D0x7fff5c39c9c8) a=
t ui/cocoa.m:815=0A#8=A0 0x0000000103b1c42f in -[QemuCocoaAppController app=
licationDidFinishLaunching:] (self=3D0x7fd10be0c580, _cmd=3D0x7fff8587b240,=
 note=3D0x7fd10bd2a5c0) at ui/cocoa.m:793=0A#9=A0 0x00007fff8d870e0c in __C=
FNOTIFICATIONCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__ ()=0A#10 0x00007fff8d76=
482d in _CFXNotificationPost ()=0A#11 0x00007fff8710d7ba in -[NSNotificatio=
nCenter postNotificationName:object:userInfo:] ()=0A#12 0x00007fff8c447b69 =
in -[NSApplication _postDidFinishNotification] ()=0A#13 0x00007fff8c44789c =
in -[NSApplication _sendFinishLaunchingNotification] ()=0A#14 0x00007fff8c4=
44786 in -[NSApplication(NSAppleEventHandling) _handleAEOpenEvent:] ()=0A#1=
5 0x00007fff8c4441db in -[NSApplication(NSAppleEventHandling) _handleCoreEv=
ent:withReplyEvent:] ()=0A#16 0x00007fff8712bf0a in -[NSAppleEventManager d=
ispatchRawAppleEvent:withRawReply:handlerRefCon:] ()=0A#17 0x00007fff8712bd=
7d in _NSAppleEventManagerGenericHandler ()=0A#18 0x00007fff8dc34e1f in aeD=
ispatchAppleEvent ()=0A#19 0x00007fff8dc34c32 in dispatchEventAndSendReply =
()=0A#20 0x00007fff8dc34b36 in aeProcessAppleEvent ()=0A#21 0x00007fff8aad4=
161 in AEProcessAppleEvent ()=0A#22 0x00007fff8c4400b6 in _DPSNextEvent ()=
=0A#23 0x00007fff8c43f89b in -[NSApplication nextEventMatchingMask:untilDat=
e:inMode:dequeue:] ()=0A#24 0x00007fff8c43399c in -[NSApplication run] ()=
=0A#25 0x0000000103b1d48a in main (argc=3D14, argv=3D0x7fff5c39c9c8) at ui/=
cocoa.m:952=0A(gdb)=A0=0A=0A- when i launch qemu from within gdb after disa=
bling signal interception (nostop, noprint for SIGUSR1 and SIGUSR2), the bl=
ack window just stays as is and nothing is loaded.=0A=0AThe configure scrip=
t picked the sigaltstack as the =A0coroutine backend. =A0(I would love to s=
witch it away from sigaltstack, and onto gthread, but I read enough to sugg=
est that qemu is not stable with gthread... so i went with the defaults, fo=
r the time being).=0A=A0=0AWhat am i doing wrong?=0A=0AI would appreciate s=
ome pointers.=0A=0AThanks!=0ANancy=0A
---589800495-177128391-1407765783=:39657
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:He=
lveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;fo=
nt-size:12pt"><div id=3D"yiv2049616253"><div><div style=3D"color: rgb(0, 0,=
 0); background-color: rgb(255, 255, 255); font-family: HelveticaNeue, 'Hel=
vetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-size: 12p=
t;"><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10644" id=3D"yiv=
2049616253yui_3_16_0_1_1407764272608_4152" style=3D"display: table; width: =
auto; word-wrap: break-word; padding-top: 12px; padding-left: 0px; font-siz=
e: 13px;"><div id=3D"yiv2049616253" class=3D"yiv2049616253"><div id=3D"yiv2=
049616253yui_3_16_0_1_1407764272608_4156" class=3D"yiv2049616253"><div id=
=3D"yiv2049616253yui_3_16_0_1_1407764272608_4155" style=3D"font-size: 12pt;=
" class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10647"><div id=3D"yiv20=
49616253" class=3D"yiv2049616253"><div class=3D"yiv2049616253"
 id=3D"yiv2049616253yui_3_16_0_1_1407764272608_4154"><div class=3D"yiv20496=
16253" id=3D"yiv2049616253yui_3_16_0_1_1407764272608_4153" style=3D"font-si=
ze:12pt;"><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8707" class=3D=
"yiv2049616253">Hi,</div><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266=
_8707" class=3D"yiv2049616253"><br></div><div id=3D"yiv2049616253yui_3_16_0=
_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background-color:tr=
ansparent;">Here is my environment:</div><div id=3D"yiv2049616253yui_3_16_0=
_1_1407726393266_8707" class=3D"yiv2049616253"><br id=3D"yiv2049616253yui_3=
_16_0_1_1407726393266_8762" class=3D"yiv2049616253"></div><div id=3D"yiv204=
9616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"ba=
ckground-color:transparent;">1- qemu 1.7.1</div><div id=3D"yiv2049616253yui=
_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background-c=
olor:transparent;">2- MacOSX 10.9.4</div><div id=3D"yiv2049616253yui_3_16_0=
_1_1407726393266_8707"
 class=3D"yiv2049616253" style=3D"background-color:transparent;">3- glib &a=
mp; friends 2.40.0</div><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_=
8707" class=3D"yiv2049616253" style=3D"background-color:transparent;">4- co=
nfigure=0A statement as copied from config.status:</div><div id=3D"yiv20496=
16253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"back=
ground-color:transparent;">exec './configure' '--enable-cocoa' '--target-li=
st=3Darm-softmmu' '--disable-vnc' '--enable-debug'</div><div id=3D"yiv20496=
16253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"back=
ground-color:transparent;">5- The kernel image and rootfs are built via yoc=
to-project (standard, out of the box, no custom bitbake recipes or anything=
)</div><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8887" class=3D"yi=
v2049616253">6- the command line arguments passed to the executable are:</d=
iv><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8887" class=3D"yiv204=
9616253"><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10665" id=
=3D"yiv2049616253yui_3_16_0_1_1407764272608_4157" style=3D"font-size: 12px;=
 color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);">-kernel
 /Users/myhome/Projects/QEMU/FinalQEMUBuild/qemuarm/zImage--3.10.17-qemuarm=
.bin -M versatilepb -hda=0A /Users/myhome/Projects/QEMU/FinalQEMUBuild/qemu=
arm/core-image-minimal-qemuarm.rootfs.ext3 -no-reboot -show-cursor -usb -us=
bdevice wacom-tablet --append "root=3D/dev/sda rw console=3DttyAMAO console=
=3Dtty ip=3D192.168.7.2::192.168.7.1:.55.255.255.0 mem=3D128M highres=3Doff=
"</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10666" id=3D"=
yiv2049616253yui_3_16_0_1_1407764272608_4157" style=3D"font-size: 12px; col=
or: rgb(76, 47, 45); background-color: rgb(223, 219, 196);">&nbsp;</div></d=
iv><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv204=
9616253" style=3D"background-color:transparent;"><br id=3D"yiv2049616253yui=
_3_16_0_1_1407726393266_8831" class=3D"yiv2049616253"></div><div id=3D"yiv2=
049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"=
background-color:transparent;">=3D=3D=3D=3D&gt; Results:</div><div id=3D"yi=
v2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=
=3D"background-color:transparent;">- a cocoa window shows up entirely
 white with absolutely nothing showing...</div><div id=3D"yiv2049616253yui_=
3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background-co=
lor:transparent;">- when i refresh it (minimize, then show), it turns entir=
ely black</div><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8707" cla=
ss=3D"yiv2049616253" style=3D"background-color:transparent;">- when i gdb-a=
ttach to the process, this is the stack trace:</div><div id=3D"yiv204961625=
3yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"backgrou=
nd-color:transparent;"><br id=3D"yiv2049616253yui_3_16_0_1_1407726393266_88=
33" class=3D"yiv2049616253"></div><div class=3D"yiv2049616253 yui_3_16_0_1_=
1407764272608_10675" id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8876" st=
yle=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76,=
 47, 45); background-color: rgb(223, 219, 196);">(gdb) bt</div><div class=
=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10676"
 id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8875" style=3D"margin-top: 0=
px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background=
-color: rgb(223, 219, 196);">#0&nbsp;=0A 0x00007fff84a129aa in select$DARWI=
N_EXTSN ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_1067=
7" id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8877" style=3D"margin-top:=
 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); backgrou=
nd-color: rgb(223, 219, 196);">#1&nbsp; 0x00000001045a36d3 in g_poll ()</di=
v><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10678" id=3D"yiv20=
49616253yui_3_16_0_1_1407726393266_8874" style=3D"margin-top: 0px; margin-b=
ottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background-color: rgb(=
223, 219, 196);">#2&nbsp; 0x0000000103aebe69 in qemu_poll_ns (fds=3D0x7fd10=
eb00100, nfds=3D4, timeout=3D29021000) at qemu-timer.c:319</div><div class=
=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10679" id=3D"yiv2049616253yui_=
3_16_0_1_1407764272608_4158" style=3D"margin-top: 0px; margin-bottom: 0px; =
font-size: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 19=
6);">#3&nbsp; 0x0000000103a96bb3 in os_host_main_loop_wait
 (timeout=3D29021000) at main-loop.c:228</div><div class=3D"yiv2049616253 y=
ui_3_16_0_1_1407764272608_10680" style=3D"margin-top: 0px; margin-bottom: 0=
px; font-size: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219=
, 196);">#4&nbsp; 0x0000000103a96a0c in main_loop_wait (nonblocking=3D0) at=
 main-loop.c:483</div><div class=3D"yiv2049616253 yui_3_16_0_1_140776427260=
8_10681" id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8873" style=3D"margi=
n-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); ba=
ckground-color: rgb(223, 219, 196);">#5&nbsp; 0x0000000103b34a86 in main_lo=
op () at vl.c:2015</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272=
608_10682" style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; c=
olor: rgb(76, 47, 45); background-color: rgb(223, 219, 196);">#6&nbsp; 0x00=
00000103b2ee86 in qemu_main (argc=3D14, argv=3D0x7fff5c39c9c8, envp=3D0x7ff=
f5c39ca40) at vl.c:4379</div><div class=3D"yiv2049616253 yui_3_16_0_1_14077=
64272608_10683"
 id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8872" style=3D"margin-top: 0=
px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background=
-color: rgb(223, 219, 196);">#7&nbsp; 0x0000000103b1c629 in -[QemuCocoaAppC=
ontroller startEmulationWithArgc:argv:] (self=3D0x7fd10be0c580, _cmd=3D0x10=
3d7110c, argc=3D14, argv=3D0x7fff5c39c9c8) at ui/cocoa.m:815</div><div clas=
s=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10684" id=3D"yiv2049616253yui=
_3_16_0_1_1407726393266_8871" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-size: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 1=
96);">#8&nbsp; 0x0000000103b1c42f in -[QemuCocoaAppController applicationDi=
dFinishLaunching:] (self=3D0x7fd10be0c580, _cmd=3D0x7fff8587b240, note=3D0x=
7fd10bd2a5c0) at ui/cocoa.m:793</div><div class=3D"yiv2049616253 yui_3_16_0=
_1_1407764272608_10685" id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8870"=
 style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(=
76, 47, 45);
 background-color: rgb(223, 219, 196);">#9&nbsp; 0x00007fff8d870e0c in __CF=
NOTIFICATIONCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__ ()</div><div class=3D"yi=
v2049616253 yui_3_16_0_1_1407764272608_10686" id=3D"yiv2049616253yui_3_16_0=
_1_1407726393266_8869" style=3D"margin-top: 0px; margin-bottom: 0px; font-s=
ize: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);">#=
10 0x00007fff8d76482d in _CFXNotificationPost ()</div><div class=3D"yiv2049=
616253 yui_3_16_0_1_1407764272608_10687" style=3D"margin-top: 0px; margin-b=
ottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background-color: rgb(=
223, 219, 196);" id=3D"yiv2049616253yui_3_16_0_1_1407764272608_5391">#11 0x=
00007fff8710d7ba in -[NSNotificationCenter postNotificationName:object:user=
Info:] ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10688=
" style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb=
(76, 47, 45); background-color: rgb(223, 219, 196);"
 id=3D"yiv2049616253yui_3_16_0_1_1407764272608_5346">#12 0x00007fff8c447b69=
 in -[NSApplication _postDidFinishNotification] ()</div><div class=3D"yiv20=
49616253 yui_3_16_0_1_1407764272608_10689" style=3D"margin-top: 0px; margin=
-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background-color: rg=
b(223, 219, 196);" id=3D"yiv2049616253yui_3_16_0_1_1407764272608_5347">#13 =
0x00007fff8c44789c in=0A -[NSApplication _sendFinishLaunchingNotification] =
()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10690" style=
=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47=
, 45); background-color: rgb(223, 219, 196);" id=3D"yiv2049616253yui_3_16_0=
_1_1407764272608_5348">#14 0x00007fff8c444786 in -[NSApplication(NSAppleEve=
ntHandling) _handleAEOpenEvent:] ()</div><div class=3D"yiv2049616253 yui_3_=
16_0_1_1407764272608_10691" style=3D"margin-top: 0px; margin-bottom: 0px; f=
ont-size: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196=
);" id=3D"yiv2049616253yui_3_16_0_1_1407764272608_5349">#15 0x00007fff8c444=
1db in -[NSApplication(NSAppleEventHandling) _handleCoreEvent:withReplyEven=
t:] ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10692" s=
tyle=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76=
, 47, 45); background-color: rgb(223, 219, 196);" id=3D"yiv2049616253yui_3_=
16_0_1_1407764272608_5350">#16
 0x00007fff8712bf0a in -[NSAppleEventManager dispatchRawAppleEvent:withRawR=
eply:handlerRefCon:] ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_14077=
64272608_10693" style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12=
px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);" id=3D"yi=
v2049616253yui_3_16_0_1_1407764272608_5351">#17 0x00007fff8712bd7d in _NSAp=
pleEventManagerGenericHandler ()</div><div class=3D"yiv2049616253 yui_3_16_=
0_1_1407764272608_10694" style=3D"margin-top: 0px; margin-bottom: 0px; font=
-size: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);"=
 id=3D"yiv2049616253yui_3_16_0_1_1407764272608_5568">#18 0x00007fff8dc34e1f=
 in aeDispatchAppleEvent ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1=
407764272608_10695" style=3D"margin-top: 0px; margin-bottom: 0px; font-size=
: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);" id=
=3D"yiv2049616253yui_3_16_0_1_1407764272608_5400">#19 0x00007fff8dc34c32 in
 dispatchEventAndSendReply ()</div><div class=3D"yiv2049616253 yui_3_16_0_1=
_1407764272608_10696" style=3D"margin-top: 0px; margin-bottom: 0px; font-si=
ze: 12px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);" id=
=3D"yiv2049616253yui_3_16_0_1_1407764272608_5401">#20 0x00007fff8dc34b36 in=
 aeProcessAppleEvent ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_14077=
64272608_10697" style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12=
px; color: rgb(76, 47, 45); background-color: rgb(223, 219, 196);" id=3D"yi=
v2049616253yui_3_16_0_1_1407764272608_5402">#21 0x00007fff8aad4161 in AEPro=
cessAppleEvent ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_14077642726=
08_10698" style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; co=
lor: rgb(76, 47, 45); background-color: rgb(223, 219, 196);" id=3D"yiv20496=
16253yui_3_16_0_1_1407764272608_5403">#22 0x00007fff8c4400b6 in _DPSNextEve=
nt ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10699"
 style=3D"margin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(=
76, 47, 45); background-color: rgb(223, 219, 196);">#23 0x00007fff8c43f89b =
in -[NSApplication nextEventMatchingMask:untilDate:inMode:dequeue:] ()</div=
><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_10700" style=3D"mar=
gin-top: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); =
background-color: rgb(223, 219, 196);">#24 0x00007fff8c43399c in -[NSApplic=
ation run] ()</div><div class=3D"yiv2049616253 yui_3_16_0_1_1407764272608_1=
0701" id=3D"yiv2049616253yui_3_16_0_1_1407764272608_4163" style=3D"margin-t=
op: 0px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); backg=
round-color: rgb(223, 219, 196);">#25 0x0000000103b1d48a in main (argc=3D14=
, argv=3D0x7fff5c39c9c8) at ui/cocoa.m:952</div><div id=3D"yiv2049616253yui=
_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background-c=
olor:transparent;"></div><div class=3D"yiv2049616253 yui_3_16_0_1_140776427=
2608_10703"
 id=3D"yiv2049616253yui_3_16_0_1_1407764272608_4162" style=3D"margin-top: 0=
px; margin-bottom: 0px; font-size: 12px; color: rgb(76, 47, 45); background=
-color: rgb(223, 219, 196);">(gdb)&nbsp;</div><div id=3D"yiv2049616253yui_3=
_16_0_1_1407726393266_8839" class=3D"yiv2049616253"><br id=3D"yiv2049616253=
yui_3_16_0_1_1407726393266_8838" class=3D"yiv2049616253"></div><div id=3D"y=
iv2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=
=3D"background-color:transparent;">- when i launch qemu from within gdb aft=
er disabling signal interception (nostop, noprint for SIGUSR1 and SIGUSR2),=
 the black window just stays as is and nothing is loaded.</div><div id=3D"y=
iv2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=
=3D"background-color:transparent;"><br></div><div id=3D"yiv2049616253yui_3_=
16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background-colo=
r:transparent;">The configure=0A script picked the sigaltstack as the &nbsp=
;coroutine backend. &nbsp;(I would love to switch it away from sigaltstack,=
 and onto gthread, but I read enough to suggest that qemu is not stable wit=
h gthread... so i went with the defaults, for the time being).</div><div id=
=3D"yiv2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" s=
tyle=3D"background-color:transparent;">&nbsp;</div><div id=3D"yiv2049616253=
yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"backgroun=
d-color:transparent;">What am i doing wrong?</div><div id=3D"yiv2049616253y=
ui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"background=
-color:transparent;"><br class=3D"yiv2049616253"></div><div id=3D"yiv204961=
6253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" style=3D"backg=
round-color:transparent;">I would appreciate some pointers.</div><div id=3D=
"yiv2049616253yui_3_16_0_1_1407726393266_8707" class=3D"yiv2049616253" styl=
e=3D"background-color:transparent;"><br
 class=3D"yiv2049616253"></div><div id=3D"yiv2049616253yui_3_16_0_1_1407726=
393266_8707" class=3D"yiv2049616253" style=3D"background-color:transparent;=
">Thanks!</div><div id=3D"yiv2049616253yui_3_16_0_1_1407726393266_8707" cla=
ss=3D"yiv2049616253" style=3D"background-color:transparent;">Nancy</div></d=
iv></div></div></div></div></div></div><div id=3D"yiv2049616253yui_3_16_0_1=
_1407764272608_5264" class=3D"yiv2049616253" style=3D""><br class=3D"yiv204=
9616253" id=3D"yiv2049616253yui_3_16_0_6_1407764272608_5" style=3D""></div>=
</div></div></div></div></body></html>
---589800495-177128391-1407765783=:39657--

