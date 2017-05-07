Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7Go8-0001TF-GU
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:40:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-0001QJ-4c
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go2-00073w-HS
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7Gny-00071d-5R; Sun, 07 May 2017 03:40:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7478140480;
	Sun,  7 May 2017 10:40:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CAFF443D;
	Sun,  7 May 2017 10:02:32 +0300 (MSK)
Received: (nullmailer pid 26573 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:20 +0300
Message-Id: <f07f38c6c149a7d63855666d2d265eb54e19e7c1.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/23] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
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
X-List-Received-Date: Sun, 07 May 2017 07:40:40 -0000

From: Kamil Rytarowski <n54@gmx.com>

Appease pkgsrc and use portable shell variable comparison.
This switches "==" to "=". It should not be a functional change.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/qemu-binfmt-conf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 0f1aa63872..8afc3eb5bb 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -284,12 +284,12 @@ while true ; do
         shift
         # check given cpu is in the supported CPU list
         for cpu in ${qemu_target_list} ; do
-            if [ "$cpu" == "$1" ] ; then
+            if [ "$cpu" = "$1" ] ; then
                 break
             fi
         done
 
-        if [ "$cpu" == "$1" ] ; then
+        if [ "$cpu" = "$1" ] ; then
             qemu_target_list="$1"
         else
             echo "ERROR: unknown CPU \"$1\"" 1>&2
-- 
2.11.0


