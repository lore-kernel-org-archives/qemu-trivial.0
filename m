Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knPkI-0001nI-Vo
	for mharc-qemu-trivial@gnu.org; Thu, 10 Dec 2020 12:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPkD-0001lr-Va
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 12:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPkC-000478-0m
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 12:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607621322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OnkF8Tn4lCrqBLKCn21DuDMmWVcEld5oTgeMIUmzvrM=;
 b=DdZrO0qpFomepSESPJ4G7ScKLTcLbOuH4ZyjgfFBi8PBUTFIViInQ9rMQ2Tj1b4PULdHEs
 KIS6A+3NAm33rzaa5+Djm5DfWrGd3saFQmBOM4SYBZ1HPUVM1wzxOm74YcIRGCtkMtJ2/3
 6llvqR5exMhoUXTD+0xEassFj6v7bpg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358--Y5lmnVgOgCCNu5a7vQ_NQ-1; Thu, 10 Dec 2020 12:28:39 -0500
X-MC-Unique: -Y5lmnVgOgCCNu5a7vQ_NQ-1
Received: by mail-wr1-f72.google.com with SMTP id o17so2191396wra.8
 for <qemu-trivial@nongnu.org>; Thu, 10 Dec 2020 09:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnkF8Tn4lCrqBLKCn21DuDMmWVcEld5oTgeMIUmzvrM=;
 b=iqSjnat7alohi9hK/FASHph8mfgX78D3RZNKAWmmg+skysezzncpOag7izb2bd1d+7
 44dnucPoxRd9tekcWei94DSJj9bVq4I9a+EXhfUjjdmP0E5Nw/IqddIeE0k40iowUFXw
 26oWu7I3HuYDfUUj9d9kQc9pZtxHY7NbCJh/FRkHK2f+xoTNcWA3Xw2w8AaOP163+NxZ
 T1YRlR7fJLpG+pISO1TSmob/CXm2TTvoNaQP9/IIa5WjFxYO8qSdwFgMLo6EdJZa2bWL
 66PEA64D/wSDocSWtxhFZoq/DoD/cieiHA+XfN7JGWG37PAJPx8z3tb8OLHcPZC2OOOh
 Hflg==
X-Gm-Message-State: AOAM532coRVJy24IJxRnstBlzCVGlOjKT7VGuHQAKsYx3982FLdZYNh3
 pVcMTeCiGizJYhrj4/NjePtCh9Mikl7Ltq1oN9cPiFhEyjDlmQtTQF+vGCHzdQfYLGvQWbZyM1D
 VLZEzU5Rp5mBr6N86Tw==
X-Received: by 2002:adf:8b8f:: with SMTP id o15mr9560609wra.311.1607621316920; 
 Thu, 10 Dec 2020 09:28:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9zFPfiITG2inh9BBvSevH3g6HsV2chB5pJXQWKTD/Ts0lUIWKFH46Wowf0PMMx4MwtX8fGg==
X-Received: by 2002:adf:8b8f:: with SMTP id o15mr9560596wra.311.1607621316768; 
 Thu, 10 Dec 2020 09:28:36 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id p19sm12765072wrg.18.2020.12.10.09.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:28:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Date: Thu, 10 Dec 2020 18:28:34 +0100
Message-Id: <20201210172834.178052-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 10 Dec 2020 17:28:46 -0000

Replace I/O write error reported with error_report() by
qemu_log_mask(GUEST_ERROR) which allow filtering.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f863f69ede4..094c36aa3ea 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
         break;
     default:
-        error_report("%s: unexpected address 0x%x value 0x%x",
-                     __func__, addr, val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unexpected address 0x%x value 0x%x\n",
+                      __func__, addr, val);
         break;
     }
 }
-- 
2.26.2


