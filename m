Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZW46-00014g-MD
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 04:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZW45-000127-Cw
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:23:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZW43-0005yv-RR
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604309026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oqaCBtiyHyraZrQbnp3YwL6DATj7zhKDy6uE+R2EKuw=;
 b=iPfg7xCW3QsdHkL4/jbMBgmzYQuAa6GQ/gyjuAXf8I3ctqyT/U9DtomNGLKYmV6G+F/JKp
 ZTth1fm/cKJ9sV2uasKMpAybEf9k6ogE4fv7qAprliK4WW0a57GIGa5RrmJiT7PFWleEUM
 TI1t71/Hmg27rddORyMs89CVIAqZEZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-9HcVXU9hNDaNSoTzRc2_wg-1; Mon, 02 Nov 2020 04:23:43 -0500
X-MC-Unique: 9HcVXU9hNDaNSoTzRc2_wg-1
Received: by mail-wm1-f72.google.com with SMTP id z7so3110855wme.8
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 01:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oqaCBtiyHyraZrQbnp3YwL6DATj7zhKDy6uE+R2EKuw=;
 b=HL2TBeWAQGnhX+QKv3J9C3IiOkfl+Uhzx9orkUMad9WEBwOq9CK2XPNa9YIx0rOMnh
 +8o082hAUXv15+KFPxQwZ0QgWKS4W+GLyl/Ly5G10tYnlBQUOwAU1GhHM2XwqzHOG0r6
 wCWHF+jQUL7h3v3rwmxbnsK9y1SB34hr6p5q8nm1447Ff1MAGgztOTq0R9YhDc3+eYXE
 yRYtlfgKODLbZTgDTQvIlwWTDefTM4O/YfuGS3AsIl4ajIoMBgCq2U9yDxv53KV35QB1
 i3V2C2PVJ9Cjc84sVUr+mta/FKncfm6/aXUy6H/XxY5LKcOgMKFC4WarA9fnO0bLwc1U
 BQXg==
X-Gm-Message-State: AOAM532p07KVGMEE+MF0fXjArbfXp7c8c6Xtccs04OjUjpb6vdOPjLU3
 cQd+Du/lRcEI6OYe9Lw1sqfANGP/ezAI5ea5aFTqZwCZxoiVS8taWVxMubYW2UD9KyIuZtUnJJw
 xebi/GFsbaCIMmHn+Eg==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr17275130wml.155.1604309022051; 
 Mon, 02 Nov 2020 01:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyk+QDyNpG9dTaMZWy9y7bOQsX/Fs8KwApcQ2y4Nep/+DGI2aKxQqqzql7YYHH2+tbtT9EIQ==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr17275102wml.155.1604309021883; 
 Mon, 02 Nov 2020 01:23:41 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e25sm22320755wra.71.2020.11.02.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:23:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 v2] tools/virtiofsd: Check vu_init() return value (CID
 1435958)
Date: Mon,  2 Nov 2020 10:23:39 +0100
Message-Id: <20201102092339.2034297-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 02 Nov 2020 09:23:49 -0000

Since commit 6f5fd837889, vu_init() can fail if malloc() returns NULL.

This fixes the following Coverity warning:

  CID 1435958 (#1 of 1): Unchecked return value (CHECKED_RETURN)

Fixes: 6f5fd837889 ("libvhost-user: support many virtqueues")
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Add fuse_log()
---
 tools/virtiofsd/fuse_virtio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 324936948d3..83ba07c6cd8 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1013,8 +1013,11 @@ int virtio_session_mount(struct fuse_session *se)
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
     pthread_rwlock_init(&se->virtio_dev->vu_dispatch_rwlock, NULL);
-    vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
-            fv_set_watch, fv_remove_watch, &fv_iface);
+    if (!vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
+                 fv_set_watch, fv_remove_watch, &fv_iface)) {
+        fuse_log(FUSE_LOG_ERR, "%s: vu_init failed\n", __func__);
+        return -1;
+    }
 
     return 0;
 }
-- 
2.26.2


