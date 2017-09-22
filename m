Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ59-00058z-2M
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ54-00053l-He
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ53-0003Rw-LQ
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:30 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4x-0003Nf-1H; Fri, 22 Sep 2017 11:41:23 -0400
Received: by mail-qk0-x241.google.com with SMTP id g128so879449qke.0;
	Fri, 22 Sep 2017 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vDFnSQ+ZN1e/wYz3YPhricYSAs2ayL9+jrP91Da0t50=;
	b=nB3w5Ho8VGBqNKIS9rNDeXOjJnQwMXEbzm4G6Dm73mQivymNG6DPc7HKp2Sj20mMlI
	sxZSeh9cceX5+P+rGS6w87JQXNeHwkRV5AmOXcXDP7cdgZkrqBMO/yc6NxvDfY5tFABc
	2TdYOLviSl0CvRPPve77iYuyXPSZLQAXC7zAuRfv3p/cvxWldOaqzWGcxILTRCIRbT73
	Ed9f/Z7y/+8FutWsen2e250RAqDoBxIm1EzUeU1Ye5oNsjZJc9dkWZ6HDqrBpii7bUt0
	xj/I+pN2HcD42c07a8YrmloVyzu4xM+kh/IeNyVOAiERMiZxLEBSYAdx/hYbpxMcXvY5
	TkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vDFnSQ+ZN1e/wYz3YPhricYSAs2ayL9+jrP91Da0t50=;
	b=jeY8OgnNlNSGCbcPYhfK08HyiVbWShixFeW8R+ZvgvqdCaTQOA8K5+jkCUWtBjJ9AF
	00t8M5u3ItsnI8X6sxtpyBqwCLmSqx8Eagf39sM2WgHtTJfzclC7Mxa9uCo6fJqcBYMd
	rkAxbPze9RqLFGybizrUPB1tLrbfpGeEp023Qxr4lCSrVkeN1b5Rd63G7Ei9X/j7P5NO
	4U1Ue1IKo/tTzsnjouvc+9GU1GRMkieQinT1HS/ioXsvi41UIYa7p+jolNRE0BOkSE+d
	lpMHGl4I5W95jfBV74GjmYv6l+vISl97hPN6lsf634w5azf34gbfeYg/yr7IvmzVsU9V
	qnTA==
X-Gm-Message-State: AHPjjUjoZSe5qwFJYtMquS9FRS7CFp50UVfI68d+W0SgQpLT64WvDARy
	4Bk3RBGmctJ4Lx17zY23O58=
X-Google-Smtp-Source: AOwi7QDvScGqPHU2/Vj/qDZkIZ6atDaGfbjtlE3pTGWMTOHY6YYPSso0+AUJFiyQUiPJDHWL1r3qYw==
X-Received: by 10.55.104.138 with SMTP id d132mr8615479qkc.151.1506094882547; 
	Fri, 22 Sep 2017 08:41:22 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:55 -0300
Message-Id: <20170922154014.29350-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 15/34] hw/i2c: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:31 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pm_smbus.c   | 1 -
 hw/i2c/smbus_ich9.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 6fc3923f56..a044dd1b27 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -19,7 +19,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/i2c/smbus.h"
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index ea51e09186..082cdecba9 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -26,7 +26,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
-- 
2.14.1


