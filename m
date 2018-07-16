Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ff9FQ-0007dl-NM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 15:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ff9FO-0007cS-8Y
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 15:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ff9FN-00010r-GD
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 15:33:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ff9FI-0000wY-KQ; Mon, 16 Jul 2018 15:33:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id C235C7456BA;
	Mon, 16 Jul 2018 21:33:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id A5BA17456B9; Mon, 16 Jul 2018 21:33:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Mon, 16 Jul 2018 21:12:08 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180716193312.A5BA17456B9@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH] Document command line options with single
 dash
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
X-List-Received-Date: Mon, 16 Jul 2018 19:33:27 -0000

QEMU options have a single dash (but also work as double dash for
convenience and compatibility). Most options are listed with single
dash in command line help but some were listed with two dashes.
Normalize these to have the same format as the others.

Left --preconfig as that is mentioned as double dash everywhere so I
assume that is the preferred form for that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 qemu-options.hx | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 371c427..b1bf0f4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -471,7 +471,7 @@ STEXI
 @item -balloon virtio[,addr=@var{addr}]
 @findex -balloon
 Enable virtio balloon device, optionally with PCI address @var{addr}. This
-option is deprecated, use @option{--device virtio-balloon} instead.
+option is deprecated, use @option{-device virtio-balloon} instead.
 ETEXI
 
 DEF("device", HAS_ARG, QEMU_OPTION_device,
@@ -2005,7 +2005,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
 DEF("nic", HAS_ARG, QEMU_OPTION_nic,
-    "--nic [tap|bridge|"
+    "-nic [tap|bridge|"
 #ifdef CONFIG_SLIRP
     "user|"
 #endif
@@ -2024,7 +2024,7 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
     "                macaddr) and connect it to the given host network backend\n"
-    "--nic none      use it alone to have zero network devices (the default is to\n"
+    "-nic none       use it alone to have zero network devices (the default is to\n"
     "                provided a 'user' network connection)\n",
     QEMU_ARCH_ALL)
 DEF("net", HAS_ARG, QEMU_OPTION_net,
@@ -3339,7 +3339,7 @@ mlocking qemu and guest memory can be enabled via @option{mlock=on}
 ETEXI
 
 DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
-    "--overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
+    "-overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
     "                run qemu with overcommit hints\n"
     "                mem-lock=on|off controls memory lock support (default: off)\n"
     "                cpu-pm=on|off controls cpu power management (default: off)\n",
-- 
2.7.6


