Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzo5G-0003PO-JB
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 11:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Yzo5B-0003JJ-S8
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 11:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Yzo5B-0000a0-17
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 11:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Yzo51-0000Wq-WD; Tue, 02 Jun 2015 11:26:16 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A94DC19F996;
	Tue,  2 Jun 2015 15:26:15 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-233.ams2.redhat.com
	[10.36.4.233])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52FQDwP009190; Tue, 2 Jun 2015 11:26:14 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jun 2015 16:26:08 +0100
Message-Id: <1433258768-28946-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] Add .dir-locals.el file to configure emacs
	coding style
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
X-List-Received-Date: Tue, 02 Jun 2015 15:26:29 -0000

The default emacs setup indents by 2 spaces and uses tabs
which is counter to the QEMU coding style rules. Adding a
.dir-locals.el file in the top level of the GIT repo will
inform emacs about the QEMU coding style, and so assist
contributors in avoiding common style mistakes before
they submit patches.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 .dir-locals.el | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 .dir-locals.el

diff --git a/.dir-locals.el b/.dir-locals.el
new file mode 100644
index 0000000..ddb2fae
--- /dev/null
+++ b/.dir-locals.el
@@ -0,0 +1,8 @@
+(
+ (c-mode . (
+            (c-file-style . "K&R")
+            (indent-tabs-mode . nil)
+            (c-indent-level . 4)
+            (c-basic-offset . 4)
+            ))
+)
-- 
2.4.1


