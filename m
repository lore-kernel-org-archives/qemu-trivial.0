Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Snw-0003QS-8M
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 21:10:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S5Sno-0003HV-US
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 21:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S5Snh-0003xJ-Ps
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 21:10:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1S5Snh-0003ve-IM; Wed, 07 Mar 2012 21:09:53 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2829pIa019575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 7 Mar 2012 21:09:51 -0500
Received: from amd-6168-8-1.englab.nay.redhat.com
	(amd-6168-8-1.englab.nay.redhat.com [10.66.104.52])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2829nKH014105; Wed, 7 Mar 2012 21:09:50 -0500
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 08 Mar 2012 10:05:22 +0800
Message-ID: <20120308020522.24053.8087.stgit@amd-6168-8-1.englab.nay.redhat.com>
User-Agent: StGit/0.16-1-g60c4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q2829pIa019575
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ioapic: fix build with DEBUG_IOAPIC
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
X-List-Received-Date: Thu, 08 Mar 2012 02:10:06 -0000

ioapic.c:198: error: format =E2=80=98%08x=E2=80=99 expects type =E2=80=98=
unsigned int=E2=80=99, but argument 3 has type =E2=80=98uint64_t=E2=80=99

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/ioapic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/ioapic.c b/hw/ioapic.c
index 3fee011..2b0e6e9 100644
--- a/hw/ioapic.c
+++ b/hw/ioapic.c
@@ -195,7 +195,7 @@ ioapic_mem_write(void *opaque, target_phys_addr_t add=
r, uint64_t val,
         if (size !=3D 4) {
             break;
         }
-        DPRINTF("write: %08x =3D %08x\n", s->ioregsel, val);
+        DPRINTF("write: %08x =3D %lx\n", s->ioregsel, val);
         switch (s->ioregsel) {
         case IOAPIC_REG_ID:
             s->id =3D (val >> IOAPIC_ID_SHIFT) & IOAPIC_ID_MASK;


