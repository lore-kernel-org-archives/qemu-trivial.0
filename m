Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxD0-0005rq-KU
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCx-0005oo-Pt
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCu-0000AY-UQ
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
 b=Y7/HgaykXGJaGQG1ddlXdHHOTOYd1wURQ8nb8ZWa64+1Rx459M+bMwX7wddfBvNj9qjxS0
 Nd4g8YhzGiqJl1gR4ZxzdoQRDBc+hcXr+4kjoBSHj/HFJLgm/53tHu/4vO1Jkl+62wXf48
 ZdMH6nEJ9Jveq//6sLWsQNxuZS8qO+Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-dtkZFxkcPqOGnIRM60K7vA-1; Mon, 12 Oct 2020 08:45:38 -0400
X-MC-Unique: dtkZFxkcPqOGnIRM60K7vA-1
Received: by mail-wr1-f72.google.com with SMTP id p6so8755264wrm.23
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
 b=nLGB5N2Z8JtGt7ZybjA+92rogabhipZneml1kwYok+y1aGxJZM5U2QIymEW85lORC2
 kIKfcNrxN9GSmvJKOtF5WUDG8RufSg1XcNdI8Xlr7N7TstFhtrvvq0t1auvgAI/GtiH4
 ERsjTD/F1iGr2fy0Xd9c8HiPRFyOrENjEO44NzlEsG6r25v+rsmY9bnwDGvWoh3Pb51U
 M5DpR/xfc4wXHDechdaO+vMaFHCLbZ6NIuCsVLDr89MwQXfg2ec9mO3VmvKfaeXa7aQq
 trHgVzJ/4BPMn+AFewlcJt4VBtcWUXa0YSIETrXLGiHczlEUSLViPHAhQZMAm5LHVs87
 k7Ug==
X-Gm-Message-State: AOAM531GBy/babfzeeLnql7rsMy5IIDZAZ02V3Yg5Puvhfe28qdByGSW
 0G9cpBZp/iq36zgiwWCUGfsqgxEulwYo88URMv5Ik4Q9pRVo9hMWMWx1ftuYy6c5TfaWpRFHhCL
 WE+Zm5H+4/tfmgwKmuQ==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544377wrm.241.1602506737179; 
 Mon, 12 Oct 2020 05:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGju9pLDMIkjylp5prt4ukBOzX2jmiDpK+NGjR15EPrzwXN0JDbAFCeWH5hcu15IBYdHhmBg==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544349wrm.241.1602506736967; 
 Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id s185sm22765462wmf.3.2020.10.12.05.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 5/5] hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:06 +0200
Message-Id: <20201012124506.3406909-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:44 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_DEVFN() macro in "hw/pci/pci.h"
to pack the PCI slot/function identifiers, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c          | 3 ++-
 hw/pci-host/uninorth.c | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a988d68..f601ef0798c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1144,7 +1144,8 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                      full_irq_map, sizeof(full_irq_map));
 
     qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, /* devfn (PCI_SLOT(3)) */
+                           cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
+                           0, 0,
                            0x7           /* PCI irq */);
 }
 
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index c21de0ab805..f73d452bdce 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -70,10 +70,8 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         /* ... and then convert them to x86 format */
         /* config pointer */
         retval = (reg & (0xff - 7)) | (addr & 7);
-        /* slot */
-        retval |= slot << 11;
-        /* fn */
-        retval |= func << 8;
+        /* slot, fn */
+        retval |= PCI_DEVFN(slot, func) << 8;
     }
 
     trace_unin_get_config_reg(reg, addr, retval);
-- 
2.26.2


