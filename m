Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh5R-0005oh-7n
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh5N-0005mj-EW
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh5M-0006NZ-Nl
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh5K-0006M9-OO; Thu, 13 Jul 2017 12:35:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1D077F7A9;
	Thu, 13 Jul 2017 16:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A1D077F7A9
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A1D077F7A9
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BDCC60466;
	Thu, 13 Jul 2017 16:35:22 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 13 Jul 2017 18:32:18 +0200
Message-Id: <20170713163219.9024-29-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Jul 2017 16:35:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 28/29] test-iov: replace
 g_malloc()+memcpy() with g_memdup()
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
X-List-Received-Date: Thu, 13 Jul 2017 16:35:32 -0000

I found these pattern via grepping the source tree. I don't have a
coccinelle script for it!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/test-iov.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/test-iov.c b/tests/test-iov.c
index a22d71fd2c..fa3d75aee1 100644
--- a/tests/test-iov.c
+++ b/tests/test-iov.c
@@ -167,8 +167,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
=20
-    siov =3D g_malloc(sizeof(*iov) * niov);
-    memcpy(siov, iov, sizeof(*iov) * niov);
+    siov =3D g_memdup(iov, sizeof(*iov) * niov);
=20
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
--=20
2.13.1.395.gf7b71de06


