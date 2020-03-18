Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEZ4M-0005zZ-Cx
	for mharc-qemu-trivial@gnu.org; Wed, 18 Mar 2020 09:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1jEZ4J-0005yt-9H
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 09:49:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1jEZ4I-0002We-7u
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 09:49:11 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:25916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1jEZ4I-0002U7-3n
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 09:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584539349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tDXB/8+Q9VTzUqH6QIri9JT1cxyBCk802SIj4HcYUp4=;
 b=B1j/XfjSPG+kXgzuggLNFXiujPjCLVvnBr6fBMv9llmEkNquJfGOXgI5hNAZfKuL0bVFlb
 fJP7rJYU+HIQSJkNDqEnOHHKS/0nkWcXJDFesVtiLytm58QcPx0mq7BjbaswnIjDthAryS
 xQjvjYPfVbDbZNDQtGJjPIehqy32x+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-cPIBvck8NrWIG10ooCm2yg-1; Wed, 18 Mar 2020 09:49:06 -0400
X-MC-Unique: cPIBvck8NrWIG10ooCm2yg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4099C18B5FA0;
 Wed, 18 Mar 2020 13:49:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-41.sin2.redhat.com
 [10.67.116.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F40D60BEC;
 Wed, 18 Mar 2020 13:48:57 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] hw/rdma/vmw/pvrdma_dev_ring: Replace strncpy with pstrcpy
Date: Wed, 18 Mar 2020 14:48:49 +0100
Message-Id: <20200318134849.237011-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Mar 2020 13:49:12 -0000

ring->name is defined as 'char name[MAX_RING_NAME_SZ]'. Replace untruncated
strncpy with QEMU function.
This case prevented QEMU from compiling with --enable-sanitizers.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/rdma/vmw/pvrdma_dev_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
index d7bc7f5ccc..c2b3dd70a9 100644
--- a/hw/rdma/vmw/pvrdma_dev_ring.c
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
 #include "cpu.h"
+#include "qemu/cutils.h"
=20
 #include "trace.h"
=20
@@ -30,8 +31,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, =
PCIDevice *dev,
     int i;
     int rc =3D 0;
=20
-    strncpy(ring->name, name, MAX_RING_NAME_SZ);
-    ring->name[MAX_RING_NAME_SZ - 1] =3D 0;
+    pstrcpy(ring->name, MAX_RING_NAME_SZ, name);
     ring->dev =3D dev;
     ring->ring_state =3D ring_state;
     ring->max_elems =3D max_elems;
--=20
2.24.1


