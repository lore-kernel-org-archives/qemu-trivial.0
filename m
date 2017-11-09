Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCoC7-0005Rx-R3
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 09:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eClo7-00010v-3U
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 07:19:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eClo6-0005vG-91
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 07:19:43 -0500
Received: from teknoservice.es ([213.4.81.82]:58618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>)
	id 1eClny-0005qF-2X; Thu, 09 Nov 2017 07:19:34 -0500
Received: from localhost.localdomain ([10.7.7.88]) by teknoservice.es with
	Microsoft SMTPSVC(6.0.3790.211); Thu, 9 Nov 2017 13:19:26 +0100
From: Vicente Jimenez Aguilar <googuy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Vicente Jimenez Aguilar <googuy@gmail.com>
Date: Thu,  9 Nov 2017 13:19:03 +0100
Message-Id: <20171109121903.24510-1-googuy@gmail.com>
X-Mailer: git-send-email 2.14.1
X-OriginalArrivalTime: 09 Nov 2017 12:19:26.0326 (UTC)
	FILETIME=[FBF6D960:01D35954]
X-detected-operating-system: by eggs.gnu.org: Windows XP [fuzzy]
X-Received-From: 213.4.81.82
X-Mailman-Approved-At: Thu, 09 Nov 2017 09:52:37 -0500
Subject: [Qemu-trivial] [PATCH] Add missing parameters to mon option
 documentation
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
X-List-Received-Date: Thu, 09 Nov 2017 12:19:43 -0000

Documentation missed 'mon' option's 'pretty' and 'default' parameters

Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3728e9b4dd..72cf48a8e5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3477,9 +3477,9 @@ Like -qmp but uses pretty JSON formatting.
 ETEXI
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon [chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)
+    "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]][,default[=on|off]]\n", QEMU_ARCH_ALL)
 STEXI
-@item -mon [chardev=]name[,mode=readline|control]
+@item -mon [chardev=]name[,mode=readline|control][,pretty[=on|off]][,default[=on|off]]
 @findex -mon
 Setup monitor on chardev @var{name}.
 ETEXI
-- 
2.14.1


