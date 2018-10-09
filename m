Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9mj7-00013x-Kp
	for mharc-qemu-trivial@gnu.org; Tue, 09 Oct 2018 03:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g9mj4-00012z-M8
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 03:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g9miz-0000OQ-IU
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 03:46:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1g9mit-0000GQ-97; Tue, 09 Oct 2018 03:46:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D39A83F40;
	Tue,  9 Oct 2018 07:46:24 +0000 (UTC)
Received: from thuth.com (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 963AE5E1C8;
	Tue,  9 Oct 2018 07:46:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-trivial@nongnu.org
Date: Tue,  9 Oct 2018 09:46:20 +0200
Message-Id: <1539071180-2028-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 Oct 2018 07:46:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] target/cris/translate: Get rid of
 qemu_log_separate()
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
X-List-Received-Date: Tue, 09 Oct 2018 07:46:44 -0000

The gen_BUG() function calls already cpu_abort(), which prints the
information to stderr and the log already. So instead of additionally
printing the dc->pc via fprintf() and qemu_log here, too, we can
simply pass this information to cpu_abort() instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/cris/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 4ae1c04..0ee2c5d 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -137,11 +137,7 @@ typedef struct DisasContext {
 
 static void gen_BUG(DisasContext *dc, const char *file, int line)
 {
-    fprintf(stderr, "BUG: pc=%x %s %d\n", dc->pc, file, line);
-    if (qemu_log_separate()) {
-        qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
-    }
-    cpu_abort(CPU(dc->cpu), "%s:%d\n", file, line);
+    cpu_abort(CPU(dc->cpu), "%s:%d dc->pc=%x\n", file, line, dc->pc);
 }
 
 static const char *regnames_v32[] =
-- 
1.8.3.1


