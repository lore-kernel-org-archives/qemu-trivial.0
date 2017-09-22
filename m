Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4y-0004xo-Cl
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4w-0004vp-L2
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4v-0003NA-T1
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:22 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4u-0003MH-1z; Fri, 22 Sep 2017 11:41:20 -0400
Received: by mail-qk0-x244.google.com with SMTP id o77so872865qke.2;
	Fri, 22 Sep 2017 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=45mSqhP1yxDHiEs6LQkOCEqsncYe5nRY3mbVQiuxjTk=;
	b=KrPkyTWkhtNGbZVXWM0Zk3veCgWKkenWbQxP53TNV/I8Vlk/q+LkiZZIhaG1MYYKaT
	1LxB4YeU2psaA8Z0qO0oOtSNIm8Vpws8I5bn5Xo55NRBFRhMAm3EYzOfv3XDDbou2UsQ
	RR4CBzyf625OBsoBvHs/PKGoolyLY/tdS24C3YfHqaLWzAjuUEeiWBhxblcV7kjgz1zn
	elx76uzaZDAcleu3IZ7sVLjYtr5FAG0bfzZzu6KIvg8GbYNgprGLdSaWNxasCSPKHX/5
	35vsavdF31O52mH554PCEeY18HvqsN3IjulvDjcMuz1NWF0U+VRsgBTCDVc7g8EfWTnk
	QkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=45mSqhP1yxDHiEs6LQkOCEqsncYe5nRY3mbVQiuxjTk=;
	b=dId/8UhGZz+5XQtZYlDXNRuhWliStAXkUbPIZNx0zgnzyKC/FGjzlJhlLflTxASHbw
	RkAfz+jWqBBUQvKSFhc8/9BtiUSskjNCMgnPP+Z0SYPa8h/l8ebM+oG1sggMvuf8wzat
	GV9H1Xcik8ZZrI9NXr+NL494DU+BXvIrtkOFZG5He+HMS6N30kkefBj8DnwsS8yBmbFP
	Klde+D+b9MtcOdtTHFLZlt1u2waJ59sN2ZdPLRsZI1JoZkryc3/oNDPcCigbCOsfq2BU
	yUQG5kbCE53nGu+ha6Nk3cxFxOaZe7OpuCvrmMxe5DPzdYxZm+qmqQimBkKcgBFp6Ukh
	vj9g==
X-Gm-Message-State: AHPjjUhY/33BtaDyUbigvGjx31Axfx4UMQ9WWu9M7Dc4l5rAyjrmWiGB
	XrsVlbZ9wvht/jpZ0sjcwqU=
X-Google-Smtp-Source: AOwi7QBMZbI7WxX+fOVEvSCcNGBbzugCUdB6I9t5ipa2OjG8LXwHsteHsINYD0z51JMnjTvWO50vmw==
X-Received: by 10.55.212.93 with SMTP id l90mr8352993qki.30.1506094879627;
	Fri, 22 Sep 2017 08:41:19 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <minyard@acm.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:54 -0300
Message-Id: <20170922154014.29350-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 14/34] hw/ipmi: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:23 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ipmi/isa_ipmi_bt.c  | 1 -
 hw/ipmi/isa_ipmi_kcs.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 2fcc3d2e7c..e098fd5206 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 /* Control register */
 #define IPMI_BT_CLR_WR_BIT         0
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 80444977a0..689587b65d 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 #define IPMI_KCS_OBF_BIT        0
 #define IPMI_KCS_IBF_BIT        1
-- 
2.14.1


