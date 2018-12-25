Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbn7j-0006HC-47
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2018 08:51:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gbjME-0004le-1Q
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:50:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gbjMD-0007FO-2y
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:50:38 -0500
Received: from mail-it1-x12a.google.com ([2607:f8b0:4864:20::12a]:38530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jon.diekema@gmail.com>)
	id 1gbjMC-0007AX-LE
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 04:50:37 -0500
Received: by mail-it1-x12a.google.com with SMTP id h65so17404849ith.3
	for <qemu-trivial@nongnu.org>; Tue, 25 Dec 2018 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=N6M+kXQ6LqmwNEy62dlSBAUSH8le7kKs28ziAgcRqDg=;
	b=mGPMpD5sYUdaP6Kd4Q3F2t2HsnqVH/tN8lOTAdFWKpoRwBhQl3aBCatLhPoZBIb0LV
	Y2X/ikz641FOFITFWgPgo8uKelQKWQkdTQH1TanLG3i9e7M5cqMU3U1QZyHtuTNRZRvf
	F/KLUpaRCIKjmP/CEvBGUpVghsfOYDe4LEaqiruiBfe+aW3x+psOhZ7jmvKyMgXJze9t
	N1+yMFjNtS6MMqCR1l256IlVmu1ibicEJa4iR724clwtQXO9gttAa/sNs0SrQ9B+9lNm
	mxxh8fKLgXjBE3Q96/+RmWHZj5nDZV+hEH95vy7SERWxh0MyHcp+s9d5upa/3Lpnutv3
	KYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=N6M+kXQ6LqmwNEy62dlSBAUSH8le7kKs28ziAgcRqDg=;
	b=D4XCrNG8vp2eV+j42C+maCyoui49KZxTGixfhh6YyvRdIY1xKdkxDilJD9XJncuME5
	+Tory94HE3QJaYSb7vjZYTDHJR5nbldYT2r/+H2uxsFD2tNEU0WYb8itqIkFir4pu3Dc
	drp63q/o6jNJXAwvKaX+V/uK4PUkvYYI+Ty4jswuhqbsputSqJRLmL9KJMyl32VRsC0W
	MIwhbrSd0Yj+fXMMogfsEWzTdCtV7siyqoAgMuNmQpbur+w7T3+W7s3Pyy5GGLF080ZD
	41ulLQoHdtcsITmyGNNyyjzx+iOo3/jdhfmfrpts2UJi1vq7iQN6Am5329zkz2rdbF80
	ovBg==
X-Gm-Message-State: AA+aEWbTIZSkdXBsy5EJJeCY5bjkVoQcs80PCCwxjTt9aIMx2kzYcp2r
	BFcatxKVHDRTFjfAjGUUhykCanvrLulYFCQx/UuLTPh8
X-Google-Smtp-Source: ALg8bN5DCW2eTwnUD4rq4VyWuslNefkZz3fAzYFrFr3zBf52POOO1RSTUvy7J5YbkAXUa7IMYAXItecG5VYt2o23kKc=
X-Received: by 2002:a24:7349:: with SMTP id y70mr10338159itb.48.1545731435212; 
	Tue, 25 Dec 2018 01:50:35 -0800 (PST)
MIME-Version: 1.0
From: Jon Diekema <jon.diekema@gmail.com>
Date: Tue, 25 Dec 2018 04:50:24 -0500
Message-ID: <CALvuzg43uSodseEHjNaRcPFBKKPTY2mcppUbYgiLL=QO9RxX_Q@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001d369c057dd5a580"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12a
X-Mailman-Approved-At: Tue, 25 Dec 2018 08:51:52 -0500
Subject: [Qemu-trivial] ppc: e6500 registers SPR 604 twice
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
X-List-Received-Date: Tue, 25 Dec 2018 09:50:38 -0000

--0000000000001d369c057dd5a580
Content-Type: text/plain; charset="UTF-8"

From f399f28441e0aa79458d68996038ca3606fcb699 Mon Sep 17 00:00:00 2001
From: Jon Diekema <jon.diekema@ge.com>
Date: Tue, 25 Dec 2018 04:36:06 -0500
Subject: ppc: e6500 registers SPR 604 twice

When using the e6500 CPU, QEMU generates a fatal error after
complaining about registering SPR 604 twice.

Building and testing with commit
9b2e891ec5ccdb4a7d583b77988848282606fdea shows the issue:

qemu-system-ppc64 --version
QEMU emulator version 3.1.50 (v3.1.0-456-g9b2e891ec5-dirty)
Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers

qemu-system-ppc64 -M none -cpu e6500
Error: Trying to register SPR 604 (25c) twice !

Signed-off-by: Jon Diekema <jon.diekema@ge.com>
---
 target/ppc/translate_init.inc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/ppc/translate_init.inc.c
b/target/ppc/translate_init.inc.c
index 03f1d34a97..c971a5faf7 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -4947,14 +4947,6 @@ static void init_proc_e500(CPUPPCState *env, int
version)
     }

     if (version == fsl_e6500) {
-        spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
         /* Thread identification */
         spr_register(env, SPR_TIR, "TIR",
                      SPR_NOACCESS, SPR_NOACCESS,
-- 
2.20.1.3.gf17a2b179

--0000000000001d369c057dd5a580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>From f399f28441e0aa79458d68996038ca3=
606fcb699 Mon Sep 17 00:00:00 2001</div><div>From: Jon Diekema &lt;<a href=
=3D"mailto:jon.diekema@ge.com">jon.diekema@ge.com</a>&gt;</div><div>Date: T=
ue, 25 Dec 2018 04:36:06 -0500</div><div>Subject: ppc: e6500 registers SPR =
604 twice</div><div><br></div><div>When using the e6500 CPU, QEMU generates=
 a fatal error after</div><div>complaining about registering SPR 604 twice.=
</div><div><br></div><div>Building and testing with commit</div><div>9b2e89=
1ec5ccdb4a7d583b77988848282606fdea shows the issue:</div><div><br></div><di=
v>qemu-system-ppc64 --version</div><div>QEMU emulator version 3.1.50 (v3.1.=
0-456-g9b2e891ec5-dirty)</div><div>Copyright (c) 2003-2018 Fabrice Bellard =
and the QEMU Project developers</div><div><br></div><div>qemu-system-ppc64 =
-M none -cpu e6500</div><div>Error: Trying to register SPR 604 (25c) twice =
!</div><div><br></div><div>Signed-off-by: Jon Diekema &lt;<a href=3D"mailto=
:jon.diekema@ge.com">jon.diekema@ge.com</a>&gt;</div><div>---</div><div>=C2=
=A0target/ppc/translate_init.inc.c | 8 --------</div><div>=C2=A01 file chan=
ged, 8 deletions(-)</div><div><br></div><div>diff --git a/target/ppc/transl=
ate_init.inc.c b/target/ppc/translate_init.inc.c</div><div>index 03f1d34a97=
..c971a5faf7 100644</div><div>--- a/target/ppc/translate_init.inc.c</div><d=
iv>+++ b/target/ppc/translate_init.inc.c</div><div>@@ -4947,14 +4947,6 @@ s=
tatic void init_proc_e500(CPUPPCState *env, int version)</div><div>=C2=A0 =
=C2=A0 =C2=A0}</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0if (version =
=3D=3D fsl_e6500) {</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spr_register(env=
, SPR_BOOKE_SPRG8, &quot;SPRG8&quot;,</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPR_NOACCESS, SPR_NOACC=
ESS,</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;spr_read_generic, &amp;spr_write_generic,</div><div>-=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x00000000);</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spr_register(env, SP=
R_BOOKE_SPRG9, &quot;SPRG9&quot;,</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPR_NOACCESS, SPR_NOACCESS,=
</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;spr_read_generic, &amp;spr_write_generic,</div><div>-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
00000000);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Thread identifica=
tion */</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spr_register(env, SPR_T=
IR, &quot;TIR&quot;,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPR_NOACCESS, SPR_NOACCESS,</div><div>--=
=C2=A0</div><div>2.20.1.3.gf17a2b179</div><div><br></div></div></div>

--0000000000001d369c057dd5a580--

