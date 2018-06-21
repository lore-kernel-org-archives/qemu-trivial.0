Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vP-0000qn-31
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vG-0000iZ-47
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vE-0006fS-Un
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:06 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:45824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v9-0006bg-Bs; Thu, 21 Jun 2018 14:02:59 -0400
Received: by mail-qk0-x22b.google.com with SMTP id c198-v6so2247125qkg.12;
	Thu, 21 Jun 2018 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PGvpCD9jglBEanKdWI6t+U1dBgkvK654ZeOvsU/7uO4=;
	b=uwEbJ8IBWDT+le8JeQZDFVFQCYNDdP2gwckOXA/odWTiy32qcVw2x/SywyzX0ATQ9e
	P6Y/w51kkzU4MG6Z6jCpZLTkpWopox375qi9Bbl5bQaoMyYa8dyfEjVSpbJZHnC36HOT
	3FhnmDkxWGb+CaLBccRUNRQRCep+R7jdbroC8Coe4Z97EzOlHOCnQ/TavHXcm3BC9pEc
	DCIkGKcwF6L8SU4iKM0Eyp7y8d4iwVU1AQBX5ozb88NKsdIue9cL9eglkO8x2Jcezo+b
	vFFSghN4c0OcK22+K1757Njvzv+jYrssNYp+WdbfNoVOtmMqPEPcFPCBncLU3FHMAU6b
	DOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PGvpCD9jglBEanKdWI6t+U1dBgkvK654ZeOvsU/7uO4=;
	b=CVpC1TdGc3cUgpmteXiAY8J7HQblNtOxv0oAo4djg4DXPNWStD9w2JqOVnGLzKrV5K
	ICHF9cTnet3vdjtPtG7PDhv1NrxbMr8DxOPlaunQZwsM9JFSOPjtNoFl5Yxd8n1ayNxQ
	XjUeoPa62K2blhw1ZH1KpickVEhr1mwG4EdUNUIfzWL+/2zCip5F3NlbHCENZde8zkE0
	oq7GyBhzJQqJIntYuk+EjYmwSEwID9Jck9ccaIw9fimcRcANyZPn0T82w5zVO4kRx0c6
	cBlU9KZVXFhVZvj2SCqktCzalOkimMeR2pF8IpZUe7YufIUYO8sVI0znrAtU2HEwFGGc
	1uEQ==
X-Gm-Message-State: APt69E1WpC4WtHo6orin1waMeSiP9aO9JJD8tQ9GA4xKOSEYl/VfSsZ4
	dNTIly7r0Q0x0GnYyluOkRk=
X-Google-Smtp-Source: ADUXVKK7T658DSLZga5yu2t8plizBtjVM4N8OlwbgWWJJCDVkW2GKUCVj/HBHkpf4RlNjN8E68uN5g==
X-Received: by 2002:a37:60c1:: with SMTP id
	u184-v6mr21050981qkb.143.1529604178667; 
	Thu, 21 Jun 2018 11:02:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:21 -0300
Message-Id: <20180621180224.8312-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: [Qemu-trivial] [PATCH 08/11] hw/arm/omap: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:03:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/omap.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index b398607b06..3d805b6174 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -21,6 +21,7 @@
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
 #include "target/arm/cpu-qom.h"
+#include "qemu/log.h"
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -962,8 +963,8 @@ void omap_mpu_wakeup(void *opaque, int irq, int req);
         fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
                         __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        fprintf(stderr, "%s: Read-only register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register " OMAP_FMT_plx \
+                      "\n", __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
    (Board-specifc tags are not here)  */
@@ -997,14 +998,17 @@ enum {
 
 # ifdef TCMI_VERBOSE
 #  define OMAP_8B_REG(paddr)		\
-        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, \
+                      "%s: 8-bit register " OMAP_FMT_plx "\n", \
+                      __func__, paddr)
 #  define OMAP_16B_REG(paddr)		\
-        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, \
+                      "%s: 16-bit register " OMAP_FMT_plx "\n", \
+                      __func__, paddr)
 #  define OMAP_32B_REG(paddr)		\
-        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, \
+                      "%s: 32-bit register " OMAP_FMT_plx "\n", \
+                      __func__, paddr)
 # else
 #  define OMAP_8B_REG(paddr)
 #  define OMAP_16B_REG(paddr)
-- 
2.18.0.rc2


