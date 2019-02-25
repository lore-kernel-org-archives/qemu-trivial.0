Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyEvd-0000GX-76
	for mharc-qemu-trivial@gnu.org; Mon, 25 Feb 2019 07:00:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gyEvY-0000DZ-HS
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 07:00:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gyEvO-0008NM-TY
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 07:00:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gyEv9-00089b-3P; Mon, 25 Feb 2019 06:59:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1DFBC057F4B;
	Mon, 25 Feb 2019 11:59:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-246.ams2.redhat.com [10.36.116.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC2660857;
	Mon, 25 Feb 2019 11:59:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Fam Zheng <fam@euphon.net>
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Date: Mon, 25 Feb 2019 12:59:30 +0100
Message-Id: <1551095970-14645-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 25 Feb 2019 11:59:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block/nvme: Remove QEMU_PACKED from
 naturally aligned NVMeRegs struct
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
X-List-Received-Date: Mon, 25 Feb 2019 12:00:11 -0000

The QEMU_PACKED is causing a compiler warning/error with GCC 9:

  CC      block/nvme.o
block/nvme.c: In function =E2=80=98nvme_create_queue_pair=E2=80=99:
block/nvme.c:209:22: error: taking address of packed member of
 =E2=80=98struct <anonymous>=E2=80=99 may result in an unaligned pointer =
value
 [-Werror=3Daddress-of-packed-member]
  209 |     q->sq.doorbell =3D &s->regs->doorbells[idx * 2 * s->doorbell_=
scale];

All members of the struct are naturally aligned, so there should
not be the need for QEMU_PACKED here, and the following QEMU_BUILD_BUG_ON
also ensures that there is no padding. Thus simply remove the QEMU_PACKED
here.

Buglink: https://bugs.launchpad.net/qemu/+bug/1817525
Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index b5952c9..6c2ce7d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -82,7 +82,7 @@ typedef volatile struct {
     uint8_t  reserved1[0xec0];
     uint8_t  cmd_set_specfic[0x100];
     uint32_t doorbells[];
-} QEMU_PACKED NVMeRegs;
+} NVMeRegs;
=20
 QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) !=3D 0x1000);
=20
--=20
1.8.3.1


