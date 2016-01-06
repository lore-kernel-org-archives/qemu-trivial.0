Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGjKe-00004y-Ez
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jan 2016 03:20:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGjKc-0008Uw-FA
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 03:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGjKb-0002cK-MB
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 03:20:34 -0500
Received: from [59.151.112.132] (port=15371 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aGjKV-0002UM-V4; Wed, 06 Jan 2016 03:20:28 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2276015"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2016 16:20:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4FFE441890F8;
	Wed,  6 Jan 2016 16:19:57 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 6 Jan 2016 16:19:56 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 6 Jan 2016 16:22:55 +0800
Message-ID: <1452068575-21543-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 4FFE441890F8.AB519
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: amit.shah@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH] virtio serial port: fix to incomplete QOMify
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
X-List-Received-Date: Wed, 06 Jan 2016 08:20:35 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/char/virtio-serial-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 497b0af..2d2a659 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -798,7 +798,7 @@ static const TypeInfo virtser_bus_info = {
 
 static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 {
-    VirtIOSerialPort *port = DO_UPCAST(VirtIOSerialPort, dev, qdev);
+    VirtIOSerialPort *port = VIRTIO_SERIAL_PORT(qdev);
 
     monitor_printf(mon, "%*sport %d, guest %s, host %s, throttle %s\n",
                    indent, "", port->id,
-- 
2.1.0




