Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rzqy7-0000EN-VH
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2012 09:45:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Rzqxz-0008FI-G7
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 09:45:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Rzqxu-0005lu-UO
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 09:45:19 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Rzqxd-0005co-Mg; Tue, 21 Feb 2012 09:44:57 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RzqxM-0005mN-DM; Tue, 21 Feb 2012 14:44:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 21 Feb 2012 14:44:40 +0000
Message-Id: <1329835480-22192-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Corey Bryant <coreyb@linux.vnet.ibm.com>,
	=?UTF-8?q?=E9=99=B3=E9=9F=8B=E4=BB=BB?= <chenwj@iis.sinica.edu.tw>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] [PATCH] Makefile: Add dependency to fix
	linux-user-only build
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
X-List-Received-Date: Tue, 21 Feb 2012 14:45:25 -0000

Make qemu-bridge-helper explicitly depend on $(GENERATED_HEADERS)
so that it doesn't fail to build when we configured for linux-user
targets only. (Build breakage introduced in commit 7b93fad.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I suspect we could handle generated headers better in our makefile
than having to scatter $(GENERATED_HEADERS) dependencies into almost
everything (eg "%.o: $(GENERATED_HEADERS)" ??) but this is the minimal
fix for the build breakage which we should apply for now I think.

 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index e66e885..c67493e 100644
--- a/Makefile
+++ b/Makefile
@@ -159,6 +159,7 @@ qemu-nbd$(EXESUF): qemu-nbd.o $(tools-obj-y) $(block-obj-y)
 qemu-io$(EXESUF): qemu-io.o cmd.o $(tools-obj-y) $(block-obj-y)
 
 qemu-bridge-helper$(EXESUF): qemu-bridge-helper.o
+qemu-bridge-helper.o: $(GENERATED_HEADERS)
 
 fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/virtio-9p-marshal.o oslib-posix.o $(trace-obj-y)
 fsdev/virtfs-proxy-helper$(EXESUF): LIBS += -lcap
-- 
1.7.1


