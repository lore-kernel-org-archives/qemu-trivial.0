Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3v2-0000Ze-Jf
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:02:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v0-0000Xq-GG
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uz-0006Vg-MR
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:50 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uv-0006UM-As; Thu, 21 Jun 2018 14:02:45 -0400
Received: by mail-qt0-x244.google.com with SMTP id h5-v6so3641343qtm.13;
	Thu, 21 Jun 2018 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GAPGsT8/sI4OqRnGRqAHkaNZMK3odX7yf/jdm22lTc8=;
	b=Dm3tCfBtHTyM0DY4X8hUSTjuBvlQUhNH/OrYZ499BkNUApU9h3exwEKi0BKmmDkkE0
	4Z9sSbn+TBUZYUsOvlKotwcHLW/gtisSk8Y5LcdfMdYWCas04gBsvvXLaVAuw+bKlKJe
	ekSakc0SR7MVAbiQHL2IJF+aQy4V7ZfpEcx4SzmIfdr4jkk4GgTh5ndb8S601da+TEuI
	UIE6fmtn/JFUUwWuOhW6UuwouTQjx/iXMmZ0ZQ7cu/niq1wsby0mXChrZAGkvsCvqd0R
	7j4Nw9WFgnJ32rnI2K53TqKxVlq6MtK62iqnF1AwER9OC55dI99VeadIAvN9GAP22XP7
	mQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GAPGsT8/sI4OqRnGRqAHkaNZMK3odX7yf/jdm22lTc8=;
	b=uY750lAkNKUuuyXZr12BWu27NW5uf2Nwc9QKxAjJYJAa7MdZyoZzSToO925/22bzNG
	5S/zHzHKAsjuQQeOqyKCXDeT1FlIsve5ZrEhWDUWNsh5HnH6TVDG/48ofbIXMm7laUG/
	v+jydMrpPbXZYjbfu5GKNz+B6veh7hOzXa58RcPZ6nq8d20Zf1nLDXFqo3GhAnCpi0L9
	6vrkDUa7gkpeR1QQSEpXkmntBb5w1pl5yoyQgwcGwt3OLoTGH8gicsMXWb0I4kJb73Ym
	ugHC9/5roIRvaLXFuhWKXsR7sfI14XF8Ucik+3/YamPkJJMiF4b6dCaOPeyLNAaF4XUG
	UkEg==
X-Gm-Message-State: APt69E0hRWe9n/QKibkzAVrfIs1QXoWNrVS4nzYlcM6F0fpCS3bXE3Ca
	CP2zmGoBzUxhZNartiR9MRIEL+S1
X-Google-Smtp-Source: ADUXVKKEhR5nI+jVQNemFCn7VDo1ICcPpHWMOUks7EEdxdtQKfud5TePt2IQWgQG5DFaF2sw/UdUKg==
X-Received: by 2002:a0c:84e6:: with SMTP id
	m93-v6mr23455263qva.227.1529604164526; 
	Thu, 21 Jun 2018 11:02:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:16 -0300
Message-Id: <20180621180224.8312-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 03/11] hw/dma/omap_dma: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:02:51 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


