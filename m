Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF52C531CB
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 12:01:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wms6j-0004uZ-6z; Thu, 23 Jul 2026 08:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wms6L-0004id-FR
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wms6J-0002MU-RC
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784808031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0nIgzkawwNw5P6qL9qW8APCzIW0gYvFSgTcfhT68YqI=;
 b=e/APm4opqqSMZCPunyMiCc4+eEqEe36jBf3+j9NkA01CCq4ujv/p4GIlb3PcEmyJ67gx8G
 t9NfSSFPbH7oJpJmz34dx4zJUqXyf9Qp9+k7aIdGUJGua5NtGMzn3yWG4tFU0HsB9nLL8w
 0x4r6SUmq4lt0+vt3gnmfnPk/snN6uo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-IrFBPXKEMUWWxD048o1aaw-1; Thu,
 23 Jul 2026 08:00:27 -0400
X-MC-Unique: IrFBPXKEMUWWxD048o1aaw-1
X-Mimecast-MFC-AGG-ID: IrFBPXKEMUWWxD048o1aaw_1784808025
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DA55F1830253; Thu, 23 Jul 2026 12:00:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.74])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6C07E180029A; Thu, 23 Jul 2026 12:00:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] hw/display/vmware_vga: Don't allow guest to trigger long
 running loop in host
Date: Thu, 23 Jul 2026 14:00:20 +0200
Message-ID: <20260723120020.330089-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: pCmV8htk1vcl6n0qYVwYCwDVpnXcO54S1YigGAoRex8_1784808025
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.951,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001,
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

The code in the SVGA_CMD_DEFINE_ALPHA_CURSOR handler in vmsvga_fifo_run()
basically does:

            x = vmsvga_fifo_read(s);
            y = vmsvga_fifo_read(s);
            args = x * y;
            goto badcmd;
            ...
badcmd:
            len -= args;
            if (len < 0) {
                goto rewind;
            }
            while (args--) {
                vmsvga_fifo_read(s);
            }

Thus by supplying huge values for x and y that overflow the result of
the multiplication, the guest can trigger a long-running loop here
that burns the host's CPU cycles.

Add some sanity checks so that this cannot happen anymore.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3782
Reported-by: Feifan Qian <bea1e@proton.me>
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4026
Reported-by: Tristan Madani <tristan@talencesecurity.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4076
Reported-by: Sunday Jiang
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/vmware_vga.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index f6f9edfd1d9..04cc438cc02 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -737,6 +737,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
             vmsvga_fifo_read(s);
             x = vmsvga_fifo_read(s);
             y = vmsvga_fifo_read(s);
+            if (x < 0 || x >= 32768 || y < 0 || y >= 32768) {
+                goto rewind;
+            }
             args = x * y;
             goto badcmd;
         case SVGA_CMD_RECT_ROP_FILL:
@@ -776,7 +779,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
             if (len < 0) {
                 goto rewind;
             }
-            while (args--) {
+            while (args-- > 0) {
                 vmsvga_fifo_read(s);
             }
             printf("%s: Unknown command 0x%02x in SVGA command FIFO\n",
-- 
2.55.0


