Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzPp-0004qY-Q5
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPo-0004e0-7D
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:52:12 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPl-0006b7-ID
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:52:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so511578566b.2
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725969128; x=1726573928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4j7QaKPiMfal8LA98trbEZECyavoczk6GLxC++Oo1o=;
 b=ItQUSk3smZrTjn5J0YK5I7Y3nFsFxh8gPvgzK0f+yZONnKKgvhL9UeEKQKKi2r+kX3
 X1vATzqdmwrapv78zcR2on67bc+tpYzJyxice7DqeHDIkGbxvzjA0fg1l8uCdvdbZTLb
 nxQ6yS1v8EY0Gt4dlA+GN17+Nj7Ikonh9nX8EdVmMaUzSYNEhTPXAvtha6VrC8Q1k5g0
 s0jgbDY1p9ZcuzdM6EEGIurWyAHJ1NefiaiYagR4MVQxAtDnUsUWbnW0huO9HQfbwX+h
 BEman7tEWUBnNSU0QH8eER4pQkRaK9mO+SItjMy22edwxlrXB3EC7kyRDsccTlkpAhIw
 vKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969128; x=1726573928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4j7QaKPiMfal8LA98trbEZECyavoczk6GLxC++Oo1o=;
 b=c6aP01FIUwhgOH2ZY23+CmuPk69Oktnb9Jrofp78kN2ihsHLVk/iQCZrLMQTdJogC5
 Z9Pwb/L3g+Bg+Q1Un9WBhrB0iJxo2tLaLweiKKIPHvy57WMGlx3hQPma/wNRybm5iSF/
 XTFQo3gcPb2vEbJb+yUaSFHeglRmXYmA4AT9t3psBkeDaOfSqCLHtc2CvrPdFMzjCQxz
 mkSkCOhAGph+dDhRYteCiUACPmtW54BGoQY+KxBfEg7Aj5nSZQACawBb/jFxS0UaVVE5
 n29/gwv69dbNP6mACQ+lJnjL8o7d1m96JxZ6cgYy12MTZ1ZShNCc7q/0lSHbjbhD87qC
 d8hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUwe2YTfyaQnaly2A+KqUMWTCd+Lfu84WVOGBuQNrlmMUFq1qAno5Hui3wGHzT6zW52gB+L7+/TGV9k7o=@nongnu.org
X-Gm-Message-State: AOJu0Yy4OC9aRMfBZixwUGO1v0sJUhjWLURrCedHHSUKwQogPpS5CVS2
 e1NmF7jb9f9u0u0b+To1+DBJpxg8QybyjcSMSHTICsW82l2MZlOjbloui9NNK4c=
X-Google-Smtp-Source: AGHT+IH+1lAk76d8DtEULRk82XIVG5R8CiXx7tzfeoiF8hXBBUx/YsMmSBLeRJgr6ZRc6dlZW8VkQA==
X-Received: by 2002:a17:907:2daa:b0:a8d:7210:e295 with SMTP id
 a640c23a62f3a-a8ffaaa245dmr46805966b.10.1725969128085; 
 Tue, 10 Sep 2024 04:52:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2582d490sm480271866b.14.2024.09.10.04.52.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:52:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] license: Update deprecated SPDX tag GPL-2.0 to
 GPL-2.0-only
Date: Tue, 10 Sep 2024 13:51:31 +0200
Message-ID: <20240910115131.28766-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910115131.28766-1-philmd@linaro.org>
References: <20240910115131.28766-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:52:12 -0000

The 'GPL-2.0' license identifier has been deprecated since license
list version 3.0 [1] and replaced by the 'GPL-2.0-only' tag [2].

[1] https://spdx.org/licenses/GPL-2.0.html
[2] https://spdx.org/licenses/GPL-2.0-only.html

Mechanical patch running:

  $ sed -i -e s/GPL-2.0/GPL-2.0-only/ \
    $(git grep -l 'SPDX-License-Identifier: GPL-2.0$')

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/crc-ccitt.h            | 2 +-
 linux-user/alpha/syscallhdr.sh      | 2 +-
 linux-user/arm/syscallhdr.sh        | 2 +-
 linux-user/hppa/syscallhdr.sh       | 2 +-
 linux-user/i386/syscallhdr.sh       | 2 +-
 linux-user/m68k/syscallhdr.sh       | 2 +-
 linux-user/microblaze/syscallhdr.sh | 2 +-
 linux-user/mips/syscallhdr.sh       | 2 +-
 linux-user/mips64/syscallhdr.sh     | 2 +-
 linux-user/ppc/syscallhdr.sh        | 2 +-
 linux-user/s390x/syscallhdr.sh      | 2 +-
 linux-user/sh4/syscallhdr.sh        | 2 +-
 linux-user/sparc/syscallhdr.sh      | 2 +-
 linux-user/x86_64/syscallhdr.sh     | 2 +-
 linux-user/xtensa/syscallhdr.sh     | 2 +-
 scripts/kernel-doc                  | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/qemu/crc-ccitt.h b/include/qemu/crc-ccitt.h
index 8918dafe07..ce28e29720 100644
--- a/include/qemu/crc-ccitt.h
+++ b/include/qemu/crc-ccitt.h
@@ -8,7 +8,7 @@
  *
  * From Linux kernel v5.10 include/linux/crc-ccitt.h
  *
- * SPDX-License-Identifier: GPL-2.0
+ * SPDX-License-Identifier: GPL-2.0-only
  */
 
 #ifndef CRC_CCITT_H
diff --git a/linux-user/alpha/syscallhdr.sh b/linux-user/alpha/syscallhdr.sh
index 55cafe6abf..6da0c957e2 100644
--- a/linux-user/alpha/syscallhdr.sh
+++ b/linux-user/alpha/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/arm/syscallhdr.sh b/linux-user/arm/syscallhdr.sh
index 4c952b2cfb..692fd6a76e 100644
--- a/linux-user/arm/syscallhdr.sh
+++ b/linux-user/arm/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/hppa/syscallhdr.sh b/linux-user/hppa/syscallhdr.sh
index ac91a95762..bf1c1d4f30 100644
--- a/linux-user/hppa/syscallhdr.sh
+++ b/linux-user/hppa/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/i386/syscallhdr.sh b/linux-user/i386/syscallhdr.sh
index b2eca96db7..938a793d2a 100644
--- a/linux-user/i386/syscallhdr.sh
+++ b/linux-user/i386/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/m68k/syscallhdr.sh b/linux-user/m68k/syscallhdr.sh
index eeb4d01d34..39b11dd05e 100644
--- a/linux-user/m68k/syscallhdr.sh
+++ b/linux-user/m68k/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/microblaze/syscallhdr.sh b/linux-user/microblaze/syscallhdr.sh
index f55dce8a62..b42b669154 100644
--- a/linux-user/microblaze/syscallhdr.sh
+++ b/linux-user/microblaze/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/mips/syscallhdr.sh b/linux-user/mips/syscallhdr.sh
index 761e3e47dd..cd7043ef5a 100644
--- a/linux-user/mips/syscallhdr.sh
+++ b/linux-user/mips/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/mips64/syscallhdr.sh b/linux-user/mips64/syscallhdr.sh
index ed5a45165a..a4339b2041 100644
--- a/linux-user/mips64/syscallhdr.sh
+++ b/linux-user/mips64/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/ppc/syscallhdr.sh b/linux-user/ppc/syscallhdr.sh
index 6c44e0eaad..6e8b93d673 100644
--- a/linux-user/ppc/syscallhdr.sh
+++ b/linux-user/ppc/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/s390x/syscallhdr.sh b/linux-user/s390x/syscallhdr.sh
index 85a99c48de..ac22d422b0 100755
--- a/linux-user/s390x/syscallhdr.sh
+++ b/linux-user/s390x/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/sh4/syscallhdr.sh b/linux-user/sh4/syscallhdr.sh
index 080790556a..cb3a5de711 100644
--- a/linux-user/sh4/syscallhdr.sh
+++ b/linux-user/sh4/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/sparc/syscallhdr.sh b/linux-user/sparc/syscallhdr.sh
index 34a99dc832..938a02bb48 100644
--- a/linux-user/sparc/syscallhdr.sh
+++ b/linux-user/sparc/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/x86_64/syscallhdr.sh b/linux-user/x86_64/syscallhdr.sh
index 182be52a74..988256b6c6 100644
--- a/linux-user/x86_64/syscallhdr.sh
+++ b/linux-user/x86_64/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/linux-user/xtensa/syscallhdr.sh b/linux-user/xtensa/syscallhdr.sh
index eef0644c94..dc787fbbfe 100644
--- a/linux-user/xtensa/syscallhdr.sh
+++ b/linux-user/xtensa/syscallhdr.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 in="$1"
 out="$2"
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 240923d509..fec83f53ed 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1,5 +1,5 @@
 #!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 use warnings;
 use strict;
-- 
2.45.2


