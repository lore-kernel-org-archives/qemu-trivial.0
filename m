Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Ain-0000Wj-TQ
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 11:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aij-0000Oj-8y
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aii-0004oS-E2
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0Aia-0004hF-TB; Wed, 03 Jun 2015 11:36:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E5D46407DA;
	Wed,  3 Jun 2015 18:36:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 81462A58;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27466 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:46 +0300
Message-Id: <1597051b84b816c9608e1ee0947f8e6dc9876b56.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 26/30] Add -incoming help text
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
X-List-Received-Date: Wed, 03 Jun 2015 15:36:46 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The help/man text for

-incoming defer

didn't make it through the merge of the code that implemented it.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7edd1f1..b3db6cb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3239,7 +3239,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "-incoming fd:fd\n" \
     "-incoming exec:cmdline\n" \
     "                accept incoming migration on given file descriptor\n" \
-    "                or from given external command\n",
+    "                or from given external command\n" \
+    "-incoming defer\n" \
+    "                wait for the URI to be specified via migrate_incoming\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
@@ -3255,6 +3257,11 @@ Accept incoming migration from a given filedescriptor.
 
 @item -incoming exec:@var{cmdline}
 Accept incoming migration as an output from specified external command.
+
+@item -incoming defer
+Wait for the URI to be specified via migrate_incoming.  The monitor can
+be used to change settings (such as migration parameters) prior to issuing
+the migrate_incoming to allow the migration to begin.
 ETEXI
 
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
-- 
2.1.4


