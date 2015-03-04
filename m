Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTD4G-0002Du-Uz
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:26:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4B-00022z-LI
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4A-00052H-Kr
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTD44-0004y1-Ah; Wed, 04 Mar 2015 12:26:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 65FC0408AA;
	Wed,  4 Mar 2015 20:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 31015930;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: (nullmailer pid 17503 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:27 +0300
Message-Id: <f00d5ec1dc98f83bedb3677ca268a29cc1b01a63.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PULL 10/47] qerror.h: Swap definitions that were
	not in alphabetical order
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
X-List-Received-Date: Wed, 04 Mar 2015 17:26:40 -0000

From: Alberto Garcia <berto@igalia.com>

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


