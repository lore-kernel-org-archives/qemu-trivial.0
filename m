Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbn7j-0006HX-97
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2018 08:51:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gbjTD-0005k4-LJ
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gbjTC-0000Ie-Sj
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:57:51 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43103)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jon.diekema@gmail.com>)
	id 1gbjTC-0000H7-Mu
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:57:50 -0500
Received: by mail-io1-xd36.google.com with SMTP id a2so325501ios.10
	for <qemu-trivial@nongnu.org>; Tue, 25 Dec 2018 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CBn89FwIxIfA6SsMj4J/JjIVTXuDisMGiOpngqEVxCw=;
	b=il29bOXAkFLBHRx+fFhY3xWxsvHn0lfpHsimC4UmQ8bQSBSGpR2qu2guFmsfVkFjJ9
	IizCSnplSecK0qG9iO0zCX2DaD2unnzolzTDEE+rjBs/a5CYuDYyhji2WN06GoUmiHeJ
	3CpvmOU2AfCX6A128/KKKy5Z5JDPVUXItkce4+5dV/5ci5Bb+fSVicSkyS7ERrbz6iBi
	nouZljJVaiEkMRVGN9uObNXgsT8UvKkWin2vnLmiwGRmTLK//A1No4Ff9l0YfwsxZeDf
	QQL+CAGodTptY/ZtfpxTI6x5Inf8OpQYs4Wt1abDxHiN+6QckRHO2JmnBKL2wewmKqkf
	Lqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CBn89FwIxIfA6SsMj4J/JjIVTXuDisMGiOpngqEVxCw=;
	b=f9T4Xb5mkrNYcogYm1Y3B+5Vpqw9+PZYzVRU1tItFsCgIAviJPi/T07n71Suo/Dct5
	TRR96AiYv8g6UvBwzqGkvdwqj7PLAWdwf8whCWnsmBTCdq9GaI8HzKtYRnSV5bbyZs2m
	/8Th8PmAvcCUBBzouIo/EMfler7LAHAMRrdUHRr6TlDDR8//er/+ZF+AMYjwBynuRQtv
	gEjfOEb+Q0S6gnQr2yOLPO4L0BS+iABysmLqo+I57GekyDPKWU1yFE9yM5OPbzGeKvi7
	wQ1nrEpIQeyUgPX1knjcmLQ6TKXpQicJJPb6zHPISlpDDeXaYVLyqvI+oktLvTjWj01G
	R8Aw==
X-Gm-Message-State: AJcUukfVurzxXQ6M5m0LYhC4RwL4inkzMNw8Undrp6E4abKn7+KUiXcV
	1ONlaj7ZGaxN9a5eF66b25fbHlGObmACBzqg5kDYpOdF
X-Google-Smtp-Source: ALg8bN6wRmpT6uJtYneELiw3vSCpx8aSMc4B6UxgEIDU/SKxIDMGMTag92C9MFnve2egR+w0AnHnEZM6qMTKs8homU8=
X-Received: by 2002:a6b:2c92:: with SMTP id
	s140mr10603018ios.218.1545731869917; 
	Tue, 25 Dec 2018 01:57:49 -0800 (PST)
MIME-Version: 1.0
From: Jon Diekema <jon.diekema@gmail.com>
Date: Tue, 25 Dec 2018 04:57:39 -0500
Message-ID: <CALvuzg6x2NjiJR=fPkgEmW2fCn6Uzy+rLAPHsC6Qn-S6hiNoqQ@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000648eb057dd5bf08"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d36
X-Mailman-Approved-At: Tue, 25 Dec 2018 08:51:52 -0500
Subject: [Qemu-trivial] Whitespace cleanup: target/ppc/translate_init.inc.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Dec 2018 09:57:52 -0000

--0000000000000648eb057dd5bf08
Content-Type: text/plain; charset="UTF-8"

From b9c6caf3913487f05997144a940db0b900b17f05 Mon Sep 17 00:00:00 2001
From: Jon Diekema <jon.diekema@ge.com>
Date: Tue, 25 Dec 2018 04:03:04 -0500
Subject: Whitespace cleanup: target/ppc/translate_init.inc.c

Signed-off-by: Jon Diekema <jon.diekema@ge.com>
---
 target/ppc/translate_init.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate_init.inc.c
b/target/ppc/translate_init.inc.c
index 03f1d34a97..ac186845d0 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -5245,7 +5245,7 @@ static void init_proc_601(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     init_excp_601(env);
-    /* XXX: beware that dcache line size is 64
+    /* XXX: beware that dcache line size is 64
      *      but dcbz uses 32 bytes "sectors"
      * XXX: this breaks clcs instruction !
      */
@@ -10493,7 +10493,7 @@ static void ppc_cpu_class_init(ObjectClass *oc,
void *data)
     cc->tcg_initialize = ppc_translate_init;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
-
+
     dc->fw_name = "PowerPC,UNKNOWN";
 }

-- 
2.20.1.3.gf17a2b179

--0000000000000648eb057dd5bf08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>From b9c6caf3913487f05997144a940db0b=
900b17f05 Mon Sep 17 00:00:00 2001</div><div>From: Jon Diekema &lt;<a href=
=3D"mailto:jon.diekema@ge.com">jon.diekema@ge.com</a>&gt;</div><div>Date: T=
ue, 25 Dec 2018 04:03:04 -0500</div><div>Subject: Whitespace cleanup: targe=
t/ppc/translate_init.inc.c</div><div><br></div><div>Signed-off-by: Jon Diek=
ema &lt;<a href=3D"mailto:jon.diekema@ge.com">jon.diekema@ge.com</a>&gt;</d=
iv><div>---</div><div>=C2=A0target/ppc/translate_init.inc.c | 4 ++--</div><=
div>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)</div><div><br></d=
iv><div>diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate=
_init.inc.c</div><div>index 03f1d34a97..ac186845d0 100644</div><div>--- a/t=
arget/ppc/translate_init.inc.c</div><div>+++ b/target/ppc/translate_init.in=
c.c</div><div>@@ -5245,7 +5245,7 @@ static void init_proc_601(CPUPPCState *=
env)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00000000);</div><div>=C2=A0 =C2=A0 =C2=A0/* Memory management */</div=
><div>=C2=A0 =C2=A0 =C2=A0init_excp_601(env);</div><div>-=C2=A0 =C2=A0 /* X=
XX: beware that dcache line size is 64=C2=A0</div><div>+=C2=A0 =C2=A0 /* XX=
X: beware that dcache line size is 64</div><div>=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0 but dcbz uses 32 bytes &quot;sectors&quot;</div><div>=C2=
=A0 =C2=A0 =C2=A0 * XXX: this breaks clcs instruction !</div><div>=C2=A0 =
=C2=A0 =C2=A0 */</div><div>@@ -10493,7 +10493,7 @@ static void ppc_cpu_clas=
s_init(ObjectClass *oc, void *data)</div><div>=C2=A0 =C2=A0 =C2=A0cc-&gt;tc=
g_initialize =3D ppc_translate_init;</div><div>=C2=A0#endif</div><div>=C2=
=A0 =C2=A0 =C2=A0cc-&gt;disas_set_info =3D ppc_disas_set_info;</div><div>-=
=C2=A0</div><div>+</div><div>=C2=A0 =C2=A0 =C2=A0dc-&gt;fw_name =3D &quot;P=
owerPC,UNKNOWN&quot;;</div><div>=C2=A0}</div><div>=C2=A0</div><div>--=C2=A0=
</div><div>2.20.1.3.gf17a2b179</div><div><br></div></div></div>

--0000000000000648eb057dd5bf08--

