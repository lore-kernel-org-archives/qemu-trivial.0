Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwN-0005iS-GX
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwF-0005QV-Ud
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwE-0002c3-3Q
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002a4-Vx; Thu, 30 Apr 2015 02:27:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E813F42BA6;
	Thu, 30 Apr 2015 09:27:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 44B5A963;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4372 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:52 +0300
Message-Id: <7f64038067792a534d01c9690bb214a2727ca180.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 39/42] vhost-user: remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:13 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost-user.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index aefe0bb..e7ab829 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -128,7 +128,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vho=
stUserMsg *msg)
=20
     r =3D qemu_chr_fe_read_all(chr, p, size);
     if (r !=3D size) {
-        error_report("Failed to read msg header. Read %d instead of %d.\=
n", r,
+        error_report("Failed to read msg header. Read %d instead of %d."=
, r,
                 size);
         goto fail;
     }
@@ -136,7 +136,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vho=
stUserMsg *msg)
     /* validate received flags */
     if (msg->flags !=3D (VHOST_USER_REPLY_MASK | VHOST_USER_VERSION)) {
         error_report("Failed to read msg header."
-                " Flags 0x%x instead of 0x%x.\n", msg->flags,
+                " Flags 0x%x instead of 0x%x.", msg->flags,
                 VHOST_USER_REPLY_MASK | VHOST_USER_VERSION);
         goto fail;
     }
@@ -144,7 +144,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vho=
stUserMsg *msg)
     /* validate message size is sane */
     if (msg->size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
-                " Size %d exceeds the maximum %zu.\n", msg->size,
+                " Size %d exceeds the maximum %zu.", msg->size,
                 VHOST_USER_PAYLOAD_SIZE);
         goto fail;
     }
@@ -155,7 +155,7 @@ static int vhost_user_read(struct vhost_dev *dev, Vho=
stUserMsg *msg)
         r =3D qemu_chr_fe_read_all(chr, p, size);
         if (r !=3D size) {
             error_report("Failed to read msg payload."
-                         " Read %d instead of %d.\n", r, msg->size);
+                         " Read %d instead of %d.", r, msg->size);
             goto fail;
         }
     }
@@ -235,8 +235,8 @@ static int vhost_user_call(struct vhost_dev *dev, uns=
igned long int request,
         msg.memory.nregions =3D fd_num;
=20
         if (!fd_num) {
-            error_report("Failed initializing vhost-user memory map\n"
-                    "consider using -object memory-backend-file share=3D=
on\n");
+            error_report("Failed initializing vhost-user memory map, "
+                    "consider using -object memory-backend-file share=3D=
on");
             return -1;
         }
=20
@@ -280,7 +280,7 @@ static int vhost_user_call(struct vhost_dev *dev, uns=
igned long int request,
         }
         break;
     default:
-        error_report("vhost-user trying to send unhandled ioctl\n");
+        error_report("vhost-user trying to send unhandled ioctl");
         return -1;
         break;
     }
@@ -296,27 +296,27 @@ static int vhost_user_call(struct vhost_dev *dev, u=
nsigned long int request,
=20
         if (msg_request !=3D msg.request) {
             error_report("Received unexpected msg type."
-                    " Expected %d received %d\n", msg_request, msg.reque=
st);
+                    " Expected %d received %d", msg_request, msg.request=
);
             return -1;
         }
=20
         switch (msg_request) {
         case VHOST_USER_GET_FEATURES:
             if (msg.size !=3D sizeof(m.u64)) {
-                error_report("Received bad msg size.\n");
+                error_report("Received bad msg size.");
                 return -1;
             }
             *((__u64 *) arg) =3D msg.u64;
             break;
         case VHOST_USER_GET_VRING_BASE:
             if (msg.size !=3D sizeof(m.state)) {
-                error_report("Received bad msg size.\n");
+                error_report("Received bad msg size.");
                 return -1;
             }
             memcpy(arg, &msg.state, sizeof(struct vhost_vring_state));
             break;
         default:
-            error_report("Received unexpected msg type.\n");
+            error_report("Received unexpected msg type.");
             return -1;
             break;
         }
--=20
2.1.4


