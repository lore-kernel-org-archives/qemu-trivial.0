Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvWcL-0000py-DN
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 12:17:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvWcG-0000nH-RG
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:17:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6q-0002C2-Rp
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:04 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00025I-U2; Wed, 16 Jan 2013 09:36:42 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id CDF90A2C77;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 07DB6200A9; Wed, 16 Jan 2013 15:36:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:37 +0100
Message-Id: <1358346998-26328-11-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 10/11] qapi: Fix unchecked strdup() by
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
X-List-Received-Date: Wed, 16 Jan 2013 17:17:35 -0000

Note that we already free with g_free().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qmp-registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 70cdbca..28bbbe8 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -92,7 +92,7 @@ char **qmp_get_command_list(void)
     list_head = list = g_malloc0(count * sizeof(char *));
 
     QTAILQ_FOREACH(cmd, &qmp_commands, node) {
-        *list = strdup(cmd->name);
+        *list = g_strdup(cmd->name);
         list++;
     }
 
-- 
1.7.11.7


