Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3uu-0000R8-Jl
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3us-0000Pr-Hm
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3ur-0006Rb-OC
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:42 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3up-0006Ql-Jq; Thu, 21 Jun 2018 14:02:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id y31-v6so3656070qty.9;
	Thu, 21 Jun 2018 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xYIXHulijO1M0Y9+Sb6iuxRwYqw1AOB/7zw1n4GqS9s=;
	b=oFq8lDtfVmPPjQXZMF+I+0AYjqMI85NVxIdAliILq4i5pkKDOlwau+VL6GZrSs8HTl
	wfuP8FF9VPaPTAunedt/21M7TabEMxKXy80s0eId05Zu18ht5KmCv/7xJFHD1zzvntYl
	/Gf95L9JGcySpueo8y52eu1JsY+x1AEGXOxju41PqxAMugjddAHkkRLh30sAF5nIDZPg
	QheTbQGBb+sdSnFiGIL6rlfyoETY1o5vQH+tbIzDBFxmFzsWRnrrjYCzTjhUjh0r59+9
	duQHuP7w/RvlGQ2PNJ3hHCsYvrDk/vo3mhgx+PC1A3lALKvfPG6jEpjy0skuUqRnHn5c
	I4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xYIXHulijO1M0Y9+Sb6iuxRwYqw1AOB/7zw1n4GqS9s=;
	b=GGIyP+ckregmeDEQXwkjtDa/hW251GCsERv/suIL1ZQcLyYe6l3MHN5IVTxKpXfsc7
	v2kuqNglHvDsA3t2ZT6qA1hw+nd8Afg/OKd7O1v0IAgHNZfoG+khr/+rgVLtnl75p//K
	nXKv9Ta9rzKHGqXABfydsJO76c+3kTUBDKjth8S4WSE2USWqa+TvrYgXwSfIG8SMBaVL
	G8j/kOPrQOaJ83ufA6ENXNQ59nW6XqKfkYP0W6YAuhJB49DuQqMyttbBfqpPBx5yiTOd
	+9mxGFcnaVCGTZlknC1TOLJpcCy1aHVtam/2Q5iyGAtQN4SbiP8hirnXhJUojUlk9dOM
	Ha0w==
X-Gm-Message-State: APt69E3q1YcN7T3FuktjGIiKyWLmSXfoRtN7FEEL3AccLuluuvyr694u
	Z0s2Kq8R3uOv1D1GQz2l22c=
X-Google-Smtp-Source: ADUXVKKY1cte6KgeGojsRpQYtwCi937NWw/A+M9jNGJd1cn9iRS/wN2EySnyyBcBBEc4LQi2vYoQGg==
X-Received: by 2002:ac8:4a0:: with SMTP id s32-v6mr24217615qtg.2.1529604158920;
	Thu, 21 Jun 2018 11:02:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 21 Jun 2018 15:02:14 -0300
Message-Id: <20180621180224.8312-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 01/11] hw/input/pckbd: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:02:43 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..1102d2a31b 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
@@ -308,7 +309,8 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         /* ignore that */
         break;
     default:
-        fprintf(stderr, "qemu: unsupported keyboard cmd=0x%02x\n", (int)val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "qemu: unsupported keyboard cmd=0x%02lx\n", val);
         break;
     }
 }
-- 
2.18.0.rc2


