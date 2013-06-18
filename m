Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UovlE-0003lY-DT
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 09:15:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Uoqv6-0004Vz-8w
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 04:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Uoqv4-0007il-3t
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 04:05:39 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:54461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Uoqut-0007fh-Ii; Tue, 18 Jun 2013 04:05:27 -0400
Received: from blackfin.pond.sub.org (p5B32A651.dip0.t-ipconnect.de
	[91.50.166.81])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 3E150A4617;
	Tue, 18 Jun 2013 10:05:24 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 75FF7200B4; Tue, 18 Jun 2013 10:05:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2013 10:05:23 +0200
Message-Id: <1371542723-926-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.46.104.156
X-Mailman-Approved-At: Tue, 18 Jun 2013 09:15:46 -0400
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] acl: acl_add can't insert before last list
	element, fix
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
X-List-Received-Date: Tue, 18 Jun 2013 08:05:42 -0000

Watch this:

    $ upstream-qemu -nodefaults -S -vnc :0,acl,sasl -monitor stdio
    QEMU 1.5.50 monitor - type 'help' for more information
    (qemu) acl_add vnc.username drei allow
    acl: added rule at position 1
    (qemu) acl_show vnc.username
    policy: deny
    1: allow drei
    (qemu) acl_add vnc.username zwei allow 1
    acl: added rule at position 2
    (qemu) acl_show vnc.username
    policy: deny
    1: allow drei
    2: allow zwei
    (qemu) acl_add vnc.username eins allow 1
    acl: added rule at position 1
    (qemu) acl_show vnc.username
    policy: deny
    1: allow eins
    2: allow drei
    3: allow zwei

The second acl_add inserts at position 2 instead of 1.

Root cause is an off-by-one in qemu_acl_insert(): when index ==
acl->nentries, it appends instead of inserting before the last list
element.

Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/acl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/acl.c b/util/acl.c
index a7f33ff..938b7ae 100644
--- a/util/acl.c
+++ b/util/acl.c
@@ -138,9 +138,9 @@ int qemu_acl_insert(qemu_acl *acl,
 
     if (index <= 0)
         return -1;
-    if (index >= acl->nentries)
+    if (index > acl->nentries) {
         return qemu_acl_append(acl, deny, match);
-
+    }
 
     entry = g_malloc(sizeof(*entry));
     entry->match = g_strdup(match);
-- 
1.7.11.7


