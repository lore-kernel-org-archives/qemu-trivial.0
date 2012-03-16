Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8TFz-0007lR-Ft
	for mharc-qemu-trivial@gnu.org; Fri, 16 Mar 2012 05:15:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S8TFw-0007jW-FH
	for qemu-trivial@nongnu.org; Fri, 16 Mar 2012 05:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S8TFr-0007Tp-M7
	for qemu-trivial@nongnu.org; Fri, 16 Mar 2012 05:15:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1S8TFr-0007T4-EZ; Fri, 16 Mar 2012 05:15:23 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2G9FJRU014919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 16 Mar 2012 05:15:20 -0400
Received: from amd-6168-8-1.englab.nay.redhat.com
	(amd-6168-8-1.englab.nay.redhat.com [10.66.104.52])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2G9FHNF015213; Fri, 16 Mar 2012 05:15:18 -0400
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Mar 2012 17:10:44 +0800
Message-ID: <20120316091044.6166.86916.stgit@amd-6168-8-1.englab.nay.redhat.com>
User-Agent: StGit/0.16-1-g60c4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q2G9FJRU014919
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [RESEND PATCH] ioapic: fix build with DEBUG_IOAPIC
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
X-List-Received-Date: Fri, 16 Mar 2012 09:15:29 -0000

ioapic.c:198: error: format =E2=80=98%08x=E2=80=99 expects type =E2=80=98=
unsigned int=E2=80=99, but argument 3 has type =E2=80=98uint64_t=E2=80=99

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/ioapic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/ioapic.c b/hw/ioapic.c
index 3fee011..1ff31a1 100644
--- a/hw/ioapic.c
+++ b/hw/ioapic.c
@@ -195,7 +195,7 @@ ioapic_mem_write(void *opaque, target_phys_addr_t add=
r, uint64_t val,
         if (size !=3D 4) {
             break;
         }
-        DPRINTF("write: %08x =3D %08x\n", s->ioregsel, val);
+        DPRINTF("write: %08x =3D %" PRIx64 "\n", s->ioregsel, val);
         switch (s->ioregsel) {
         case IOAPIC_REG_ID:
             s->id =3D (val >> IOAPIC_ID_SHIFT) & IOAPIC_ID_MASK;


