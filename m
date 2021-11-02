Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2el-0006PW-5c
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ek-0006Lp-6s
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:26 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ef-0002l0-Q2
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:25 -0400
Received: by mail-io1-xd30.google.com with SMTP id g8so555580iob.10
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3xeQseg7XCe/PHz62qvWhdyf1FsVU4bvG/P2lXDf50=;
 b=U9EAgY2UWzBeUi1+xQbYvftzEOyEAWQOsxTWaLcTdCeXdoEM15G8UQ/U53gemHS0TB
 DfVKFDHGJDBkH1J73sSLWM0Y7oAyklu+AsJK/htnpFnMMp7c52SWaokOJlWwCQD6rh/2
 ky/e1D/7APDbLXPx4E0LeIzmo06DGn+M2HKni7eYmpKWz2+JdlptaTXqMbnOTOmqQzKr
 NxXx/XEYuPhZB51NIff1k7C9bDfQY6s+l51+fszsDDWi1+BjJkN1HoDVMmWVsQZSeS2y
 n1D8+hmdIx7ZA2WYxaXrp789yATsrvtRCvX7sQci4PyvkCd3PPP0NQzi/D7XCWKmBcW2
 qi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3xeQseg7XCe/PHz62qvWhdyf1FsVU4bvG/P2lXDf50=;
 b=x9hMl/Nq0r0QEXRRno7bUOwenOrgh2SskDjvY50ly5JFBALlSsRrCjKjvv7mypnpmT
 kXrAUtGpO41uGsVDa6JFcAEKrFyusQhbkf72cyNYDAoK9MAguZODVvJSIKaV2PwBdiYe
 vGVeYIkAmjXN5Kr6iBvroYlU6Kq2wMcv41Ovcdk2ZGqHiiObJx1y0lzqpF60bSLBal7k
 tHq3kEz1R8kXVWCVpb/Xx2jSZtBIL/lqDrmts9qDS9OS5OcEFsj8yYCAFiozCPEuSn6L
 eNnZ+/Q80IpL9H6SQ8fEl0yKR+mXvMZcMRefumjBXnwUZ64mtA2XwckvleRnNj4m6A9G
 EiYg==
X-Gm-Message-State: AOAM533eNYFY1Wo+kVNZqOC5nLrh1eYt6NDg3NoBHRvQgXjTCgP8WzgW
 egS/BrZsGVa1xf+AtkBVidkqWQ==
X-Google-Smtp-Source: ABdhPJxrOzTswHuhehWPfP+wiSFkMle9PJ8pGFAkQt1fkaYfw+5GOLBfyeGFR9ciwT6gj9fp5Y7fig==
X-Received: by 2002:a5e:cb0b:: with SMTP id p11mr28233000iom.41.1635893600372; 
 Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 01/30] bsd-user: Add stubs for new signal routines
Date: Tue,  2 Nov 2021 16:52:19 -0600
Message-Id: <20211102225248.52999-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:26 -0000

Until the signal support is merged from the bsd-user fork, we need stubs
for cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus to link. These call
abort after logging a message. Since singals aren't supported here
yet, this is sufficient.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 0c1093deb1..05b277c642 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -20,6 +20,11 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 
+/*
+ * Stubbed out routines until we merge signal support from bsd-user
+ * fork.
+ */
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
@@ -36,3 +41,19 @@ void signal_init(void)
 void process_pending_signals(CPUArchState *cpu_env)
 {
 }
+
+void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                           MMUAccessType access_type, bool maperr, uintptr_t ra)
+{
+    qemu_log_mask(LOG_UNIMP, "No signal support for SIGSEGV\n");
+    /* unreachable */
+    abort();
+}
+
+void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                          MMUAccessType access_type, uintptr_t ra)
+{
+    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
+    /* unreachable */
+    abort();
+}
-- 
2.33.0


