Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txaym-0006wZ-M8
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 05:21:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamP-0008Me-SW
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamE-0000Eq-6j
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:33 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam7-0000Bf-2y; Tue, 22 Jan 2013 05:08:15 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 9EBD8A4310;
	Tue, 22 Jan 2013 11:08:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B1FD7200B0; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:08:05 +0100
Message-Id: <1358849286-24750-11-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 10/11] qapi: Fix unchecked strdup() by
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
X-List-Received-Date: Tue, 22 Jan 2013 10:21:18 -0000

Note that we already free with g_free().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


