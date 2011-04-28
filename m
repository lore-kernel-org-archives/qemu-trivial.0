Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1l-0001QJ-8N
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Z-00014H-F6
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1X-0006ia-7o
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:01 -0400
Received: from moutng.kundenserver.de ([212.227.17.8]:59436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eY-M8; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0Lb8B7-1PUtnh3FMn-00l87H; Thu, 28 Apr 2011 17:20:45 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1H-0002BD-TQ; Thu, 28 Apr 2011 17:20:43 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:25 +0200
Message-Id: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:BpCmiHCsgkSNnL/uvvVLfp2t2yziMXhDBLsMofRXxkz
	1PqrDRncKKmg/XPONdsVw4GNB5oH+XtZi0J94k6ymDul0bDVe4
	MSvurvg/p+dTH1BWV1yDR6IzTtksVHHjOAG68NAIEF2lOefroP
	UOaTDBjOGp+pgyo10TByfGZby2LL8AO+HaK6bnGTRWUMPB0PkL
	UaVgJPe0cGR0KSRLDgzGs1vGfD4jYMoPgRC/+Cdh3ZQKpVr/Op nrVb9Vyrjo4DV
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.8
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 01/18] Fix typos in comments (dependancy ->
	dependency)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:06 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 Changelog     |    2 +-
 Makefile.objs |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Changelog b/Changelog
index 152feaa..1c41e14 100644
--- a/Changelog
+++ b/Changelog
@@ -525,7 +525,7 @@ version 0.1.5:
 
  - ppc64 support + personality() patch (Rusty Russell)
  - first Alpha CPU patches (Falk Hueffner)
- - removed bfd.h dependancy
+ - removed bfd.h dependency
  - fixed shrd, shld, idivl and divl on PowerPC.
  - fixed buggy glibc PowerPC rint() function (test-i386 passes now on PowerPC).
 
diff --git a/Makefile.objs b/Makefile.objs
index 0cbff4d..e387ab9 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -335,7 +335,7 @@ trace-dtrace.h: trace-dtrace.dtrace
 	$(call quiet-command,dtrace -o $@ -h -s $<, "  GEN   trace-dtrace.h")
 
 # Normal practice is to name DTrace probe file with a '.d' extension
-# but that gets picked up by QEMU's Makefile as an external dependancy
+# but that gets picked up by QEMU's Makefile as an external dependency
 # rule file. So we use '.dtrace' instead
 trace-dtrace.dtrace: trace-dtrace.dtrace-timestamp
 trace-dtrace.dtrace-timestamp: $(SRC_PATH)/trace-events config-host.mak
-- 
1.7.2.5


