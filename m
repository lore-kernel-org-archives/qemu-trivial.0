Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIX-0003vS-Fs
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIO-0003oX-Sv
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIN-0003nY-TN
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:36 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:46879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIL-0003l0-JQ; Sun, 24 Jun 2018 00:06:33 -0400
Received: by mail-qk0-x22d.google.com with SMTP id o2-v6so5822350qkc.13;
	Sat, 23 Jun 2018 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9BJrfe3YsXs6O2ov28k+EgGRDFxXxxjtMYmwMWtaRlY=;
	b=L50UsBP56A6kQYytHBgjVB+2IkwYODPRw6w99sCL/dHKfscNTwq7luHrPD10XBj/B4
	vx6nyoL3Cb6Mc+73BQ/Y+vCNrnggzOZs9/qZ9iQ/u9EadCgkJ0xegFqPFOOvwEzAQEMo
	e2T8nNT88rysqiFEaGG3qla70kcxsFdHvEfFa27pXxkyBQKua7yZcxtKxsfunhJWi1al
	1nKYf5WBrjYdkGuVahG+2R3rsNDsR5zSkFhG5Gzm2cL0dO3WEsbfYWVxH6+I/M/NKtj2
	B/vNo+DOWBRsAYYjAtaKfeIfsdlokYQirWEzq8lNd6gy7cUjJwt/g3MXDiTC/Nx0Q1O1
	xH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9BJrfe3YsXs6O2ov28k+EgGRDFxXxxjtMYmwMWtaRlY=;
	b=oykA6JDfs+zH5TMKKj2lYmImX0syYaTKIEj2ElGAMccVnt+lwVybBVq2ERgkjE/qTr
	QhR5xeHX9kSCrIPrcUoa4m2paweVeQE/SqO3AR93TqiC/XY7N0K4h5eGFCOf3rwkvkNv
	PVm3343y9y3nAMte1kwWfj92df14RCQkc726XL1/w+x7SCNz4cs8H4P5AWOxlZ9/q8nB
	xHFsvwXVd4pVkwNGSv6fjhVXm41x2BHZAcEqyy1USA1A8jkYuPrNyd3RuTuz3ZNVhCCX
	M6VJIe3bx6hcGqSRDEgswVBpMgvba43wEto9hHt0vqt5yRADKLPAd4LjCa2EmDO0yvfj
	q1hQ==
X-Gm-Message-State: APt69E2KkJK9MfJhP2qS7It640fulP9cnXuiBO2POOaa5pLrSU0Qv9gB
	Euoes7IsU3+nCnzZCgA44wI=
X-Google-Smtp-Source: AAOMgpdW0MCkN297rfJ8YYZqiOgvCbxa6e7aUPu1wfL4WB4rjCNO/YbssGJRqt5Nhk7XCVyP51/lCA==
X-Received: by 2002:a37:16d1:: with SMTP id
	78-v6mr6700828qkw.271.1529813193169; 
	Sat, 23 Jun 2018 21:06:33 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:05:56 -0300
Message-Id: <20180624040609.17572-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-trivial] [PATCH v3 03/16] hw/dma/omap_dma: Use
 qemu_log_mask(UNIMP) instead of printf
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:41 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/omap_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index abd18c67ea..ab3a1b0451 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -1439,8 +1440,9 @@ static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
     case 0x480:	/* DMA_PCh0_SR */
     case 0x482:	/* DMA_PCh1_SR */
     case 0x4c0:	/* DMA_PChD_SR_0 */
-        printf("%s: Physical Channel Status Registers not implemented.\n",
-               __func__);
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Physical Channel Status Registers not implemented\n",
+                      __func__);
         *ret = 0xff;
         break;
 
-- 
2.18.0


