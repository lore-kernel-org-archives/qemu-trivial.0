Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Wl-0000vB-EX
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30We-0000ob-Uo
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Wd-0005iu-Rx
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:24:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30WT-0005gf-4Q; Wed, 18 May 2016 08:24:21 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E09E417A7;
	Wed, 18 May 2016 15:24:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1D340ADD;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12398 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:04 +0300
Message-Id: <3f3b5388d400a4e26718328809e6546b21fb4588.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/13] configure: Use uniform description for
 devel packages
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
X-List-Received-Date: Wed, 18 May 2016 12:24:37 -0000

From: Stefan Weil <sw@weilnetz.de>

As all other devel packages are written in the form "name devel",
use this form for libcap devel and libattr devel, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index bbf9005..293639c 100755
--- a/configure
+++ b/configure
@@ -4611,7 +4611,7 @@ if test "$softmmu" = yes ; then
       tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" = yes; then
-        error_exit "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
+        error_exit "VirtFS is supported only on Linux and requires libcap devel and libattr devel"
       fi
       virtfs=no
     fi
-- 
2.1.4


