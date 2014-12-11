Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8tg-0006mk-9c
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:55:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8ta-0006fy-Nq
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tW-000206-8n
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8tM-0001y0-Rp; Thu, 11 Dec 2014 13:55:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2A38441D52;
	Thu, 11 Dec 2014 21:55:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 41CD18DD;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22979 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:00 +0300
Message-Id: <8ccefb91bf0b4be7a7434c55dae77ed3acb39f68.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 12/20] configure: Replace which(1) with "has"
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:31 -0000

From: Fam Zheng <famz@redhat.com>

Using "has" is more slick because which(1) is not always there.

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Amos Kong <akong@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 47048f0..cae588c 100755
--- a/configure
+++ b/configure
@@ -2727,7 +2727,7 @@ fi
 if test "$modules" = yes; then
     shacmd_probe="sha1sum sha1 shasum"
     for c in $shacmd_probe; do
-        if which $c >/dev/null 2>&1; then
+        if has $c; then
             shacmd="$c"
             break
         fi
-- 
2.1.3


