Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJB-00062O-HD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ9-0005zW-3Y
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ8-00039C-4R
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:40:59 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:33658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ3-000301-AS; Fri, 22 Jun 2018 09:40:53 -0400
Received: by mail-qk0-x230.google.com with SMTP id c131-v6so3676450qkb.0;
	Fri, 22 Jun 2018 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHiQErN6yopcx1uS9Z7wFWgWzQ8k9MSYNeu5WE6YAp4=;
	b=l/p9whakpVaCbIZ3Rfd3dHpN+FREe7/YUtk7I7CA0EgNdQC6cxfDpU/1nfUM3gI1SG
	kKSAxfIqJgvbqYcRDUeuiBH61kgfuMRtkB/Y2eSSatxleduM+XfOyRM5zxYEfxItTQln
	oldgAkRK0vjOT3tqwpQAm3Q7tNQEH36GWeCn0YMA5xH+OD55XkZN8c8NyAJmImoVfXVb
	Mu9NHrr79JDnbhGOTjYHtJDPXudEnOjjm40uVTU1DqLJ4IXGjyv1E6IX+4R5t15vyhaU
	nvOMUieYV5CGddXMacEJljRhJcDnxsGj85ix1nyMYPWnHnf++dKE8kuZ3u0nYCUo2jzQ
	hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fHiQErN6yopcx1uS9Z7wFWgWzQ8k9MSYNeu5WE6YAp4=;
	b=Akg6Jklffz8aLit5VGG7KSTxJ3wul0IiFFUFPaf45YLK4wcjKtb9jTLMp9PrDnW2SZ
	Ptgx9eHpEMRCcTdLKLPPAG4hjpgZrjqal4aPpmV40hNDHfJhBxTCqsU8yHTtZO6vPIe+
	hXU08GqB60LlHn7L7LqW5ORnbs2fNPhAWNsrrp4lmUThJDcjlXBCG8avBpmDT65IUKq5
	RzAMpZi8AHkX59zu6RQ6Wv1xP79NumYVb/UvR/L1jMQ5sYp1ola7Vl54Cfwd0duP9lNF
	fxCwZPn8DZYA7hn4stN4kmjWxleCc8Rmv9dDqyUlQJBOCIXlqLiDt7Bxec2O67RxN4pe
	o9kw==
X-Gm-Message-State: APt69E037U8SScE8CEyOZ5t6qleqSDU4i//wINfsTYYw4NqQ4YMEsiju
	mNQatxoFqLGDiP85X1zNGg4=
X-Google-Smtp-Source: ADUXVKKZd2zimhPq4OkCeb71Ma84YxQC5jzO1DvjosHzxsvYSakhIK0/7MlLpBKUBRdZ+4kd8Psclw==
X-Received: by 2002:a37:9846:: with SMTP id
	a67-v6mr1280582qke.219.1529674852708; 
	Fri, 22 Jun 2018 06:40:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:25 -0300
Message-Id: <20180622134036.23182-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-trivial] [PATCH v2 03/14] hw/dma/omap_dma: Use
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:00 -0000

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
2.18.0.rc2


