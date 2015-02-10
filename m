Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6h4-0002Mg-QT
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:01:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6gy-0002Bg-Fv
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6gx-00023f-ND
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL6gq-0001zv-Mk; Tue, 10 Feb 2015 04:01:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 88CA941891;
	Tue, 10 Feb 2015 12:01:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CEC3E953;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9359 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:02 +0300
Message-Id: <dbfe1b6aef1751bced58cbd4a7a3868721ace2ba.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 13/46] qemu-log: Correct help text of 'log
	cpu_reset'
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
X-List-Received-Date: Tue, 10 Feb 2015 09:01:16 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

The logging of the CPU state during reset is done for all architectures
nowadays (see cpu_common_reset() in qom/cpu.c), so the "x86 only" text
does not apply here anymore.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-log.c b/qemu-log.c
index 05b5493..13f3813 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -111,7 +111,7 @@ const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_PCALL, "pcall",
       "x86 only: show protected mode far calls/returns/exceptions" },
     { CPU_LOG_RESET, "cpu_reset",
-      "x86 only: show CPU state before CPU resets" },
+      "show CPU state before CPU resets" },
     { CPU_LOG_IOPORT, "ioport",
       "show all i/o ports accesses" },
     { LOG_UNIMP, "unimp",
-- 
2.1.4


