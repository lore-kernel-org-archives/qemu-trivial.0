Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqU-0000Q6-Rt
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqO-00009g-E7
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqN-0006DV-Kc
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqH-0006Bh-QR; Thu, 30 Apr 2015 01:16:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6C5242B84;
	Thu, 30 Apr 2015 08:16:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D72F9969;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4333 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:33 +0300
Message-Id: <38f225b0d7992b9c2eb0902ca02673b034a19ef6.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 20/42] configure: alphabetize tricore in
	target list
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:05 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

tricore was out of alphabetical order in the target list. Fix.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6969f6f..9f0d9bb 100755
--- a/configure
+++ b/configure
@@ -5169,8 +5169,6 @@ case "$target_name" in
     TARGET_BASE_ARCH=mips
     echo "TARGET_ABI_MIPSN64=y" >> $config_target_mak
   ;;
-  tricore)
-  ;;
   moxie)
   ;;
   or32)
@@ -5221,6 +5219,8 @@ case "$target_name" in
   s390x)
     gdb_xml_files="s390x-core64.xml s390-acr.xml s390-fpr.xml"
   ;;
+  tricore)
+  ;;
   unicore32)
   ;;
   xtensa|xtensaeb)
-- 
2.1.4


