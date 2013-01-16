Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvXmz-0006Rh-UE
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 13:32:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvWqv-0000fc-3a
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:32:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvWqp-000197-J6
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:32:41 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:42185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvWqe-00014O-Ne; Wed, 16 Jan 2013 12:32:24 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 0E949A0179;
	Wed, 16 Jan 2013 18:32:23 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D8705200AE; Wed, 16 Jan 2013 18:32:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 18:32:15 +0100
Message-Id: <1358357540-29862-7-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358357540-29862-1-git-send-email-armbru@redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 06/11] virtfs-proxy-helper: Fix unchecked
	strdup() by conv. to g_strdup()
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
X-List-Received-Date: Wed, 16 Jan 2013 18:32:40 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 fsdev/virtfs-proxy-helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 6b9afd3..36f6616 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -1039,7 +1039,7 @@ int main(int argc, char **argv)
         }
         switch (c) {
         case 'p':
-            rpath = strdup(optarg);
+            rpath = g_strdup(optarg);
             break;
         case 'n':
             is_daemon = false;
@@ -1048,7 +1048,7 @@ int main(int argc, char **argv)
             sock = atoi(optarg);
             break;
         case 's':
-            sock_name = strdup(optarg);
+            sock_name = g_strdup(optarg);
             break;
         case 'u':
             own_u = atoi(optarg);
-- 
1.7.11.7


