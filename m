Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFX-0000g6-5e
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEy-0000GX-Jh
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:28 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEp-0000Nn-7v
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:28 -0400
Received: by mail-io1-xd2d.google.com with SMTP id r134so21104413iod.11
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PhlzCvSvqqxwJDB+n7xnrNxr2xqSNg8Pye04ee+ax8=;
 b=cto8VnFa9SA2kZtI/G6J/q6cddtokv/GlTvU43Hm7SHurzJrrK1xdDNXiOySLewvnW
 heybDKcGOrKZYz7soDZcPPVP52iIQ1fO/KD7Sye3Kaf5OkfN9WX/UxWPNb0VXbTgyzW7
 zCXgCUB69yed4Ezge+dGVcomm+G1pRtj6dWBOVfZk22Q3wVVcsSuW18FRQKydJayYHnB
 sIebFk/4dbRGqeyokx9BdpZQmtHunQfz+2IXnNAW/N6xS7iSGww69myQPv+yKcGzSlpH
 NMOnT3UIL8sGU694AEmS+wqPqYtswGR6uuY0YbCxMd/bg6MaAwBz7l1ENnFRsGCCpSXg
 xOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PhlzCvSvqqxwJDB+n7xnrNxr2xqSNg8Pye04ee+ax8=;
 b=kcuZIR6GrvqHEmG0uir7YUB01mVtK0YXIWl68C9qu3GzOgW/IEbBSHwFhRnXVbmsVg
 qnwf2TJ6v+rOzmMRkJbrrP8hVIgG1SCoV3AMZ2YhMXxADdyJgy+l71WeHRoJ7xsEsXme
 StkVbwbORYPHUJi/veQY4vvtyFJlP9wO2qf9ArvMootIihstlAmMA8avls6EWhJAVAtS
 86ag5x2EKDOZLozrPO5skBp10Trl60Z9q1JgcR2ICCfzVE+kclm19eFLkKPtqJvyS/1c
 n3NEg2vRxzjnrHjf+r7W4jFJhIZqYsk0YlOwtqUdtrnqz1hggy+XvINVzo++x1AOgWSS
 6uTQ==
X-Gm-Message-State: AOAM530qi7y4X+en5p2iCSZXdUeU/vLL4ORX1XpOfqX5kfxVS4ZbBhBc
 tJhg2IWBlKkxAv3pBQufWK8Cq+5a3pzJPA==
X-Google-Smtp-Source: ABdhPJzEfosj1cpdm7lLzYoXlpsp6FbhVd675Wkp0cx1EOlZyPnwpMmoAVCSH0hiCZJb81/0ZSOyOA==
X-Received: by 2002:a05:6602:3412:: with SMTP id
 n18mr21027991ioz.65.1634661918090; 
 Tue, 19 Oct 2021 09:45:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 11/24] bsd-user/arm/target_arch_vmparam.h: Parameters for arm
 address space
Date: Tue, 19 Oct 2021 10:44:34 -0600
Message-Id: <20211019164447.16359-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 16:45:29 -0000

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


