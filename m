Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxCo-0005Uy-Ag
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCl-0005PN-Vf
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCk-0008WD-3l
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afTxi5eJGUK9TCxtbNIddaNUCDX7pFC3c3DvHTcAqpY=;
 b=hK5hh1AuKbwDdRxUb6JVmjC//L6O5JkupYkYAEQjRSSZG/0PkhWK3ImHdUNmJve2pab3+8
 6x+lzS0CL8ko0o+YtCX4bzBSLQW4lk+bvHgRHhdQpFBmPXbOq5qG/5g7XB/Q4qC8cOuiGN
 4Qo+Gc/1ycnllMXqJGtU3PaUBqNLPsc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-wOwM_bVKOB2Tumzt7vw-rA-1; Mon, 12 Oct 2020 08:45:27 -0400
X-MC-Unique: wOwM_bVKOB2Tumzt7vw-rA-1
Received: by mail-wr1-f71.google.com with SMTP id 47so9254920wrc.19
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afTxi5eJGUK9TCxtbNIddaNUCDX7pFC3c3DvHTcAqpY=;
 b=Mm5LNlAkXS+f8+LMm+nOEE2fowmc7Ntueu1LbvG+lg94NFV5tNpPhE5JPK6xBIjicv
 iYsoLDhHywUGSTQlEszIaD4CazWgoKGU6UG8SrDzIBgcaOwoTMnU+eym/O33HjO02gTW
 +I8ug6TTAKQbp0F6KHXiS+OKLBgztiSjtjWWNIgx1JF4ZDZXpMKGN+60++yUiK8zTIUf
 AUEsOU6sh9AC9BnHBQZ5qFwEu8dRrCEsrETJZxQj1PDGGaR2fUinjNq9xVF6hp6/1oeK
 op2+PQu+rK1CWIluF43HIZ20SyQ/0i9/zLEvB97GAMUHyGNaQBC90C4Qzm7m+C04H5LU
 yK8w==
X-Gm-Message-State: AOAM530lQQ9xbPKW819E1KVqcwLBJGFN/sic/GscKEJdId7rjKaMqkj0
 8W5dyn7rZjXUtFHho+IY6Po+9yHhhOac2TjNiEp6fXs7ncLNKKSjmCMjzPQONo+HMUhbLo6L0Ph
 t0SIlgL4DHwlDFUrynQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr10299477wrl.70.1602506726315; 
 Mon, 12 Oct 2020 05:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpp+5kB0ZYqB04uT+WIG2a4k9Wmj2oRtvHubS3HvdSiiZu7CRJnV3hLF0c9e7ixdPrjPJpoQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr10299453wrl.70.1602506726102; 
 Mon, 12 Oct 2020 05:45:26 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d2sm14916896wrq.34.2020.10.12.05.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:25 -0700 (PDT)
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
Subject: [PATCH 3/5] hw/pci-host/uninorth: Use the PCI_FUNC() macro from
 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:04 +0200
Message-Id: <20201012124506.3406909-4-philmd@redhat.com>
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:32 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_FUNC() macro in "hw/pci/pci.h" to
extract the PCI function identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/uninorth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 1ed1072eeb5..c21de0ab805 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -65,7 +65,7 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         if (slot == 32) {
             slot = -1; /* XXX: should this be 0? */
         }
-        func = (reg >> 8) & 7;
+        func = PCI_FUNC(reg >> 8);
 
         /* ... and then convert them to x86 format */
         /* config pointer */
-- 
2.26.2


