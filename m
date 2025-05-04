Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLW-0007Zs-7u
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLU-0007Xd-Do
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLS-0005D2-Ky
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22c336fcdaaso42788775ad.3
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395877; x=1747000677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T30H+Xqi+D11ghfM6nKfQX3kyu+3U71s0mbiqhW/0/s=;
 b=Pdql+r8rx25wcbdLqYhCuGSz5nCZ5G8dLSku0WrvlGhXkJ/BttljvjXgoxNtRYqQUK
 4C8aVqjomPJoDcA6MOAx4DQLIT2o+AxAu6NH98neUaiOaeRZv2ugd3/L7vrioKeSrKI/
 RPL66q+R/xaM5NPcwNHLcmpap5+TGCHr1xcBCsKtlJxR2UETAk0sWTkiUnSeJrLwI4a0
 6vMDsRllX3R8AXkENmqXG3WpnT2DkW05nS7tVrpRHKExODQcGn2eRErtO/+w+sUBvEes
 nY0zqHqA9r+zExtp18gbcShs7uAhIzxQzQ++NGo7eIgU6ItnpAn+pccU4K7L8xXt3eHU
 z2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395877; x=1747000677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T30H+Xqi+D11ghfM6nKfQX3kyu+3U71s0mbiqhW/0/s=;
 b=lh2t7TWyjX5F4O2nDf5DlybXCwKN1RzzzKnprtA2FDZaAzWxKigs8ykiOLxH3qJn6+
 nxDshJBq0cKwLeCLLKi9Jp7R1pUQvnSK2shpi5ihEN1g1AQUB8vMShc+RdxTtLmI/9di
 +KPwlAVTD1kI8Unr0RWaJ+tk1Be9IxYmhaE6zAe6EoQVMCeBXJdcTpr3Pvz8nGaBaJps
 fu+jDRBZFr9BVfL9gjIiXdJzZfD+b87hESXs80clj3JdaflrpZX+NjO84otCOWNKJEvx
 lPP9PWVM7lruAd6y8aTHmQO9DZOBbzx3O/YrlRDS/12o/F6s3FVwlFwXFzQTSaBBgxg7
 ZrJw==
X-Gm-Message-State: AOJu0YwxXALm4sf6UV7fbdTL5zpcdzTJl/NsS9BIHDQJEfRywhLwxB2B
 wkK6AKbsPVkRp+WwEw4SQe0wQWVb44xhsNZ/zQ87J+3VGBQqj7EY6LBCW7+Gjhw=
X-Gm-Gg: ASbGncurA2O6j0zOQ6MfeyrgYdWASNBdjHpLTOGkgeEz2xfJWg3ksjkOzfi9Xcd/NN5
 ilvvwcZy3RiviYU8KQ/BXLRJ0V4NqS6e450g1h5sHmYMLkGMTkq6PxT7bUPx1JAuXyOmlYdewNw
 1Z3R2Y8esTVOIw5Ax0TBYQTJ2Wn9CDtMA6gqG+aaJH9V7vXTdOf/9qxFvJcGkMeeGEVRM2g9Pku
 59CxUPkWwJ7MvmcwP5cQ/AaAD2gPd9XzJbXLyZhIOjb9MI40gpqhJebhF0Z7nZr60NbJj8T8wTL
 hKgSeYL61Tw0vElpjI2bUSnl/Z+Fs3rkIsrNDUoH9W13U0rc
X-Google-Smtp-Source: AGHT+IFLOYo2VF9CCIcRfjuhSTmt7XVXCxZ/TEOLp6sfRYPRnAGNb5E/aa3DrqbfoYXE3MAPRWeKPA==
X-Received: by 2002:a17:902:f686:b0:223:635d:3e2a with SMTP id
 d9443c01a7336-22e1e909934mr73071745ad.23.1746395877119; 
 Sun, 04 May 2025 14:57:57 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:56 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/i386/acpi-build: Fix typo in function name
Date: Sun,  4 May 2025 21:56:36 +0000
Message-Id: <20250504215639.54860-8-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:58:00 -0000

Fix missing "i" in the name of the function responsible for adding the call to
the PCI notification method (PCNT) in the ACPI table.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/i386/acpi-build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b5836417a0..f40ad062f9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -589,8 +589,8 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 }
 
-static bool build_append_notfication_callback(Aml *parent_scope,
-                                              const PCIBus *bus)
+static bool build_append_notification_callback(Aml *parent_scope,
+                                               const PCIBus *bus)
 {
     Aml *method;
     PCIBus *sec;
@@ -604,7 +604,7 @@ static bool build_append_notfication_callback(Aml *parent_scope,
             continue;
         }
         nr_notifiers = nr_notifiers +
-                       build_append_notfication_callback(br_scope, sec);
+                       build_append_notification_callback(br_scope, sec);
         /*
          * add new child scope to parent
          * and keep track of bus that have PCNT,
@@ -1773,7 +1773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
-        has_pcnt = build_append_notfication_callback(scope, b);
+        has_pcnt = build_append_notification_callback(scope, b);
         if (has_pcnt) {
             aml_append(dsdt, scope);
         }
-- 
2.34.1


