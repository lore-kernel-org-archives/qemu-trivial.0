Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tPTlL-0001gp-Ey
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2024 16:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tPTlI-0001fx-LT
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 16:45:21 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tPTlH-0001vD-3U
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 16:45:20 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2163b0c09afso31867035ad.0
 for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2024 13:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734903915; x=1735508715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Jx370CFTAl7yh8PdG3ZOseQcMn3UXlcTs+5VqFVgwk=;
 b=et0WTLoWD9UufgsKKbUhxIEYwwyy84tL+OWUUpB1VzBsVegAI/0knDv53dQ/mmUNqW
 UmMF6+VxYPPasa7KU2UIXbelhtnIWU78BT0AILdMMG6RVJ/QHp8xN7VsUQ63aDN2Z+Zu
 vF19w8skXuMhsDdFWA9Lb9Md66i9ap0BW2OX8W5z2aJTWF+zl0GyTinHquYuAXIsrWq3
 9pRZm7GgLEA4OHGPa7Cc/VRpF6bugNj5HtUilrpaAwFizm0k3VQoQj8bTbB+XVawx9VH
 AWmNMIgZKiNoByMvSjNJBE+E0w49ISu3BRcpDf5nJ2jMLpXVU11Z3Gbt5LlXBSFDOnjI
 vMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734903915; x=1735508715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Jx370CFTAl7yh8PdG3ZOseQcMn3UXlcTs+5VqFVgwk=;
 b=Rdf5ID9xV4hQsCXa4lC/EAYCF6O14sp41OSAOjR0hCc+sNu9zkDYZ5A41RnhqK+NHw
 ZiMwEF+hXQOiBTQLgJvRmFbeLS7d7iZD1Cn7SCD+qthiM/gMWtozoamZa+JOVek7GxuN
 0zdgKyFeh9kUFb4KZLbccop11tmUkicrV65fG4tfLr7qkttZEXpwrv9pDPkJ1qsY1VaP
 Z+Ou/rHqMmihB/WT2HwBhgnDiM6+Ogal9awgGACTQZeJC9MrByCfhfy/DT00o2on+vb9
 tX6x3ioOqXgX0QoeXSWFTwmEx2lrVmm2TOoRL4LusY4gfPpXIfkv66fdlgq6X1zLVpXC
 3bNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJBRNhawXd86+nwKUxrBzFav5GDwgaG+EO4JKIuYIIOXQyRDiifsQaBCS1bKNAEh8Y8RlpWiD0QskPHOo=@nongnu.org
X-Gm-Message-State: AOJu0Yz3Qn9mG3q8C1sJlXEN2rRAWC4dneHMxJV+yu4S/4PselslSb3b
 E0tSVcgBgITwpcakAcgeibx9EHX/ZTeMgZnoJSk+IOWa6j+4y7PRpLq2ERkzSy8=
X-Gm-Gg: ASbGnct06Etl7GXNkJGtkgrid7o7GueMooJ3c6kAoGv3cFdWwzO7xbRI7JPhOTKtARt
 7Uioy8jdHcRdE+uCf4zAy7sINEkhcFAdaPUqFjPBZftM+Q9NliAj3RPXzNrzunSKhhDol6LInEn
 7GcCyR7HO12u8iT+wXgoDV1upGpEv6Tvh8WYdI9Y2e/31gvg65wAFA8Xj5zm87DPh6MuZ0ZKvA1
 B3Ow7LBKXvje4F1hUoiuFgGQ6HcFBvIyjkCNrw2l2qRwm+9qXL7vUQZaZBJF8xcbhjZJMT8mgTJ
 8PrnYLs=
X-Google-Smtp-Source: AGHT+IFKH9jwIo9aJMZrUJYkYeESxx2qnXCyqi01O2xyG92HUKJAvukWHW3gK6CRyMjpfQ7hL4ZwJg==
X-Received: by 2002:a17:902:d2c3:b0:216:69ca:7714 with SMTP id
 d9443c01a7336-219e6e85c30mr145820255ad.11.1734903915653; 
 Sun, 22 Dec 2024 13:45:15 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f7312sm60737175ad.225.2024.12.22.13.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 13:45:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/riscv/riscv-iommu-sys.c: fix duplicated 'table_size'
Date: Sun, 22 Dec 2024 18:45:07 -0300
Message-ID: <20241222214507.2173648-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Sun, 22 Dec 2024 21:45:21 -0000

Trivial fix for the following ticket:

CID 1568580:  Incorrect expression  (EVALUATION_ORDER)
In "table_size = table_size = n_vectors * 16U",
    "table_size" is written twice with the same value.

Cc: qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Resolves: Coverity CID 1568580
Fixes: 01c1caa9d1 ("hw/riscv/virt.c, riscv-iommu-sys.c: add MSIx support")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
index 28153f38da..65b24fb07d 100644
--- a/hw/riscv/riscv-iommu-sys.c
+++ b/hw/riscv/riscv-iommu-sys.c
@@ -121,7 +121,7 @@ static void riscv_iommu_sysdev_init_msi(RISCVIOMMUStateSys *s,
                                         uint32_t n_vectors)
 {
     RISCVIOMMUState *iommu = &s->iommu;
-    uint32_t table_size = table_size = n_vectors * PCI_MSIX_ENTRY_SIZE;
+    uint32_t table_size = n_vectors * PCI_MSIX_ENTRY_SIZE;
     uint32_t table_offset = RISCV_IOMMU_REG_MSI_CONFIG;
     uint32_t pba_size = QEMU_ALIGN_UP(n_vectors, 64) / 8;
     uint32_t pba_offset = RISCV_IOMMU_REG_MSI_CONFIG + 256;
-- 
2.47.1


