Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxCi-0005Ep-3x
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCg-000591-Bb
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCe-0008VS-C5
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
 b=UkT5GRgFttURbsFo2rWy98QsdLC50MaBIDAzU5UWSFUhgBNTQldOvYSB9THd7uq+93GcS5
 czDI0G+LNyv5f/pMHDFSmXdyaE+aJQnkejwqseA5HD/TCcd5HnLx4Boqw0vLyrOXK87naf
 XfRFI8vg6bA4w+5pGzvN/eyqefgNc8I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-0PH_SZwANwy1ptvr3PCyFg-1; Mon, 12 Oct 2020 08:45:21 -0400
X-MC-Unique: 0PH_SZwANwy1ptvr3PCyFg-1
Received: by mail-wr1-f71.google.com with SMTP id n14so5758999wrp.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
 b=ZTxT2CqmYiJbqUsbPBg1c1v4E3jjnHXbtiVtFpN0/C3qDqqAQi5nGMRyzm6UDCcRtE
 ydHt/RxizKb3INX5wS7DO3bA/E81FHyEzOHtJLZX0jhrK8bk9t0+mCCW8RGUV8GhLPoe
 qxDlvi+bgWmKnYj1Q1W5lNIkXJwVe06dmgy+1+rsLxMFOESh5GkfqDFBgYuY+aLdFmK3
 vQgk8+3TQm8AP/Qv2eLDsJeWVhZyh3/yMlWUR2UUBjC8yi/aAO4CqkPjYyp6rCd0tdXV
 cQJIjxFv1z/ejVsXqXGVyWvcWME2bQgnCyQVw5Y8L5ipWESHcLOADo37Qni+yzkQ/rCi
 EKyQ==
X-Gm-Message-State: AOAM5306U8lhd6KJg1q24SC26KDLfA7lAe6eHLhQLlaQ6RgJn1A6mZmo
 yNPB3jfOgBrhrGceH2hneysGJ08MH366oDqaZ4pNhkUJ1BsZMc++wb60GUpNQTnLwSmg418zmPJ
 ycOlxph43faK1y/gMVw==
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319163wra.104.1602506720839; 
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUet7a3+icknkdXIUBYsqHO/fz4MbL6X5ByiZqEc6CjjMuhyc0L0IjJS+YtIXZM/ET90duwQ==
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319151wra.104.1602506720677; 
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id b5sm2564766wrs.97.2020.10.12.05.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
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
Subject: [PATCH 2/5] hw/pci-host: Use the PCI_BUILD_BDF() macro from
 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:03 +0200
Message-Id: <20201012124506.3406909-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:26 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
to pack these values, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c   | 3 +--
 hw/pci-host/pnv_phb4.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index abb3ee86769..b05295639a6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
-    (((funno) & 0x7) << 8) + (regno))
+    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 03daf40a237..6328e985f81 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
     /* Read RTE */
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
-    addr += 2 * ((bus_num << 8) | ds->devfn);
+    addr += 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
     if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) {
         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
-- 
2.26.2


