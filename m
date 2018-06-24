Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIN-0003mG-6C
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIK-0003jv-D2
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIJ-0003jg-KO
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:32 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIG-0003hF-FV; Sun, 24 Jun 2018 00:06:28 -0400
Received: by mail-qk0-x244.google.com with SMTP id b66-v6so348412qkj.1;
	Sat, 23 Jun 2018 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BXZ3TltxLVi5ZCRN6XIGUwCl7iIEoMwsENofQGK5k44=;
	b=UPKsU0YtaS2DkihuPbLpkfFWJ4rPwMuMw3k1g69eiwbCmb16JtsPu2szWtneWOcvcp
	vGhsD9SusZaXpo9byh0X0TolBWEsKID6uJDlKER1QAbPOjNbzSjo759xE0gtg+k+VjIU
	qIbszbsWNEKrzthVPrfGv6b2u+KDMadvos/A3czl1Gm8G5dkciNXtuyJny3mCVck8T6x
	qQ09eu3IZ3QUmQWnpM8hjscsX2UBDLUpmA71fTtgfbSO+ZxIZMRdHonoBULYhaq4RqM3
	+wRF8jU69EnJrtuyAX8kaAf3KQ+OMTbXxi8nrkVixZStZUTAgx6tSoa6djlHM9yy8OqV
	9SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BXZ3TltxLVi5ZCRN6XIGUwCl7iIEoMwsENofQGK5k44=;
	b=te1NsdSzVx6mLSefMjqtMYKC9CQAwB9/g73nDf9wM40OehFfR2oKromEDXy6HE1Hw2
	t0exm3WQJe0/TvNVr7LQxOFr5ajw+/PaYRuTCgeOSu63Qq6HL83rHYgmI17geP2XSmc7
	3P5pjiSF4r8wcp7qGhzjoIIg19hrDOAVcdwlT7GO3MxkD2tG29WswVWPN8gf2yCogtSb
	NM7Rai3IFV/88orzYvI2sxB0d/MwTUycKvrqB7BWXb5MnLoxME7ZGQGvDKRvJq3J1U49
	KSSODpYFUlNZhtEusEoTTQp9vibVwUqCEKSkpYrfGEZ/FrxNhA7CyP00fdCIZ1P96+AU
	JOcw==
X-Gm-Message-State: APt69E2Y9TeQ633pE3Eo7NKBo+RdvoKsh5OS2Oop5OH8Lr/PeWWoEUjY
	7mF9uX/0lK2dbcATfmwa58g=
X-Google-Smtp-Source: ADUXVKK7s4naWFyv6AzaWrTmgj/bUO2MNV+vHym56+3u/zEIhs+f9bbaqtWTfTPI0Bf6DC8yaEurcA==
X-Received: by 2002:a37:9a95:: with SMTP id
	c143-v6mr6538756qke.378.1529813188026; 
	Sat, 23 Jun 2018 21:06:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 24 Jun 2018 01:05:54 -0300
Message-Id: <20180624040609.17572-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 01/16] hw/input/pckbd: Use
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:33 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..07c8801387 100644
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
+                      "unsupported keyboard cmd=0x%02" PRIx64 "\n", val);
         break;
     }
 }
-- 
2.18.0


