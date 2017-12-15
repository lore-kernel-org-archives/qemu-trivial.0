Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjK-0002xX-UJ
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjI-0002vB-Ob
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjF-0005bM-LE
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:08 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjC-0005Wl-FI; Thu, 14 Dec 2017 22:32:02 -0500
Received: by mail-qt0-x242.google.com with SMTP id u10so10619516qtg.2;
	Thu, 14 Dec 2017 19:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gIH+QVz4MaaE7W7uyjQdjkamrPdjHVMbI6qUQhSSTeg=;
	b=Gz6apJgg4mlrwxTOUcpdMtn6/T6SGpZZP4jQNOmA1nCvgHORyB9Ewz2/giBZUTbRej
	EU1tXqd4CoIldnC2iUB4AJdyRDTe9xAvmpLdNtMit20lHYZZyTWf1mfMZDfvpXdahIoj
	owsVDQ76F+V5bryCKxO1au4Dhilf2u9xFRPnA5by0iqDQTAqnnk1u9rABKGIVTxUP0+2
	JUwqdKFd3IVMw1u0fd/1s1VmEA82yeu3F/n2feMEnBihspLNLe7u74f6vTwj1gyKPMt3
	hYKsSRpeoyfjHn8G7Al2SEE3zi6gkjzCJwgGV4OLrqVj+efqdnytfXnBlbhPBCnFBRsF
	ceGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gIH+QVz4MaaE7W7uyjQdjkamrPdjHVMbI6qUQhSSTeg=;
	b=Hgd2Nbo7Wa8BOnvuyo6GQPm0pt/6iEolljdZFeDwmxjP3kpL6dose6viiu8BwQoivs
	J/4ziktYbnzl4Sf8oJ3upl9mghVj+jSHWapcgr4pAHtHfrE27383RBB65pqHe6i/Wolt
	XAt8q9kLcy7eexLLI2BKrfe9MVZQYwUQl3KY5FNuy+LOutE8X2I52gHH8r+BQDbRzwcq
	Q2WO7KgWjaWdKJcUS7yxd6IYK2DCjw3EmtAbjo3zm8lfC71zCTpzNy/acj5XN+pjsNlo
	GzQpP0LtjMh0+u/h3Z2YkflpoMgj6X/Nh7tSxWA+pMpyfj1DHNTFvwAQE/wMspIFIRc/
	+jrA==
X-Gm-Message-State: AKGB3mLd6Ne6BNGpJr5SLMljBEsApIGoHSX4shUj4qdOZpAFzW4RumbI
	j52S1Wko1JOLjkYYp+9D5lI=
X-Google-Smtp-Source: ACJfBosR8e4W2ogt9ISXtjTD45zeIqywiddCeYD1PXA+8lCterb5Sc7AZ6AB436J/kClC7g6WyiUiQ==
X-Received: by 10.200.57.40 with SMTP id s37mr21011652qtb.41.1513308722007;
	Thu, 14 Dec 2017 19:32:02 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:58 -0300
Message-Id: <20171215033015.738-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 26/43] hw/ipmi: remove old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:09 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
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
2.15.1


