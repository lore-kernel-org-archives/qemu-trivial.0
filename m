Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9rYA-0003d2-KB
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2015 05:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z9rY8-0003Zn-9p
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 05:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z9rY7-00071o-CH
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 05:09:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Z9rY1-0006yY-8y; Tue, 30 Jun 2015 05:09:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 6C78819F229;
	Tue, 30 Jun 2015 09:09:44 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5U99h2k014832; Tue, 30 Jun 2015 05:09:43 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id D2810807CB; Tue, 30 Jun 2015 11:09:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jun 2015 11:09:34 +0200
Message-Id: <1435655374-20741-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] move QemuOpts from qemu/option.h to
	qemu/typedefs.h
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
X-List-Received-Date: Tue, 30 Jun 2015 09:09:53 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/option.h   | 2 +-
 include/qemu/typedefs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 57e51c9..28195ba 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -28,6 +28,7 @@
 
 #include <stdint.h>
 #include "qemu/queue.h"
+#include "qemu/typedefs.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 
@@ -45,7 +46,6 @@ bool has_help_option(const char *param);
 bool is_valid_option_list(const char *param);
 
 typedef struct QemuOpt QemuOpt;
-typedef struct QemuOpts QemuOpts;
 typedef struct QemuOptsList QemuOptsList;
 
 enum QemuOptType {
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6fdcbcd..690ff69 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -66,6 +66,7 @@ typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
 typedef struct QEMUFile QEMUFile;
 typedef struct QEMUMachine QEMUMachine;
+typedef struct QemuOpts QemuOpts;
 typedef struct QEMUSGList QEMUSGList;
 typedef struct QEMUSizedBuffer QEMUSizedBuffer;
 typedef struct QEMUTimerListGroup QEMUTimerListGroup;
-- 
1.8.3.1


