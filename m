Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQilz-0005N0-8W
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 18:55:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQilt-0005Ga-NI
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQils-0005zj-Hn
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQilm-0005pW-TQ; Sun, 17 Dec 2017 18:54:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 57E3941181;
	Mon, 18 Dec 2017 02:54:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7B336D35;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30922 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Tao Wu <lepton@google.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:24 +0300
Message-Id: <84df8224309e84ca418e2bc583d2425e7d31b2e5.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/61] hw/input/hid: Add support for several
 keys.
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
X-List-Received-Date: Sun, 17 Dec 2017 23:55:06 -0000

From: Tao Wu <lepton@google.com>

Add support for these keys: audiomute volumedown volumeup power.
Tested with "sendkey" command in monitor and verify the behavior
in guest OS.

Signed-off-by: Tao Wu <lepton@google.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/input/hid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 0d049ff61c..aa4fb826fd 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -57,14 +57,14 @@ static const uint8_t hid_usage_keys[0x100] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x58, 0xe4, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
+    0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00,
+    0x80, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
     0xe6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x48, 0x4a,
     0x52, 0x4b, 0x00, 0x50, 0x00, 0x4f, 0x00, 0x4d,
     0x51, 0x4e, 0x49, 0x4c, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x66, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-- 
2.11.0


