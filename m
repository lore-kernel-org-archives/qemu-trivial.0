Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKufv-0007PR-UD
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:24:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufp-0007NX-Hh
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufl-0004AW-0X
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKufi-00048M-UC; Fri, 01 Dec 2017 18:24:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C236356F4;
	Fri,  1 Dec 2017 23:24:42 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFABE5D6A3;
	Fri,  1 Dec 2017 23:24:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Jason Wang <jasowang@redhat.com>
Date: Fri,  1 Dec 2017 17:24:27 -0600
Message-Id: <20171201232433.25193-2-eblake@redhat.com>
In-Reply-To: <20171201232433.25193-1-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Dec 2017 23:24:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 1/7] net: Drop unusual use of do { } while
 (0); 
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
X-List-Received-Date: Fri, 01 Dec 2017 23:24:55 -0000

For a couple of macros in pcnet.c, we have to provide a new scope
to avoid compiler warnings about declarations in the middle of a
switch statement that aren't in a sub-scope.  But use of
'do { ... } while (0);' merely to provide that new scope is arcane
overkill, compared to just using '{ ... }'.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/pcnet.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index 654455355f..641bf2fd88 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -455,32 +455,32 @@ static inline void pcnet_rmd_store(PCNetState *s, struct pcnet_RMD *rmd,
 #define CHECK_RMD(ADDR,RES) do {                \
     switch (BCR_SWSTYLE(s)) {                   \
     case 0x00:                                  \
-        do {                                    \
+        {                                       \
             uint16_t rda[4];                    \
             s->phys_mem_read(s->dma_opaque, (ADDR), \
                 (void *)&rda[0], sizeof(rda), 0); \
             (RES) |= (rda[2] & 0xf000)!=0xf000; \
             (RES) |= (rda[3] & 0xf000)!=0x0000; \
-        } while (0);                            \
+        }                                       \
         break;                                  \
     case 0x01:                                  \
     case 0x02:                                  \
-        do {                                    \
+        {                                       \
             uint32_t rda[4];                    \
             s->phys_mem_read(s->dma_opaque, (ADDR), \
                 (void *)&rda[0], sizeof(rda), 0); \
             (RES) |= (rda[1] & 0x0000f000L)!=0x0000f000L; \
             (RES) |= (rda[2] & 0x0000f000L)!=0x00000000L; \
-        } while (0);                            \
+        }                                       \
         break;                                  \
     case 0x03:                                  \
-        do {                                    \
+        {                                       \
             uint32_t rda[4];                    \
             s->phys_mem_read(s->dma_opaque, (ADDR), \
                 (void *)&rda[0], sizeof(rda), 0); \
             (RES) |= (rda[0] & 0x0000f000L)!=0x00000000L; \
             (RES) |= (rda[1] & 0x0000f000L)!=0x0000f000L; \
-        } while (0);                            \
+        }                                       \
         break;                                  \
     }                                           \
 } while (0)
@@ -488,22 +488,22 @@ static inline void pcnet_rmd_store(PCNetState *s, struct pcnet_RMD *rmd,
 #define CHECK_TMD(ADDR,RES) do {                \
     switch (BCR_SWSTYLE(s)) {                   \
     case 0x00:                                  \
-        do {                                    \
+        {                                       \
             uint16_t xda[4];                    \
             s->phys_mem_read(s->dma_opaque, (ADDR), \
                 (void *)&xda[0], sizeof(xda), 0); \
             (RES) |= (xda[2] & 0xf000)!=0xf000; \
-        } while (0);                            \
+        }                                       \
         break;                                  \
     case 0x01:                                  \
     case 0x02:                                  \
     case 0x03:                                  \
-        do {                                    \
+        {                                       \
             uint32_t xda[4];                    \
             s->phys_mem_read(s->dma_opaque, (ADDR), \
                 (void *)&xda[0], sizeof(xda), 0); \
             (RES) |= (xda[1] & 0x0000f000L)!=0x0000f000L; \
-        } while (0);                            \
+        }                                       \
         break;                                  \
     }                                           \
 } while (0)
-- 
2.14.3


