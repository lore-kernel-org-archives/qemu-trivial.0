Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwzOP-0001og-4X
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 16:26:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1ZwzON-0001n1-Nt
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 16:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1ZwzOM-0000p0-UT
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 16:26:51 -0500
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11]:4839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1ZwzOG-0000nX-Ng; Thu, 12 Nov 2015 16:26:44 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CEDA14B0072;
	Thu, 12 Nov 2015 22:26:43 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2015 22:26:33 +0100
Message-Id: <1447363593-20637-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::11
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] scsi: remove scsi_req_free prototype
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
X-List-Received-Date: Thu, 12 Nov 2015 21:26:52 -0000

Function has been deleted in ad2d30f79d3b0812f02c741be2189796b788d6d7.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 include/hw/scsi/scsi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index cdaf0f8..1915a73 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -250,7 +250,6 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops,=
 SCSIDevice *d,
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
                           uint8_t *buf, void *hba_private);
 int32_t scsi_req_enqueue(SCSIRequest *req);
-void scsi_req_free(SCSIRequest *req);
 SCSIRequest *scsi_req_ref(SCSIRequest *req);
 void scsi_req_unref(SCSIRequest *req);
=20
--=20
2.1.4


