Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJo1Z-0002jX-Iy
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 11:07:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJo1X-0002fm-7C
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 11:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJo1W-0005a5-8q
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 11:07:11 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:46501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RJo1Q-0005ZP-Rg; Fri, 28 Oct 2011 11:07:04 -0400
Received: from blackfin.pond.sub.org (p5B32C8B0.dip.t-dialin.net
	[91.50.200.176])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 285C89FF71;
	Fri, 28 Oct 2011 17:07:03 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 4F7EB6006D; Fri, 28 Oct 2011 17:07:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Oct 2011 17:07:02 +0200
Message-Id: <1319814422-17952-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] acl: Fix use after free in qemu_acl_reset()
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
X-List-Received-Date: Fri, 28 Oct 2011 15:07:12 -0000

Reproducer:

    $ MALLOC_PERTURB_=234 qemu-system-x86_64 -vnc :0,acl,sasl [...]
    QEMU 0.15.50 monitor - type 'help' for more information
    (qemu) acl_add vnc.username fred allow
    acl: added rule at position 1
    (qemu) acl_reset vnc.username
    Segmentation fault (core dumped)

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 acl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/acl.c b/acl.c
index 0654f38..e840b9b 100644
--- a/acl.c
+++ b/acl.c
@@ -95,13 +95,13 @@ int qemu_acl_party_is_allowed(qemu_acl *acl,
 
 void qemu_acl_reset(qemu_acl *acl)
 {
-    qemu_acl_entry *entry;
+    qemu_acl_entry *entry, *next_entry;
 
     /* Put back to deny by default, so there is no window
      * of "open access" while the user re-initializes the
      * access control list */
     acl->defaultDeny = 1;
-    QTAILQ_FOREACH(entry, &acl->entries, next) {
+    QTAILQ_FOREACH_SAFE(entry, &acl->entries, next, next_entry) {
         QTAILQ_REMOVE(&acl->entries, entry, next);
         free(entry->match);
         free(entry);
-- 
1.7.6.4


