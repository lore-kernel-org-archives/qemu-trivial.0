Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwC5W-00012d-NJ
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 09:02:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SwC5O-0000db-Jl
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 09:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SwC5G-0004H5-It
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 09:02:06 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:56084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SwC4y-0003wA-UH; Tue, 31 Jul 2012 09:01:41 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SwC4t-00021c-J7; Tue, 31 Jul 2012 14:01:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jul 2012 14:01:35 +0100
Message-Id: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Jan Kiszka <jan.kiszka@siemens.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Makefile: Avoid explicit list of directories
	in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 13:02:12 -0000

Avoid having an explicit list of directories in the 'clean'
target by using 'find' to remove all .o and .d files instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I figured that (unlike Makefile.target) we should probably take
the xargs route here since otherwise the rm command line is huge...

There's also an argument that there's not much point having a clean
target in Makefile.target when this one blows away most of it anyway.

 Makefile |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 621cb86..9f7eaa8 100644
--- a/Makefile
+++ b/Makefile
@@ -212,13 +212,10 @@ clean:
 # avoid old build problems by removing potentially incorrect old files
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
 	rm -f qemu-options.def
-	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
+	find . -name '*.[od]' | xargs rm -f
+	rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
 	rm -Rf .libs
-	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
-	rm -f qom/*.o qom/*.d
-	rm -f usb/*.o usb/*.d hw/*.o hw/*.d
 	rm -f qemu-img-cmds.h
-	rm -f trace/*.o trace/*.d
 	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
 	@# May not be present in GENERATED_HEADERS
 	rm -f trace-dtrace.h trace-dtrace.h-timestamp
-- 
1.7.9.5


