Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWOQ7-00070v-5a
	for mharc-qemu-trivial@gnu.org; Sun, 07 Aug 2016 09:47:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nospam@kota.moe>) id 1bWHvn-0002gD-Iu
	for qemu-trivial@nongnu.org; Sun, 07 Aug 2016 02:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nospam@kota.moe>) id 1bWHvj-0006uS-G7
	for qemu-trivial@nongnu.org; Sun, 07 Aug 2016 02:51:30 -0400
Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235]:33585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nospam@kota.moe>) id 1bWHvj-0006uK-8p
	for qemu-trivial@nongnu.org; Sun, 07 Aug 2016 02:51:27 -0400
Received: by mail-io0-x235.google.com with SMTP id 38so333694663iol.0
	for <qemu-trivial@nongnu.org>; Sat, 06 Aug 2016 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kota.moe; s=google;
	h=mime-version:reply-to:from:date:message-id:subject:to;
	bh=1Q6k1lZEf4TxeRYwoxdiidfiNFpDsE7SXka0Lqf0xL0=;
	b=cl5XaBIVMq7fBP9aUJjgMwLomEYOXY7WVItVUj8AMLBkDJpisjyB14E+jJ7LiTCHlx
	b8XwLum0sE7FXmzLXBEdxBCWn125n+1ap1yPu37w7/fmcuL60r5vc4D/HVyAix416761
	UpcSNg8vWXEH8QxzHmSxIQbjPn87XWnabysaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:from:date:message-id
	:subject:to;
	bh=1Q6k1lZEf4TxeRYwoxdiidfiNFpDsE7SXka0Lqf0xL0=;
	b=bKtRct+lTJc9e6RbAqAuzKJ+7CsGICnxV962P58lCmeRLPdGG+QqUZEW0t8V6vkU79
	Q7jog2EUr2zuXL/TANxSGyh+I6ErxLLBILEu1kBsal0cuoh/iUkgeCkoSvbmkTp7kRcu
	xsP0mEyuaDZP4dzi0I2YvFFMAGuhuK/p4tlb4JB5pZu1VUQv9iws497VjUWVyPiBx+N2
	rlk2MjoxMjXxNRMNpdVegZAVWLY7Q9OkEZDjq13hdYqRVOGRyJ34M/vBoAkK+4k4tB3C
	BF2JyVeLyE7gTL6GYOx07KfdQrMHiumizCXjAbRsfqmih4eut9VjwrBeUSBpA+hVGl3Q
	6q3A==
X-Gm-Message-State: AEkoousGbiMYXEXqShf6ykiYhaMXzVUkWl4AmyJbHf0x6i3T8HqVEALcyai6bDlpD+2aPCR5aY/ojaUMGPtt/gZ0
X-Received: by 10.107.16.228 with SMTP id 97mr100009494ioq.98.1470552685594;
	Sat, 06 Aug 2016 23:51:25 -0700 (PDT)
MIME-Version: 1.0
Reply-To: work@kota.moe
Received: by 10.50.125.102 with HTTP; Sat, 6 Aug 2016 23:50:45 -0700 (PDT)
X-Originating-IP: [120.146.152.126]
From: Donny Yang <work@kota.moe>
Date: Sun, 7 Aug 2016 16:50:45 +1000
Message-ID: <CACsxjPbpdVhgwGdkBF+9Nac7np532FjauYonkY=NnRfOr2ACAA@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a113edaae7311eb053975ba10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::235
X-Mailman-Approved-At: Sun, 07 Aug 2016 09:47:13 -0400
Subject: [Qemu-trivial] [PATCH] hw/timer/imx_gpt: Properly mask control
 register on software reset
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
X-List-Received-Date: Sun, 07 Aug 2016 06:51:32 -0000

--001a113edaae7311eb053975ba10
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Donny Yang <work@kota.moe>
---
 hw/timer/imx_gpt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 82bc73c..02d875f 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -306,8 +306,8 @@ static void imx_gpt_reset(DeviceState *dev)
     /*
      * Soft reset doesn't touch some bits; hard reset clears them
      */
-    s->cr &= ~(GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
-               GPT_CR_WAITEN|GPT_CR_DBGEN);
+    s->cr &= GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
+             GPT_CR_WAITEN|GPT_CR_DBGEN;
     s->sr = 0;
     s->pr = 0;
     s->ir = 0;
-- 
2.9.2

--001a113edaae7311eb053975ba10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Donny Yang &lt;work@kota.moe&gt;<br>---<br>=
=C2=A0hw/timer/imx_gpt.c | 4 ++--<br>=C2=A01 file changed, 2 insertions(+),=
 2 deletions(-)<br><br>diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c=
<br>index 82bc73c..02d875f 100644<br>--- a/hw/timer/imx_gpt.c<br>+++ b/hw/t=
imer/imx_gpt.c<br>@@ -306,8 +306,8 @@ static void imx_gpt_reset(DeviceState=
 *dev)<br>=C2=A0=C2=A0=C2=A0=C2=A0 /*<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * S=
oft reset doesn&#39;t touch some bits; hard reset clears them<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */<br>-=C2=A0=C2=A0=C2=A0 s-&gt;cr &amp;=3D ~(GPT_CR_=
EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPT_CR_WAITEN|GPT=
_CR_DBGEN);<br>+=C2=A0=C2=A0=C2=A0 s-&gt;cr &amp;=3D GPT_CR_EN|GPT_CR_ENMOD=
|GPT_CR_STOPEN|GPT_CR_DOZEN|<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPT_CR_WAITEN|GPT_CR_DBGEN;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 s-&gt;sr =3D 0;<br>=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;pr =3D 0;<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 s-&gt;ir =3D 0;<br>-- <br>2.9.2<br><br></div>

--001a113edaae7311eb053975ba10--

