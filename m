Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmG-0005Jn-UY
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm1-0004XX-W2
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miply-0004BM-NL
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:13 -0400
Received: by mail-il1-x136.google.com with SMTP id l19so8323317ilk.0
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=jv0dLjV4mrXUY3snyiQ6c51BEj97lhaQkMRHPwt5k7otCAN+GpVbKFtyHbXikURwa7
 rgV5xgjl0vSE17euTf4i7SrE5RuIugPGBca6SBnznD2Ep/8lsEsNrpse60IjZ319Dm9z
 dz+n1PHGv4EY3EopGMUQXuLuts8ukU/PTlNJKT00v40U4NNR69V+0HpZVCSU9EbRwWdD
 i/+tbNoIgu0ZgU5gTOIrQL7/X9W5T8tYdutldwMjEqRpc4ANnv/o+taHI8vgiDJQD2qg
 PxyJbGPn3Kz9P8tED+CPDst8h9MUN7bbwcPD4Ea4N/wa+kvX7KzRZ1e/8+SH/56isWlt
 cptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=aDvjWu/tENn92uGl60i8+GAqe/PUy9s++tgaqiktaTBWFID8SgEllQpx6RkWhT8+Aj
 Bv0IP/tMZfkV49WHyWJhmV/HOw9Si03uEwlcPrAE5+WCT464Shbdh+uwDJ9dK/hV0UiM
 jnPBxChvf8pOEoW1qM1nWvCE0Bp6ydWNDLMhyIpA/TzZ5vpO1/woC2/AltKn8Sie5UFV
 TSPEJPcfzHtO4gXz9xAdmO7qhLwXSdjs26kGSuo11nla0qPZ5bcdITsJD8ALh8v2GTX8
 ldQ/ve99hl9bEjJTH876+O7YkE8NqjhyG8MauGeCxqEeAvfK5RybEtS1eAgPP+oigYb5
 swQA==
X-Gm-Message-State: AOAM533NAC3k96AnA9JZqbNZuxEZxksZVqgBb0z358DMJPKNy2Pp7u4q
 jpZpH/HnbXwfdWqWniTA1qp53Q==
X-Google-Smtp-Source: ABdhPJxQKqlXIZYFNc73EhrO2XRmXvaNTXGZacHM5nhF33rM9hn0hDbkSfRJXtXMiWWMlOh0VXUzOg==
X-Received: by 2002:a92:d48f:: with SMTP id p15mr36433785ilg.236.1636082408953; 
 Thu, 04 Nov 2021 20:20:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 22/36] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
Date: Thu,  4 Nov 2021 21:19:03 -0600
Message-Id: <20211105031917.87837-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_vmparam.h

diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
new file mode 100644
index 0000000000..4bbc04ddf5
--- /dev/null
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -0,0 +1,48 @@
+/*
+ *  arm VM parameters definitions
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to sys/arm/include/vmparam.h */
+#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
+#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
+#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
+#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
+
+#define TARGET_RESERVED_VA  0xf7000000
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[13]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->regs[1] = retval2;
+}
+
+#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
-- 
2.33.0


