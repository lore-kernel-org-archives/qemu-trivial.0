Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QORD6-00043t-II
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2011 05:14:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QORD4-000420-Vb
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 05:13:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QORD4-0002k1-5l
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 05:13:58 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:58163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QORD2-0002j2-2B; Mon, 23 May 2011 05:13:56 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QORCt-0007oE-9T; Mon, 23 May 2011 10:13:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 23 May 2011 10:13:47 +0100
Message-Id: <1306142027-29995-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Document --disable-slirp option
	in --help
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
X-List-Received-Date: Mon, 23 May 2011 09:13:59 -0000

The --disable-slirp option was undocumented; add it to configure's
--help output.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index d7dba5d..1f95ed7 100755
--- a/configure
+++ b/configure
@@ -964,6 +964,7 @@ echo "  --disable-check-utests   disable check unit-tests"
 echo "  --enable-check-utests    enable check unit-tests"
 echo "  --disable-bluez          disable bluez stack connectivity"
 echo "  --enable-bluez           enable bluez stack connectivity"
+echo "  --disable-slirp          disable SLIRP userspace network connectivity"
 echo "  --disable-kvm            disable KVM acceleration support"
 echo "  --enable-kvm             enable KVM acceleration support"
 echo "  --disable-nptl           disable usermode NPTL support"
-- 
1.7.1


