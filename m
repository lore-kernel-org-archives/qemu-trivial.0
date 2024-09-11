Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1soP22-0006ip-PF
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2024 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soP1A-000364-Ax
 for qemu-trivial@nongnu.org; Wed, 11 Sep 2024 11:12:32 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soP17-0001IJ-Ek
 for qemu-trivial@nongnu.org; Wed, 11 Sep 2024 11:12:27 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32971cso2865014a12.0
 for <qemu-trivial@nongnu.org>; Wed, 11 Sep 2024 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726067541; x=1726672341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f52+BqOoRzSG9eBiMUrGEFVsDTdb6hL4k2FLSWDqtKs=;
 b=bDJnhHIFDEdeyBo85iznVQqhDm6vh302SdYd3TcCnQvtqvbYXo5JA0t9k+hvT324yq
 Rd9mFLCJwywo4MCJcB+w7wbuFcnVYOEmaz4X36jtLUNzektYbhIJ65GITlvU2ci98OM2
 zSgMgmEQTCl4a/GeHFFFZrncO/mqZRuwlb3U/kQyps1IWpLllzw6YXQTRX06SZdCeFOO
 SYZpvCy+khzIQNidy9ztXUkyxd/h6rQz8PwxS+erJp1i0OdAgtqWhFtpABTH9WynZxoS
 ocwiBveebf2jXZLMEys7RIDsl8KNWJOTd91Vik/mVvPdYF1wvAg7coG0RHtYiwBTGf67
 fDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726067541; x=1726672341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f52+BqOoRzSG9eBiMUrGEFVsDTdb6hL4k2FLSWDqtKs=;
 b=pa+LJh+uNXqBvPkCrSEe1odXENmdNO1IuwrPBWbX+vX3WYdqvWcsvJyvnr0QCUdbjQ
 DcMa3I86TJ2dULGdlFQXtLAf4RlMtWogJmyP8eCofYOJAJxQ8qAs6u7BxlQtPziFVQfH
 ipyITU9S5bhkYIqrr98eNLTyf+lGy96oi3ckg1uWoz810FDuRNpSpIfM9YFqUnuvRXY+
 imRS5wLj16NODbvypH97IS96SAHtzwqA6zjthkMREumC9bU8qFjZIAJZhrblJ6pT1gid
 nRQUQO1yroUyh1Xdsaa3+YwdDLnvErzq+mBTCu8s5CIHok4vFcFYb9rr881/U6hobhXX
 2LWg==
X-Gm-Message-State: AOJu0YxcNI9bIRU7eJwabH0GlW9/EazSPyQzUfiMNpKwm7JBGE91jXIP
 diRchMbJn2OXeICk9DeTJZIkDn5My7xMVgO5932eUkAkUQL2IeTgTJsrqObwS7UoBlGnqLbaLYq
 L
X-Google-Smtp-Source: AGHT+IHlWRcW+YSCOoeARjmOWmlsXZUiXq4ysmZrs1FNtCBGBF1ufs5ezV0SUsNbR7wwXx2+iLk3nw==
X-Received: by 2002:a05:6402:848:b0:5c4:1334:76ea with SMTP id
 4fb4d7f45d1cf-5c4133476f6mr308265a12.22.1726067541207; 
 Wed, 11 Sep 2024 08:12:21 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.196.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76eb6sm5497102a12.61.2024.09.11.08.12.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Sep 2024 08:12:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH v3 2/5] license: Simplify GPL-2.0-or-later license descriptions
Date: Wed, 11 Sep 2024 17:12:03 +0200
Message-ID: <20240911151206.60368-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911151206.60368-1-philmd@linaro.org>
References: <20240911151206.60368-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Wed, 11 Sep 2024 15:12:33 -0000

Since the "2 | 3+" expression can be simplified as "2+",
it is pointless to mention the GPLv3 license.

Add the corresponding SPDX identifier to remove all doubt.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/timed-average.h | 4 +++-
 block/vdi.c                  | 4 +++-
 hw/net/eepro100.c            | 4 +++-
 hw/ppc/rs6000_mc.c           | 4 +++-
 util/timed-average.c         | 4 +++-
 qemu.nsi                     | 4 +++-
 6 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/qemu/timed-average.h b/include/qemu/timed-average.h
index 08245e7a10..dfd8d653fa 100644
--- a/include/qemu/timed-average.h
+++ b/include/qemu/timed-average.h
@@ -8,10 +8,12 @@
  *   Benoît Canet <benoit.canet@nodalink.com>
  *   Alberto Garcia <berto@igalia.com>
  *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
- * (at your option) version 3 or any later version.
+ * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/block/vdi.c b/block/vdi.c
index 6363da08ce..149e15c831 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -3,10 +3,12 @@
  *
  * Copyright (c) 2009, 2012 Stefan Weil
  *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
- * (at your option) version 3 or any later version.
+ * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index d9a70c4544..c8a88b9813 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -6,10 +6,12 @@
  * Portions of the code are copies from grub / etherboot eepro100.c
  * and linux e100.c.
  *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
- * (at your option) version 3 or any later version.
+ * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index e6ec4b4c40..07b0b664d9 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -3,10 +3,12 @@
  *
  * Copyright (c) 2017 Hervé Poussineau
  *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
- * (at your option) version 3 or any later version.
+ * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/util/timed-average.c b/util/timed-average.c
index 2b49d532ce..5b5c22afd8 100644
--- a/util/timed-average.c
+++ b/util/timed-average.c
@@ -8,10 +8,12 @@
  *   Benoît Canet <benoit.canet@nodalink.com>
  *   Alberto Garcia <berto@igalia.com>
  *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
- * (at your option) version 3 or any later version.
+ * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/qemu.nsi b/qemu.nsi
index 564d617d11..b186f223e1 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -7,7 +7,7 @@
 ; This program is free software: you can redistribute it and/or modify
 ; it under the terms of the GNU General Public License as published by
 ; the Free Software Foundation, either version 2 of the License, or
-; (at your option) version 3 or any later version.
+; (at your option) any later version.
 ;
 ; This program is distributed in the hope that it will be useful,
 ; but WITHOUT ANY WARRANTY; without even the implied warranty of
@@ -16,6 +16,8 @@
 ;
 ; You should have received a copy of the GNU General Public License
 ; along with this program.  If not, see <http://www.gnu.org/licenses/>.
+;
+; SPDX-License-Identifier: GPL-2.0-or-later
 
 ; NSIS_WIN32_MAKENSIS
 
-- 
2.45.2


