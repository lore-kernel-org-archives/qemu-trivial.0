Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzxa-0000HM-HK
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 08:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzxY-00007m-6t
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:27:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzxT-0003gr-3e
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:27:03 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso815965a12.1
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725971210; x=1726576010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxicRzYkmvOskoD/w+UVeNTJwRS2R7t5eol06ROza4s=;
 b=Lytm0O25CYaJEPtzl8PssjB07zGLrJuAmXSUnu9R5WP3kq9QxzG0HN3TDZjekfNJC6
 emYEL5KfljC0TQST7TKsbeB0eM0bcIKrPTzRgMwzkl3vhtPHiNZd6nGyCVbtba4SYHLJ
 jBqIjibrlVAVLJrYfc38k4SIQVi4Zb8ErJlW7ONngCXQrQWZOIh+++CQdX6BFCp9fOKZ
 78VaYhEoyBO9BGw3HSY2ROqPIF7pjE8AzQMaT5uCOQv87V5s77CtiM+vJwFZzfXrQL+M
 qyFDUdE5fr+p76UKLS/mj1Sl3253jtH/EevH5TP3hyMxtvsWCJ/pJl0+f0XIhUTudsCQ
 kHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725971210; x=1726576010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxicRzYkmvOskoD/w+UVeNTJwRS2R7t5eol06ROza4s=;
 b=vPaOovVN0s2oELmAjTP0MW+0VJz9vifLosHj2OEldOGn9ZBvu6bbg+aacY29DnoJFF
 2M8baJs3JnQ2PT9D5PJdOEmjO4WdhZEp0O/Aqk59X54IdZwSVwHMmWjnMuyW18fDuM1b
 Cm09KOZlyShQy9uOHy7jiU6XuB2IDE/enqnYxzvPpX4HzRc1wNOmlj5UWeIMKPZLbwwd
 et1OoXn2Q5TB6KacIYDlNBUnCKt4JJGI77QP6iLyMKBIvD6aNgF1JLZC1byXyFLFXuSY
 CDpFJNaxRDM6zkblMt/gAtMJxXZSx+euq0imled9TDnOznZDDBodleeYQ3+OQzFizwvo
 oAXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVA75be5ljlxS6HTEAlh4D4Hg87+5O+zcjjTbcn4izUbnkMQ/aKpwH1cvS3Gu0c1Xz6g5mCHCT6ivJTsc=@nongnu.org
X-Gm-Message-State: AOJu0YyRR6bI2UTVvn+PDnmMUgpjRM/572XaPYhXH314hvm+ICOYOxBH
 l0g7jafIN8endMSfi2uBDKJBxLt9lvh3rvVlVwA+eyMWIMoZ888kKaMSvyHxKq8=
X-Google-Smtp-Source: AGHT+IEWbmqCW4isrelMC/Q812pWqlHTYlksWqqGqXgNFrfbtU0CScphGUh8LevT1TFKyigx8C4fuA==
X-Received: by 2002:a05:6402:3903:b0:5be:fdc0:e704 with SMTP id
 4fb4d7f45d1cf-5c3dc79323dmr9566347a12.10.1725971209820; 
 Tue, 10 Sep 2024 05:26:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523casm4207838a12.58.2024.09.10.05.26.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 05:26:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/5] license: Update deprecated SPDX tag GPL-2.0+ to
 GPL-2.0-or-later
Date: Tue, 10 Sep 2024 14:26:17 +0200
Message-ID: <20240910122618.33056-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910122618.33056-1-philmd@linaro.org>
References: <20240910122618.33056-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 12:27:04 -0000

The 'GPL-2.0+' license identifier has been deprecated since license
list version 2.0rc2 [1] and replaced by the 'GPL-2.0-or-later' [2]
tag.

[1] https://spdx.org/licenses/GPL-2.0+.html
[2] https://spdx.org/licenses/GPL-2.0-or-later.html

Mechanical patch running:

  $ sed -i -e s/GPL-2.0+/GPL-2.0-or-later/ \
    $(git grep -lP 'SPDX-License-Identifier: \W+GPL-2.0\+[ $]' \
        | egrep -v '^linux-headers|^include/standard-headers')

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/uboot_image.h           | 2 +-
 include/hw/nvram/fw_cfg_acpi.h  | 2 +-
 include/hw/usb/dwc2-regs.h      | 2 +-
 include/hw/virtio/virtio-acpi.h | 2 +-
 target/riscv/cpu-param.h        | 2 +-
 target/s390x/cpu-param.h        | 2 +-
 hw/nvram/fw_cfg-acpi.c          | 2 +-
 hw/virtio/virtio-acpi.c         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 18ac293359..e4dcfb08f0 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * (C) Copyright 2008 Semihalf
  *
diff --git a/include/hw/nvram/fw_cfg_acpi.h b/include/hw/nvram/fw_cfg_acpi.h
index b39eb0490f..dfd2a44ef0 100644
--- a/include/hw/nvram/fw_cfg_acpi.h
+++ b/include/hw/nvram/fw_cfg_acpi.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * ACPI support for fw_cfg
  *
diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
index 0bf3f2aa17..523b112c5e 100644
--- a/include/hw/usb/dwc2-regs.h
+++ b/include/hw/usb/dwc2-regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause) */
 /*
  * Imported from the Linux kernel file drivers/usb/dwc2/hw.h, commit
  * a89bae709b3492b478480a2c9734e7e9393b279c ("usb: dwc2: Move
diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
index cace2a315f..cdfbd943ae 100644
--- a/include/hw/virtio/virtio-acpi.h
+++ b/include/hw/virtio/virtio-acpi.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * ACPI support for virtio
  */
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index 1fbd64939d..25686192c0 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -2,7 +2,7 @@
  * RISC-V cpu parameters for qemu.
  *
  * Copyright (c) 2017-2018 SiFive, Inc.
- * SPDX-License-Identifier: GPL-2.0+
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #ifndef RISCV_CPU_PARAM_H
diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index 11d23b600d..a05ffcf78d 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -2,7 +2,7 @@
  * S/390 cpu parameters for qemu.
  *
  * Copyright (c) 2009 Ulrich Hecht
- * SPDX-License-Identifier: GPL-2.0+
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #ifndef S390_CPU_PARAM_H
diff --git a/hw/nvram/fw_cfg-acpi.c b/hw/nvram/fw_cfg-acpi.c
index 58cdcd3121..2e6ef89b98 100644
--- a/hw/nvram/fw_cfg-acpi.c
+++ b/hw/nvram/fw_cfg-acpi.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Add fw_cfg device in DSDT
  *
diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
index 230a669500..85becef03c 100644
--- a/hw/virtio/virtio-acpi.c
+++ b/hw/virtio/virtio-acpi.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * virtio ACPI Support
  *
-- 
2.45.2


