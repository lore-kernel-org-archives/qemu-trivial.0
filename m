Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sgzqb-0006AU-MN
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jun 2012 10:56:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SgzqU-0005mO-38
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2012 10:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SgzqN-0007Da-Tn
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2012 10:55:53 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:44850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SgzqK-0007Cx-OC; Tue, 19 Jun 2012 10:55:44 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SgzqE-0003y0-Ex; Tue, 19 Jun 2012 15:55:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2012 15:55:38 +0100
Message-Id: <1340117738-15225-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Makefile.hw: avoid overly large 'make clean'
	rm command
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
X-List-Received-Date: Tue, 19 Jun 2012 14:56:00 -0000

Avoid 'make clean' producing an 'rm' command which has a lot
of duplicate 'hw//*.o' arguments, by using $(sort $(dir ..))
rather than $(dir $(sort ..)) so Make's sort function will
remove the duplicates for us. We can also remove the double
'//' safely because $(dir ..) is guaranteed to return a string
ending in '/'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Mostly cosmetic, although I guess there's a faint chance that expanding
all those hw/*.o would hit the command line argument buffer limit...

 Makefile.hw |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.hw b/Makefile.hw
index 2bcbaff..28fe100 100644
--- a/Makefile.hw
+++ b/Makefile.hw
@@ -19,8 +19,8 @@ all: $(hw-obj-y)
 	@true
 
 clean:
-	rm -f $(addsuffix /*.o, $(dir $(sort $(hw-obj-y))))
-	rm -f $(addsuffix /*.d, $(dir $(sort $(hw-obj-y))))
+	rm -f $(addsuffix *.o, $(sort $(dir $(hw-obj-y))))
+	rm -f $(addsuffix *.d, $(sort $(dir $(hw-obj-y))))
 
 # Include automatically generated dependency files
 -include $(patsubst %.o, %.d, $(hw-obj-y))
-- 
1.7.1


