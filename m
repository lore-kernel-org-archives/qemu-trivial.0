Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmW-0005eW-Eu
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm3-0004ae-Vo
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:16 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm1-0004CC-JT
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: by mail-io1-xd2b.google.com with SMTP id y73so9312598iof.4
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=kjjfayhKhadnXPKY1Ckovw00NxlvpWARnZb4s3n5yYGoratnwoCc6pDRdN7gu3lBQQ
 +A+16Qdkgkt7/zFk4BEJTj/cqH+7Y1avHtbX7XuMqAc5y1Pp6C1soogWVMsFd6H6RSpe
 yH49cl4shqbXcWtYgl115XQf6J/nbS2pwYv4l9ZY8RmoCF/jI+md8JqEjWvJflguAed5
 PY14pM/vMfZIxE6P7Xh8BBSVMtpTqj0qjq/87hNACekeBLanYssQPe14m4X09KFMM45h
 v/Btw2WUoT5IOfkeqUSZf8ODxS3bXWNYP1p0RRjRdLwvtnr1bJtJ+lucSFKQIFdDkxiT
 jlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=InuJFDENeqBn0P/N8ZfztASIRe034oL9z6ZPFQiTMZx82JATv1mGz2DGNTGfp8MD1m
 7kWz3t2RmHoP9rjMejvRKrbHdjlv/lboumTrKHY/sg8EtdIduPr+IaYoKHSoBC1B9Len
 dmMBWf775KjV6tVVkDomg7utEkYjM+LfFPGKhKp0aFnd63z/Ljx9HmkLRPbTHAO1KDY3
 3KSiUl5dZTK1UhuOT8v3Y+HyLQ4bdZW/Z2AxGPZMx4qMoeqpOrHIx6bw72FQq839uc4g
 BRHT4dNTWkKcmEo++8zV9fCgf89jqeGyGPiWoSy1B/rcsYoN+ZyClXlVmEEYt0RPyJ5u
 pbSA==
X-Gm-Message-State: AOAM532kY11hQPoVjuqQcWUGQ1xUuRpJbm6qCdkqEc4b+UQfWj5+SyQl
 KuGmP7je7CIXf7f+PPPsgy6xRQ==
X-Google-Smtp-Source: ABdhPJwGvscJUcaIAXCijl95dr/Y77kQ+aVHvBfpdR2ckhnOj+PfMFQcSEhy9jAWkwScMVmf18Y6Hw==
X-Received: by 2002:a05:6602:1649:: with SMTP id
 y9mr26275400iow.133.1636082412292; 
 Thu, 04 Nov 2021 20:20:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 25/36] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Thu,  4 Nov 2021 21:19:06 -0600
Message-Id: <20211105031917.87837-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:16 -0000

Basic set of defines needed for arm ELF file activation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_elf.h

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
new file mode 100644
index 0000000000..15b5c66511
--- /dev/null
+++ b/bsd-user/arm/target_arch_elf.h
@@ -0,0 +1,36 @@
+/*
+ *  arm ELF definitions
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
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
+#define ELF_START_MMAP 0x80000000
+#define ELF_ET_DYN_LOAD_ADDR    0x500000
+
+#define elf_check_arch(x) ((x) == EM_ARM)
+
+#define ELF_CLASS       ELFCLASS32
+#define ELF_DATA        ELFDATA2LSB
+#define ELF_ARCH        EM_ARM
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#define ELF_HWCAP 0
+
+#endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.33.0


