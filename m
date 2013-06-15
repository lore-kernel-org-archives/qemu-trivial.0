Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Unn7e-00050f-7m
	for mharc-qemu-trivial@gnu.org; Sat, 15 Jun 2013 05:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Unn7c-0004xh-JU
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 05:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Unn7b-000699-CP
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 05:50:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Unn7Z-0005qj-3q; Sat, 15 Jun 2013 05:50:09 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D93824175A;
	Sat, 15 Jun 2013 13:49:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id BFE5451B; Sat, 15 Jun 2013 13:49:58 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2013 13:49:51 +0400
Message-Id: <1371289791-27686-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH trivial] qemu-options: trivial fix for -mon
	args help
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
X-List-Received-Date: Sat, 15 Jun 2013 09:50:13 -0000

It is the (implied sub)option name which is optional, not
the value of that (sub)option, make it so in the help output.
(Introduced by commit 22a0e04b9bb)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bf94862..4e2dbd4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2540,9 +2540,9 @@ Like -monitor but opens in 'control' mode.
 ETEXI
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon chardev=[name][,mode=readline|control][,default]\n", QEMU_ARCH_ALL)
+    "-mon [chardev=]name[,mode=readline|control][,default]\n", QEMU_ARCH_ALL)
 STEXI
-@item -mon chardev=[name][,mode=readline|control][,default]
+@item -mon [chardev=]name[,mode=readline|control][,default]
 @findex -mon
 Setup monitor on chardev @var{name}.
 ETEXI
-- 
1.7.10.4


