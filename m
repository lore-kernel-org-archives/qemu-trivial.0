Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9y9x-0005mW-V5
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 16:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mansourweb@gmail.com>) id 1j9xxN-0001Uu-GN
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 16:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mansourweb@gmail.com>) id 1j9xxM-0008SY-6e
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 16:23:01 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:44568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mansourweb@gmail.com>)
 id 1j9xxL-0008Rj-Uc
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 16:23:00 -0500
Received: by mail-lf1-x12d.google.com with SMTP id i10so108390lfg.11
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 13:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UlDFHDD6C6K4MqyN6QSxw8ae9bFx8S/bZMSBUKfWd2M=;
 b=To5vsaMzbo6D/9YuwM3rjmQF8oynERkmos2Fs7fTQwxt6HVG5eIuRmxqyqKYZI6vvz
 fvYSk7GwAg80Ryu6mM9W21oheIa/mBfMq5qPzEtjbblfxOD6zYBX1y0/1wjFEn8/WN5/
 PeKadK3WPuN8OYGF8qwRHa7TDbPIP273B2kQ3Jd9ta8GjMURfYWcPgv5MmhU2Dwvw/ZQ
 XImUQHB3+Xmx/k3qURnOILwmMVwW1w4+PPxdGvI0yOGdpcw+qAQFmF44JZxgfrUyjsrO
 Qm5HhoTZNhf7DBnInQJCRAXrr3xvsAx68uzwMtxizS9qhMEujP2wsZ2LEFyM7FJPpgMX
 V0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UlDFHDD6C6K4MqyN6QSxw8ae9bFx8S/bZMSBUKfWd2M=;
 b=q2eab/OIy0S1TPJZD7Ch7FRx0DeugnAWDZX1rig25WnGZn7rTeBOAXGsauOcRYjzwW
 vCJ7IZv8vd+0E7lOBNN5POdERLvdBFNJoPYexEmT4oSsX6glGiYJ6MStzWoVq1ieJKHq
 h2wqmcVy/JCMaeprCqdzKR4Yfwhc7LT63OyieLKGmNXTjADm7apJNvR0BNajgdZwYgWq
 NJENkrJU1ZlRC4qvQaQlaBx0geSkXEXrSWSA9+QlgP9dAmlOVQSnmuMnDGm1A+OWQwbl
 4cgS431zI90YufmbnW5Jn7/be/K6cjceqi7Id8f11mrcfnDHvYjBFl1IGL3aWSU5xvZJ
 MuDg==
X-Gm-Message-State: ANhLgQ0VHBxv0x11tlGPbW6Eq35GpMHe+JulYstVmTGugACzNQWpzDym
 ksMIxyJGXFX5C+rms0/qokBz6S6q80EZsHeUFbJYaEutA4M=
X-Google-Smtp-Source: ADFU+vuxudCcryilO8UjcbRMBKc8dlfx1ddVIN00J6OiAvw5J7yvF4mGiMq+tpwhuJngBG1wOWzdhkJ79dAoMPFwtWs=
X-Received: by 2002:a05:6512:203c:: with SMTP id
 s28mr308966lfs.117.1583443377299; 
 Thu, 05 Mar 2020 13:22:57 -0800 (PST)
MIME-Version: 1.0
From: Mansour Ahmadi <mansourweb@gmail.com>
Date: Thu, 5 Mar 2020 16:22:46 -0500
Message-ID: <CAGT9xrCF740RKCBrOFVN2LJUKMkLj25oO4pVD1LOfM=ZVKgLeQ@mail.gmail.com>
Subject: Inconsistency - potential bug
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000006a65405a02224c6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12d
X-Mailman-Approved-At: Thu, 05 Mar 2020 16:36:00 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 21:23:02 -0000

--00000000000006a65405a02224c6
Content-Type: text/plain; charset="UTF-8"

Hi

It seems there is an inconsistency here:

https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/disas/ppc.c#L996
if (((insn & (1 << 21)) == 0) != ((insn & (1 << 15)) == 0))
*invalid = 1;
https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/disas/ppc.c#L1041
if (((insn & (1 << 21)) == 0) == ((insn & (1 << 15)) == 0))
*invalid = 1;

Does "==" need to be changed to "!="?

Mansour

--00000000000006a65405a02224c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:garamond=
,serif;font-size:large">Hi</div><div class=3D"gmail_default" style=3D"font-=
family:garamond,serif;font-size:large"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:garamond,serif;font-size:large">It seems there is a=
n inconsistency here:</div><div class=3D"gmail_default" style=3D"font-famil=
y:garamond,serif;font-size:large"><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:garamond,serif;font-size:large"><a href=3D"https://githu=
b.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/disas/ppc.c#L=
996">https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54=
268b/disas/ppc.c#L996</a><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:garamond,serif;font-size:large"><span class=3D"gmail-pl-k" style=
=3D"box-sizing:border-box;color:rgb(215,58,73);font-family:SFMono-Regular,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-sp=
ace:pre">if</span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Reg=
ular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;wh=
ite-space:pre;background-color:rgb(255,251,221)"> (((insn &amp; (</span><sp=
an class=3D"gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0,92,197)=
;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,mono=
space;font-size:12px;white-space:pre">1</span><span style=3D"color:rgb(36,4=
1,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo=
,monospace;font-size:12px;white-space:pre;background-color:rgb(255,251,221)=
"> &lt;&lt; </span><span class=3D"gmail-pl-c1" style=3D"box-sizing:border-b=
ox;color:rgb(0,92,197);font-family:SFMono-Regular,Consolas,&quot;Liberation=
 Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">21</span><span =
style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Libe=
ration Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre;background=
-color:rgb(255,251,221)">)) =3D=3D </span><span class=3D"gmail-pl-c1" style=
=3D"box-sizing:border-box;color:rgb(0,92,197);font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-spa=
ce:pre">0</span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regul=
ar,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;whit=
e-space:pre;background-color:rgb(255,251,221)">) !=3D ((insn &amp; (</span>=
<span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0,92,1=
97);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,m=
onospace;font-size:12px;white-space:pre">1</span><span style=3D"color:rgb(3=
6,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Me=
nlo,monospace;font-size:12px;white-space:pre;background-color:rgb(255,251,2=
21)"> &lt;&lt; </span><span class=3D"gmail-pl-c1" style=3D"box-sizing:borde=
r-box;color:rgb(0,92,197);font-family:SFMono-Regular,Consolas,&quot;Liberat=
ion Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">15</span><sp=
an style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;L=
iberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre;backgro=
und-color:rgb(255,251,221)">)) =3D=3D </span><span class=3D"gmail-pl-c1" st=
yle=3D"box-sizing:border-box;color:rgb(0,92,197);font-family:SFMono-Regular=
,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-=
space:pre">0</span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Re=
gular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;w=
hite-space:pre;background-color:rgb(255,251,221)">))</span><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:garamond,serif;font-size:large"=
><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&qu=
ot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre;bac=
kground-color:rgb(255,251,221)">    </span><span style=3D"color:rgb(36,41,4=
6);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,mo=
nospace;font-size:12px;white-space:pre">*invalid =3D </span><span class=3D"=
gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0,92,197);font-family=
:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-s=
ize:12px;white-space:pre">1</span><span style=3D"color:rgb(36,41,46);font-f=
amily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;f=
ont-size:12px;white-space:pre">;</span></div><div class=3D"gmail_default" s=
tyle=3D"font-family:garamond,serif;font-size:large"><a href=3D"https://gith=
ub.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e54268b/disas/ppc.c#=
L1041">https://github.com/qemu/qemu/blob/55afdac3b29e672aad51e953412364127e=
54268b/disas/ppc.c#L1041</a><span style=3D"color:rgb(36,41,46);font-family:=
SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-si=
ze:12px;white-space:pre;background-color:rgb(255,251,221)"><br></span></div=
><div class=3D"gmail_default" style=3D"font-family:garamond,serif;font-size=
:large"><span class=3D"gmail-pl-k" style=3D"box-sizing:border-box;color:rgb=
(215,58,73);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;=
,Menlo,monospace;font-size:12px;white-space:pre">if</span><span style=3D"co=
lor:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono=
&quot;,Menlo,monospace;font-size:12px;white-space:pre;background-color:rgb(=
255,251,221)"> (((insn &amp; (</span><span class=3D"gmail-pl-c1" style=3D"b=
ox-sizing:border-box;color:rgb(0,92,197);font-family:SFMono-Regular,Consola=
s,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pr=
e">1</span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-spa=
ce:pre;background-color:rgb(255,251,221)"> &lt;&lt; </span><span class=3D"g=
mail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0,92,197);font-family:=
SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-si=
ze:12px;white-space:pre">21</span><span style=3D"color:rgb(36,41,46);font-f=
amily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;f=
ont-size:12px;white-space:pre;background-color:rgb(255,251,221)">)) =3D=3D =
</span><span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb=
(0,92,197);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,=
Menlo,monospace;font-size:12px;white-space:pre">0</span><span style=3D"colo=
r:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&q=
uot;,Menlo,monospace;font-size:12px;white-space:pre;background-color:rgb(25=
5,251,221)">) =3D=3D ((insn &amp; (</span><span class=3D"gmail-pl-c1" style=
=3D"box-sizing:border-box;color:rgb(0,92,197);font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-spa=
ce:pre">1</span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regul=
ar,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;whit=
e-space:pre;background-color:rgb(255,251,221)"> &lt;&lt; </span><span class=
=3D"gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0,92,197);font-fa=
mily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;fo=
nt-size:12px;white-space:pre">15</span><span style=3D"color:rgb(36,41,46);f=
ont-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monosp=
ace;font-size:12px;white-space:pre;background-color:rgb(255,251,221)">)) =
=3D=3D </span><span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box;co=
lor:rgb(0,92,197);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono=
&quot;,Menlo,monospace;font-size:12px;white-space:pre">0</span><span style=
=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberatio=
n Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre;background-colo=
r:rgb(255,251,221)">))</span></div><div class=3D"gmail_default" style=3D"fo=
nt-family:garamond,serif;font-size:large"><span style=3D"color:rgb(36,41,46=
);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,mon=
ospace;font-size:12px;white-space:pre;background-color:rgb(255,251,221)">  =
  </span><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Cons=
olas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space=
:pre">*invalid =3D </span><span class=3D"gmail-pl-c1" style=3D"box-sizing:b=
order-box;color:rgb(0,92,197);font-family:SFMono-Regular,Consolas,&quot;Lib=
eration Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">1</span>=
<span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quo=
t;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">;</=
span><br></div><div class=3D"gmail_default" style=3D"font-family:garamond,s=
erif;font-size:large"><br></div><div class=3D"gmail_default" style=3D"font-=
family:garamond,serif;font-size:large">Does &quot;=3D=3D&quot; need to be c=
hanged to &quot;!=3D&quot;?<span style=3D"font-family:Arial,Helvetica,sans-=
serif;font-size:small"><br></span></div><div class=3D"gmail_default" style=
=3D"font-family:garamond,serif;font-size:large"><br></div><div class=3D"gma=
il_default" style=3D"font-family:garamond,serif;font-size:large">Mansour</d=
iv><div class=3D"gmail_default" style=3D"font-family:garamond,serif;font-si=
ze:large"><span style=3D"font-family:Arial,Helvetica,sans-serif;font-size:s=
mall"><br></span></div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"border-collapse:collapse;w=
hite-space:pre-wrap"><span style=3D"border-collapse:separate;white-space:no=
rmal"><font color=3D"#000000" size=3D"2"><div style=3D"font-family:Calibri"=
><div style=3D"font-family:arial,sans-serif"></div></div></font></span></sp=
an></div></div></div></div></div></div></div></div></div>

--00000000000006a65405a02224c6--

