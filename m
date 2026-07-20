Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4860C44515
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Jul 2026 19:42:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wltse-00068j-7B; Mon, 20 Jul 2026 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wltsc-00067o-QT
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2026 15:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wltsb-0002b7-01
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2026 15:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784576539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fzi3pocbfSFvoNzvx12UIr6hy/A9X6Ta3LgMmsvuxg0=;
 b=VszXk+sDRwcM4u/sd84uSrZeNhGxc9+Q63V7guqMweNJzt6G75bOcKKku/QUXVUYbDk1u8
 ZPThDpUCU8i8Ty6HwhPiFigBJQfTxYkl/NRxklsC9JRFFfVVsTLdDHLDnRQd8MG3uUI9zl
 6dKlntFQBT6G66tVvbQDMStssl9wXzU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-9-vons-3M2GAWqdwzNS45g-1; Mon,
 20 Jul 2026 15:42:16 -0400
X-MC-Unique: 9-vons-3M2GAWqdwzNS45g-1
X-Mimecast-MFC-AGG-ID: 9-vons-3M2GAWqdwzNS45g_1784576535
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BF9FE1800594; Mon, 20 Jul 2026 19:42:14 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.34.82])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1804C1800615; Mon, 20 Jul 2026 19:42:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
Date: Mon, 20 Jul 2026 21:42:10 +0200
Message-ID: <20260720194210.663629-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 3EUHmAvHDJW35A7VmKk7jekWgEGyhMJgqiu0I9tA5jE_1784576535
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

From: Thomas Huth <thuth@redhat.com>

ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
two IDE drives on a bus (primary or secondary drive) to cancel all
pending DMA transfers on the drive. The code then checks
s->bus->dma->aiocb to see whether there is any IO in flight on the
*bus* and then calls blk_drain(s->blk) to wait for its completion.
However, s->bus->dma->aiocb might belong to the other drive on the
bus, and if there is no disk attached to the current drive, s->blk
is NULL. Since blk_drain() does not check its parameter for a NULL
pointer, QEMU can crash in such a case.

Fix the problem by checking s->blk to be a valid pointer before
calling blk_drain() in this function.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/905
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4052
Reported-by: dong ling
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index f78b00220b8..49848c8e6bd 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -741,8 +741,11 @@ void ide_cancel_dma_sync(IDEState *s)
      * In the future we'll be able to safely cancel the I/O if the
      * whole DMA operation will be submitted to disk with a single
      * aio operation with preadv/pwritev.
+     *
+     * Note: s->bus->dma->aiocb might belong to the adjacent IDEState,
+     * so we have to check s->blk for not being NULL, too.
      */
-    if (s->bus->dma->aiocb) {
+    if (s->bus->dma->aiocb && s->blk) {
         trace_ide_cancel_dma_sync_remaining();
         blk_drain(s->blk);
         assert(s->bus->dma->aiocb == NULL);
-- 
2.55.0


