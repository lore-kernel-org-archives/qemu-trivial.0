Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEWKL-0005pM-Cp
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 03:12:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eEWKB-0005l8-UC
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 03:12:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eEWKB-0001eO-14
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 03:12:03 -0500
Received: from teknoservice.es ([213.4.81.82]:26839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>)
	id 1eEWK5-0001Ya-N0; Tue, 14 Nov 2017 03:11:57 -0500
Received: from localhost.localdomain ([10.7.7.88]) by teknoservice.es with
	Microsoft SMTPSVC(6.0.3790.211); Tue, 14 Nov 2017 09:11:49 +0100
From: Vicente Jimenez Aguilar <googuy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Vicente Jimenez Aguilar <googuy@gmail.com>
Date: Tue, 14 Nov 2017 09:11:27 +0100
Message-Id: <20171114081127.12664-1-googuy@gmail.com>
X-Mailer: git-send-email 2.14.1
X-OriginalArrivalTime: 14 Nov 2017 08:11:49.0967 (UTC)
	FILETIME=[38F31DF0:01D35D20]
X-detected-operating-system: by eggs.gnu.org: Windows XP [fuzzy]
X-Received-From: 213.4.81.82
Subject: [Qemu-trivial] [PATCH v2] Document pretty parameter for mon option
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
X-List-Received-Date: Tue, 14 Nov 2017 08:12:11 -0000

Documentation: document pretty parameter for mon option
that turns on JSON pretty printing

Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
---
 qemu-options.hx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3728e9b4dd..a62c260d5f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3477,11 +3477,12 @@ Like -qmp but uses pretty JSON formatting.
 ETEXI
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon [chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)
+    "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 STEXI
-@item -mon [chardev=]name[,mode=readline|control]
+@item -mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]
 @findex -mon
-Setup monitor on chardev @var{name}.
+Setup monitor on chardev @var{name}. @code{pretty} turns on JSON pretty printing
+easing human reading and debugging.
 ETEXI
 
 DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \
-- 
2.14.1


