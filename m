Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fC1LT-000251-Hk
	for mharc-qemu-trivial@gnu.org; Fri, 27 Apr 2018 07:15:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fC1LR-00022I-GN
	for qemu-trivial@nongnu.org; Fri, 27 Apr 2018 07:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fC1LQ-0007Ql-Kc
	for qemu-trivial@nongnu.org; Fri, 27 Apr 2018 07:15:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52014 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fC1LL-0007Pd-Aw; Fri, 27 Apr 2018 07:15:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EBEE8160F82;
	Fri, 27 Apr 2018 11:15:07 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-117-237.ams2.redhat.com
	[10.36.117.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F20F215CDCB;
	Fri, 27 Apr 2018 11:15:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	eblake@redhat.com
Date: Fri, 27 Apr 2018 12:15:02 +0100
Message-Id: <20180427111502.9822-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 11:15:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 11:15:07 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] migration: Textual fixups for blocktime
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2018 11:15:18 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Blank lines and comments as suggested by Eric.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 qapi/migration.json | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index f3974c6807..e7010fc611 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -157,11 +157,13 @@
 #              error strings. (Since 2.7)
 #
 # @postcopy-blocktime: total time when all vCPU were blocked during postcopy
-#           live migration (Since 2.13)
+#           live migration. This is only present when the postcopy-blocktime
+#           migration capability is enabled. (Since 2.13)
 #
-# @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU (Since 2.13)
+# @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
+#           only present when the postcopy-blocktime migration capability
+#           is enabled. (Since 2.13)
 #
-
 #
 # Since: 0.14.0
 ##
@@ -363,7 +365,6 @@
 #
 # @x-multifd: Use more than one fd for migration (since 2.11)
 #
-#
 # @dirty-bitmaps: If enabled, QEMU will migrate named dirty bitmaps.
 #                 (since 2.12)
 #
-- 
2.17.0


