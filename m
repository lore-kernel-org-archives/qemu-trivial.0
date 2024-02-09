Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYSNC-00079c-0D
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 10:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSN3-000723-Hh
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:00:56 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSN0-0000RA-S3
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:00:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4107ed0c536so2231235e9.2
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707490849; x=1708095649; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mg8ftsd7gly0oQXIDNMIRszjMB+Go5UbvZZR9Wb4MxQ=;
 b=ePICh5mU3hFAH5yjgo2C+G0/5M+3W8zS3ramHgCK61CwBeT3ChIqeUwR48VgQ97/At
 jQVFMWxOCh+KxagvMBNXNuwmEqE/AB2xw9GzEZwHrfzKeqtRbJEOaTsXjgV8a47YEyGm
 Fxt15NeRZjMCT4HyBurzLqpanh6DrFvYTX52wJJcl2vvBoNSPQ6jGVs8DsEpzkJWZUft
 PxlYcQr/TAV1hDQDScw5wKq0174I/4psdJ1hjklkIk5dwvppwu6titN8jAoCsWPFcYtY
 yWfb9iSgzj/HBmTq6D5L3E2+M7cKRb1io4iEEHygXA3jmZIWNs3vrtI8D2c2ZzQaGoYg
 Rnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707490849; x=1708095649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mg8ftsd7gly0oQXIDNMIRszjMB+Go5UbvZZR9Wb4MxQ=;
 b=o8E4ja1lGCtn+4PRW7TV6N8/Rfr2j7iUbkwK+e+OWukVtY350dlV5nTLnqJuoDR/AY
 ns7CxkiuTN9uiWe9XVQvseecp1G8chaRN0HgLA1y5FNqth4pYElvgXGLh0ofrhOP/5XJ
 gLvmaqYNcwVLV06m+ULQVxZVoigBnv0mNDre1OeugTP1tq1WRStSYaUyHHBCy0VfkPQx
 7l4G3mJGt0P3SSowzkmKgc27zbZdlV6/xMJmQHXH7qqDwIP9cZ/dv75+iyO6NazAv9Km
 G2IDtfKxWxjxHBn3j8D4EbloeRdl1rwk+/Y4L9fewF7AheQF4Z/GYjqsjWg9kpYTceaT
 PlKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXriGUL3blorR251HmvKezAotMaJJNPSXDwA2ehNPEqQDECsRmleNYIhLspOlMLmbiV9uITc1vMZ7b+04IqNU50OSnuCe3cpg==
X-Gm-Message-State: AOJu0YzvW0S4RimC3WJIUTdmzemIP1+Z6CjZnz+7l1+VD/FS3/HL7Dr/
 PSbQWRi/+uMRI+mXlFiOQYJGq1QoKj9Ia4UsVRKAfx4Enh0xIQQ0ZIgGY3UgJys=
X-Google-Smtp-Source: AGHT+IHr7EnD9Z/uSqgBPfAAeYziZLciiFUwhziTvoNbZ4PbcG6EO2b8yMZBjC82siN/5rl+RilXRg==
X-Received: by 2002:a05:600c:19c6:b0:410:2b93:4908 with SMTP id
 u6-20020a05600c19c600b004102b934908mr1346248wmq.4.1707490849482; 
 Fri, 09 Feb 2024 07:00:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWc5w4kMIN9nakLOIww9hv3iuRRiZbw196P8LxvSyyz2izeLtVQzA7ht2ENq2tI0oX7u2drLDRgt75zydu4fnATo9bocRaaSxOK1M/q+SPiV2249tq15W9vJ5oqZLy1yyjJY57RLpWMG+BYKOHJ/Y6dYP5F+3pm9v6UO2sSB6eh+dwshU//r51NyEgYfNjOlcf7NuTix1C1vIz0cZBk7tqjyxqqPPXkGFd45kORopKtj2ik23CjHo7p9rvpP9EhVYVyC3T5/DMkBlAQePw1rva526OGVp33Mg==
Received: from m1x-phil.lan ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c468700b004105528c61fsm911832wmo.35.2024.02.09.07.00.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Feb 2024 07:00:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Subject: [PATCH 1/3] cpu-target: Include missing 'exec/memory.h' header
Date: Fri,  9 Feb 2024 16:00:37 +0100
Message-ID: <20240209150039.22211-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240209150039.22211-1-philmd@linaro.org>
References: <20240209150039.22211-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Fri, 09 Feb 2024 15:00:57 -0000

Include "exec/memory.h" in order to avoid:

  cpu-target.c:201:50: error: use of undeclared identifier 'TYPE_MEMORY_REGION'
      DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
                                                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cpu-target.c b/cpu-target.c
index 958d63e882..86444cc2c6 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -31,6 +31,7 @@
 #else
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
+#include "exec/memory.h"
 #endif
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
-- 
2.41.0


