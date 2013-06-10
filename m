Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um8zz-0003r3-9V
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 16:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um8zx-0003os-CG
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um8zw-0007Z0-Ae
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:47:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um8zu-0007YW-7F; Mon, 10 Jun 2013 16:47:26 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AED334114D;
	Tue, 11 Jun 2013 00:47:24 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 2C46C4F5; Tue, 11 Jun 2013 00:47:23 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Jun 2013 00:47:20 +0400
Message-Id: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>
Subject: [Qemu-trivial] [PATCH trivial] configure: explicitly disable virtfs
	if softmmu=no
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
X-List-Received-Date: Mon, 10 Jun 2013 20:47:30 -0000

Or else

 ./configure --disable-system --enable-virtfs

(which makes no sense by its own but does not error out)
will fail to build, because it will define CONFIG_VIRTFS,
and the makefile will try to build virtfs-proxy-helper
manpage (but not the executable).

Cc: qemu-trivial@nongnu.org
Cc: M. Mohan Kumar <mohan@in.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index a3f0b7a..0ff0380 100755
--- a/configure
+++ b/configure
@@ -3423,6 +3423,8 @@ if test "$softmmu" = yes ; then
       tools="qemu-ga\$(EXESUF) $tools"
     fi
   fi
+else
+  virtfs=no
 fi
 
 # Mac OS X ships with a broken assembler
-- 
1.7.10.4


