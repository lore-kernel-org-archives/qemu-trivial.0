Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqKo-0005Ds-NI
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKi-00050q-42
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-0008R0-7N
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqKd-0008LO-5S; Thu, 11 Feb 2016 07:26:47 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B9F8F4146A;
	Thu, 11 Feb 2016 15:26:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B9848A8A;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: (nullmailer pid 11197 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:19:02 +0300
Message-Id: <91dbeeda2d2cf85e733ddd86aa84de12bdf8cd4a.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Daniel Serpell <daniel.serpell@gmail.com>
Subject: [Qemu-trivial] [PULL 13/14] Adds keycode 86 to the hid_usage_keys
	translation table.
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
X-List-Received-Date: Thu, 11 Feb 2016 12:26:53 -0000

From: Daniel Serpell <daniel.serpell@gmail.com>

This key is present in international keyboards, between left shift and
the 'Z' key, ant is described in the HID usage tables as "Keyboard
Non-US \ and |": http://www.usb.org/developers/hidpage/Hut1_12v2.pdf

This patch fixes the usb-kbd devices.

Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/input/hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index a11e2bc..b41efbb 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -45,7 +45,7 @@ static const uint8_t hid_usage_keys[0x100] = {
     0xe2, 0x2c, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e,
     0x3f, 0x40, 0x41, 0x42, 0x43, 0x53, 0x47, 0x5f,
     0x60, 0x61, 0x56, 0x5c, 0x5d, 0x5e, 0x57, 0x59,
-    0x5a, 0x5b, 0x62, 0x63, 0x00, 0x00, 0x00, 0x44,
+    0x5a, 0x5b, 0x62, 0x63, 0x00, 0x00, 0x64, 0x44,
     0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
     0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
-- 
2.1.4


