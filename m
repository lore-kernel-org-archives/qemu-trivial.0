Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVK-00066U-8J
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVH-00063n-SA
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVH-0003yi-0w
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:03 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:47671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVC-0003wW-Vk; Mon, 16 Oct 2017 20:12:59 -0400
Received: by mail-qt0-x244.google.com with SMTP id z50so60235qtj.4;
	Mon, 16 Oct 2017 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1S1zneIwNjpkvHRDkXShy/fNZi31QyD+YdfZvt+9Qp8=;
	b=f/gwolREK7NA7c6toK0Q+MwKH2x3iPbxZftr84R1ChnS8KavsD/8wEW8O+EDiiW0iI
	5C+XEKA4+H6Tk0AoqV86Jp3LAl93uj0LAI2JRbia6rsabLFj6MAKS0gKUrtMzTaCAW91
	XAU6JuGBOt05BTs7oQh5HaG2sHD0P6YB73EVf8sLCIIJscq8CAgdPyZxllQvtKPrIy8t
	tvki3S4Ukj5SauqrrQZSGreswUYK5uKt2wjFDPw1vAYPEpx2UYcFRZPI1cnKQfIhNAgG
	jA8l2Z9TFyhAkh9y05YrOK6MHB1uoPfx9TFwgv7qwpobmmUsaGCthWegVBmml+lhjxF5
	8rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1S1zneIwNjpkvHRDkXShy/fNZi31QyD+YdfZvt+9Qp8=;
	b=cofBQylN2pRw/R9v6KgGPfKeFBLImK76zeazyShYDTVga13crKDmShupCxI73zu05f
	bCmq69kTIwedMZ8AKMmZJLUdD8d5RMce1g3ItO7UpH7pxBjrmxAvGe/NEDLeBMLlzJnI
	5FyR2rnfGzLj2mXLQ5hT3AArRaTcKG/YV4DR7dpHZpnMDFmnxTMrgMo2Buy/wWElPOWQ
	W1uNP2Fcn3Y6LFPTAlJh+i7IFP90V7CTT8t0u8mMEwr2qltYBTsvriaVUIHyZqFmPIGC
	HPn4Vs+ojem5YLSuYpan9gvSmUIV7npUWiXvl6AQTm2Sd70cQSmBdb9b453dLRWomWLR
	l5Wg==
X-Gm-Message-State: AMCzsaWay24hZUyslLLJ6PzIOYKZXHc1NMXR5jne7ml6OUdX1WEdVQOO
	xs+iY7hCOkS9inqUaFSI+Ek=
X-Google-Smtp-Source: ABhQp+S6wfkRQgbBawG6rhL65OBeBfnIIUinJFK8AZtFk4Jd9e8uoez80kZOOcf0oR6NB49ylNh4yA==
X-Received: by 10.200.41.90 with SMTP id z26mr14448558qtz.47.1508199178573;
	Mon, 16 Oct 2017 17:12:58 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:39 -0300
Message-Id: <20171017001209.32276-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 09/39] hw: remove "qemu/osdep.h" from
 header files
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:04 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
---
 include/hw/acpi/ipmi.h      | 1 -
 include/hw/cpu/core.h       | 1 -
 include/hw/i2c/ppc4xx_i2c.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/include/hw/acpi/ipmi.h b/include/hw/acpi/ipmi.h
index ab2bb29048..c38483565c 100644
--- a/include/hw/acpi/ipmi.h
+++ b/include/hw/acpi/ipmi.h
@@ -9,7 +9,6 @@
 #ifndef HW_ACPI_IPMI_H
 #define HW_ACPI_IPMI_H
 
-#include "qemu/osdep.h"
 #include "hw/acpi/aml-build.h"
 
 /*
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 79ac79c29c..b7470644d8 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -9,7 +9,6 @@
 #ifndef HW_CPU_CORE_H
 #define HW_CPU_CORE_H
 
-#include "qemu/osdep.h"
 #include "hw/qdev.h"
 
 #define TYPE_CPU_CORE "cpu-core"
diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
index e53042f6d4..3450bda577 100644
--- a/include/hw/i2c/ppc4xx_i2c.h
+++ b/include/hw/i2c/ppc4xx_i2c.h
@@ -25,7 +25,6 @@
 #ifndef PPC4XX_I2C_H
 #define PPC4XX_I2C_H
 
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/i2c.h"
-- 
2.15.0.rc0


