Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rc4Po-0003Xo-HV
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2024 09:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pm-0003XP-Ox
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:38 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pe-0008Pd-CB
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e91993d73so153875566b.3
 for <qemu-trivial@nongnu.org>; Mon, 19 Feb 2024 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708352068; x=1708956868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11KfkGQwT3DyJXfReiuxEKgaxGdeCZY+EPPlA79U4tU=;
 b=pTOXppyCCNnSKTiAvd73zmqstq3gnxuwl8txhpgdj1sonk/iAFmRQdPmqr2SV2npsq
 li+QMdS5IG+3ScnhuhzHNN5f6YvWk24ch+thKLTWf0aFouTHD3Lp9InjCuwCqkB+tubv
 dWvPFEh6zAIIUxnJEqH4mLWwhLvFi8eR/2JF+HoZEWtsvDHgpA3B6rl327eCe8BP0tyt
 XlGgqOHUej/oOs/pZLFayXFmWPSOdLjxHFOHsyD4jox4PmxTfUwk/GLGH59AW0Uzbycp
 RoC/fwpKb+XEDB/m2gXIbO7NIur9hyzYAf6VPH2IYi2F/R9iZJkAepvoabBhOtKZq8BZ
 85AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352068; x=1708956868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11KfkGQwT3DyJXfReiuxEKgaxGdeCZY+EPPlA79U4tU=;
 b=Pz9oDSfCw5RyYOOCTHaHXzjPIV5wXnPwn+svSHtaT6naTS8UOfrSY0v9YcofLCUDDR
 fWtwabnZPGLhw6NIqslpBo3NmHJS93BnkyiyYjUVNZW47fcEWzbYqOjiZR1u+5JMPCCZ
 4VhzHQ7mOZhedVURA9HbcfFoaEoRVqK/sqW1PCbyKFsjmKSvuxzY9Rooh5GkZd57M4Cm
 sQK4O6UoMUNiQqXxVi4wNFUdT+uAnuu7O0S4iZeuh5ReN5GNQIiUxAVIoj/KDbOkpPyy
 SpDsMbnyF7ouKdKtd/wU3guxU0hSzLeNKXFapEPh9sXVFbHSSj1b15Kpk7cmo0WtWn5y
 2caQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi3FePotCdw8bapoYWTmPWsBM4IMVOIySfgH5fj+mvPMj5svhl06wQofGISnqb3RmlE0uRw8Mlp152ff8GB+uzsuL/kB5dQg==
X-Gm-Message-State: AOJu0YzO5ZRKcRVH9R23qnUZJjpTb7J1BV1TYHvOcHchsR1XZqdunq/N
 0WMvGv2R0Vq2Ye06KIjXG/pREraHWwQscPuyQwxuuiTVMg8Oone0UPPG2TtFPXQ=
X-Google-Smtp-Source: AGHT+IETYCEFpXzchz+BXlbjc5WCW+gYz2Guo3B1Sp9JkNHPWyqH7eULSPVQfml2IdnQ7YdjWl+ypw==
X-Received: by 2002:a17:906:a89:b0:a3e:a8bf:4c22 with SMTP id
 y9-20020a1709060a8900b00a3ea8bf4c22mr1345883ejf.9.1708352067862; 
 Mon, 19 Feb 2024 06:14:27 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 vi17-20020a170907d41100b00a3d47ee62c7sm2983185ejc.124.2024.02.19.06.14.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Feb 2024 06:14:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 2/5] hw/acpi/cpu: Use CPUState typedef
Date: Mon, 19 Feb 2024 15:14:08 +0100
Message-ID: <20240219141412.71418-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240219141412.71418-1-philmd@linaro.org>
References: <20240219141412.71418-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 19 Feb 2024 14:14:39 -0000

QEMU coding style recommend using structure typedefs:
https://www.qemu.org/docs/master/devel/style.html#typedefs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/acpi/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index e011d01adf..e6e1a9ef59 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -20,7 +20,7 @@
 #include "hw/hotplug.h"
 
 typedef struct AcpiCpuStatus {
-    struct CPUState *cpu;
+    CPUState *cpu;
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
-- 
2.41.0


