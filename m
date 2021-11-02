Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2eq-0006hh-5x
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eo-0006dO-3R
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:30 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ek-0002lx-9M
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:29 -0400
Received: by mail-il1-x12c.google.com with SMTP id l19so720013ilk.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=lTpq017Ejx7nCI89/YhtE4NlpT5jMRw/EZO0Ibxsp64jWH4poHGiwtWgHOYy2UrFgk
 SKa4gQYK4baZyX0gwk9G2HlWw0LWOvIhyCWQDtx2Sk3znFsXBggY3++a6fIeiW0PvELK
 ScUt41xG6+7jCdPUhBxWTVIO6mJp+rTlommSwLasOQufRuCtJb8x9oWOIp7jlZUIOMj0
 qaQIaggKOEswIrwJVZgtMPGShbrblQj388W4ENHc0/UHZO4UvxstJaEZIWuYSECE6scw
 P8blTg2TxuHbqJkkYNcKnkIVWiLng27j8Y8zV8uTORaaE5cDkUQl5auKIM1Rt2dtg22h
 iVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=VdJCOOhmjv3+100y+Nk1IA7vbZpnyNrj39GayMSKuWb3fKTMp8dIY6rhBb+eUTdvoU
 oZQsyRUK9sl6tpfnFaIofwrZIzS/3zxZs8bjTftDR9okpUF8B0nHkqb5EocqmkrBEWcl
 WrSOyh3zZI9gbw987tNGR0cD10pcil9UcD7N5h0vpqPTAVONfhKnKlw/hlUtJYFCAg0X
 51FEO233g8IOuqSzFM2ETq8kKOwqctamuvPlfD5Cq16PW4dapVS+4NexJ6+oJGDE9x0r
 ITIwMEAFMw7LWhwmt2E8gVp2v1u9tsUECK+qfxKs77+kHxYH9aTpvhX7dBipG4KEZ/Je
 ogtQ==
X-Gm-Message-State: AOAM533f/M0qVCzhbch1CUhVQuxdXQ606pFVpVR1PSRz0wZmJVMQdIWP
 qeAddhbV+omkYF7kQpz9CtG3Cw==
X-Google-Smtp-Source: ABdhPJzn0NKXdfVt+SeIVbHGMbNtdA0J64LFw/Ah2iEoqP+iIbLmxm/DAd7dz/jgHpu4W14grPPp9Q==
X-Received: by 2002:a92:c263:: with SMTP id h3mr14546011ild.322.1635893605238; 
 Tue, 02 Nov 2021 15:53:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 06/30] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Tue,  2 Nov 2021 16:52:24 -0600
Message-Id: <20211102225248.52999-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:30 -0000

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0


