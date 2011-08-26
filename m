Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qx1kn-0000lY-Md
	for mharc-qemu-trivial@gnu.org; Fri, 26 Aug 2011 15:07:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Qx1kk-0000l4-Vk
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Qx1kj-0004TY-Qe
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:07:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Qx1kj-0004TJ-Cu; Fri, 26 Aug 2011 15:07:41 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7QJ7eT3028346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 26 Aug 2011 15:07:40 -0400
Received: from bow.redhat.com (reserved-203-244.tlv.redhat.com [10.35.203.244]
	(may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7QJ7dAU016050; Fri, 26 Aug 2011 15:07:39 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 26 Aug 2011 22:06:01 +0300
Message-Id: <1314385561-22519-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/pci-stub: fix comment typo
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
X-List-Received-Date: Fri, 26 Aug 2011 19:07:43 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 hw/pci-stub.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pci-stub.c b/hw/pci-stub.c
index c5a0aa8..8454c30 100644
--- a/hw/pci-stub.c
+++ b/hw/pci-stub.c
@@ -1,5 +1,5 @@
 /*
- * PCI stubs for plathome that doesn't support pci bus.
+ * PCI stubs for platforms that doesn't support pci bus.
  *
  * Copyright (c) 2010 Isaku Yamahata <yamahata at valinux co jp>
  *                    VA Linux Systems Japan K.K.
-- 
1.7.6


