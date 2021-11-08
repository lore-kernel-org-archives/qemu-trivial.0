Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpc-0007BW-Vm
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpP-00075q-Pz
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:22 -0500
Received: from [2607:f8b0:4864:20::131] (port=37421
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpN-0000wW-C3
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:14 -0500
Received: by mail-il1-x131.google.com with SMTP id h23so15543983ila.4
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=mk0AMUynlSIOwY6E4iZcT+o3omMwaOPb3annq6wPg3Dv5N4iScRMRnTAk09AQPFo50
 BkkYtd6OSstbtSexk3cuHGOexe6E7Ud9W5MTJ/VcbCRVlMBuqGIdMwrayKvG+vY8WF3e
 XLhUgmZBQZ+yk16tmw6YfCuB65K2SfM+gRlgrYrRp+tMCll+J3shh4AHiLja7Da37Ps/
 bFYhnMOBH/naiJa1v5Mf2rA/l98TMh0w8jaY91W0cAZvr3kl3E2tdkWTb2kfGsZAdo/V
 CfJ3JgSlgCbzohSbdneRDRt04rlXz3jzbwMw5Yd7rP3dHdNon05H8IVkfUs19cEVq/Vd
 wdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=wldSplLJNL0fvI7PYDGUWU6uoWRyOA/ib9zx69+5zBdHopm3+U+oB3Bx8aOgJLT26F
 kU5L+f8J/OzRX7oAjPK529gcRshCNCML7DplpI7cEsTg6q4LlcwImRZZ+CFNusNCgBc5
 +xKGmB3T8q574TgtVhW/eIx1u8v/SCg+5YkcUjtBfkr1btHmZBd7jfxvC7Sa7unbtqBZ
 gsa/5Q95tkzkOEBJOS7RMOiHdbY7tE7dHpYL8hf10EZV87DQly9PdodWIbt0DuhgR/5Y
 GTUjZBAlGPBNQspNUyiVBe4Qx6xbD2/Af9W6dl71vh/noTgAhvjdGZAIGz5ksOht/ihN
 FZiw==
X-Gm-Message-State: AOAM531IHnzYDQ+JnD89BX1mGx7ES7btknnhCQ5eRb9AwrDHbpJm7x6P
 8XbJPXtfxFuLWHkCdQmSuNlf2G04icatIw==
X-Google-Smtp-Source: ABdhPJxswyzqBceC795HS1jZdv+zoQ/6RjTNYZaliWshEhlEG/c/u/2gf5TDDTRL7s0YlLoobKR8dA==
X-Received: by 2002:a92:4b06:: with SMTP id m6mr21119978ilg.123.1636343544183; 
 Sun, 07 Nov 2021 19:52:24 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:23 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v5 15/37] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Sun,  7 Nov 2021 20:51:14 -0700
Message-Id: <20211108035136.43687-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:23 -0000

Target specific TLS routines to get and set the TLS values.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
 bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c

diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
new file mode 100644
index 0000000000..93cfaea098
--- /dev/null
+++ b/bsd-user/arm/target_arch.h
@@ -0,0 +1,28 @@
+/*
+ * ARM 32-bit specific prototypes for bsd-user
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+#include "qemu.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
+target_ulong target_cpu_get_tls(CPUARMState *env);
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
new file mode 100644
index 0000000000..02bf9149d5
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -0,0 +1,39 @@
+/*
+ *  arm cpu related code
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "target_arch.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
+{
+    if (access_secure_reg(env)) {
+        env->cp15.tpidrurw_s = newtls;
+        env->cp15.tpidruro_s = newtls;
+        return;
+    }
+
+    env->cp15.tpidr_el[0] = newtls;
+    env->cp15.tpidrro_el[0] = newtls;
+}
+
+target_ulong target_cpu_get_tls(CPUARMState *env)
+{
+    if (access_secure_reg(env)) {
+        return env->cp15.tpidruro_s;
+    }
+    return env->cp15.tpidrro_el[0];
+}
-- 
2.33.0


