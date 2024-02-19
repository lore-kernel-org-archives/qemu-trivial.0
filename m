Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rc4Py-0003ek-Vi
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2024 09:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Px-0003eU-JF
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:49 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pv-0008Sk-SR
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:49 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so4121116e87.1
 for <qemu-trivial@nongnu.org>; Mon, 19 Feb 2024 06:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708352085; x=1708956885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daMydCoKKjW/BM3LMOveVy0d9uKVycJYmVQBhTRBuqo=;
 b=LORgC9+N5hXmGsDhZ7T3uVN+cbwxJCT3tMewfvov5Te5q0EXACBqGg+XlGS+4QPTxJ
 7IpKo+UntF0Fhl6hx/2qmBoJH9rvCn9QP4iOtdD49rqO/SXNM7NFwIYBSwhGcw5szi5K
 bHe09ERo2ZOlE0uNbaXPy3KtqHrDHsf+q+IaSnUIbHDQP9AlrIc6pI9hfmuNjSYq9Fqa
 0E7fZg7fnL2MfXGk3HzYktT0ya/Np/11KmKSPNM4ZSik0IyLuj+d4BvnGvHd0AgUnXgl
 Xw1+snYUdTapNhHH0NJYC5fqwp0lg8nUNwsVwbKz/5d8RVimeL/W82Rf3ErjHCjrPsqz
 5bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352085; x=1708956885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daMydCoKKjW/BM3LMOveVy0d9uKVycJYmVQBhTRBuqo=;
 b=wdJf+lUbsiwcFoL5K7OThKEPlTGjq1QriDtjKgaseHcxrNrGrL9vhpY+J6dn/FwTLu
 JBFIUy0LqwUdweyMrDBYjM3LQHxiJ8MmVVmFCli0+Rz+0nk0O+F82y06YYMK+wawnFkd
 7UKCOA/1cLSza92UID9W346HtJbm+BGNoQM8StqbFX7DZRRFU9XFRv5m3JDwxZ2neV0q
 2xl3JjVLUqXnMSlTyB0Ychx/NhfxRnwrk/xOnLiAYNS4xXzhNRcFv/rYVjtCPfSerqIk
 bJ8P57560kkPK77d/gH/6Xi2yqs5miwatmEAxIzNSK3mQjGntl/UXRkbqpeLR0BDjduG
 L7Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdytSbLQc/JoOOL1ECliqa8Nz3yCDHs88k3v+ow3TcHyffkP9vBsFiifHN0l0B6wceeTe70rsLmm4kHNY/AIOnORnkPFPwwQ==
X-Gm-Message-State: AOJu0Yx7n9gqAxRvPZsGzL/Lq2HIdQd5CP7sHXZjP8UlG6b1kQMbx/tr
 myTISYbvo/K2/fz3+rwUsCOQjRyyZ3idazJKn4e/luertoGmbxt2rImqWwpeEKQ=
X-Google-Smtp-Source: AGHT+IFAilRjevCe6058c9xDUe1XJi/5FzlEXXDLcFbJHJ8YA+aJL7lvfR89+XQEahFnGOMsKmwffg==
X-Received: by 2002:a05:6512:e8f:b0:512:be57:6dcf with SMTP id
 bi15-20020a0565120e8f00b00512be576dcfmr820919lfb.8.1708352085061; 
 Mon, 19 Feb 2024 06:14:45 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 cx1-20020a170907168100b00a3c456b0c0esm2974171ejd.108.2024.02.19.06.14.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Feb 2024 06:14:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/i386/q35: Include missing 'hw/acpi/acpi.h' header
Date: Mon, 19 Feb 2024 15:14:11 +0100
Message-ID: <20240219141412.71418-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240219141412.71418-1-philmd@linaro.org>
References: <20240219141412.71418-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-List-Received-Date: Mon, 19 Feb 2024 14:14:49 -0000

"hw/acpi/acpi.h" is implicitly included. Included it
explicitly to avoid when refactoring headers:

hw/i386/pc_q35.c:209:43: error: use of undeclared identifier 'ACPI_PM_PROP_ACPI_PCIHP_BRIDGE'
                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d346fa3b1d..a91f414922 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -58,6 +58,7 @@
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/i386/acpi-build.h"
+#include "hw/acpi/acpi.h"
 #include "target/i386/cpu.h"
 
 /* ICH9 AHCI has 6 ports */
-- 
2.41.0


