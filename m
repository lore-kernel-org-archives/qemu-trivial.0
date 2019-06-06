Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqFh-0000jB-TJ
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:08:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFd-0000d0-Dv
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFc-00042o-G8
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:09 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40507)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqFV-0003o2-B3; Thu, 06 Jun 2019 07:08:01 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MVMJ7-1hAGYT2wEh-00SNSl; Thu, 06 Jun 2019 13:06:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, Kamal Heib <kheib@redhat.com>
Date: Thu,  6 Jun 2019 13:06:10 +0200
Message-Id: <20190606110625.32127-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p5QiGkDHYjVQOWvNLCE7ybZDVUE17nKGGpnu4Z0+6/3/EaA8R1N
	kYCdU4ffdWKbbeG8UT+wwPoddlRPgXX2pPoyn1Hng7oF8qkXvP/32CduU7RvYU674O3wCoY
	1G2dlefckFC4MH2wLV5fm/02Vj8k1qm7eLypC94OHNXGtJyxDTTKJKnyy4S/UUQCBWIze+3
	ewdiiZL7jTzS3LGW3YJpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ozra9I6ERoU=:x4oV6y93l2CwRU9PJYcolF
	3A5uiIo3kKa/8t8YAqBEsxQDnvEqndEWdax/9TYtnM2HVXJinyAAulvY22Z17nKM1RA3Y4R9h
	zknpp7LUkrbCFsOSKYczaNY/GdJwj9E6mePR+yZEoGNC+2pK5v+NAvErVf/cAKOr0AgpDN/kJ
	k99yDgzGesi5KeX+hu2duTVcpQl1PFNVJSHUrlxVLOR6A0BvJNWAuVSYhCE+YrLdprAk3TKPM
	whzMnRoj/94MYNz7B2Zyid9VpjPYWQt/YjnoKh/TCHf+95qLjsXQhwrMkeuUOiIsM5LvCNvhk
	LdAhscXlGZQUQEF9j56+cIEFbCIynn5Dw9weq6BNQc/opicN3wkawuoT9MMWuoiLSk0YAv6qX
	7yAWDJoEpRaBbKAbNygJuHuxe4Lcp2uL9fSeEx93zN/wAoP367ksL7EWamEe2ctpdVoFxIebn
	i2zdTnzS1AUN1koioi35GK3BnkCcctdQuGnW8WSMMsyO+3EuZAXO3PRINiFwfYbAqfizoAHxN
	rxvY3DaDzo+05RENj7SBDHLFgUngCfbjrdfk9lclmWE25/pfw3gDGTd7udQZi65SI0b0Ttm/o
	Al/wSq6yU5aT6EA1Z7de2WqeTlOMKGQitu7orCd/b+rg37i2BZcd8nxSxx+zuD5yVDLnOWO6J
	D4B5fRWkRYs/gS5cwgBac+yz87fQXlD73nzRYmwbSDHp6EMrzaf5yWXs0EgIfJ/os1HTIWB00
	cWfe987/DDqyb1cAsH1i+yXw/+bnpICQHVE4XA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: [Qemu-trivial] [PULL 01/16] hw/rdma: Delete unused headers inclusion
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
X-List-Received-Date: Thu, 06 Jun 2019 11:08:10 -0000

From: Yuval Shaia <yuval.shaia@oracle.com>

This is a trivial cleanup patch.

Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
Reviewed-by: Kamal Heib <kheib@redhat.com>
Message-Id: <20190505105112.22691-1-yuval.shaia@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rdma/rdma_backend.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index cf34874e9d2f..c39051068d1e 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -14,16 +14,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
-#include "qapi/error.h"
-#include "qapi/qmp/qlist.h"
-#include "qapi/qmp/qnum.h"
 #include "qapi/qapi-events-rdma.h"
 
 #include <infiniband/verbs.h>
-#include <infiniband/umad_types.h>
-#include <infiniband/umad.h>
-#include <rdma/rdma_user_cm.h>
 
 #include "contrib/rdmacm-mux/rdmacm-mux.h"
 #include "trace.h"
-- 
2.21.0


