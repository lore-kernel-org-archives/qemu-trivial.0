Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxamS-0008Mz-N0
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 05:08:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamI-0007yh-AF
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamC-0000EF-1N
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:22 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam6-0000AN-8q; Tue, 22 Jan 2013 05:08:14 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 3E157A2468;
	Tue, 22 Jan 2013 11:08:07 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 45B27200AE; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:08:00 +0100
Message-Id: <1358849286-24750-6-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 05/11] spice: Fix unchecked strdup() by
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
X-List-Received-Date: Tue, 22 Jan 2013 10:08:32 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 ui/spice-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index 3f2c565..bcc4199 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -848,8 +848,8 @@ static int qemu_spice_set_ticket(bool fail_if_conn, bool disconnect_if_conn)
 int qemu_spice_set_passwd(const char *passwd,
                           bool fail_if_conn, bool disconnect_if_conn)
 {
-    free(auth_passwd);
-    auth_passwd = strdup(passwd);
+    g_free(auth_passwd);
+    auth_passwd = g_strdup(passwd);
     return qemu_spice_set_ticket(fail_if_conn, disconnect_if_conn);
 }
 
-- 
1.7.11.7


