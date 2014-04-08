Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQEw-0002DN-MT
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:14:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEq-00021w-LS
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEm-0004Qi-9E
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQEW-0004Mh-OQ; Tue, 08 Apr 2014 03:14:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 05BAF40E35;
	Tue,  8 Apr 2014 11:14:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0D4F76B3;
	Tue,  8 Apr 2014 11:04:14 +0400 (MSK)
Received: (nullmailer pid 10583 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:09 +0400
Message-Id: <1396940651-10513-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/11] configure: Remove redundant message for
	-Werror
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
X-List-Received-Date: Tue, 08 Apr 2014 07:14:37 -0000

From: Stefan Weil <sw@weilnetz.de>

The compiler flag -Werror is printed (or not printed) as any other
compiler flag which is part of QEMU_CFLAGS.

Therefore an extra output line for -Werror is redundant and can be removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 31fd3ad..1e73117 100755
--- a/configure
+++ b/configure
@@ -4092,7 +4092,6 @@ echo "sparse enabled    $sparse"
 echo "strip binaries    $strip_opt"
 echo "profiler          $profiler"
 echo "static build      $static"
-echo "-Werror enabled   $werror"
 if test "$darwin" = "yes" ; then
     echo "Cocoa support     $cocoa"
 fi
-- 
1.7.10.4


