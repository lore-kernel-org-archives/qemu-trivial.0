Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLH-0007Np-Ai
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLF-0007NU-3D
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLD-0005AO-HO
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224341bbc1dso47219345ad.3
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395861; x=1747000661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rB/8xBZmswHJCiwCgkX6MTRXJBKKdtzkzYjbWxeAqk=;
 b=jeFTCCw12a3RJuZ+DgZN/3LgS1MK0jokN9K431a1Rir09ZOvJGaDMXmkauMms82tFB
 swNq0Q3rW/XWBEONoqa+G+JT08PFxb+n2BfTYrkDLELYvZnCTk+8gZ6//qtVKDp6b4jx
 3/EXqm67Rru+7oqWat3t8afTy/N1A9kqfAsowrHhypjcRb+XvSbwag0eWoIxNcAh1nBb
 cPBsCV/UfuaJLNy4MpJeZ1DlJDlK+rDgiCCz3ffAy+JOlLFM2F1hF3E1BI331s418gZ0
 IUwptu8LPQ5wRkc2PHZnYoLE5YLZwOCdfieSNK7/hMFtPpHINYEDgYxHbLyboHpVTgo7
 qMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395861; x=1747000661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rB/8xBZmswHJCiwCgkX6MTRXJBKKdtzkzYjbWxeAqk=;
 b=VQPDqlIYHtELBhMOx/2R8wWt7U9Lt3WAadHz7LUyZSAY0KLgkzhVGPutL2n6cwLjBf
 QBNGVVS11j3QpS0jlmTr/t46tvKoTSUWl/cQIvkBqWriImXL8rdPiUiAohwvqw5gDMvz
 Oa3ht+CgDIE6BW03T9Ehe9YoeYYUDUbf4T+XBT+MrMbnU1AcUimzfo7vBRo9LpCrRDOL
 5gOvdFJGbNxEfjonmJWqGaLxUZJQAKB2w5CJoqr4fiAa224QT9l1Tms1n2tV8wDO1nMq
 AluvqTAoL4Gp4zHsZPQ5lEdT0zUW1I+hmvamUuUVVYVcV5/d4sD//Qxtim5zI7yLInQI
 Bg0g==
X-Gm-Message-State: AOJu0Yy/rt1YK6kFTKX/aJrYhPymYqRd4gisTARJimOpLPYNr5ikr31m
 dW6HkFljcGH64wke1/KyQBwA5NcJiIhvd8W5OkKh/Zn0BDLhjmTWt/aT3ojnU6Q=
X-Gm-Gg: ASbGncvQoEhC7ufYgcf/ri073cl0iqWdXKkvyne0Xt9A8e1c2EZsn8RF0HhHYHV40im
 gvwnKpKhOHvpDaUyO+/H/ugpRanp9QfEqxGhQCgklyAEywYZE4RKKOGS/2Ugae8woLRvD7VoMdv
 4k5yrhfycsofY+KEePGhHZhoAZOdrPPYTjRoOp/oBdAesq/F1zuhGOd82Lg7FyFk8GTSsGiZFOh
 0p3bG2smJBfoVHsv95R9UxG7Wjx3rszcaUyLGFRY8VCQEu8L/6gAR/ZMIDqm6YCtfMSaYe7VosB
 a7EzNN0SzQK23LyIbguw9Zd0OHcE/ZXhr0Xz7qdPlZm6vjBO
X-Google-Smtp-Source: AGHT+IGOfoUo5R8E50tqvpsstcNS8aNq+ltwe2IyoE4AGKB02pjVb7B7iD67sPWlh3UNySXRCQkILQ==
X-Received: by 2002:a17:903:1a30:b0:220:e156:63e0 with SMTP id
 d9443c01a7336-22e18b8612cmr87433525ad.8.1746395861469; 
 Sun, 04 May 2025 14:57:41 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:40 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/pci-host/gpex-acpi: Fix typo in comment
Date: Sun,  4 May 2025 21:56:29 +0000
Message-Id: <20250504215639.54860-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:45 -0000

Fix typo in a comment about the creation of the ACPI CRS method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/pci-host/gpex-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e8b4c64c5f..0aba47c71c 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -182,7 +182,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
             /*
              * Resources defined for PXBs are composed of the following parts:
-             * 1. The resources the pci-brige/pcie-root-port need.
+             * 1. The resources the pci-bridge/pcie-root-port need.
              * 2. The resources the devices behind pxb need.
              */
             crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
-- 
2.34.1


