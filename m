Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyPOz-0001Pp-E3
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 14:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YyPOy-0001Nl-3V
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 14:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YyPOx-0006En-97
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 14:53:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YyPOq-0006Db-2Z; Fri, 29 May 2015 14:52:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9D220BBB36;
	Fri, 29 May 2015 18:52:54 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-116-107.ams2.redhat.com
	[10.36.116.107])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4TIqqML021960; Fri, 29 May 2015 14:52:53 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 May 2015 19:52:52 +0100
Message-Id: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, quintela@redhat.com--dry-run
Subject: [Qemu-trivial] [PATCH 1/1] Add -incoming help text
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
X-List-Received-Date: Fri, 29 May 2015 18:53:05 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The help/man text for

-incoming defer

didn't make it through the merge of the code that implemented it.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 qemu-options.hx | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dad49cf..3085412 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3238,7 +3238,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
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
@@ -3254,6 +3256,8 @@ Accept incoming migration from a given filedescriptor.
 
 @item -incoming exec:@var{cmdline}
 Accept incoming migration as an output from specified external command.
+@item -incoming defer
+Wait for the URI to be specified via migrate_incoming.
 ETEXI
 
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
-- 
2.4.1


