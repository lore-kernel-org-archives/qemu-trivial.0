Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpaR5-00013j-U7
	for mharc-qemu-trivial@gnu.org; Sat, 05 Jun 2021 13:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lpaR4-000139-Pr
 for qemu-trivial@nongnu.org; Sat, 05 Jun 2021 13:50:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lpaR2-0007Nv-R8
 for qemu-trivial@nongnu.org; Sat, 05 Jun 2021 13:50:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so2420059wmq.5
 for <qemu-trivial@nongnu.org>; Sat, 05 Jun 2021 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3UDdYIIbBSBDNTI50q7qk82QAVUtMU5aZ5Z1t+RC1Ok=;
 b=PFr39cAsVckQ2K6GhoWxfUuyeH661sOOtcQCndUAURyMvODbL7lKSMu4QpKNt/Yj7c
 0eYywk71qErBqHTPMK6Yp0y5ov0nwuwCosU0W5g0eFSo5qYw4mUL7zSEVrO/vRJgSpAL
 qNgAgI7fszJN3HJfYnHUkKn5gHvtagROnQePa5KsKvLP0oFoilyVLhNNMA+aBTzF6+w+
 +pLJOQxMHNYz2BUuDiJhrKFP/q2tzn6khdwbwAnrUgQKfBi/fqcjkAIQ3qGvGJhCzWTn
 PJ08CSj/c7pD/YJA7fKkeK5UmOrLW3FxD3iHt9uODtKJ2ZGi6muyvLBrRuYBCsnAWJm5
 asvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3UDdYIIbBSBDNTI50q7qk82QAVUtMU5aZ5Z1t+RC1Ok=;
 b=g2VcZkX13lzNYyHHcu+pFa0x26dpn1zwtUDUuJQNwNhw+4VJNfUFBPzsUyz4SOX1R7
 Hk7JjFqlLPhkx/BxVL49ajR1zFCJW9oOS/lbWsrpN80IW+qAIyWyxt9uNOZYYQcDfYAD
 hxNcbPBdrA6YXhFhcEkkF6bpSmWj7wZWbE1z66JyMgthTUudhRD/oos49H2Vn03ghmOs
 /2VcLmMA0alYkuaKRJQQD9o4YvMzeGETy6aVNzmvXDmA4K+Q/d2WewTIJgke2vgmYpj9
 /Honaj+DpYEW7NW+ZJVC1mkBdKfxAtQmd3FNtFwsztphTsInS5DKjpg6aEOl98XImbOg
 FKTA==
X-Gm-Message-State: AOAM530ihCpGWOSQ7zYsraoC6u0cShPc1S7T9Iux3z9JeVUXCeoscRkL
 PuTu+L6uyL0S7hrlFp2RmyYbvg==
X-Google-Smtp-Source: ABdhPJxAo5TB0b8Drb6qDw/qpmMhKTfQll+I2/xy74enbyT2bbn4mhIO1f4GeGdvUEKHmOGRNK7rMQ==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr9278863wma.85.1622915411109;
 Sat, 05 Jun 2021 10:50:11 -0700 (PDT)
Received: from pythagoras.localdomain ([154.177.90.187])
 by smtp.gmail.com with ESMTPSA id b22sm5727938wmj.22.2021.06.05.10.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 10:50:10 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com,
 Ahmed Abouzied <email@aabouzied.com>
Subject: [PATCH 2/2] Remove leading underscores from Xen defines
Date: Sat,  5 Jun 2021 19:50:01 +0200
Message-Id: <20210605175001.13836-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=email@aabouzied.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 05 Jun 2021 17:50:15 -0000

Identifiers with leading underscores followed by capital letters or
underscores are reserved for C standards.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---
 include/hw/xen/interface/grant_table.h  | 4 ++--
 include/hw/xen/interface/io/blkif.h     | 4 ++--
 include/hw/xen/interface/io/console.h   | 4 ++--
 include/hw/xen/interface/io/fbif.h      | 4 ++--
 include/hw/xen/interface/io/kbdif.h     | 4 ++--
 include/hw/xen/interface/io/netif.h     | 4 ++--
 include/hw/xen/interface/io/protocols.h | 4 ++--
 include/hw/xen/interface/io/ring.h      | 4 ++--
 include/hw/xen/interface/io/usbif.h     | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/xen/interface/grant_table.h b/include/hw/xen/interface/grant_table.h
index 2af0cbdde3..c0a09dadad 100644
--- a/include/hw/xen/interface/grant_table.h
+++ b/include/hw/xen/interface/grant_table.h
@@ -25,8 +25,8 @@
  * Copyright (c) 2004, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
-#define __XEN_PUBLIC_GRANT_TABLE_H__
+#ifndef XEN_PUBLIC_GRANT_TABLE_H
+#define XEN_PUBLIC_GRANT_TABLE_H
 
 /*
  * Reference to a grant entry in a specified domain's grant table.
diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
index d07fa1e078..680914571f 100644
--- a/include/hw/xen/interface/io/blkif.h
+++ b/include/hw/xen/interface/io/blkif.h
@@ -25,8 +25,8 @@
  * Copyright (c) 2012, Spectra Logic Corporation
  */
 
-#ifndef __XEN_PUBLIC_IO_BLKIF_H__
-#define __XEN_PUBLIC_IO_BLKIF_H__
+#ifndef XEN_PUBLIC_IO_BLKIF_H
+#define XEN_PUBLIC_IO_BLKIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
diff --git a/include/hw/xen/interface/io/console.h b/include/hw/xen/interface/io/console.h
index e2155d1cf5..0d4a72456e 100644
--- a/include/hw/xen/interface/io/console.h
+++ b/include/hw/xen/interface/io/console.h
@@ -24,8 +24,8 @@
  * Copyright (c) 2005, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_IO_CONSOLE_H__
-#define __XEN_PUBLIC_IO_CONSOLE_H__
+#ifndef XEN_PUBLIC_IO_CONSOLE_H
+#define XEN_PUBLIC_IO_CONSOLE_H
 
 typedef uint32_t XENCONS_RING_IDX;
 
diff --git a/include/hw/xen/interface/io/fbif.h b/include/hw/xen/interface/io/fbif.h
index ea87ebec0a..4e25423490 100644
--- a/include/hw/xen/interface/io/fbif.h
+++ b/include/hw/xen/interface/io/fbif.h
@@ -23,8 +23,8 @@
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_FBIF_H__
-#define __XEN_PUBLIC_IO_FBIF_H__
+#ifndef XEN_PUBLIC_IO_FBIF_H
+#define XEN_PUBLIC_IO_FBIF_H
 
 /* Out events (frontend -> backend) */
 
diff --git a/include/hw/xen/interface/io/kbdif.h b/include/hw/xen/interface/io/kbdif.h
index 1d68cd458e..a952c77bf2 100644
--- a/include/hw/xen/interface/io/kbdif.h
+++ b/include/hw/xen/interface/io/kbdif.h
@@ -23,8 +23,8 @@
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_KBDIF_H__
-#define __XEN_PUBLIC_IO_KBDIF_H__
+#ifndef XEN_PUBLIC_IO_KBDIF_H
+#define XEN_PUBLIC_IO_KBDIF_H
 
 /*
  *****************************************************************************
diff --git a/include/hw/xen/interface/io/netif.h b/include/hw/xen/interface/io/netif.h
index 48fa530950..f4a28a43b1 100644
--- a/include/hw/xen/interface/io/netif.h
+++ b/include/hw/xen/interface/io/netif.h
@@ -24,8 +24,8 @@
  * Copyright (c) 2003-2004, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_IO_NETIF_H__
-#define __XEN_PUBLIC_IO_NETIF_H__
+#ifndef XEN_PUBLIC_IO_NETIF_H
+#define XEN_PUBLIC_IO_NETIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
diff --git a/include/hw/xen/interface/io/protocols.h b/include/hw/xen/interface/io/protocols.h
index 52b4de0f81..3d1cac322b 100644
--- a/include/hw/xen/interface/io/protocols.h
+++ b/include/hw/xen/interface/io/protocols.h
@@ -22,8 +22,8 @@
  * Copyright (c) 2008, Keir Fraser
  */
 
-#ifndef __XEN_PROTOCOLS_H__
-#define __XEN_PROTOCOLS_H__
+#ifndef XEN_PROTOCOLS_H
+#define XEN_PROTOCOLS_H
 
 #define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
 #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
index 115705f3f4..ea324c5a62 100644
--- a/include/hw/xen/interface/io/ring.h
+++ b/include/hw/xen/interface/io/ring.h
@@ -24,8 +24,8 @@
  * Tim Deegan and Andrew Warfield November 2004.
  */
 
-#ifndef __XEN_PUBLIC_IO_RING_H__
-#define __XEN_PUBLIC_IO_RING_H__
+#ifndef XEN_PUBLIC_IO_RING_H
+#define XEN_PUBLIC_IO_RING_H
 
 /*
  * When #include'ing this header, you need to provide the following
diff --git a/include/hw/xen/interface/io/usbif.h b/include/hw/xen/interface/io/usbif.h
index c6a58639d6..564c0115e8 100644
--- a/include/hw/xen/interface/io/usbif.h
+++ b/include/hw/xen/interface/io/usbif.h
@@ -25,8 +25,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#ifndef __XEN_PUBLIC_IO_USBIF_H__
-#define __XEN_PUBLIC_IO_USBIF_H__
+#ifndef XEN_PUBLIC_IO_USBIF_H
+#define XEN_PUBLIC_IO_USBIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
-- 
2.25.1


