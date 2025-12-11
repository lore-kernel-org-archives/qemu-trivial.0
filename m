Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124E1D41C3B
	for <qemu-trivial@archiver.kernel.org>; Thu, 11 Dec 2025 14:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vThTB-0000Wr-RE; Thu, 11 Dec 2025 09:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaronlo0929@gmail.com>)
 id 1vTccU-0005q4-CD
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 04:05:54 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aaronlo0929@gmail.com>)
 id 1vTccS-0005o7-GX
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 04:05:54 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-44ffaeda17fso370116b6e.1
 for <qemu-trivial@nongnu.org>; Thu, 11 Dec 2025 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765443951; x=1766048751; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aC0QiZKr/3DLPytD5Vsp0YSN+Shd7hwrvtulRp6ZC7g=;
 b=Y+Y0Nin8ngx58vri0gcgHleDrOysX79nu4QQSLxylG7XIwmIttTxyv+ORq4slnguVB
 74FBoxO+jZQLBIcwfACuOH8brCjCI+NMS2mcPMt5mSZjR1Tk1bwLNizZbnqhpD8fX6Zy
 PIJU6a7ygx/8oqMAA0GPis6r5AJB2aSCznNdv8xlROBU4eKFtlAUxEgrlgtVwL8XWVNQ
 knYVtPI4TVLM4H+hbqZ1M8Uh+qTb1BZVGdKcyK1F/JbDJPyx2rgGyUpEXgh3HnbzUxlG
 CPj4pXzp5eor3BpUedBVYWFIemPjXjjtGrrwfkTuLaQDUSM4jKSrEHPjWm2hTcaSyXEd
 U2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765443951; x=1766048751;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC0QiZKr/3DLPytD5Vsp0YSN+Shd7hwrvtulRp6ZC7g=;
 b=g5XN/7/wmY5og1PbRRkQtdzDWkgx68gju5TJAnlklor9I4Fa3EYhIqsJCoVCfmJbNd
 igK1vEZBG/esb7ZgjFCluDhhQcKYz1bynA86swD5dZfMSqG40atPTxSIqrI93cCa4aFB
 cLoi3m7XBIs3o6R8nL8JnvEBgYO1OOBKqleLERBVYnmmJCi2aNmJhlan6J+clQLCe2NW
 pGSji7Veuhsy5rFUczq1NxdjZSDeyexe2FgurHDUbc5wczOcL1SHMkk3Xp+W2/cJxSt5
 NI7IFMSZ7VfO4tgMGHOvUNRrM0mTN3SDcwKHDEukx8c9h5SMr/XU1McLtmv5xQmzmfzb
 yn+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9CGmtfkhZ2263iJBd+aycxGwYEkmPQzmjM6x1WbCD9pjmuZE2VQ5SswDLpqEs2XmTM0vFMW8r/OqqnJ0=@nongnu.org
X-Gm-Message-State: AOJu0Yy6Ixm1Et37LqTa5KMUgaQCYeurvzMZT25W9bR3po584jatkbkg
 4ojBdXg5QEO/FgqXqqSKfjPntkbX6Dw2BHFfHAiOHc6EW2O/yNB41SDl
X-Gm-Gg: ASbGncs6FqPYYC4kxJhCxgzkhaTjvqtiuh4lbOc1e0NXiN50xLcM+Nc+EYwVxd8RkPV
 oxJFZMuXuUteoNBfPqr612GE9Ju441O8IN+EpxS6X+KO1IlviDfyI537L8/HMtMLDjL7HNZq5O6
 dorxt+FQWbEiYs1Y4ZcJBE6gEJa2DM1KxWw1aGuDoFKnIVwZwJ/2mIC0n6X99eIrtdezc/gO0De
 470jykuBQJAmTBj1vnaJvtpR/G1ekl/xncYds3L3hGDAyKM3d1Kj5GnX9KjCwdwq8tTQk2HCe45
 poYYfhEqveC+acN2UyTZNnrZzXpP3euDKc+TyzV6Wpjdc7x7lxP9iaYUI7Xaye0dn5X5yNHMj9i
 VHE7am+9ZNuzZ0XawDb0RCMOLUP3DkjBfkV4c8aGQpYiQ4QdRTHEftWIANyJ2cJQxfiBUIrpnS+
 UK0VRb95X45bxt9f6YyZiQWnjOeNpRkbi8
X-Google-Smtp-Source: AGHT+IHB/b7LaZBKC5FO1HwvvHgHTr1Zqj7Gshvi/2mtEtRdifon0CHGV9XVt7IpZ3YUOp/70Hew9g==
X-Received: by 2002:a05:6808:2189:b0:44f:e3d2:59e3 with SMTP id
 5614622812f47-455866f5ea9mr2998679b6e.32.1765443950748; 
 Thu, 11 Dec 2025 01:05:50 -0800 (PST)
Received: from DESKTOP-M2KV102.localdomain ([66.112.242.31])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f5d5156631sm1285671fac.19.2025.12.11.01.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 01:05:50 -0800 (PST)
From: Aaron Lo <aaronlo0929@gmail.com>
Date: Thu, 11 Dec 2025 03:05:49 -0600
Subject: [PATCH] virtio-balloon: only create statsq when
 VIRTIO_BALLOON_F_STATS_VQ exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-balloon-check-stats-feature-v1-1-ae8951957b80@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGyJOmkC/x3MQQqDMBAF0KvIrDtgUqzSq5QupulXh0pSMlEE8
 e4NXb7NO8iQFUb35qCMTU1TrHCXhsIscQLru5p86zvnneOXLEtKkcOM8GErUoxHSFkzuIfcugH
 tdQigOnwzRt3/++N5nj9ZtL9FbQAAAA==
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 David Hildenbrand <david@kernel.org>, qemu-trivial@nongnu.org, 
 Aaron Lo <aaronlo0929@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765443949; l=1841;
 i=aaronlo0929@gmail.com; s=20251211; h=from:subject:message-id;
 bh=zbYfKIjnxCYX9hf677K+YYy9OUX21TXa8Xc2wOm3EEY=;
 b=Zh5q2llRkh4wrmuwNmVvf6In6FbRSzr7LsAzJLevx9rntkM2MuNb6bDMq+n7nzVDfGY/nTgeg
 CFrbMUr8CpID5SFKWIoacfnKVIuofwwl0w0rlEF3s1HtYtOSpD10Gc/
X-Developer-Key: i=aaronlo0929@gmail.com; a=ed25519;
 pk=8NbKHVJf2P8RqSXZ1l7w/K5TBnYs2yM+kTVDpAi9TP8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=aaronlo0929@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Dec 2025 09:16:21 -0500
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

The VirtIO specification (section 5.5.2) states that the stats queue
is only present if the VIRTIO_BALLOON_F_STATS_VQ feature is
negotiated. QEMU currently creates the statsq unconditionally.

This patch guards statsq creation so it occurs only when the
feature bit is enabled.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3188

Signed-off-by: Aaron Lo <aaronlo0929@gmail.com>
---
 hw/virtio/virtio-balloon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 02cdd807d7..f5d4d5f60c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -892,7 +892,10 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
 
     s->ivq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
     s->dvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
-    s->svq = virtio_add_queue(vdev, 128, virtio_balloon_receive_stats);
+
+    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_STATS_VQ)) {
+        s->svq = virtio_add_queue(vdev, 128, virtio_balloon_receive_stats);
+    }
 
     if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
         s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
@@ -932,7 +935,9 @@ static void virtio_balloon_device_unrealize(DeviceState *dev)
 
     virtio_delete_queue(s->ivq);
     virtio_delete_queue(s->dvq);
-    virtio_delete_queue(s->svq);
+    if (s->svq) {
+        virtio_delete_queue(s->svq);
+    }
     if (s->free_page_vq) {
         virtio_delete_queue(s->free_page_vq);
     }

---
base-commit: 9c23f2a7b0b45277693a14074b1aaa827eecdb92
change-id: 20251211-balloon-check-stats-feature-7ea658e038ce

Best regards,
-- 
Aaron Lo <aaronlo0929@gmail.com>


