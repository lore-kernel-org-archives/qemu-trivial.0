Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxCf-00057G-JF
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCd-00052b-G0
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCb-0008Up-UQ
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
 b=RntxbnbnIhP+l7Fv8jxOoodoM3K67oeX/V0kH4oFKzMoB8odGz0cZDl1Img98P068o/sGJ
 FOy5bVI/O8ovQa1OjOwfDHYNdB58mGvc7HqI7eSihtMUDXylutCb2sdPunIrgeQwe4eoXL
 a5NrEbDNuo7G9sTzxBO3nZ/YpX0D9q8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-cgQnHRcyMrqbl0sv8zhL0w-1; Mon, 12 Oct 2020 08:45:16 -0400
X-MC-Unique: cgQnHRcyMrqbl0sv8zhL0w-1
Received: by mail-wr1-f72.google.com with SMTP id v5so9304873wrr.0
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
 b=L4UZmV40SEGPX/3TKB6xV75lgnnEmfIc8UvLI2SX1+hTm6T9r+SWa6tVPiROEgu0uX
 MpIIxHVAWxGi+hcUt2iS5BYhuheTmPlC4oya844d0BxLsvuzpwhD9zf1aujRQqgFyas5
 H12LHmfr6yMZIGXuzxW0E6U3P24BjS51ljn9CHvj7/M8tbe6tko/r9XdHMkE8MG21uS/
 iIecaB6vMlZ0XT6b4zyRGIZ+zdG1MxeR0Lcls6Mc/H6IACPmHK6jyx3sciRejZEDDfCc
 JRrdtntpo3nA7AzhaGMbpdeQ06+68l2/zLIMw7wfgj4M/mC07k5qN5jo283z2DX0Nx7p
 6ILA==
X-Gm-Message-State: AOAM531eJHslkZXZq+Gv3ciNPUuJn67TJ41JWUr66/GtONk4RZRQYKUi
 e4YHLg32Rhog8wTlBL57NDTY2PyvmflRO2GQp18je6ViDS+9UIujWd1zRj+Ea0/zHzW+kVHY/e7
 WJEYFXJ/ikqZ7gOxwrA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753232wrm.295.1602506715237; 
 Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyueR4JjpNH2sLzfTjSqD0R65Ts5ka4vohHBW3dn4ShgyH1BUlk0MTIhNUHnqavD80ySjglhw==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753217wrm.295.1602506715091; 
 Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11016383wru.50.2020.10.12.05.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:14 -0700 (PDT)
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
Subject: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more readable
Date: Mon, 12 Oct 2020 14:45:02 +0200
Message-Id: <20201012124506.3406909-2-philmd@redhat.com>
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:23 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
Rewrite it extracting the shift operation one layer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..abb3ee86769 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
-    (((funno) << 8) & 0x700) + (regno))
+    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
+    (((funno) & 0x7) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
-- 
2.26.2


