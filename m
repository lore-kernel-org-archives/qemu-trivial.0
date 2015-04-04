Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIED-0006M0-0E
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE7-0006EH-3r
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE3-0006Tq-Ex
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIDu-0006Q4-Nc; Sat, 04 Apr 2015 03:10:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96861405F5;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 84B86926;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20948 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:25 +0300
Message-Id: <085feb61dbc6130bfd2e6c3f59d03220ff9e1bb3.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 4/5] gitignore: Ignore more .pod files.
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
X-List-Received-Date: Sat, 04 Apr 2015 07:10:47 -0000

From: Eric Blake <eblake@redhat.com>

kvm_stat.{1,pod} started showing up as untracked files in my
directory, and I nearly accidentally merged them into a commit
with my usual habit of 'git add .'.  Rather than spelling out
each such file, just ignore the entire pattern.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/.gitignore b/.gitignore
index e32a584..aed0e1f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,14 +37,8 @@
 /qemu-tech.html
 /qemu-doc.info
 /qemu-tech.info
-/qemu.1
-/qemu.pod
-/qemu-img.1
-/qemu-img.pod
 /qemu-img
 /qemu-nbd
-/qemu-nbd.8
-/qemu-nbd.pod
 /qemu-options.def
 /qemu-options.texi
 /qemu-img-cmds.texi
@@ -56,8 +50,7 @@
 /qmp-commands.txt
 /vscclient
 /fsdev/virtfs-proxy-helper
-/fsdev/virtfs-proxy-helper.1
-/fsdev/virtfs-proxy-helper.pod
+*.[1-9]
 *.a
 *.aux
 *.cp
@@ -70,6 +63,7 @@
 *.ky
 *.log
 *.pdf
+*.pod
 *.cps
 *.fns
 *.kys
-- 
2.1.4


