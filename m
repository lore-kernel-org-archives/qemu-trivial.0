Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79968F94CD8
	for <qemu-trivial@archiver.kernel.org>; Wed, 22 Apr 2026 07:55:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wFSQ0-0003rR-1A; Wed, 22 Apr 2026 03:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wFSPy-0003qP-2Y
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 03:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wFSPw-0006gm-HJ
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 03:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776844479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fQ/Gm5mXI5uP0dB7l1HO9HAOWfvVCU1YytbxxGf+WmM=;
 b=HT4XlH2GIreU+i4XxZuR8i9pFX6B3CVpEpacMcAOeMdzBHnq50HYft/T/ApesUE/cZWO8H
 fXnVWmqiaUIBA/XcnqC4dTP0h9BFNNTMbHwVtdzwBqjEVu+IZ3UInBcmJZj4SyWHLox43R
 savU39cMdc1zb1g/AL68ivTesfyvdSA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-qG8JdtsqP1ylpwKsf6gZEw-1; Wed,
 22 Apr 2026 03:54:35 -0400
X-MC-Unique: qG8JdtsqP1ylpwKsf6gZEw-1
X-Mimecast-MFC-AGG-ID: qG8JdtsqP1ylpwKsf6gZEw_1776844474
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3A9971800454; Wed, 22 Apr 2026 07:54:34 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.99])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7863F19560B7; Wed, 22 Apr 2026 07:54:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Yoshinori Sato <yoshinori.sato@nifty.com>
Cc: qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] hw/sh4/sh7750: Remove forgotten abort() in the MM_ITLB_DATA
 handler
Date: Wed, 22 Apr 2026 09:54:29 +0200
Message-ID: <20260422075429.341409-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: VzNoAwsi_QfD_uGHT-WFbINcteDmCdh40c8IvvGc7OE_1776844474
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

QEMU currently aborts when the guest writes to the MM_ITLB_DATA register:

 echo "writel 0xf3000000 0x11223344" | \
  ./qemu-system-sh4 -M r2d -display none -accel qtest -qtest stdio
 [I 0.000000] OPENED
 [R +0.004476] writel 0xf3000000 0x11223344
 Aborted                    (core dumped)

Looking at the history of the code, the abort() here has likely just
been forgotten when the register handler had been implemented (it used
to be a reminder about unimplemented functionality initially):

 https://gitlab.com/qemu-project/qemu/-/commit/9f97309a70f12df5f9104f1f

Thus simply remove the abort() now to get rid of the problem.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3420
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sh4/sh7750.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 3ae71f99fe5..6aa7f637734 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -687,7 +687,6 @@ static void sh7750_mmct_write(void *opaque, hwaddr addr,
         break;
     case MM_ITLB_DATA:
         cpu_sh4_write_mmaped_itlb_data(&s->cpu->env, addr, mem_value);
-        abort();
         break;
     case MM_OCACHE_ADDR:
     case MM_OCACHE_DATA:
-- 
2.53.0


