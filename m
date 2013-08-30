Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFVYc-00030U-9l
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 16:44:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFVYS-0002yq-5d
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 16:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFVYJ-00082x-8x
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 16:44:28 -0400
Received: from qmta14.emeryville.ca.mail.comcast.net ([76.96.27.212]:48633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFVYJ-00082m-0d
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 16:44:19 -0400
Received: from omta05.emeryville.ca.mail.comcast.net ([76.96.30.43])
	by qmta14.emeryville.ca.mail.comcast.net with comcast
	id K8cA1m0040vp7WLAE8kHEg; Fri, 30 Aug 2013 20:44:17 +0000
Received: from red.redhat.com ([24.10.250.254])
	by omta05.emeryville.ca.mail.comcast.net with comcast
	id K8kB1m0185W4ddU8R8kGkR; Fri, 30 Aug 2013 20:44:17 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 30 Aug 2013 14:44:11 -0600
Message-Id: <1377895451-6603-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.3.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1377895457;
	bh=unPSDlkgwhYI7ZPtySpcUT+iKzgnNcPC3XeF9zbCRpo=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=q6AuklhbiwLyMADEfaz/G5jFHrxfTE3FXEasHe6UxPIsPvOskHh86ryRpgr5Pp/tQ
	Wb0/SWSflHUhm5jxkJ7Y4HaeugEu6WPY0Yxxtg1A4NQHYBZprXV8N5Hk4OZpYVp/O6
	J9NvPvRO/er5Dw04aqto6KHwrXeVV3e12OX1lrQUK+uPgdlvq78xj/OpOuQJe0VZ2d
	hgq4zy/ZJLo4fy24/yAJfcbDfNWAGQ8uNemidstSxJ+fvDTMDw7K0uWBiYD+QgZ+0s
	e5ofW46LPtFUp9K5CGMSO9oifwSg6UxQgtTAEV7HlC+WSV3YeKx0YSfWWL4091rEN7
	ztcfiqWHaqvSg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 76.96.27.212
Cc: benoit@irqsave.net, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCHv2] qmp: fix integer usage in examples
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
X-List-Received-Date: Fri, 30 Aug 2013 20:44:36 -0000

Per the qapi schema, block_set_io_throttle takes most arguments
as ints, not strings.

* qmp-commands.hx (block_set_io_throttle): Use correct type.  Fix
whitespace and a copy-paste bug in the process.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: also touch up the doc comments

 qmp-commands.hx | 26 +++++++++++++-------------
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
1.8.3.1


