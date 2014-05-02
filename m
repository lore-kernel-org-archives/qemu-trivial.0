Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgBqO-0005nx-CO
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 07:41:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgBqI-0005eT-Fu
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 07:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgBqD-0003l4-Hz
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 07:41:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgBq3-0003ic-Dl; Fri, 02 May 2014 07:41:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B1AF6401A2;
	Fri,  2 May 2014 15:41:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9D7C95FE;
	Fri,  2 May 2014 15:41:10 +0400 (MSK)
Received: (nullmailer pid 23434 invoked by uid 1000);
	Fri, 02 May 2014 11:41:10 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  2 May 2014 15:41:09 +0400
Message-Id: <1399030869-23399-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: remove bashism
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
X-List-Received-Date: Fri, 02 May 2014 11:41:31 -0000

Commit e26110cfc67d48 added a check for shacmd to create a hash
for modules.  This check in configure is using bash construct &>
to redirect both stdout and stderr, whcih does fun things on some
shells.  Get rid of it, use standard redirection instead.

Cc: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2fbec59..7442790 100755
--- a/configure
+++ b/configure
@@ -2627,7 +2627,7 @@ done
 if test "$modules" = yes; then
     shacmd_probe="sha1sum sha1 shasum"
     for c in $shacmd_probe; do
-        if which $c &>/dev/null; then
+        if which $c >/dev/null 2>&1; then
             shacmd="$c"
             break
         fi
-- 
1.7.10.4


