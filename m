Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI5-0005SI-RT
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHy-0005CU-4N
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHs-00050G-4r
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHe-0004vo-Ug; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0C86A44080;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DF0916B2;
	Tue, 24 Jun 2014 20:09:21 +0400 (MSK)
Received: (nullmailer pid 15611 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:07 +0400
Message-Id: <1403626160-15546-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/14] virtio-serial: remove useless
	set_config function
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:48 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Its only contents are a dead memcpy.  Since it is optional,
drop the function altogether.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/virtio-serial-bus.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 2b647b6..a2958ff 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -465,13 +465,6 @@ static void get_config(VirtIODevice *vdev, uint8_t *config_data)
     memcpy(config_data, &vser->config, sizeof(struct virtio_console_config));
 }
 
-static void set_config(VirtIODevice *vdev, const uint8_t *config_data)
-{
-    struct virtio_console_config config;
-
-    memcpy(&config, config_data, sizeof(config));
-}
-
 static void guest_reset(VirtIOSerial *vser)
 {
     VirtIOSerialPort *port;
@@ -1024,7 +1017,6 @@ static void virtio_serial_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_serial_device_unrealize;
     vdc->get_features = get_features;
     vdc->get_config = get_config;
-    vdc->set_config = set_config;
     vdc->set_status = set_status;
     vdc->reset = vser_reset;
 }
-- 
1.7.10.4


