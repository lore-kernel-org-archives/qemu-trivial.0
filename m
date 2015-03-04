Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHb-00020C-PJ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHX-0001sk-HB
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHW-0008OU-JU
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHN-0008M1-Ey; Wed, 04 Mar 2015 16:56:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 69B5940962;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E2ADC980;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17573 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:07:01 +0300
Message-Id: <ff13dacf7559cdd4ddf855f685809ae559073b44.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Subject: [Qemu-trivial] [PULL 44/47] fix GCC 5.0.0 logical-not-parentheses
	warnings
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
X-List-Received-Date: Wed, 04 Mar 2015 21:56:44 -0000

From: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>

man gcc:
  Warn about logical not used on the left hand side operand of a
  comparison.  This option does not warn if the RHS operand is of a
  boolean type.

By preferring bool over int where sensible, but without modifying any
depending code, make GCC happy in cases like this,
  qemu-img.c: In function =E2=80=98compare_sectors=E2=80=99:
  qemu-img.c:992:39: error: logical not is only applied to the left hand
  side of comparison [-Werror=3Dlogical-not-parentheses]
           if (!!memcmp(buf1, buf2, 512) !=3D res) {

hw/ide/core.c:1836 doesn't throw an error,
  assert(!!s->error =3D=3D !!(s->status & ERR_STAT));
even thought the second operand is int (and first hunk of this patch has
a very similar case), maybe GCC developers still have a little faith in
C programmers.

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/virtio-net.c | 4 ++--
 kvm-all.c           | 2 +-
 qemu-img.c          | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 45da34a..9381867 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -120,8 +120,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
         return;
     }
=20
-    if (!!n->vhost_started =3D=3D
-        (virtio_net_started(n, status) && !nc->peer->link_down)) {
+    if ((virtio_net_started(n, status) && !nc->peer->link_down) =3D=3D
+        !!n->vhost_started) {
         return;
     }
     if (!n->vhost_started) {
diff --git a/kvm-all.c b/kvm-all.c
index 05a79c2..07ef62c 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -366,7 +366,7 @@ static void kvm_log_stop(MemoryListener *listener,
     }
 }
=20
-static int kvm_set_migration_log(int enable)
+static int kvm_set_migration_log(bool enable)
 {
     KVMState *s =3D kvm_state;
     KVMSlot *mem;
diff --git a/qemu-img.c b/qemu-img.c
index 6d17755..5af6f45 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -976,7 +976,8 @@ static int is_allocated_sectors_min(const uint8_t *bu=
f, int n, int *pnum,
 static int compare_sectors(const uint8_t *buf1, const uint8_t *buf2, int=
 n,
     int *pnum)
 {
-    int res, i;
+    bool res;
+    int i;
=20
     if (n <=3D 0) {
         *pnum =3D 0;
--=20
2.1.4


