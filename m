Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmO-0005ZC-1o
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm3-0004Yo-FF
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:35755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm0-0004Bo-3d
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: by mail-io1-xd2c.google.com with SMTP id c206so7788669iof.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=uocYHOL+N/Zc+TzaAsIC0fuw++G00gnW8Jej5GciuPQE3PGm9ZAxaafpaQDaYNOeiQ
 bBFnil65s+NIOrhWIWDmk2KaS5+MWtQNxTf42KSTtvVh5La/RvTUlK6C5eZzSEcEybJd
 31vij7bUVfU3yTBNMhjvLiMxL1U7Y5J9+OGgo75m1GwW0hcBCwPZ4uEu7kAZnEqZhWeV
 01z32GahkjmcVJXUKOi3mA4qvb//t90fpzVvjaPB4xCwQbuzUuknQnsC36QDDV8dOORq
 F3PzkzLetCxHssk18JvWlgpsG/va6S/oH6QvcgNvd8bCWohTNScfCRfvVjaaLsQPzTl+
 sTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=XQnAn2iGlpIWG+ysxTCxeIGQcd4Z/Ia+aIdQV8uRx3NUsxektniBKH4xsQXzR7sA5w
 6fyciK/OYS1Sf+MOSSUTgImrfcwp9upbo85EkBZvtUr/MKuAV9E2IPI15ZHt56wy3Dxr
 q8isM3hBnBZfJ4kVrdSz1PiLkn3LRWripcDPrr2/UVVnjuiSQkE9wcKPDBBEHv/fyOnd
 N6/rKxuY7oVbLe+rOauo8AGyb+tYN+DIozj7rLzi/Ryi2CK8+AU6/+sct4+FUMYrLw63
 WkZyCGJ3x9fpWdd0EmXdem4GUiuu1Vsjvg94d1AJX27l5HEFeQ6YomtqnY1WtxTw1F+Y
 yFlg==
X-Gm-Message-State: AOAM533SyHdpS65FRw9bZfVhcWjOkgztaLybVtL61kck/Hj0qRwhRAon
 JSwNLyrPSkPv+Adz5nP8PPg3lQ==
X-Google-Smtp-Source: ABdhPJxdbmQMhIEDU+vkko9gQWHAA9XohINh0Vprdbh9VKuvscTT6O/MIi+1+d7Osa42nfb6ne+NjA==
X-Received: by 2002:a05:6602:2293:: with SMTP id
 d19mr4244150iod.71.1636082411069; 
 Thu, 04 Nov 2021 20:20:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:10 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 24/36] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
Date: Thu,  4 Nov 2021 21:19:05 -0600
Message-Id: <20211105031917.87837-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:15 -0000

Implement target_thread_init (to create a thread) and target_set_upcall
(to switch to a thread) for arm.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/arm/target_arch_thread.h | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_thread.h

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
new file mode 100644
index 0000000000..11c7f76583
--- /dev/null
+++ b/bsd-user/arm/target_arch_thread.h
@@ -0,0 +1,82 @@
+/*
+ *  arm thread support
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
+#ifndef _TARGET_ARCH_THREAD_H_
+#define _TARGET_ARCH_THREAD_H_
+
+/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUARMState *env, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    abi_ulong sp;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm/include/param.h (STACKLIGN() macro)
+     */
+    sp = (u_int)(stack_base + stack_size) & ~0x7;
+
+    /* sp = stack base */
+    env->regs[13] = sp;
+    /* pc = start function entry */
+    env->regs[15] = entry & 0xfffffffe;
+    /* r0 = arg */
+    env->regs[0] = arg;
+    env->spsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    cpsr_write(env, (entry & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+    memset(regs, 0, sizeof(*regs));
+    regs->ARM_cpsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    if (infop->entry & 1) {
+        regs->ARM_cpsr |= CPSR_T;
+    }
+    regs->ARM_pc = infop->entry & 0xfffffffe;
+    regs->ARM_sp = stack;
+    if (bsd_type == target_freebsd) {
+        regs->ARM_lr = infop->entry & 0xfffffffe;
+    }
+    /*
+     * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
+     * programs to set status messages that we see in ps. bsd-user doesn't
+     * support that functionality, so it's ignored. When set to 0, FreeBSD's csu
+     * code ignores it. For the static case, r1 and r2 are effectively ignored
+     * by the csu __startup() routine. For the dynamic case, rtld saves r0 but
+     * generates r1 and r2 and passes them into the csu _startup.
+     *
+     * r0 ps_strings 0 passed since ps arg setting not supported
+     * r1 obj_main   ignored by _start(), so 0 passed
+     * r2 cleanup    generated by rtld or ignored by _start(), so 0 passed
+     */
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.0


