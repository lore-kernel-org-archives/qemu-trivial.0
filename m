Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1bn6-000226-7I
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 07:29:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T1bn4-0001uV-2s
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 07:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T1bn3-0006Hp-6Z
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 07:29:34 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:33038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T1bmz-0006GV-HI; Wed, 15 Aug 2012 07:29:29 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T1bmu-0000eh-V4; Wed, 15 Aug 2012 12:29:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 15 Aug 2012 12:29:24 +0100
Message-Id: <1345030164-2496-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2] Makefile: Avoid explicit list of
	directories in clean target
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
X-List-Received-Date: Wed, 15 Aug 2012 11:29:34 -0000

Avoid having an explicit list of directories in the 'clean'
target by using 'find' to remove all .o and .d files instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: use portable 'find -exec' rather than unsafe 'find | xargs'
or unportable 'find -print0 | xargs -0'.

 Makefile |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index d736ea5..2964d5c 100644
--- a/Makefile
+++ b/Makefile
@@ -214,13 +214,10 @@ clean:
 # avoid old build problems by removing potentially incorrect old files
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
 	rm -f qemu-options.def
-	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
+	find . -name '*.[od]' -exec rm -f {} +
+	rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
 	rm -Rf .libs
-	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
-	rm -f qom/*.o qom/*.d libuser/qom/*.o libuser/qom/*.d
-	rm -f hw/usb/*.o hw/usb/*.d hw/*.o hw/*.d
 	rm -f qemu-img-cmds.h
-	rm -f trace/*.o trace/*.d
 	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
 	@# May not be present in GENERATED_HEADERS
 	rm -f trace-dtrace.h trace-dtrace.h-timestamp
-- 
1.7.9.5


