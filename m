Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJ3-0005to-6g
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:40:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ1-0005s1-JD
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ0-0002wJ-K3
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:40:51 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMIy-0002s9-1U; Fri, 22 Jun 2018 09:40:48 -0400
Received: by mail-qt0-x242.google.com with SMTP id i18-v6so5893129qtp.12;
	Fri, 22 Jun 2018 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x5A9yyNDN4c6vjUK92tDsD+YIh1STXvsuJSarWOK7Ww=;
	b=a7m1IoRjzjo8UA5Rc+0/vgiuA2/tKtHyiM7PbLZjOaI04hfqO5blmc3BsqYC+K4gPc
	NKV3ljaZINrDc9P35f8Eub9Afc/T0rTzp/CZ6Bu3y+IMaA0rMfaSXyDHe0iUGT8GwfoF
	oVsGQBEwTdfiueWiaFbAn1B3JIOJvRAjF7pKzGBBXuy8IDQpDOQxMWritBJ5+BAV/3Ne
	ZwSElchdLklLabJ23P0kkFoBjcxYVrlIRs6evMIoGNB1UB9qXxvLmC22XvTLy/xXmpwv
	6rJgG8EfGk3BrQlm+EFkFwiFW8Ml91MujJ+I1uS3uEIFAVdEt2LP3eYiEV2s05UpcWKv
	m7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=x5A9yyNDN4c6vjUK92tDsD+YIh1STXvsuJSarWOK7Ww=;
	b=MRheI4v/NhQh5NDbkv4nQ4ua7ERwLbVWWdptLRbCDECfELYPN38PCdlEHaSNssYKGj
	K3uu9fnvXXw5x9U4S8Uqt5KNDRWgSZCeWfm0OQCDe4UrepWZ0bizSEvhZI+gQH4i4gq8
	dCeqTlXVmNrMyvyHuFlGpartK6mM2royArci7GUoG7iQK48Q0mNgG/Vsa0QkYyn8jKBg
	lsg/mbjXY0/Dzu66gZqNR6kYkl8HtRzvKzPyexZUc3wEBuNjxUuySHcLZwQyrwdgIyG8
	iowZhCa8LPKkFaAosTr+JuEqeJtLUV7yDcGO2MXHSmvvzDj8xKWtAHcmTlmDKjb0boRg
	5gBg==
X-Gm-Message-State: APt69E3Yg8iQtgBFnDMAy/G5AX2JL9Kuz2axpswDb87jSczGl8FBnjJI
	TkTU0u/CcDoXSeWNRrwocks=
X-Google-Smtp-Source: AAOMgpex9ZgTeLQsH9GRG7aJ045Nn0e3liCWtrwh/qu1H8gT3vcsfdq4WIWEUcRfLrAHd7WIYG4ahQ==
X-Received: by 2002:a0c:f54d:: with SMTP id
	p13-v6mr1403848qvm.149.1529674847431; 
	Fri, 22 Jun 2018 06:40:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Jun 2018 10:40:23 -0300
Message-Id: <20180622134036.23182-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 01/14] hw/input/pckbd: Use
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
X-List-Received-Date: Fri, 22 Jun 2018 13:40:52 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..26aeac2326 100644
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
+                      "unsupported keyboard cmd=0x%02lx\n", val);
         break;
     }
 }
-- 
2.18.0.rc2


