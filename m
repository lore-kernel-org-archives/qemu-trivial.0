Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBrjC-0006lx-As
	for mharc-qemu-trivial@gnu.org; Fri, 19 May 2017 19:54:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dBrj9-0006kW-P2
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 19:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dBrj8-0000b2-VH
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 19:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dBrj4-0000Xk-KO; Fri, 19 May 2017 19:54:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CA9C624CF;
	Fri, 19 May 2017 23:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4CA9C624CF
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4CA9C624CF
Received: from thh440s.redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AE88777D0;
	Fri, 19 May 2017 23:54:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu-trivial@nongnu.org
Date: Sat, 20 May 2017 01:54:25 +0200
Message-Id: <1495238065-15846-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 19 May 2017 23:54:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests/libqtest: Print error instead of
 aborting when env variable is missing
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
X-List-Received-Date: Fri, 19 May 2017 23:54:36 -0000

When you currently try to run a test directly from the command line
without setting the QTEST_QEMU_BINARY environment variable first,
you are presented with an unhelpful assertion message like this:

 ERROR:tests/libqtest.c:163:qtest_init_without_qmp_handshake:
 assertion failed: (qemu_binary != NULL)
 Aborted (core dumped)

Let's replace the assert() with a more user friendly error message
instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqtest.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 84ecbd2..f0fd682 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -160,7 +160,11 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     const char *qemu_binary;
 
     qemu_binary = getenv("QTEST_QEMU_BINARY");
-    g_assert(qemu_binary != NULL);
+    if (!qemu_binary) {
+        fprintf(stderr, "The environment variable QTEST_QEMU_BINARY has to be "
+                        "set before running the test.\n");
+        exit(1);
+    }
 
     s = g_malloc(sizeof(*s));
 
-- 
1.8.3.1


