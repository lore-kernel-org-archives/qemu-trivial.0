Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8OhS-0006sp-GR
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2020 08:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from <n@nirf.de>)
 id 1j8NLs-00051l-I5
 for qemu-trivial@nongnu.org; Sun, 01 Mar 2020 07:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <n@nirf.de>) id 1j8NLr-0003fM-Nh
 for qemu-trivial@nongnu.org; Sun, 01 Mar 2020 07:05:44 -0500
Received: from photon.nirf.de ([147.135.208.3]:44708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <n@nirf.de>)
 id 1j8NLp-0003e2-LK; Sun, 01 Mar 2020 07:05:41 -0500
Received: from [10.68.247.14] (pc-68-247.ram.rwth-aachen.de [137.226.68.247])
 by photon.nirf.de (Postfix) with ESMTPSA id 8AF7E4342F;
 Sun,  1 Mar 2020 13:05:32 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
From: Nick Erdmann <n@nirf.de>
Subject: [PATCH] vhost-vsock: fix error message output
Message-ID: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
Date: Sun, 1 Mar 2020 13:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 147.135.208.3
X-Mailman-Approved-At: Sun, 01 Mar 2020 08:32:05 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2020 12:05:48 -0000

error_setg_errno takes a positive error number, so we should not invert
errno's sign.

Signed-off-by: Nick Erdmann <n@nirf.de>
---
  hw/virtio/vhost-vsock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 66da96583b..9f9093e196 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -325,7 +325,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
      } else {
          vhostfd = open("/dev/vhost-vsock", O_RDWR);
          if (vhostfd < 0) {
-            error_setg_errno(errp, -errno,
+            error_setg_errno(errp, errno,
                               "vhost-vsock: failed to open vhost device");
              return;
          }
--
2.25.1

