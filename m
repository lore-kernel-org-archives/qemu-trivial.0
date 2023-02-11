Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQriI-0004mt-5B
	for mharc-qemu-trivial@gnu.org; Sat, 11 Feb 2023 10:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriF-0004m2-D9
 for qemu-trivial@nongnu.org; Sat, 11 Feb 2023 10:22:51 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriD-00085m-V0
 for qemu-trivial@nongnu.org; Sat, 11 Feb 2023 10:22:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id y1so8016488wru.2
 for <qemu-trivial@nongnu.org>; Sat, 11 Feb 2023 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBVEmZrqr4evLXhyxNSwpcErgC+DGTQFF+QpIR9ORpA=;
 b=NnVpU2cUih7b5fx1AAlNeRR5XXSQhqwUjtyrebMbJzEP8+mNkmMczGroqiZoEEyJD0
 aELarYqgyZ7JWMeae88GWPu4sWGsIZdZeTyilhVbbUZZqWyWC8IX0Jk2MMMVwWEXdR1I
 xuCsbANIchG+Npt9l+gczGF3cFCP3m/ekaxgAL624b15R+aC7olXEDn2c17ddZI/BLZG
 FaL+34Eb8Iw/8SNzcFICigqjt1NHjRx73z+m/7nkxMqCN5BilWYFK/D28DI6dimPHSPn
 QW189+nwqum2/EruLkTORrwaPoCMB1Z+69M5BTSTBRh/wnDNCv4OLwL6f7RntaEd+QsR
 TZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBVEmZrqr4evLXhyxNSwpcErgC+DGTQFF+QpIR9ORpA=;
 b=LHXTvRzg3JklHMfcK3sNYP5ib4ynPIssWNGLXq9yqg/LVVSt0+koA8ztwrYAne0V+e
 YSJttR5dAySrCqJMG/oNLIJDvGTwL9FhiidIpiyqs5PdUHHyItkH3FuTcUGhDOciggEc
 2mc86bKM55zQWVqzcCVGCtHR1s+sd6OnHJm9XOHG2gz3pbtNQQWmwi3sPoqXiW4gMh4K
 Yci1/D2sG+/mftHNdhhxGOElLVVgl+Hbr/i5sVSwOfKQ5VLKoVmIjyN1GGtNc1AqPCo+
 EjJplCdDWXHkRHNCo8onvwuT/EC6RL3afNgVTxbubnKxgeUbOTmICyLmh4rcxAjLb/HD
 OHGA==
X-Gm-Message-State: AO0yUKXEqk6djkKwR1+otVfNJnz7OIqjb8RPrE7ubXhyWsEtBPpDCuMe
 FO4dnsoaA+OYZnPVICGPqfGqtg==
X-Google-Smtp-Source: AK7set9htTGCe2Wban0FU1vU2vOOwyrYTwI5iw7+tau/N0EvBgur1cRBZdICzZsYvY3cTN6EzAMxVQ==
X-Received: by 2002:adf:e106:0:b0:2c3:e20b:82aa with SMTP id
 t6-20020adfe106000000b002c3e20b82aamr16394296wrz.22.1676128968289; 
 Sat, 11 Feb 2023 07:22:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003e001afa274sm9048631wmo.2.2023.02.11.07.22.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Feb 2023 07:22:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/pci: Fix a typo
Date: Sat, 11 Feb 2023 16:22:38 +0100
Message-Id: <20230211152239.88106-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230211152239.88106-1-philmd@linaro.org>
References: <20230211152239.88106-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 11 Feb 2023 15:22:52 -0000

Fix 'interrutp' typo.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f450..805e4b0c68 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1648,7 +1648,7 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
  * 9.1: Interrupt routing. Table 9-1
  *
  * the PCI Express Base Specification, Revision 2.1
- * 2.2.8.1: INTx interrutp signaling - Rules
+ * 2.2.8.1: INTx interrupt signaling - Rules
  *          the Implementation Note
  *          Table 2-20
  */
-- 
2.38.1


