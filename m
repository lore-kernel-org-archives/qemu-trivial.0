Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmHOx-0001Fx-8t
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 06:36:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dmHOs-0001Ba-3H
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 06:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dmHOr-00025q-5T
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 06:36:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40484)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dmHOj-0001wZ-EE; Mon, 28 Aug 2017 06:36:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BCEA4A6E8;
	Mon, 28 Aug 2017 10:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3BCEA4A6E8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-110.ams2.redhat.com
	[10.36.116.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1DE97F494;
	Mon, 28 Aug 2017 10:35:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>
Date: Mon, 28 Aug 2017 12:35:57 +0200
Message-Id: <1503916557-1292-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 28 Aug 2017 10:36:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests/libqtest: Use a proper error message
 if QTEST_QEMU_BINARY is missing
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
X-List-Received-Date: Mon, 28 Aug 2017 10:36:13 -0000

The user can currently still cause an abort() if running certain tests
(like the prom-env-test) without setting the QTEST_QEMU_BINARY first.
A similar problem has been fixed with commit 7c933ad61b8f3f51337
already, but forgot to also take care of the qtest_get_arch() function,
so let's introduce a proper wrapper around getenv("QTEST_QEMU_BINARY")
that can be used in both locations now.

Buglink: https://bugs.launchpad.net/qemu/+bug/1713434
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqtest.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index b9a1f18..342a77b 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -150,6 +150,19 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
     g_hook_prepend(&abrt_hooks, hook);
 }
 
+static const char *qtest_qemu_binary(void)
+{
+    const char *qemu_bin;
+
+    qemu_bin = getenv("QTEST_QEMU_BINARY");
+    if (!qemu_bin) {
+        fprintf(stderr, "Environment variable QTEST_QEMU_BINARY required\n");
+        exit(1);
+    }
+
+    return qemu_bin;
+}
+
 QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 {
     QTestState *s;
@@ -157,13 +170,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     gchar *socket_path;
     gchar *qmp_socket_path;
     gchar *command;
-    const char *qemu_binary;
-
-    qemu_binary = getenv("QTEST_QEMU_BINARY");
-    if (!qemu_binary) {
-        fprintf(stderr, "Environment variable QTEST_QEMU_BINARY required\n");
-        exit(1);
-    }
+    const char *qemu_binary = qtest_qemu_binary();
 
     s = g_malloc(sizeof(*s));
 
@@ -624,8 +631,7 @@ char *qtest_hmp(QTestState *s, const char *fmt, ...)
 
 const char *qtest_get_arch(void)
 {
-    const char *qemu = getenv("QTEST_QEMU_BINARY");
-    g_assert(qemu != NULL);
+    const char *qemu = qtest_qemu_binary();
     const char *end = strrchr(qemu, '/');
 
     return end + strlen("/qemu-system-");
-- 
1.8.3.1


