Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFcpf-0007Qi-NK
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 08:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcpe-0007M1-1G
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 08:34:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48603
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcpc-0008NN-E6
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 08:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599568479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H8Bt+SoGCwHI5v8vuo9aRmtnYuy2KkNT4W5PKJJ+pEo=;
 b=cUO+7oiwFG12NB9pkFrMxnq1JXWxb+xgP3VvFMbYRaFuB8uh7fjtjM4/WP3be3HVdEqybX
 oiaEQSYGI2XvgQCzEuvF0p8dCWEk9Gt07J4lC31R9FAJzqa+5nb5yWnuVCi02q/5ARvqrl
 YnHGTY/lcvOtqiuGClBCVmAB28pxYG0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-8x7_62HnN6KyiXpb4Vc_Fg-1; Tue, 08 Sep 2020 08:34:38 -0400
X-MC-Unique: 8x7_62HnN6KyiXpb4Vc_Fg-1
Received: by mail-wm1-f69.google.com with SMTP id d5so3432628wmb.2
 for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2020 05:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H8Bt+SoGCwHI5v8vuo9aRmtnYuy2KkNT4W5PKJJ+pEo=;
 b=ujpz+B3933+xBqM2WnT/8cMsKKgt0SxYc0wl5C6x+AfS948lKNoB67YXPeOPlBWYWG
 z5Yy5xnMqBn+0jTCE3fmF6koOTlNmIGqRWeYzzgTzNEVfhGjxzuQiq0v7nvCOycAOaKZ
 ot0tzBQy/1HT1WcRA3dtbRTQGjSW7qE6sRdAvCarA4vf3WPLxese4xtTqJl6apDYtCJ0
 wzKTXPJ3Z0nDvJ2DBCT5f/A0Oi9FsuoHSv4QTZ29fcmO++IjCDx2KDILOb39p5gTkcFl
 g9UcyFKjStlVzUkxqyagF46G2xlsYtOrt438oKieSm0HpUSSBtVqQphnIoXmbs3h74++
 hv4g==
X-Gm-Message-State: AOAM532sW+mfXxx3gJ3yABHLatFCaXXcIucqy6CWXuhp45SxdQJC2Pvq
 gHemDkj0VymM4w0M2QXjT6RasyNrLm+FrzRRwT2zTKdebk3jAIq0ZbdTx6Wi0DPiOCp/JM8kWh+
 bgXBCl1YmMfXf+DAbgQ==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr26245402wrb.212.1599568476916; 
 Tue, 08 Sep 2020 05:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHVDS7APNGfQg6onMvH5pOdGKb31yvi/vagMB+owAQf86vw4YlC+7eWYF0aReRutuR2PMNqA==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr26245379wrb.212.1599568476678; 
 Tue, 08 Sep 2020 05:34:36 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b11sm33839733wrt.38.2020.09.08.05.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 05:34:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/core/cpu: Add missing 'exec/cpu-common.h' include
Date: Tue,  8 Sep 2020 14:34:33 +0200
Message-Id: <20200908123433.105706-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 08 Sep 2020 12:34:42 -0000

cpu_common_reset() uses tcg_flush_softmmu_tlb() which is
declared in "exec/cpu-common.h". Add the missing header
to avoid when refactoring other headers:

  hw/core/cpu.c: In function ‘cpu_common_reset’:
  hw/core/cpu.c:273:9: error: implicit declaration of function ‘tcg_flush_softmmu_tlb’ [-Werror=implicit-function-declaration]
    273 |         tcg_flush_softmmu_tlb(cpu);
        |         ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 22bc3f974a2..63ece3662d6 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -26,6 +26,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "exec/log.h"
+#include "exec/cpu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
-- 
2.26.2


