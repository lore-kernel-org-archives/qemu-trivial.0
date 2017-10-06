Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSZ-0002VI-IB
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cST-0002Q4-39
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSR-00087m-Uo
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:09 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:52775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSN-00084x-Je; Fri, 06 Oct 2017 19:55:03 -0400
Received: by mail-qt0-x241.google.com with SMTP id o52so34330014qtc.9;
	Fri, 06 Oct 2017 16:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rR36fwBv7mScxAVZSpIrXHl8/e30rqjRXFK308/5Kd8=;
	b=ddgwKw1Cm5XMP/a13chBsQYTR9Y9t+yvvAqd65R+tZaTRyzLoWkhtmY/85gn5NAILN
	6eSQJZWZRDqGwId4KTu/VxJKUhqS724YHgv97qBe/MXg9SjCKvk/lrfqw0gCLwcDn+MK
	AJbIkCNUQJdxOAUhilavgVDQad1ipsbbllLzUv14MNOQnIOr1U/OxOXBhCe0iN+THSKy
	LMj8P0PGOiQlp3oiQyripAw71U1YRGp3rjwQztmV5Xk10RSt2r4OW1B+FfNjfZqblsFZ
	5YWFu4aJN46qHZUILYViozuQfeM+wr/lsz7tsHOn23syOSV6zAg3ZSg7stzEdb7u+flQ
	wNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rR36fwBv7mScxAVZSpIrXHl8/e30rqjRXFK308/5Kd8=;
	b=G//QWC/Tm8Um3+5TDcmr9Po+Y53EQX68gDwNloqQF5a/LjVX6lHOdI11JUBLYTS6Tq
	R1rY47JhF5Eah6RGO6L6/ewxXLWl2N8x0wQNU4mYANDfjctyGNEEjJyuJO3zjeANibFh
	XPsW2iw53bttKQBz750TnZYSZ69O4bexJljXcPJhzg1yeC73JWCyA2cn8Pt0cALBrr6R
	DoLli5VDKN4RhVKBCklVHcgA8UafRjhedhf/FpvCjBPEoOq+WZfxs3imJ2tNaIgai8G6
	EpDIC1ZT4Q4Ml2poPnfCGXdbG3vMZIm7LSWQcxopufMciF3/muRmzD+k/IN7GRinfWtd
	Vfsg==
X-Gm-Message-State: AMCzsaU9NICRJJY1KvykUA1a5RSsEdLnwuRybis7D8Ji+2M+Qa3URT3w
	/P9YO/y0WCNOGIgT4r+UfPk=
X-Google-Smtp-Source: AOwi7QCbwU3hNN7FEa0ntcxezQ7sS1QoBNLfSkVkRO3RH7TjN5WrYzWtUVRvt1I9RF7hvvs6/uu93A==
X-Received: by 10.200.56.108 with SMTP id r41mr5071728qtb.143.1507334103062;
	Fri, 06 Oct 2017 16:55:03 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:50:11 -0300
Message-Id: <20171006235023.11952-77-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 76/88] dma: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:10 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added hw/dma/etraxfs_dma.c]
---
 dma-helpers.c        | 4 ++--
 hw/dma/etraxfs_dma.c | 2 +-
 hw/dma/rc4030.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index 2d7e02d35e..e327fc21c4 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -40,7 +40,7 @@ int dma_memory_set(AddressSpace *as, dma_addr_t addr, uint8_t c, dma_addr_t len)
 void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
                       AddressSpace *as)
 {
-    qsg->sg = g_malloc(alloc_hint * sizeof(ScatterGatherEntry));
+    qsg->sg = g_new(ScatterGatherEntry, alloc_hint);
     qsg->nsg = 0;
     qsg->nalloc = alloc_hint;
     qsg->size = 0;
@@ -53,7 +53,7 @@ void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len)
 {
     if (qsg->nsg == qsg->nalloc) {
         qsg->nalloc = 2 * qsg->nalloc + 1;
-        qsg->sg = g_realloc(qsg->sg, qsg->nalloc * sizeof(ScatterGatherEntry));
+        qsg->sg = g_renew(ScatterGatherEntry, qsg->sg, qsg->nalloc);
     }
     qsg->sg[qsg->nsg].base = base;
     qsg->sg[qsg->nsg].len = len;
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index d5650eb885..97951a2abe 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -768,7 +768,7 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
-	ctrl = g_malloc0(sizeof *ctrl);
+	ctrl = g_new0(struct fs_dma_ctrl, 1);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
 
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 5d4833eeca..14bcab9fb3 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -636,8 +636,8 @@ static rc4030_dma *rc4030_allocate_dmas(void *opaque, int n)
     struct rc4030DMAState *p;
     int i;
 
-    s = (rc4030_dma *)g_malloc0(sizeof(rc4030_dma) * n);
-    p = (struct rc4030DMAState *)g_malloc0(sizeof(struct rc4030DMAState) * n);
+    s = g_new0(rc4030_dma, n);
+    p = g_new0(struct rc4030DMAState, n);
     for (i = 0; i < n; i++) {
         p->opaque = opaque;
         p->n = i;
-- 
2.14.2


