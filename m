Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvUEy-0007QS-31
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 09:45:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvUEv-0007Q4-KT
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6q-0002Bh-Hc
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:05 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00025D-TS; Wed, 16 Jan 2013 09:36:42 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 9BFF7A2468;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CB43F200AF; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:34 +0100
Message-Id: <1358346998-26328-8-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 07/11] qemu-log: Fix unchecked strdup() by
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
X-List-Received-Date: Wed, 16 Jan 2013 14:45:19 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


