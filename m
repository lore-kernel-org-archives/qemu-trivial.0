Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh3F-0002r7-Tc
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:33:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh3C-0002oT-0s
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh3A-0004I4-Sn
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:33:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh35-0004FJ-LN; Thu, 13 Jul 2017 12:33:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E9DAC08C326;
	Thu, 13 Jul 2017 16:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7E9DAC08C326
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7E9DAC08C326
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF12577EE7;
	Thu, 13 Jul 2017 16:32:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 13 Jul 2017 18:31:56 +0200
Message-Id: <20170713163219.9024-7-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 13 Jul 2017 16:33:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 06/29] pcspk: use QEMU_ALIGN_DOWN
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
X-List-Received-Date: Thu, 13 Jul 2017 16:33:15 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/audio/pcspk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index f643b122bb..0206f7399b 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -69,7 +69,7 @@ static inline void generate_samples(PCSpkState *s)
         const uint32_t n =3D ((uint64_t)PIT_FREQ << 32) / m;
=20
         /* multiple of wavelength for gapless looping */
-        s->samples =3D (PCSPK_BUF_LEN * PIT_FREQ / m * m / (PIT_FREQ >> =
1) + 1) >> 1;
+        s->samples =3D (QEMU_ALIGN_DOWN(PCSPK_BUF_LEN * PIT_FREQ, m) / (=
PIT_FREQ >> 1) + 1) >> 1;
         for (i =3D 0; i < s->samples; ++i)
             s->sample_buf[i] =3D (64 & (n * i >> 25)) - 32;
     } else {
--=20
2.13.1.395.gf7b71de06


