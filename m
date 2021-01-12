Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzMLB-0005xp-GS
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 11:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMLA-0005xN-3j
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:16:16 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzML7-0008He-T4
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:16:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k10so2387856wmi.3
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 08:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6s1AwCaLK/CUqXxViLf0QxnciSlkvphZJyETdGYuiaM=;
 b=oRpIo2Y1rRJ8DVtP1zR1KfwHRvXkg5EyW2QPFWSRXfEiLIB5+m9nJBH5rtoJ88kJno
 5SH1mJ4JiWUB1H3rw6I8S2F7oW49AoQTHjUXB6greCuTNmGq5EDKvwudrsgZz69LqXIS
 YM2I0uub7h/1QfvSrdZZkGYfJguALNsBZCIxpWYfSqQZ6aY4zX76DsUZwfmzN/uxwUpf
 ZvDhqNXKm/VsoqXh6dhxSVL54BFfpPQspoOGkTb42MzziCPtqjZqljrDkV7quQlocDzB
 WEAPZLeDh6rTs1K4Qm/zn+GcDr9BiQgeiRJj0VyiGmWvCjlfACqvvATLJ3ZCalxCf/Yv
 N4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6s1AwCaLK/CUqXxViLf0QxnciSlkvphZJyETdGYuiaM=;
 b=TyFjISwAPiasdr7sfolfjuBAb0JMc0jSWmeMqLKJ0sJa9RfUCWJgBsUVXhHbGyVyyk
 J9WDbygwp+Ga3DHRc9ef82vp3nljLabzOs0R4KXgPMFHS284TICVCgetTtKsLiALho0k
 HnBcGnFiQJ7QnKbOTHhmbBsNN4iKJYScIfcvzOncZ8A9faVT8NWkM2VNnwvC6aNhoPgA
 ktDCSOCVNTiELWJboZt1857oqE6Sm7eGLyW+P18B0CLKMU5h3wTpaPBxYYCdnSImp+ko
 gpSlTD/qsTohkrtPK8AKrTjh2+MWv6dNXnj9tJuPAQP5MBbNCmqtj5GVPbOozCD/Ur8X
 fI1w==
X-Gm-Message-State: AOAM5320NjDtNjVQxfrZfrONXEY1Y7lG2PfAfYnW7jJ4rJdvK3R1lj8S
 UFgRHFGpNlXBfpcot+z03tc53A==
X-Google-Smtp-Source: ABdhPJyu/eQS4osi3GVbLAa+7CPvd1hVdMHzdVb/LomyWVkC08xPWNBD0FYZu5DoeDIlzSX6qMjybg==
X-Received: by 2002:a1c:df85:: with SMTP id w127mr44939wmg.166.1610468171073; 
 Tue, 12 Jan 2021 08:16:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j2sm5840061wrh.78.2021.01.12.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:16:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] hw/display/vmware_vga: Remove dependency on VNC header
Date: Tue, 12 Jan 2021 16:16:08 +0000
Message-Id: <20210112161608.16055-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 12 Jan 2021 16:16:16 -0000

In commit 2f487a3d40faff1 we fixed a problem observed with using the
vmware-vga device and the VNC UI frontend in a belt-and-braces
manner:
 * we made the VNC frontend handle non-multiple-of-16 surface widths
 * we rounded up the vmware-vga display width to a multiple of 16

However this introduced a spurious dependency of a device model on a
UI frontend header.  vmware-vga isn't special and should not care
about what UI frontend it is using, and the VNC frontend needs to
handle arbitrary surface widths because other display device models
could use them.  Moreover, even if the maximum width in vmware-vga is
made a multiple of 16, the guest itself can always program a
different width.

Remove the dependency on the VNC header.  Since we have been using
the rounded-up width value since 2014, stick with it rather than
introducing a behaviour change, but don't calculate it by rounding up
to VNC_DIRTY_BITS_PER_PIXEL any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/vmware_vga.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index bef0d7d69a7..e2969a6c81c 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -29,7 +29,6 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "trace.h"
-#include "ui/vnc.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -220,7 +219,7 @@ enum {
 
 /* These values can probably be changed arbitrarily.  */
 #define SVGA_SCRATCH_SIZE               0x8000
-#define SVGA_MAX_WIDTH                  ROUND_UP(2360, VNC_DIRTY_PIXELS_PER_BIT)
+#define SVGA_MAX_WIDTH                  2368
 #define SVGA_MAX_HEIGHT                 1770
 
 #ifdef VERBOSE
-- 
2.20.1


