Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SmMQ0-0003Lo-3p
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jul 2012 06:02:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SmMPo-0002y9-Mj
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 06:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SmMPk-00049v-1r
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 06:02:32 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54237 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <hare@suse.de>)
	id 1SmMPX-00048f-Rt; Wed, 04 Jul 2012 06:02:15 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id A938FA538E;
	Wed,  4 Jul 2012 12:02:13 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: qemu-trivial@nongnu.org
Date: Wed,  4 Jul 2012 12:02:07 +0200
Message-Id: <1341396127-31269-1-git-send-email-hare@suse.de>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Blue Swirl <blauwirbel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Subject: [Qemu-trivial] [PATCH] megasas: mark mfi_frame_desc as 'static'
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
X-List-Received-Date: Wed, 04 Jul 2012 10:02:42 -0000

Suggested by blue swirl. Patch is on top of Paolo's
scsi-next tree.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Blue Swirl <blauwirbel@gmail.com>
---
 hw/megasas.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/megasas.c b/hw/megasas.c
index b48836f..b99fa97 100644
--- a/hw/megasas.c
+++ b/hw/megasas.c
@@ -45,7 +45,7 @@
 #define MEGASAS_FLAG_USE_QUEUE64   2
 #define MEGASAS_MASK_USE_QUEUE64   (1 << MEGASAS_FLAG_USE_QUEUE64)
 
-const char *mfi_frame_desc[] = {
+static const char *mfi_frame_desc[] = {
     "MFI init", "LD Read", "LD Write", "LD SCSI", "PD SCSI",
     "MFI Doorbell", "MFI Abort", "MFI SMP", "MFI Stop"};
 
-- 
1.7.3.4


