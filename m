Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpo-0007xx-Lu
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpn-0007rD-4Q
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:39 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=33351
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpf-00014A-Py
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:38 -0500
Received: by mail-io1-xd2b.google.com with SMTP id m9so2311256iop.0
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=Yz3CQQYjHcrff2gHLY9MsR4yRKM5eK/0MsfFP8KOJrU46n/HFHn1+gdFK86Cx/ZDiC
 Bb3UA+Urq0d4BBMix63LpVQUOHfFBXY+Lhod/d1xCV7dWoo9TSQY5R4MbEm/npbKWfhm
 hDr5rDueCxbCPlsuUEbjF+8cuoDWpzjyOanm0m7z3OVllTE12txQg9c6fZrvTKz+oCNi
 PavAHOKv4lwRWHogw1/a55gH4dahYK34dpTyLqszOrVtPpz1YSkwpGGVbI3ORhlCOvuv
 be3Fw4obHtpXcK/5oTUwGCKwawrJ9x/GPDuxoaUwehxg03wLxdHiz1lTFCKhcHFqCg0U
 gNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=Il6ll3Yh9dIdrOVcUTuXRB1tPuf6GeA2U2dNufSumBxF8xR9mnWodTifTarFbts/a1
 W3Zy7UVr2blsB3LWwWWoo3y/QrLCZRqyIvy1X90I/et54wcK6+zwUfVUHChUWn+1K9vR
 B8++9R0VykeKSImeSWOk66IrVo32k8sviR5VXPLbYDdpo1JJzt3F5HUkG69d2FBsUfjP
 DoFD+GdZcAXbDij+1sdPy0DZDbbw45mRYZwoajGejgw5pZSD5QGH6JWPH/joorft5kT5
 JGM2oiKdNPOQuX7qgrQH3hAOb/TgNxC5/YTVKlpPSmdAsglAph5RrxO4WEDYWuVzbfjo
 ZMLg==
X-Gm-Message-State: AOAM533arIrqwGpaHE+2KGuQaYKfBJrZG3+Lal5H2x+M5yYd81xeJ5a/
 RUqoIgu6atYtuIhv1mLKDoQlFfXgpZMJjQ==
X-Google-Smtp-Source: ABdhPJwOtpoxumYUgvMUupeSpvwCCJwxSlV+IausWhpkkL8dkzImwI39M9IZlvxrdI0EcClUx+5l+w==
X-Received: by 2002:a05:6e02:174d:: with SMTP id
 y13mr21717559ill.183.1636343538103; 
 Sun, 07 Nov 2021 19:52:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:17 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 09/37] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Sun,  7 Nov 2021 20:51:08 -0700
Message-Id: <20211108035136.43687-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:39 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


