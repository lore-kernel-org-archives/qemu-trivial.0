Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxob-0001ne-M6
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoW-0001hm-93
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoV-0005kU-JD
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005iS-7s; Tue, 24 Jan 2017 04:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 138CE42107;
	Tue, 24 Jan 2017 12:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BF2B5571;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12669 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:34 +0300
Message-Id: <b3cc4b39748a42e7bb541f6c596884d2b7c7b017.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 30/31] usb: Set category and description of
 the MTP device
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
X-List-Received-Date: Tue, 24 Jan 2017 09:55:00 -0000

From: Thomas Huth <thuth@redhat.com>

It's a storage device, so let's classify it accordingly. And
while we're at it, also add a short description for people who
do not know what MTP means.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/dev-mtp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 809dcf5..94c2e94 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1580,6 +1580,8 @@ static void usb_mtp_class_initfn(ObjectClass *klass, void *data)
     uc->handle_reset   = usb_mtp_handle_reset;
     uc->handle_control = usb_mtp_handle_control;
     uc->handle_data    = usb_mtp_handle_data;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->desc = "USB Media Transfer Protocol device";
     dc->fw_name = "mtp";
     dc->vmsd = &vmstate_usb_mtp;
     dc->props = mtp_properties;
-- 
2.1.4


