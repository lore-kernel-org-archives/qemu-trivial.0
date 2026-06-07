Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EE0CD8C8E
	for <qemu-trivial@archiver.kernel.org>; Sun,  7 Jun 2026 14:42:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWEha-0003nl-58; Sun, 07 Jun 2026 10:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wWEhX-0003nS-GF
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2026 10:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wWEhU-0005BR-QX
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2026 10:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780843325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q8XQOn9LUh37rgLXmw94eIPYjrEIayaDjh+oohRkMR4=;
 b=jD6bU+4DN9248ZYAnypz9wewZCJg5xilqUyFzKVlEZfRRj7OO3Rt9MqGJGjCqgx7Q7e0Rv
 XeUozGIQoUXZhrwMSp/J/du6pzrXKvV10upY+mQDHlLFn+R7oRSrtWe7pTctv2E5fPNmeU
 xh1iIhGBQg9XyPV6UG9If35wLMZuzaA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-6oNZ7_DxNn6t95L6b8b2SA-1; Sun, 07 Jun 2026 10:42:03 -0400
X-MC-Unique: 6oNZ7_DxNn6t95L6b8b2SA-1
X-Mimecast-MFC-AGG-ID: 6oNZ7_DxNn6t95L6b8b2SA_1780843323
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2bf55c3f44aso35437215ad.0
 for <qemu-trivial@nongnu.org>; Sun, 07 Jun 2026 07:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780843323; x=1781448123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8XQOn9LUh37rgLXmw94eIPYjrEIayaDjh+oohRkMR4=;
 b=XhMnIOmNvlo+JeJqHhOEJUeDo6D/hn3qWzPTgqPMuNiJKa2QqRT7AR3ydTnE+zyLmI
 r1PoIZ2NiDsEyjbrmZb3C2y0T5BwBWMhyMZ2Q+CgslfKNAEWfqomqwVYlAAe0QFcZ2PF
 yMpNkVi0JshbnQ1YGn+wmZVmdu0RNyWfLufOC+kvKm8FA7x1W21DkptPoNrN+QQ0CzLu
 85RTVEEKKeZSWXWkLUDsxXqau/cyduGabe8dv4rI9kagDbQ21WrEuPQQ/r3b8ETSvMTf
 Fbnqw2NPCthMkNYCgLcnXWWNARIuruTdSKHnZJdECIP8kExXqTKudOBgYrpmJlJSxKcI
 wr/Q==
X-Gm-Message-State: AOJu0Yw5Lg7yE1Fac/KkA9GW8n390ne4wnIfc6vpIh6cbvjVSELuftD3
 u7HjdBPnnJsxGFHqpDIO1H6BM5ZlHnnyjNm4PHTizQ8/5/WTFXSphirteU6c5PvPXNMWwT5Q0MA
 G2QK631cYgt0ez2pywm+NOlWRKR5iq6J5l9vWANz7tgOG6D8jJZUMgTHfqX8=
X-Gm-Gg: Acq92OHUFUo0Q63q9RUEkeyd12EKOU0ybylGLkHO5Lnrd/8qkD8j8A7fOkqIu6V0+8m
 FlD55KSUTrpbxJWXG+TzXX9fwVw0IIhtGgRYacr0vwnjpEQw3I/w/IHb7N11OscYgNfo/RvnVKE
 KQdKMKOxBq4Bw044AHOKWa0aFcBLRzF0lU7N+R1Imqz7X8c/3bA5rXPx2jsmNzxoXD5sQlZd2CN
 QkN7t7/EnrwR5d8boqpEy2l5hNsl+LpUlXJAz3JscSyAfMS5JySHQqouDZnlcLBg5v/oGklwVts
 knFD0qmqgfrz7zs3I8jrCO3zwJKKDN66qXdKKOoIWWC8LygirjAb272jc3kHwWpTpSp8ed32DM0
 pHXE07gd6aTrZOkuluQ5QmXZXhQm67eUfe8EwLvX7Uz5Ri8fpWj+cZqik8KBtFmR7XRRl
X-Received: by 2002:a17:903:2acd:b0:2c0:bcff:e1a9 with SMTP id
 d9443c01a7336-2c1ec7dc6d1mr87143955ad.9.1780843322697; 
 Sun, 07 Jun 2026 07:42:02 -0700 (PDT)
X-Received: by 2002:a17:903:2acd:b0:2c0:bcff:e1a9 with SMTP id
 d9443c01a7336-2c1ec7dc6d1mr87143795ad.9.1780843322167; 
 Sun, 07 Jun 2026 07:42:02 -0700 (PDT)
Received: from ani-lenovo.lan ([122.163.16.238])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2c164f8679esm147750565ad.21.2026.06.07.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 07:42:01 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Ani Sinha <anisinha@redhat.com>
Cc: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] igvm: spit out region size on error
Date: Sun,  7 Jun 2026 20:11:44 +0530
Message-ID: <20260607144144.445493-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hm7Bl4VqWr-RzHJy-Dw5v3unMqFEt0o-ZNMedXYroQU_1780843323
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This change makes the error message provide more details on the values that
caused the error. Cosmetic, no functional change. Only useful for debugging
purpose.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 backends/igvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/igvm.c b/backends/igvm.c
index 31ff6ee0b2..8b578b3b5b 100644
--- a/backends/igvm.c
+++ b/backends/igvm.c
@@ -207,8 +207,8 @@ static void *qigvm_prepare_memory(QIgvm *ctx, uint64_t addr, uint64_t size,
             error_setg(
                 errp,
                 "Processing of IGVM file failed: Could not prepare memory "
-                "at address 0x%" PRIx64 ": region size exceeded",
-                addr);
+                "at address 0x%" PRIx64 ": region size 0x%" PRIx64 " exceeded",
+                addr, size);
             return NULL;
         }
         return qemu_map_ram_ptr(mrs.mr->ram_block, mrs.offset_within_region);
-- 
2.54.0


