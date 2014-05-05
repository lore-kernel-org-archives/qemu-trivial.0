Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDm-0004Bi-P8
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDf-0003xg-EP
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDa-000197-Gh
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDM-00015j-F5; Mon, 05 May 2014 14:02:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4917740750;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 308E4661;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24212 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:43 +0400
Message-Id: <1399312923-24129-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/22] configure: remove bashism
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
X-List-Received-Date: Mon, 05 May 2014 18:02:33 -0000

Commit e26110cfc67d48 added a check for shacmd to create a hash
for modules.  This check in configure is using bash construct &>
to redirect both stdout and stderr, which does fun things on some
shells.  Get rid of it, use standard redirection instead.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Fam Zheng <famz@redhat.com>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 870c939..6484808 100755
--- a/configure
+++ b/configure
@@ -2628,7 +2628,7 @@ done
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


