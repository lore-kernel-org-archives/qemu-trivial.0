Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQDK7-0005QQ-SJ
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2019 11:57:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQDK5-00057T-8v
	for qemu-trivial@nongnu.org; Mon, 13 May 2019 11:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQDBO-0008B6-OL
	for qemu-trivial@nongnu.org; Mon, 13 May 2019 11:48:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQDBN-00089x-K3; Mon, 13 May 2019 11:48:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13541308A968;
	Mon, 13 May 2019 15:48:04 +0000 (UTC)
Received: from thuth.com (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB87819C6A;
	Mon, 13 May 2019 15:48:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 May 2019 17:47:59 +0200
Message-Id: <20190513154759.24973-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 13 May 2019 15:48:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests/libqtest: Fix description of
 qtest_vinitf() and qtest_initf()
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
X-List-Received-Date: Mon, 13 May 2019 15:57:06 -0000

These functions are convenience wrappers of qtest_init() and not of
qtest_start().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqtest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/libqtest.h b/tests/libqtest.h
index 3f7675fcf0..a98ea15b7d 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -29,7 +29,7 @@ extern QTestState *global_qtest;
  * @fmt...: Format for creating other arguments to pass to QEMU, formatt=
ed
  * like sprintf().
  *
- * Convenience wrapper around qtest_start().
+ * Convenience wrapper around qtest_init().
  *
  * Returns: #QTestState instance.
  */
@@ -41,7 +41,7 @@ QTestState *qtest_initf(const char *fmt, ...) GCC_FMT_A=
TTR(1, 2);
  * like vsprintf().
  * @ap: Format arguments.
  *
- * Convenience wrapper around qtest_start().
+ * Convenience wrapper around qtest_init().
  *
  * Returns: #QTestState instance.
  */
--=20
2.21.0


