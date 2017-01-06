Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cPaBc-0005NR-NH
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2017 14:28:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1cPaBa-0005MM-JI
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2017 14:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1cPaBZ-0006tz-OX
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2017 14:28:22 -0500
Received: from ssl.serverraum.org ([213.133.101.245]:35079)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1cPaBV-0006rv-4v; Fri, 06 Jan 2017 14:28:17 -0500
Received: from [IPv6:2001:4dd0:ff00:93d9:1c87:2279:ff13:7] (unknown
	[IPv6:2001:4dd0:ff00:93d9:1c87:2279:ff13:7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 7586A2225D;
	Fri,  6 Jan 2017 20:28:11 +0100 (CET)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1483730891;
	bh=6pgtis96ZxEjpClhJQ0Q1oyMuiWq2sREKWxtwscDBlg=;
	h=Date:In-Reply-To:References:Subject:To:CC:From:From;
	b=bVI51966aGUhAQCNA51lKAfuRgd5Q97AsOgEA1WlEfst0ScpsUbu8S1O4ofnCJJho
	J3cyAqw7rt/iQaVumFgZGB3A8vEv7PHxTmz0SB9KGlMrllFmrf0WVjgbgOvxztmXHX
	knQhoqqwXhZOcgtQYS5tasypZ9693VQPcWOgaoIg=
Date: Fri, 06 Jan 2017 20:28:09 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <1483724714-5469-1-git-send-email-peter.maydell@linaro.org>
References: <1483724714-5469-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
CC: patches@linaro.org
From: Michael Walle <michael@walle.cc>
Message-ID: <DE593C1D-BF88-4ABD-99F5-176D9090538A@walle.cc>
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [PATCH] lm32: milkymist-tmu2: fix another
 integer overflow
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
X-List-Received-Date: Fri, 06 Jan 2017 19:28:23 -0000

Am 6=2E Januar 2017 18:45:14 MEZ schrieb Peter Maydell <peter=2Emaydell@lin=
aro=2Eorg>:
>Don't truncate the multiplication and do a 64 bit one instead
>because the result is stored in a 64 bit variable=2E
>
>This fixes a similar coverity warning to commit 237a8650d640,
>in a similar way, and is the other half of the fix for
>coverity CID 1167561=2E
>
>Signed-off-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>

Acked-by: Michael Walle <michael@walle=2Ecc>

>---
> hw/display/milkymist-tmu2=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/display/milkymist-tmu2=2Ec b/hw/display/milkymist-tmu2=2E=
c
>index 5c666f9=2E=2E920374b 100644
>--- a/hw/display/milkymist-tmu2=2Ec
>+++ b/hw/display/milkymist-tmu2=2Ec
>@@ -257,7 +257,7 @@ static void tmu2_start(MilkymistTMU2State *s)
>     glColor4f(m, m, m, (float)(s->regs[R_ALPHA] + 1) / 64=2E0f);
>=20
>     /* Read the QEMU dest=2E framebuffer into the OpenGL framebuffer */
>-    fb_len =3D 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
>+    fb_len =3D 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
>     fb =3D cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 0);
>     if (fb =3D=3D NULL) {
>         glDeleteTextures(1, &texture);


