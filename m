Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOMjH-0003Y5-Ue
	for mharc-qemu-trivial@gnu.org; Thu, 19 Feb 2015 03:45:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1YOMjG-0003VY-1E
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 03:45:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1YOMjF-0000db-7i
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 03:45:01 -0500
Received: from david.siemens.de ([192.35.17.14]:51322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1YOMjA-0000cy-QO; Thu, 19 Feb 2015 03:44:57 -0500
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.14.3/8.14.3) with ESMTP id t1J8irVA012401;
	Thu, 19 Feb 2015 09:44:53 +0100
Received: from md1f2u6c.ww002.siemens.net ([139.22.135.164])
	by mail3.siemens.de (8.14.3/8.14.3) with SMTP id t1J8iqZM016105;
	Thu, 19 Feb 2015 09:44:53 +0100
Message-ID: <54E5A284.9060907@siemens.com>
Date: Thu, 19 Feb 2015 09:44:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.14
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] qmp: Provide qmp_query_vnc_servers stub for
	VNC-free build
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
X-List-Received-Date: Thu, 19 Feb 2015 08:45:02 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 qmp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qmp.c b/qmp.c
index 7f2d25a..ec070da 100644
--- a/qmp.c
+++ b/qmp.c
@@ -134,6 +134,12 @@ VncInfo *qmp_query_vnc(Error **errp)
     error_set(errp, QERR_FEATURE_DISABLED, "vnc");
     return NULL;
 };
+
+VncInfo2List *qmp_query_vnc_servers(Error **errp)
+{
+    error_set(errp, QERR_FEATURE_DISABLED, "vnc");
+    return NULL;
+};
 #endif
 
 #ifndef CONFIG_SPICE
-- 
2.1.4

