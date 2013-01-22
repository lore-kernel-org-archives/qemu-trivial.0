Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txbjl-0007zK-5E
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 06:09:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamL-0008Cg-Fb
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamE-0000Ev-8E
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:27 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam7-0000Bg-3B; Tue, 22 Jan 2013 05:08:15 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id A4267A43D5;
	Tue, 22 Jan 2013 11:08:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BA616200B4; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:08:06 +0100
Message-Id: <1358849286-24750-12-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 11/11] qemu-ga: Fix unchecked strdup() by
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
X-List-Received-Date: Tue, 22 Jan 2013 11:09:48 -0000

I figure it's freed somewhere deep down in QAPI, with g_free().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qga/commands.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands.c b/qga/commands.c
index 7ffb35e..528b082 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -61,7 +61,7 @@ struct GuestAgentInfo *qmp_guest_info(Error **err)
 
     while (*cmd_list) {
         cmd_info = g_malloc0(sizeof(GuestAgentCommandInfo));
-        cmd_info->name = strdup(*cmd_list);
+        cmd_info->name = g_strdup(*cmd_list);
         cmd_info->enabled = qmp_command_is_enabled(cmd_info->name);
 
         cmd_info_list = g_malloc0(sizeof(GuestAgentCommandInfoList));
-- 
1.7.11.7


