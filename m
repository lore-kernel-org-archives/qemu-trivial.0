Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2r-0001Aa-Fe
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2k-0000vV-6V
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2f-00008R-Nj
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-0008Vf-1h; Mon, 02 Sep 2013 07:11:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32E3A40241;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3DB33216;
	Mon,  2 Sep 2013 15:01:58 +0400 (MSK)
Received: (nullmailer pid 14652 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:33 +0400
Message-Id: <1378119695-14568-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 13/15] qmp: fix integer usage in examples
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:43 -0000

From: Eric Blake <eblake@redhat.com>

Per the qapi schema, block_set_io_throttle takes most arguments
as ints, not strings.

* qmp-commands.hx (block_set_io_throttle): Use correct type.  Fix
whitespace and a copy-paste bug in the process.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Benoit Canet <benoit@irqsave.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index bb09e72..8a8f342 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -1402,22 +1402,22 @@ Change I/O throttle limits for a block drive.
 Arguments:
 
 - "device": device name (json-string)
-- "bps":  total throughput limit in bytes per second(json-int)
-- "bps_rd":  read throughput limit in bytes per second(json-int)
-- "bps_wr":  read throughput limit in bytes per second(json-int)
-- "iops":  total I/O operations per second(json-int)
-- "iops_rd":  read I/O operations per second(json-int)
-- "iops_wr":  write I/O operations per second(json-int)
+- "bps": total throughput limit in bytes per second (json-int)
+- "bps_rd": read throughput limit in bytes per second (json-int)
+- "bps_wr": write throughput limit in bytes per second (json-int)
+- "iops": total I/O operations per second (json-int)
+- "iops_rd": read I/O operations per second (json-int)
+- "iops_wr": write I/O operations per second (json-int)
 
 Example:
 
 -> { "execute": "block_set_io_throttle", "arguments": { "device": "virtio0",
-                                               "bps": "1000000",
-                                               "bps_rd": "0",
-                                               "bps_wr": "0",
-                                               "iops": "0",
-                                               "iops_rd": "0",
-                                               "iops_wr": "0" } }
+                                               "bps": 1000000,
+                                               "bps_rd": 0,
+                                               "bps_wr": 0,
+                                               "iops": 0,
+                                               "iops_rd": 0,
+                                               "iops_wr": 0 } }
 <- { "return": {} }
 
 EQMP
@@ -1791,7 +1791,7 @@ Each json-object contain the following:
                  - "vm-state-size": size of the VM state in bytes (json-int)
                  - "date-sec": UTC date of the snapshot in seconds (json-int)
                  - "date-nsec": fractional part in nanoseconds to be used with
-                                date-sec(json-int)
+                                date-sec (json-int)
                  - "vm-clock-sec": VM clock relative to boot in seconds
                                    (json-int)
                  - "vm-clock-nsec": fractional part in nanoseconds to be used
-- 
1.7.10.4


