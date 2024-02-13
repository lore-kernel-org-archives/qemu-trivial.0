Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZrWA-0007n2-1m
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 07:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUs-0005Xt-Kr
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUo-0001BY-Eu
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33cda3dfa06so289957f8f.3
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825757; x=1708430557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gT9BnHhKSLeB6DLDQir0eTSYCNcWVKYuyB5YSaZzw1E=;
 b=G7SLVMm4HvokZLenrM6EJSDGuHSUroDT1JnLGFBYdako26hjR0IeAUmOwFropKRruu
 GiT0wnpXjAtZKQbJLrzN18OMqEcVi0MaSCKdarjAhCcL0DXSlNbofafen2lRu//HRVQP
 o/mpgkhOY/AX0Ff3w8yvvvfUtTzNnj70UDL2HYoRxkFmUHBc99LUXji8V+dPyduQsJG1
 pwF8dJMwd9jFmFI10iejYLMJM6MTYhiH+8nH540rwdIkT+7hoz7pdAhAlh6Bu6f8fBuz
 gpicj+yfFovBZrLBv9GX/mboSCMaUUekwSiNP4pMuaF04FjCDeOnmMp3+FQNp6z9c6GC
 MDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825757; x=1708430557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gT9BnHhKSLeB6DLDQir0eTSYCNcWVKYuyB5YSaZzw1E=;
 b=ajG9hdGCOoVtM9cUTJB0nuygNMqfE7vn45oTJWkqyQ6l40fCZyXpRabzo8L1URsd4M
 SuJTR1FFTiLTlDDOxwmbizMobUlV4fEkfpp2oo5nog1o2Yo/hacFLzG8WRgrCVs1AgMJ
 Vojk3y3NUf+rSnfKQIDFgqIe1xv3ZZzRP7aT9V+ZORPUe9ow2dLSvgKso22dI35DeNCO
 lcXP/nYM61smzfpu/gABr64I+BulAiUy1Si5XbuBSXr6fwEth638opeVe6bLhjYEV08K
 fthTjifNVnzMhi3azYuAUsBG/LoJ39XPdYue0x7ix6R92bNkxxiqA0vOW/obJSEyt17O
 ANog==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3D++mI951tdA8tQfPGFRuu8WGL4O4o90CBB1GZhnggq1VgCa5pHNvfqRn8J+Q79wW7SDNQhh2oOs5RZv7n0uYF3QweuaSJg==
X-Gm-Message-State: AOJu0Yz8YJMDqKcVGYdWwU3b1ZpTTVhBMZoDSRQ7EXzsQRzJeSuJ6Lgn
 6x6oG3GWG6atJqSJQ1NsFxlo8liTMLlUYTByVcKMThEQpZFuTCbYg+b+V33kyDc=
X-Google-Smtp-Source: AGHT+IE8MDoV5cIX2X0Dc1lxcmlHUOvaNY8mOvWh4DnxUxe81R2VyTR1wl9guqz9Q6362FGOSkHjPg==
X-Received: by 2002:a5d:53c4:0:b0:33a:ff66:fecc with SMTP id
 a4-20020a5d53c4000000b0033aff66feccmr6807597wrw.26.1707825757405; 
 Tue, 13 Feb 2024 04:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzfaonjkPEG9PV7JWli6v5BbF0tH/XSyuuag8oYSXFoTChnej/5IGDw4e18Ej+suIobhUpbtacqoJXowBVDwjQ75gn09cJVfX/vbiYwdujQuOTyrBX0iYix94AsVHz4IqYnjKkMghjteCIf6lLhmLF7d1iThf9ScYfzYzT8GcOJE3iwtdmYiRU5SH/AoqYXVPOB8qXm6ygJczbL5l7NCu5JG7Hkd7KNxRfkqAAUaudN27SzAr01eHhzPupS9UE3ah6jy4PPu2Ja3H2TE3G+yHILl884ac8xDn1wCvZaFwhFeDOD16cQiV77ilrkvzKGIntrx5th10=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b0033ce214a97csm331838wrt.17.2024.02.13.04.02.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 04:02:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] hw/acpi/cpu_hotplug: Include 'x86.h' instead of 'pc.h'
Date: Tue, 13 Feb 2024 13:01:52 +0100
Message-ID: <20240213120153.90930-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213120153.90930-1-philmd@linaro.org>
References: <20240213120153.90930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Tue, 13 Feb 2024 12:02:53 -0000

X86 CPU hotplug isn't specific to PC machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cpu_hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index f7fe905e0a..83b8bc5deb 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -13,7 +13,7 @@
 #include "hw/acpi/cpu_hotplug.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
-#include "hw/i386/pc.h"
+#include "hw/i386/x86.h"
 #include "hw/pci/pci_device.h"
 #include "qemu/error-report.h"
 
-- 
2.41.0


