Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxcFp-0008S1-6M
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 06:43:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamQ-0008Mk-Al
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamH-0000FZ-25
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:34 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam7-0000BV-1b; Tue, 22 Jan 2013 05:08:15 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 7AF43A247E;
	Tue, 22 Jan 2013 11:08:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 66BC4200AC; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:08:02 +0100
Message-Id: <1358849286-24750-8-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 07/11] qemu-log: Fix unchecked strdup() by
	converting to g_strdup()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 11:43:00 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qemu-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-log.c b/qemu-log.c
index b655b30..64a1b88 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -84,7 +84,7 @@ void qemu_set_log(int log_flags, bool use_own_buffers)
 
 void cpu_set_log_filename(const char *filename)
 {
-    logfilename = strdup(filename);
+    logfilename = g_strdup(filename);
     if (qemu_logfile) {
         fclose(qemu_logfile);
         qemu_logfile = NULL;
-- 
1.7.11.7


