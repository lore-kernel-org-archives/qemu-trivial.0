Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6y33-0006Do-Rk
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 10:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y32-0006B8-QH
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 10:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2y-00023q-5o
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 10:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
 b=IEoCFb6h4xOBZlAtd9Wc+9l7byXUA9akS21dopTe6XwusVbsCcfJ7iw34m3TzWxGekEhbp
 iDSiycpU9sQBcN2FD2pbvIjimGT/+hK+UJ6KusbTOSI93dd+3uavOkN+6FJMmAGxZVFxpn
 L++KAQgJiQprkDzNJc9ZM2U9FJtgNAQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-bRzeQm2vOfur9quD3PSE-A-1; Tue, 02 Feb 2021 10:56:50 -0500
X-MC-Unique: bRzeQm2vOfur9quD3PSE-A-1
Received: by mail-wm1-f70.google.com with SMTP id z188so1663914wme.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 07:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
 b=DYy9g8b5OdW0FhGTZGWUEkQvVvyCkZ1r7Z7BwrsarNBnHbQl74aj+2F9DiZgw1fcdi
 97JrUyoV6mASWtAknUKf/G3tYORhRsdfqKpjBB9z2bgE9GIJIe/LTP2z1f6p5E82Eeb4
 zZNeeE5QhS+Y1jZIbooF57A1Xxu+sQ9ADsCbS6jxcyz25enXS4tg22w+vOD0nZgjIWew
 IsKh18mkHsANViwfIFaZU8VzM8Ft2PoBr8lZ70SPEAevToT9fuiRWdWEBgvQWo5i0ymn
 NAa6I9DqSvxZB0LhN5ad0ldjb0tdGFbi3RzO1aGKTT0ivpEC9QVZ6s/zI2U0x7ZFwH9b
 XMVA==
X-Gm-Message-State: AOAM5323Fg9D1T+fFEZA8ZVrTNs9LOoyPjPXETF8KXLV+Ikx6wazjL+W
 gGT0Of2F9y4wgVSy7nyGxu2uVCPkQm47A7uAx5qrnIQwfzOanOuXoLM8H6vYouQj3c1mlcUMhR1
 1Xe0gJDtRUm/fI0S2IA==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr4281522wmk.98.1612281409504; 
 Tue, 02 Feb 2021 07:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKYLHerQzAoFfIr5Ish+YXWqEJkYkVd0aR+Ev7o1WaT/vyuU1T9BTgcwcLSBvcLIpm7WrhFg==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr4281362wmk.98.1612281406773; 
 Tue, 02 Feb 2021 07:56:46 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u206sm3928158wme.12.2021.02.02.07.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:56:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/i386/xen: Remove dead code
Date: Tue,  2 Feb 2021 16:56:44 +0100
Message-Id: <20210202155644.998812-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 02 Feb 2021 15:57:01 -0000

'drivers_blacklisted' is never accessed, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/xen/xen_platform.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7c4db35debb..01ae1fb1618 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -60,7 +60,6 @@ struct PCIXenPlatformState {
     MemoryRegion bar;
     MemoryRegion mmio_bar;
     uint8_t flags; /* used only for version_id == 2 */
-    int drivers_blacklisted;
     uint16_t driver_product_version;
 
     /* Log from guest drivers */
@@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
 
 static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
 {
-    PCIXenPlatformState *s = opaque;
-
     switch (addr) {
     case 0:
-        if (s->drivers_blacklisted) {
-            /* The drivers will recognise this magic number and refuse
-             * to do anything. */
-            return 0xd249;
-        } else {
-            /* Magic value so that you can identify the interface. */
-            return 0x49d2;
-        }
+        /* Magic value so that you can identify the interface. */
+        return 0x49d2;
     default:
         return 0xffff;
     }
-- 
2.26.2


