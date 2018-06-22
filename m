Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJN-0006EP-5Z
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJK-0006BD-8b
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJJ-0003UO-8G
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:10 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:37456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJG-0003QP-NA; Fri, 22 Jun 2018 09:41:06 -0400
Received: by mail-qt0-x22b.google.com with SMTP id a18-v6so5922156qtj.4;
	Fri, 22 Jun 2018 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4jITap4zCLIMmBm7Af3WQ1M73+xzncSdrYZfIqepkTI=;
	b=ZkTaWOkXooUUZ6dRxXtHzp6aV4gc7ZHAUBHeqy1GBPemIyP8BA4BinkGoekz9nOMDa
	0sM8hzeC0vlFIsfJRLOIoZHdDpZVGd1FnJeOkrmh0w4JnPKQZ656zlxZ7nocrbGLI6GB
	tC1M90l5gDkMjOzINStYdGjCYuxrp/gaJ+XMfgQjHBGxwgNNNKXy60Grm35YXAasJ3UE
	Bkdr4cT86bqnSYkjklpRq7ON1baUzoikxnHUiSwj6O68rtc8es2/may7cAAsw+ngmSZ+
	PlXUEzh9SSYl1497j9t2nm4JssYo6hCFR75/VB+GXg8NoZOIidniSyk2kRJkobtjsl9e
	9KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4jITap4zCLIMmBm7Af3WQ1M73+xzncSdrYZfIqepkTI=;
	b=PSaIFHWd+zWwtjb9LTxYN9cLTdE6yQgcNkhJeFwikavC+fH6DB7YuWBxHUwWcfNLh8
	06A49hNekvb2RL9cSjN6xslhyTZdHnk6Rg2SDBNTSjBSCumbRpWy9N7weDF9De0LHUP6
	2xcEWbnQFARhDZpABGlCPVa0HnzlNxI7NamHD7x4TB/N5gUJuZWB415yPWZzwbLov1bf
	RF1sE0w9IMJlhepZ5wHt5E+8tZ+ALLOlhwWHydjlXL2jifR7R2mQRKJ9aoK5f1PeNUrT
	6vKyrPArwXPuxVlyU2qZMXa/ozDoDNVysM8p07Xl/ncW1HwCAwDL5FfXfNOmc6MdnWG4
	29WQ==
X-Gm-Message-State: APt69E2eyv4QTxsyTNq3kjR8iHEdILdoWapRPUZ7tDWkxKRJdYNrj4Py
	ezOsO7+8T1LBvzywE9e4Ll4=
X-Google-Smtp-Source: ADUXVKL8myaRMzRKvmmhddKo9pajZ4mEzKlFm43ehMYFAUT1RQxZwBfHUWGsSdfyBuKYebKOMPe71A==
X-Received: by 2002:aed:3ce8:: with SMTP id
	e37-v6mr1382820qtf.295.1529674866159; 
	Fri, 22 Jun 2018 06:41:06 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:30 -0300
Message-Id: <20180622134036.23182-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH v2 08/14] hw/arm/omap1: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 13:41:11 -0000

TCMI_VERBOSE is no more used, drop the OMAP_8/16/32B_REG macros.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/omap.h | 18 ------------------
 hw/arm/omap1.c        | 18 ++++++++++++------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index b398607b06..39abba753d 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -993,24 +993,6 @@ enum {
 #define OMAP_GPIOSW_INVERTED	0x0001
 #define OMAP_GPIOSW_OUTPUT	0x0002
 
-# define TCMI_VERBOSE			1
-
-# ifdef TCMI_VERBOSE
-#  define OMAP_8B_REG(paddr)		\
-        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-#  define OMAP_16B_REG(paddr)		\
-        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-#  define OMAP_32B_REG(paddr)		\
-        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-# else
-#  define OMAP_8B_REG(paddr)
-#  define OMAP_16B_REG(paddr)
-#  define OMAP_32B_REG(paddr)
-# endif
-
 # define OMAP_MPUI_REG_MASK		0x000007ff
 
 #endif /* hw_omap_h */
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 9af04728e3..539d29ef9c 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -34,12 +34,18 @@
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
 
+static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
+                  funcname, sz << 2, addr);
+}
+
 /* Should signal the TCMI/GPMC */
 uint32_t omap_badwidth_read8(void *opaque, hwaddr addr)
 {
     uint8_t ret;
 
-    OMAP_8B_REG(addr);
+    omap_log_badwidth(__func__, addr, 1);
     cpu_physical_memory_read(addr, &ret, 1);
     return ret;
 }
@@ -49,7 +55,7 @@ void omap_badwidth_write8(void *opaque, hwaddr addr,
 {
     uint8_t val8 = value;
 
-    OMAP_8B_REG(addr);
+    omap_log_badwidth(__func__, addr, 1);
     cpu_physical_memory_write(addr, &val8, 1);
 }
 
@@ -57,7 +63,7 @@ uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
 {
     uint16_t ret;
 
-    OMAP_16B_REG(addr);
+    omap_log_badwidth(__func__, addr, 2);
     cpu_physical_memory_read(addr, &ret, 2);
     return ret;
 }
@@ -67,7 +73,7 @@ void omap_badwidth_write16(void *opaque, hwaddr addr,
 {
     uint16_t val16 = value;
 
-    OMAP_16B_REG(addr);
+    omap_log_badwidth(__func__, addr, 2);
     cpu_physical_memory_write(addr, &val16, 2);
 }
 
@@ -75,7 +81,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
 {
     uint32_t ret;
 
-    OMAP_32B_REG(addr);
+    omap_log_badwidth(__func__, addr, 4);
     cpu_physical_memory_read(addr, &ret, 4);
     return ret;
 }
@@ -83,7 +89,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
 void omap_badwidth_write32(void *opaque, hwaddr addr,
                 uint32_t value)
 {
-    OMAP_32B_REG(addr);
+    omap_log_badwidth(__func__, addr, 4);
     cpu_physical_memory_write(addr, &value, 4);
 }
 
-- 
2.18.0.rc2


