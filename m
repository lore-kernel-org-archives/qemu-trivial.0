Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHA8K-000431-W2
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jan 2015 06:53:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1YHA8I-000425-FT
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 06:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1YHA8E-0004kI-F3
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 06:53:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1YHA8E-0004kC-6w; Fri, 30 Jan 2015 06:53:02 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0UBr1tu007012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 30 Jan 2015 06:53:01 -0500
Received: from mustang.home.annexia.org (vpn1-5-134.ams2.redhat.com
	[10.36.5.134])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0UBqxRa009018; Fri, 30 Jan 2015 06:53:00 -0500
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Fri, 30 Jan 2015 11:52:57 +0000
Message-Id: <1422618777-8832-1-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t0UBr1tu007012
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: lersek@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH] Fix comparisons between implicit booleans
	and integers.
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
X-List-Received-Date: Fri, 30 Jan 2015 11:53:07 -0000

In GCC 5 there is a new warning (-Wlogical-not-parentheses) which
prevents you from writing:

  if (<some implicitly boolean expression> =3D=3D <an int>) ...

A typical error would be:

kvm-all.c: In function =E2=80=98kvm_set_migration_log=E2=80=99:
kvm-all.c:383:54: error: logical not is only applied to the left hand sid=
e of comparison [-Werror=3Dlogical-not-parentheses]
         if (!!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) =3D=3D enable) {

Fix a few places where the build is now broken in GCC 5.

The warning isn't even consistent, as with the place in
hw/net/virtio-net.c where I had to cast an obviously boolean
expression to bool.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 kvm-all.c           | 2 +-
 qemu-img.c          | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 45da34a..ba6afb8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -121,7 +121,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
     }
=20
     if (!!n->vhost_started =3D=3D
-        (virtio_net_started(n, status) && !nc->peer->link_down)) {
+        (bool) (virtio_net_started(n, status) && !nc->peer->link_down)) =
{
         return;
     }
     if (!n->vhost_started) {
diff --git a/kvm-all.c b/kvm-all.c
index 2f21a4e..b6d4387 100644
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
index 4e9a7f5..acf70fa 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -977,7 +977,8 @@ static int is_allocated_sectors_min(const uint8_t *bu=
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
2.2.2


