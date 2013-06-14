Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRax-00054p-RN
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:51:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRar-0004uT-Ld
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRap-0004JL-4z
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:50:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRaj-0004GD-Pn; Fri, 14 Jun 2013 06:50:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B17241661;
	Fri, 14 Jun 2013 14:50:49 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 0DCF71A3; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:18 +0400
Message-Id: <1371207042-17980-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/26] gitignore: unignore *.patch
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
X-List-Received-Date: Fri, 14 Jun 2013 10:51:01 -0000

This partially reverts:

 commit 082369e62c5bbaba89f173c2b803bc24115bb111
 Author: liguang <lig.fnst@cn.fujitsu.com>
 Date:   Fri Mar 22 16:44:13 2013 +0800

    gitignore: ignore more files

I'm not sure how this went in.  The thing is that
ignoring *.patch, in my opinion, is just wrong.
Especially for downstreams who apply patches for
real.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 64e9466..0fe114d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -82,7 +82,6 @@ fsdev/virtfs-proxy-helper.pod
 *.swp
 *.orig
 .pc
-*.patch
 *.gcda
 *.gcno
 patches
-- 
1.7.10.4


