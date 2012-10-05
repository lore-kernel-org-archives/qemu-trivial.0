Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TKAqD-0001E5-KE
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 12:33:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TKAqA-00017o-RX
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 12:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TKAq9-00011j-WF
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 12:33:30 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:53678
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TKAq8-00011F-5N; Fri, 05 Oct 2012 12:33:28 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TKAq2-0008GP-Ew; Fri, 05 Oct 2012 17:33:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Oct 2012 17:33:22 +0100
Message-Id: <1349454802-31742-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, Avi Kivity <avi@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Tidy up remnants of non-64-bit
	physaddrs
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
X-List-Received-Date: Fri, 05 Oct 2012 16:33:32 -0000

Tidy up some remnants of code to support non-64-bit physaddrs
which were accidentally omitted from commit 4be403c8.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    2 --
 1 file changed, 2 deletions(-)

diff --git a/configure b/configure
index e58846d..11b0e21 100755
--- a/configure
+++ b/configure
@@ -3732,7 +3732,6 @@ case "$target_arch2" in
   ;;
   x86_64)
     TARGET_BASE_ARCH=i386
-    target_phys_bits=64
     target_long_alignment=8
   ;;
   alpha)
@@ -3835,7 +3834,6 @@ case "$target_arch2" in
     target_long_alignment=8
   ;;
   unicore32)
-    target_phys_bits=32
   ;;
   xtensa|xtensaeb)
     TARGET_ARCH=xtensa
-- 
1.7.9.5


