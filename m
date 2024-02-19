Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rc4Pi-0003Tf-V5
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2024 09:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4Pf-0003MQ-G9
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:33 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4PZ-0008P7-2n
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:31 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so1895891a12.0
 for <qemu-trivial@nongnu.org>; Mon, 19 Feb 2024 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708352061; x=1708956861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrGDeP6FKIUU6jW18CkpL97+y4+8zvvTBqQzIVQHxhI=;
 b=ZEv+ioZjkdfLAJWgCBHaI1a91L2/vdjP6Fl9WapRXiVVBQylbEFq8CYQC1o9Y1TmGo
 vUGzcXHcqRccomlfZoUhC83FfFgmvInwFeSHs/ighjWR+LepgTCYIJezcol79nYzeQbr
 w/zCKqmhJvJgdDX3URIYGHJjFRhK+qvEugCTltvVGq5jXThOWRL1Ve8kOhiJ5WECkUhP
 YEd2sf782ruD6TqFkMua1Y9F/lUF1aaFutqlu5lTDgDGjdf2nwBsx5BUXSV4VEo1pAiz
 hbcA2ESejZOu7SmQHBEfgaHW5j31jabmWpE4dQdOGFnQ+lwBZnCav/vfHWU0mIcQ46K8
 UgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352061; x=1708956861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrGDeP6FKIUU6jW18CkpL97+y4+8zvvTBqQzIVQHxhI=;
 b=c0KRxjNdxUpBmuVziLOPwr8t+Z53LIuPGtug/kVwfCVznk8g2bNBIDddMcAGcjYuEz
 3i9Nq+yWd6C6/3bAJVNRJTdEmjWckxmaKIwl3yT1eEjr7yGgAQbl6ZNTtSHAiAvEkKaR
 xQ1NgzrZ/hGO2PqKl7ziA9WNUOsS1xn075gLPVqumePZJ0i6MRMD/zU6Kno9n8HfVSfS
 tXT9Xg8E44vMa2ST1L6XudrwMbDAzSeXOaAlJ0v4x/G1Wqi1D0qcW9K+1owy3uWa9DFe
 0CQSi5bexANZVVYyQi+0Vbjji8vfAWNId/MICs84v9WUkXhZssYl/W04zyiK5SOcHcm+
 PiQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyPuO/de1Kc1xKlGb36QjNIM1kK1yp6KeJAWwa+/C29dNBbYXCss1p7Yw67uwNXWO9+wQVjz0tejmjUTWjC9KHCresdUr8RQ==
X-Gm-Message-State: AOJu0YyGymgyMgtHJcw7Z9fmXhada2iLHwD7cCq15aRMOzcPsmOumAA2
 dT5sFWv0ENAyhmX23Q8m1EqNPY7Tx4DlZxGaI2CX5HYA0S2HlDNYgdo7nAlamQ8=
X-Google-Smtp-Source: AGHT+IHzOgCsF98PrJhe9iNHrFgTY9Z9G0CP6qHwUdgjAVQm+TpUmvtwi+joVmtzO84iqwB2eJ675A==
X-Received: by 2002:a05:6402:500f:b0:561:fc2:bec0 with SMTP id
 p15-20020a056402500f00b005610fc2bec0mr15748624eda.4.1708352061418; 
 Mon, 19 Feb 2024 06:14:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 fg11-20020a056402548b00b00564168e6674sm2569687edb.51.2024.02.19.06.14.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Feb 2024 06:14:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/acpi: Include missing 'qapi/qapi-types-acpi.h'
 generated header
Date: Mon, 19 Feb 2024 15:14:07 +0100
Message-ID: <20240219141412.71418-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240219141412.71418-1-philmd@linaro.org>
References: <20240219141412.71418-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 19 Feb 2024 14:14:33 -0000

ACPIOSTInfo is a QAPI generated structure:

  $ git grep -w ACPIOSTInfo
  qapi/acpi.json:81:# @ACPIOSTInfo:
  qapi/acpi.json:99:{ 'struct': 'ACPIOSTInfo',
  qapi/acpi.json:109:# Return a list of ACPIOSTInfo for devices that support status

Include the "qapi/qapi-types-acpi.h" header to avoid the following
errors when including "hw/acpi/cpu.h" or "hw/acpi/memory_hotplug.h"
elsewhere:

  include/hw/acpi/cpu.h:67:52: error: unknown type name 'ACPIOSTInfoList'
  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
                                                     ^
  include/hw/acpi/memory_hotplug.h:51:55: error: unknown type name 'ACPIOSTInfoList'
  void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
                                                        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/acpi/cpu.h            | 1 +
 include/hw/acpi/memory_hotplug.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index bc901660fb..e011d01adf 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -12,6 +12,7 @@
 #ifndef ACPI_CPU_H
 #define ACPI_CPU_H
 
+#include "qapi/qapi-types-acpi.h"
 #include "hw/qdev-core.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
index dfe9cf3fde..38841d7b06 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -1,6 +1,7 @@
 #ifndef QEMU_HW_ACPI_MEMORY_HOTPLUG_H
 #define QEMU_HW_ACPI_MEMORY_HOTPLUG_H
 
+#include "qapi/qapi-types-acpi.h"
 #include "hw/qdev-core.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
-- 
2.41.0


