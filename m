Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwFbI-0002sT-1j
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-0002q4-Nn
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-00085F-0T
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwFb9-00081e-S0; Sun, 24 Sep 2017 18:42:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 42CD041C95;
	Mon, 25 Sep 2017 01:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8CBFCC45;
	Mon, 25 Sep 2017 00:22:57 +0300 (MSK)
Received: (nullmailer pid 28300 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:48 +0300
Message-Id: <2f14ad6a961a96640da9f87cc299dda17427ec14.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 30/31] Drop gld linker usage on SunOS
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
X-List-Received-Date: Sun, 24 Sep 2017 22:42:10 -0000

From: Kamil Rytarowski <n54@gmx.com>

This is required to be removed on SmartOS (Illumos).
As of now there are no alternative supported SunOS distributions.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 1f7b4f03ce..7727f6ba5b 100755
--- a/configure
+++ b/configure
@@ -746,7 +746,6 @@ SunOS)
   solaris="yes"
   make="${MAKE-gmake}"
   install="${INSTALL-ginstall}"
-  ld="gld"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
   if test -f /usr/include/sys/soundcard.h ; then
     audio_drv_list="oss"
-- 
2.11.0


