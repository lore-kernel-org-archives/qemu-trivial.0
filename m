Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SmMYG-00067d-Qo
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jul 2012 06:11:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SmMQ8-0003Lt-5B
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 06:02:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hare@suse.de>) id 1SmMPz-0004C4-UQ
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 06:02:51 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54288 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <hare@suse.de>)
	id 1SmMPm-0004A0-Ma; Wed, 04 Jul 2012 06:02:30 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 53ED6A538E;
	Wed,  4 Jul 2012 12:02:29 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: qemu-trivial@nongnu.org
Date: Wed,  4 Jul 2012 12:02:25 +0200
Message-Id: <1341396145-31338-1-git-send-email-hare@suse.de>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: mark megasas as maintained
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
X-List-Received-Date: Wed, 04 Jul 2012 10:11:15 -0000

Add maintainers entry for megasas.
Patch is on top of Paolo's scsi-next tree.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a514fd..e67c84f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -449,6 +449,12 @@ M: Paul Brook <paul@codesourcery.com>
 S: Odd Fixes
 F: hw/lsi53c895a.c
 
+MEGASAS
+M: Hannes Reinecke <hare@suse.de>
+S: Maintained
+F: hw/megasas.c
+F: hw/mfi.h
+
 USB
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
-- 
1.7.3.4


