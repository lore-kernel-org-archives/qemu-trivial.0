Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VW4MM-0004l0-8M
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2013 09:08:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VW4ME-0004aL-4b
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 09:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VW4M8-0006tL-4h
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 09:08:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1VW4Lu-0006rR-Iq; Tue, 15 Oct 2013 09:07:58 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9FD7vxu024583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Oct 2013 09:07:57 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-6-138.ams2.redhat.com
	[10.36.6.138])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9FD7umO001605; Tue, 15 Oct 2013 09:07:56 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 15 Oct 2013 15:10:35 +0200
Message-Id: <1381842635-21699-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] move test-* from .gitignore to
	tests/.gitignore
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
X-List-Received-Date: Tue, 15 Oct 2013 13:08:24 -0000

Also sort the test-* entries in the latter.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 .gitignore       |  9 ---------
 tests/.gitignore | 11 +++++++++--
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8e1b73f..7f4c106 100644
--- a/.gitignore
+++ b/.gitignore
@@ -45,15 +45,6 @@ qemu-bridge-helper
 qemu-monitor.texi
 vscclient
 QMP/qmp-commands.txt
-test-bitops
-test-coroutine
-test-int128
-test-opts-visitor
-test-qmp-input-visitor
-test-qmp-output-visitor
-test-string-input-visitor
-test-string-output-visitor
-test-visitor-serialization
 fsdev/virtfs-proxy-helper
 fsdev/virtfs-proxy-helper.1
 fsdev/virtfs-proxy-helper.pod
diff --git a/tests/.gitignore b/tests/.gitignore
index 425757c..dbed60f 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -6,20 +6,27 @@ check-qlist
 check-qstring
 test-aio
 test-bitops
-test-throttle
+test-coroutine
 test-cutils
 test-hbitmap
 test-int128
 test-iov
 test-mul64
+test-opts-visitor
 test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
-test-qmp-commands.h
 test-qmp-commands
+test-qmp-commands.h
 test-qmp-input-strict
+test-qmp-input-visitor
 test-qmp-marshal.c
+test-qmp-output-visitor
+test-string-input-visitor
+test-string-output-visitor
 test-thread-pool
+test-throttle
+test-visitor-serialization
 test-x86-cpuid
 test-xbzrle
 *-test
-- 
1.8.3.1


