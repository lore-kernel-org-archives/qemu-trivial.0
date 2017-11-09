Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCoC7-0005Rm-KK
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 09:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eCkQs-0008H0-3b
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 05:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <googuy@gmail.com>) id 1eCkQr-0005ap-CE
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 05:51:38 -0500
Received: from teknoservice.es ([213.4.81.82]:54251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <googuy@gmail.com>)
	id 1eCkQk-0005XG-EV; Thu, 09 Nov 2017 05:51:30 -0500
Received: from localhost.localdomain ([10.7.7.88]) by teknoservice.es with
	Microsoft SMTPSVC(6.0.3790.211); Thu, 9 Nov 2017 11:51:28 +0100
From: Vicente Jimenez Aguilar <googuy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Vicente Jimenez Aguilar <googuy@gmail.com>
Date: Thu,  9 Nov 2017 11:50:23 +0100
Message-Id: <20171109105024.14991-1-googuy@gmail.com>
X-Mailer: git-send-email 2.14.1
X-OriginalArrivalTime: 09 Nov 2017 10:51:28.0842 (UTC)
	FILETIME=[B256B2A0:01D35948]
X-detected-operating-system: by eggs.gnu.org: Windows XP [fuzzy]
X-Received-From: 213.4.81.82
X-Mailman-Approved-At: Thu, 09 Nov 2017 09:52:36 -0500
Subject: [Qemu-trivial] [PATCH 1/2] Add mon pretty parameter to help
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
X-List-Received-Date: Thu, 09 Nov 2017 10:51:39 -0000

Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3728e9b4dd..2692a48f63 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3477,7 +3477,7 @@ Like -qmp but uses pretty JSON formatting.
 ETEXI
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon [chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)
+    "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 STEXI
 @item -mon [chardev=]name[,mode=readline|control]
 @findex -mon
-- 
2.14.1


