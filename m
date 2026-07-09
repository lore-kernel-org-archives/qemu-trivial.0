Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5630CC43458
	for <qemu-trivial@archiver.kernel.org>; Thu,  9 Jul 2026 20:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1whvM9-0003Cb-PP; Thu, 09 Jul 2026 16:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1whvM8-0003CI-3m
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2026 16:28:24 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1whvM6-0000dR-KD
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2026 16:28:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c15c257a488so51833766b.3
 for <qemu-trivial@nongnu.org>; Thu, 09 Jul 2026 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783628901; x=1784233701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lK1zpbyr0sEe7U9mK48Dpu/WkfnxcH8pX3QyNSJ86tA=;
 b=WhTevbJ3SPmDTY9HpaV2YAv93baIkaAHSg+JYnlVWr8ag9BaV8IFNiewSeiSrXHFOL
 Op49tzP89gfQ/NuVzoETVgvuzKq1VS8QfT8+UZH+5YShiCmTNa6S9en4k205yuiiYr+M
 NjVSFaWwLkHmRaIj8Pm7O3eXpc4w3Z0j/vgm5iQEnrtfWVTtR1uj6khwy8WQGsgbzocl
 nTA5a7+3AgZXEKHP+T2UgyqoxFsdVmBiwCSAB620wbAcI5B5XytG8PeZyT6xdxjKMO9m
 YY8ZK3dGdaCV/0ksqRZxkKniY55ab0VpzNprVjLeO7jobsunDQ6UI04l/bI8GlvpiM4O
 lIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783628901; x=1784233701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lK1zpbyr0sEe7U9mK48Dpu/WkfnxcH8pX3QyNSJ86tA=;
 b=Pd+hsTDFeDS6pOnN8S49lxm8iBYJK97w/xLI7ff8mmRCnp9QdvSdDiukQ4Jdh5afgr
 bWx5FYaXvOF73zrcabn5RmQDacOgkxWqcBDtV6p6QNT5vk0bCR1JxmQrDFszK4GKuMCU
 kx2wYdPQeNC6Pk7ha3OeQXq0+MUQ3jQPvkABQqbP0pssA98Y8KLNvBvm5PtXheY+/ojG
 /1TS4EtiWTJwf77Dgtf4eeLYsOURSa0tDh8V9uF8J14kgBngxxxxDG6XYag6nmMPmsEO
 50GAddwbL4VKhs9ujHeGSaE2KNElTd01kr6C9JSPKLbBI6m1AvIHHejXVVwBZPrWldCa
 pjqg==
X-Gm-Message-State: AOJu0YzV2djYIyvxKJVm42h/+6DYoPToOzOFHWOhQswLu/SuskbQ98NJ
 JYUpRfw9///VrVbfinuR1ZyBQkCl2kyiEwpIHN3fIArLERU014j/X6lO
X-Gm-Gg: AfdE7ckROrIccRytwR/LiUgwgRtEwY4AW304YcFzUOnGOgWserolrM8pnEKwuono8MW
 Kl9E/GNqqiGCqxPDn1oTK3ZW96euEFrny68YEdw344LKgyguW+6hu0XkBi7in9SPdV3wR9AgR0l
 BcwtSG0YHYXMR94Pllw9K7kz+uheMInvTjcpLt8rmm/FV1+UCWwnDXVrT9wJSxpNbPvgpfO+Yyy
 nBOmxirBdwk1v3W/xo9/f72aHcJhkgHQq5yBqGz79lvTyskPFVTRwZ9ZP7jyoHNZd+VSbSlTwmX
 rHnMWJNXPvdRnBLVmut1zcmnd2kvcczloOpn34lIBMJzHkRQzJu8vSYFVKVCvrMm4L3eqlYRXR4
 4zglhLCXlF/r7kYnU22unyrDvP7k+U6cV7Yd+YiJtjMYOGeI/4oKukhqky8Pg8JYS0Qbtr4OuOA
 Evo66aLv7qnO34x4+ZDOwIJ0Wdy1U=
X-Received: by 2002:a17:907:3c84:b0:c12:54c8:16f0 with SMTP id
 a640c23a62f3a-c15ce237960mr378418166b.63.1783628900611; 
 Thu, 09 Jul 2026 13:28:20 -0700 (PDT)
Received: from machine.. ([37.113.214.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15c38c164asm375453166b.3.2026.07.09.13.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 13:28:20 -0700 (PDT)
From: Evgeny Kolmakov <randomjack94dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, maciej.szmigiero@oracle.com,
 Evgeny Kolmakov <randomjack94dev@gmail.com>
Subject: [PATCH] hw/hyperv/vmbus: Use QEMU_LOCK_GUARD()
Date: Thu,  9 Jul 2026 23:27:22 +0300
Message-ID: <20260709202722.7291-1-randomjack94dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=randomjack94dev@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Replace manual qemu_mutex_(un)lock() calls with
QEMU_LOCK_GUARD() to remove 'goto out' code

Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
---
 hw/hyperv/vmbus.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index c5259d1a76..ab99f082d1 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1525,14 +1525,12 @@ static VMBusChannel *find_channel(VMBus *vmbus, uint32_t id)
 static int enqueue_incoming_message(VMBus *vmbus,
                                     const struct hyperv_post_message_input *msg)
 {
-    int ret = 0;
     uint8_t idx, prev_size;
 
-    qemu_mutex_lock(&vmbus->rx_queue_lock);
+    QEMU_LOCK_GUARD(&vmbus->rx_queue_lock);
 
     if (vmbus->rx_queue_size == HV_MSG_QUEUE_LEN) {
-        ret = -ENOBUFS;
-        goto out;
+        return -ENOBUFS;
     }
 
     prev_size = vmbus->rx_queue_size;
@@ -1544,9 +1542,7 @@ static int enqueue_incoming_message(VMBus *vmbus,
     if (!prev_size) {
         vmbus_resched(vmbus);
     }
-out:
-    qemu_mutex_unlock(&vmbus->rx_queue_lock);
-    return ret;
+    return 0;
 }
 
 static uint16_t vmbus_recv_message(const struct hyperv_post_message_input *msg,
@@ -2097,10 +2093,10 @@ static void process_message(VMBus *vmbus)
     void *msgdata;
     uint32_t msglen;
 
-    qemu_mutex_lock(&vmbus->rx_queue_lock);
+    QEMU_LOCK_GUARD(&vmbus->rx_queue_lock);
 
     if (!vmbus->rx_queue_size) {
-        goto unlock;
+        return;
     }
 
     hv_msg = &vmbus->rx_queue[vmbus->rx_queue_head];
@@ -2149,8 +2145,6 @@ out:
     vmbus->rx_queue_head %= HV_MSG_QUEUE_LEN;
 
     vmbus_resched(vmbus);
-unlock:
-    qemu_mutex_unlock(&vmbus->rx_queue_lock);
 }
 
 static const struct {
-- 
2.43.0


