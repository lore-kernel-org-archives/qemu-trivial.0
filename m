Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOnB9-0002Kx-F2
	for mharc-qemu-trivial@gnu.org; Fri, 20 Feb 2015 07:59:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YOnB7-0002Ha-MA
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 07:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YOnB4-0002sS-E8
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 07:59:33 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:54781 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YOnB4-0002p8-7Z
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 07:59:30 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkMKAHku51RbdWOb/2dsb2JhbABbgwaBLLATBQEBAQEBAQUBdpdLgRlDAQEBAQEBfIUPgR00iDMB1DiGBIl5HYQUBZVAg0+KSzSILCKBRT0cgVI8MYJDAQEB
X-IPAS-Result: AkMKAHku51RbdWOb/2dsb2JhbABbgwaBLLATBQEBAQEBAQUBdpdLgRlDAQEBAQEBfIUPgR00iDMB1DiGBIl5HYQUBZVAg0+KSzSILCKBRT0cgVI8MYJDAQEB
X-IronPort-AV: E=Sophos;i="5.09,614,1418079600"; d="scan'208";a="328925804"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Feb 2015 13:58:44 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1YOnAK-0003To-CQ; Fri, 20 Feb 2015 13:58:44 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13] helo=perseus.local)
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1YOnAI-0006ml-67; Fri, 20 Feb 2015 13:58:42 +0100
Received: from berto by perseus.local with local (Exim 4.84)
	(envelope-from <berto@igalia.com>)
	id 1YOnAG-0004ZP-Ne; Fri, 20 Feb 2015 14:58:40 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-trivial@nongnu.org
Date: Fri, 20 Feb 2015 14:58:23 +0200
Message-Id: <1424437103-17523-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: Alberto Garcia <berto@igalia.com>, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] qerror.h: Swap definitions that were not in
	alphabetical order
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
X-List-Received-Date: Fri, 20 Feb 2015 12:59:34 -0000

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 include/qapi/qmp/qerror.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 986260f..57a62d4 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -37,12 +37,12 @@ void qerror_report_err(Error *err);
 #define QERR_BASE_NOT_FOUND \
     ERROR_CLASS_GENERIC_ERROR, "Base '%s' not found"
 
-#define QERR_BLOCK_JOB_NOT_READY \
-    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
-
 #define QERR_BLOCK_FORMAT_FEATURE_NOT_SUPPORTED \
     ERROR_CLASS_GENERIC_ERROR, "Block format '%s' used by device '%s' does not support feature '%s'"
 
+#define QERR_BLOCK_JOB_NOT_READY \
+    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
+
 #define QERR_BUS_NO_HOTPLUG \
     ERROR_CLASS_GENERIC_ERROR, "Bus '%s' does not support hotplugging"
 
-- 
2.1.4


