Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmcIX-00046i-MC
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 01:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WmcIR-0003xq-UY
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 01:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WmcIN-0007le-0X
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 01:09:03 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:51205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WmcI8-0007kB-NX; Tue, 20 May 2014 01:08:44 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 3AAE817FCC1; Tue, 20 May 2014 07:08:37 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 20 May 2014 07:08:34 +0200
Message-Id: <1400562514-22903-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Kevin Wolf <kwolf@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Peter Lieven <pl@kamp.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: Fix compiler warning (unused local
	function)
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
X-List-Received-Date: Tue, 20 May 2014 05:09:09 -0000

Warning from gcc:

block/iscsi.c:384:13: error:
 =E2=80=98iscsi_allocationmap_is_allocated=E2=80=99 defined but not used =
[-Werror=3Dunused-function]

The function is only used if LIBISCSI_FEATURE_IOVECTOR is defined.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/iscsi.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index d649424..edb8e1e 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -381,6 +381,7 @@ retry:
 }
=20
=20
+#if defined(LIBISCSI_FEATURE_IOVECTOR)
 static bool iscsi_allocationmap_is_allocated(IscsiLun *iscsilun,
                                              int64_t sector_num, int nb_=
sectors)
 {
@@ -392,6 +393,7 @@ static bool iscsi_allocationmap_is_allocated(IscsiLun=
 *iscsilun,
     return !(find_next_bit(iscsilun->allocationmap, size,
                            sector_num / iscsilun->cluster_sectors) =3D=3D=
 size);
 }
+#endif /* LIBISCSI_FEATURE_IOVECTOR */
=20
=20
 #if defined(LIBISCSI_FEATURE_IOVECTOR)
--=20
1.7.10.4


