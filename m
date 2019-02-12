Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYQm-0002Qr-6d
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 08:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQi-0002Mt-Oy
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQh-0007GL-Hl
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gtYQf-00071l-Ba; Tue, 12 Feb 2019 08:48:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A2DE7F36F;
	Tue, 12 Feb 2019 13:48:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-178.ams2.redhat.com
	[10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D85683BAE;
	Tue, 12 Feb 2019 13:48:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
Date: Tue, 12 Feb 2019 13:47:57 +0000
Message-Id: <20190212134758.10514-4-dgilbert@redhat.com>
In-Reply-To: <20190212134758.10514-1-dgilbert@redhat.com>
References: <20190212134758.10514-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 12 Feb 2019 13:48:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/4] kvm: Add kvm_set_ioeventfd* traces
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
X-List-Received-Date: Tue, 12 Feb 2019 13:48:57 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a couple of traces around the kvm_set_ioeventfd* calls.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 accel/kvm/kvm-all.c    | 3 +++
 accel/kvm/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e1de942ce..fd92b6f375 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -657,6 +657,8 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr=
, uint32_t val,
         .fd =3D fd,
     };
=20
+    trace_kvm_set_ioeventfd_mmio(fd, (uint64_t)addr, val, assign, size,
+                                 datamatch);
     if (!kvm_enabled()) {
         return -ENOSYS;
     }
@@ -688,6 +690,7 @@ static int kvm_set_ioeventfd_pio(int fd, uint16_t add=
r, uint16_t val,
         .fd =3D fd,
     };
     int r;
+    trace_kvm_set_ioeventfd_pio(fd, addr, val, assign, size, datamatch);
     if (!kvm_enabled()) {
         return -ENOSYS;
     }
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 58e98efe5d..8841025d68 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -12,5 +12,7 @@ kvm_irqchip_commit_routes(void) ""
 kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vect=
or %d virq %d"
 kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=3D%d"
 kvm_irqchip_release_virq(int virq) "virq %d"
+kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign,=
 uint32_t size, bool datamatch) "fd: %d @0x%" PRIx64 " val=3D0x%x assign:=
 %d size: %d match: %d"
+kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, =
uint32_t size, bool datamatch) "fd: %d @0x%x val=3D0x%x assign: %d size: =
%d match: %d"
 kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_a=
ddr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d fla=
gs=3D0x%x gpa=3D0x%"PRIx64 " size=3D0x%"PRIx64 " ua=3D0x%"PRIx64 " ret=3D=
%d"
=20
--=20
2.20.1


