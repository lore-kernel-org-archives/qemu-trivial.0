Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knQDu-0000vQ-GU
	for mharc-qemu-trivial@gnu.org; Thu, 10 Dec 2020 12:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQDs-0000v1-Mm
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 12:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQDq-00009y-Eh
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 12:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ud3KxDqUBdjOZUtEIZXpH5CF1Q02Z/msk2wmjc+8dE=;
 b=XZp4qBLuUvnOLRvaT9KHl8k4tsxgPcUVflavjjiPZBuOR4g+V+RAy01EHyUF5XH13VS9XL
 DPASpibXKxZr95S9F8Cc0SATUss6hMiAEheI5CdRi20kfmZyLwGvunzjI3JzCakYWH6lcs
 AX6eseYnEaIPez+zonAYyFTtuU0vsOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-PFuZToOJMlOZTbFsrM1dWA-1; Thu, 10 Dec 2020 12:59:19 -0500
X-MC-Unique: PFuZToOJMlOZTbFsrM1dWA-1
Received: by mail-wm1-f69.google.com with SMTP id r1so2319869wmn.8
 for <qemu-trivial@nongnu.org>; Thu, 10 Dec 2020 09:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Ud3KxDqUBdjOZUtEIZXpH5CF1Q02Z/msk2wmjc+8dE=;
 b=nY5UZuJIyDia4zbjIQaMDlFGrN2v7fGgbZoblZ7RM72Tgf4wWfVa4uSVjXHtrj+g3X
 UL/P/blyrWX/Oi9tMmTShj7eZ22jtxZm9eCt6+qDfXO6xYku65ePPk1/59hz+eUl+mpt
 3pt3rVBSPv5G8Vm6TWio6jukLTo9U7A6AJCCcgpwoDPHlCAQqNl7iImpcIjNgZ0z0eO8
 fpDXV+5sGowMEbY0dU34yEp3JzoFcSteSaSlFWkRp8mtyMBFc70fpLJviqIg38RRibGP
 DNtylVOAi0pXCJD3EJOmw4buJWomaT6Xy11KZAhxVU9avxmXf8+OSEPFGhjZVVJAT5KX
 0NCg==
X-Gm-Message-State: AOAM530/7MXCp/6E9aYV699LzmTpm3ub2Pj7tVgtKvd7TBByRomVFALd
 PPtCgf0HYSHZPr9R4QeV6lTpqj8RVavxS4iC2FYtzYRCyJZPsbrHsYZSjcU3gLlAesgcEebOplK
 RitLba9qkfIJJvQsSCg==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr9265012wmi.75.1607623158450;
 Thu, 10 Dec 2020 09:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEQiDzySAPyn/08D+Jwn9LrpXnRXpJUua0gftvYcLqvx4RatZX0RndEb4S2ie3TXWMMIZUgQ==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr9264989wmi.75.1607623158220;
 Thu, 10 Dec 2020 09:59:18 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o74sm13298630wme.36.2020.12.10.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:59:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH] virtio: Only display errors if GUEST_ERROR is enabled
Date: Thu, 10 Dec 2020 18:59:16 +0100
Message-Id: <20201210175916.187273-1-philmd@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Dec 2020 17:59:24 -0000

Do not display virtio guest errors until the user request it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eff35fab7ce..bde0d31c5d9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3622,9 +3622,11 @@ void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
 {
     va_list ap;
 
-    va_start(ap, fmt);
-    error_vreport(fmt, ap);
-    va_end(ap);
+    if (qemu_loglevel_mask(LOG_GUEST_ERROR)) {
+        va_start(ap, fmt);
+        error_vreport(fmt, ap);
+        va_end(ap);
+    }
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         vdev->status = vdev->status | VIRTIO_CONFIG_S_NEEDS_RESET;
-- 
2.26.2


