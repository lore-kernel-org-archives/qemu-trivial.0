Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rc4Pl-0003WK-3v
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2024 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pk-0003Vb-EJ
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:36 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pi-0008Rg-VC
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:36 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so5867021a12.1
 for <qemu-trivial@nongnu.org>; Mon, 19 Feb 2024 06:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708352073; x=1708956873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J7bsYDfP840rvlPB/SKF671rHZmvSXNYnENubFOAY4=;
 b=fRlQMj6i5Xc5IPuTDGuslNsMhS1juNA1ayD4DuAhNmZUqHqo8TXKz+EKfnfGFD1d+I
 cQAYvFHDVUPcjmYPxv+1rApUA+TUZvkjdUpRquSR4d5oPqnhuDtTkk+Tc6AuKcje7+Yj
 8OWw0xeGZ2rWW1WKav6/6zLhkfiWHvNI+3dnCFeJ8HR0z4nYgpUmvyQJjjiQ1KOTl0iY
 FD2iRTt1MvPVCM4AzTJ/lugkZ0iTVYJHkmB76XQf8sy5pDPPvzwtoyQ03CzhRLuXKnW3
 UwRVUTS5BxpPwd9PhkPd7BIqF6g4MO2z6AGbHAH+MLl1XWI4Ho+iYdx1uUpIQV+Dl1tL
 1V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352073; x=1708956873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9J7bsYDfP840rvlPB/SKF671rHZmvSXNYnENubFOAY4=;
 b=rE6CEoiiTSCT7rzGwFliyv9gIRLwkC5PZX4H0OHF3TKuphb2NRntQCyeAmKfYBL0WM
 Fjj9YBENKkP/80x1EsU5Yd01d6UCZagI+ekx7jkQosf60YwiWE8SaloA/PpfpzpkXaVt
 jBmz8EAWImzKCMLlOtT5uKkaoMlhi9ahoA+N+XWb/hG1A759BZwv5Gholz8qobSjOaXn
 aJ2fNBTRJSoDtnIiR7CKLs8I9ev8AaFcZSinzp69qF9aDULUWXsar7I+zkPBWpm9TsfU
 So0EQBjcUYLSbgMnrz5rWzfeXt0nm6nWtcE+P194Qnd8ELza5i+M+B3RSrTuVH3TsBAz
 N0qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjVie+7suNjQWBiS5wWQdpYo3OH60LLd+H1Q4Ppmrl8fbyjY13zN8V5WebUeyO+0eUQxEs//8INnxAVr/FdW55aorrFnWR4A==
X-Gm-Message-State: AOJu0YxPMAgKIMnHJqnJ8sg3KZwWwJEO6yRKCsRddMAKw9IeH5iEni2M
 xCzVlBsrx0497c3XgsdxnEEMJfI7cdimSjGENCZ6R1d3fSg4zTqddI9ZhMIlD+c=
X-Google-Smtp-Source: AGHT+IE6UJQIsC4IsRblShoHibR+R93GSQrrGr2LTmzPwYMdSVTU1ZedLSCQMIqjFbeCMUXdSOJlxg==
X-Received: by 2002:a05:6402:1801:b0:564:7007:e14c with SMTP id
 g1-20020a056402180100b005647007e14cmr2272437edy.22.1708352073683; 
 Mon, 19 Feb 2024 06:14:33 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 fg11-20020a056402548b00b00564168e6674sm2569850edb.51.2024.02.19.06.14.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Feb 2024 06:14:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/acpi/ich9: Include missing headers
Date: Mon, 19 Feb 2024 15:14:09 +0100
Message-ID: <20240219141412.71418-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240219141412.71418-1-philmd@linaro.org>
References: <20240219141412.71418-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Feb 2024 14:14:36 -0000

The ICH9LPCPMRegs structure has MemoryRegion and
Notifier fields, so requires the "qemu/notify.h"
and "exec/memory.h" headers.

However nothing from "hw/acpi/acpi_dev_interface.h"
is required, so reduce its inclusion to hw/acpi/ich9.c
source file where it is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/acpi/ich9.h | 3 ++-
 hw/acpi/ich9.c         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 2faf7f0cae..215de3c91f 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -21,12 +21,13 @@
 #ifndef HW_ACPI_ICH9_H
 #define HW_ACPI_ICH9_H
 
+#include "qemu/notify.h"
+#include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/cpu.h"
 #include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
-#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/ich9_tco.h"
 
 #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 573d032e8e..be375a8b9d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -35,7 +35,7 @@
 #include "sysemu/runstate.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9_tco.h"
-
+#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/southbridge/ich9.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
-- 
2.41.0


