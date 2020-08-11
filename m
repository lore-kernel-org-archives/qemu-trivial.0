Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5W1V-0006TU-Ji
	for mharc-qemu-trivial@gnu.org; Tue, 11 Aug 2020 11:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1T-0006Qz-5A
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:17:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37381
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1R-0000d2-Fi
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597159024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYm/E2Wo6qfVLKyq/CcNoD/hCMqV5D8p7xguVa2y5Zo=;
 b=TI1NF15mQx6jz3ZKn+cKRq7zoscWOigzi0vUInDM+gFuNv02w4d0swEMWoOujIcB7aeS18
 OvkGq2qv8IjuiSwpkFBuiVG34m9zmDGKlgr82Dr2rt1yikdaCjopdRhQFWocCxnS+HCcN9
 wnFHjOZ1IXeGHrJgsYYuk7CPoEXmyrI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-YWocmbIeO4qmWS83txvjGA-1; Tue, 11 Aug 2020 11:17:02 -0400
X-MC-Unique: YWocmbIeO4qmWS83txvjGA-1
Received: by mail-wm1-f69.google.com with SMTP id k204so860553wmb.3
 for <qemu-trivial@nongnu.org>; Tue, 11 Aug 2020 08:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYm/E2Wo6qfVLKyq/CcNoD/hCMqV5D8p7xguVa2y5Zo=;
 b=nv0LuwqJEUjkeE3OaFj8Ne2OMDG1fZHGnQx9hAdCvp2k1Oybp2s2VfC8B7/kbMhSX/
 7vYfQL/s0peiEExDXK5aiNjc35hzIxKHcCxpdYJUWCDtGwUBsR4cYA9WQNrKTp8JsAz+
 izJntvt9WeXocdtz5veT14tFbiYA3eRjnzE4cKLmkceoWsdfiv3X/8miyAeirpCs46JP
 I3hHA73o676alLD/9Qxl82G6X/3lHmT8927+iWxofrilKIAtUAQfPOXvjtzrS/rnd24d
 CGnsedLo1n4EpoDxmhKMj2yfwyOyB6Twowddth5pIhZoXOWqk3yAz0OMn/f8KZ4SjqA6
 1odw==
X-Gm-Message-State: AOAM532HICoS43e57U4nDxh/0uStDvWfS4NA/H61BgPvSTc0viXZIbCx
 qh4rS9n01UDs07jrZgV2cshxvH85FKzK1Cqpb9A2x0sT4x8PxTS4W/sDAlZwAwEIogY3qlNuAHV
 vntTTaRd2eh+qr8+OLQ==
X-Received: by 2002:a1c:28d5:: with SMTP id o204mr4631377wmo.104.1597159020933; 
 Tue, 11 Aug 2020 08:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwblnJKzh66Is96SUBwlzOgKe5GQW8aNd2Fo28K0C5cZ7Rhr4V8QnK1XLKlgPPpScad9uTsgA==
X-Received: by 2002:a1c:28d5:: with SMTP id o204mr4631358wmo.104.1597159020721; 
 Tue, 11 Aug 2020 08:17:00 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z12sm27297339wrp.20.2020.08.11.08.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 08:17:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 3/3] util/vfio-helpers: Fix typo in description
Date: Tue, 11 Aug 2020 17:16:43 +0200
Message-Id: <20200811151643.21293-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200811151643.21293-1-philmd@redhat.com>
References: <20200811151643.21293-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 02:18:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Tue, 11 Aug 2020 15:17:07 -0000

Remove the second 'and' introduced in commit 418026ca43
("util: Introduce vfio helpers").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index e399e330e2..583bdfb36f 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -173,7 +173,7 @@ void qemu_vfio_pci_unmap_bar(QEMUVFIOState *s, int index, void *bar,
 }
 
 /**
- * Initialize device IRQ with @irq_type and and register an event notifier.
+ * Initialize device IRQ with @irq_type and register an event notifier.
  */
 int qemu_vfio_pci_init_irq(QEMUVFIOState *s, EventNotifier *e,
                            int irq_type, Error **errp)
@@ -505,7 +505,7 @@ static IOVAMapping *qemu_vfio_find_mapping(QEMUVFIOState *s, void *host,
 }
 
 /**
- * Allocate IOVA and and create a new mapping record and insert it in @s.
+ * Allocate IOVA and create a new mapping record and insert it in @s.
  */
 static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
                                           void *host, size_t size,
-- 
2.21.3


