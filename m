Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0A-0001jG-3U
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V02-0001ba-Jw
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V01-0003Dc-KW
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:50 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:51129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzx-0003Aq-GD; Tue, 17 Oct 2017 12:45:45 -0400
Received: by mail-qk0-x241.google.com with SMTP id o187so2832031qke.7;
	Tue, 17 Oct 2017 09:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1S1zneIwNjpkvHRDkXShy/fNZi31QyD+YdfZvt+9Qp8=;
	b=d8KbYQo11fsn2Wzun1W9gwc+cG3G7wGO61mGmssWjxPA6bHDQLImi+17TeL0TPgpCG
	RN+hkhYfNM/vPVoyOFm6MeND8MpaHicivXj4J5lt5liz1OsXtLo9e1+WAfiMkkOm5ltG
	9ZAKRaMH9Xs/tnuwCkYtJWGlvoQAJKjSp42bshT9cekWBUCE42wegsANIbGT767Ezyhc
	fwu2XN3AFizMNuWbHn/5rKrSuptZsksbtrPLtSOfbAHi7ouo0GNLMuJIXB/BS+IgScPu
	emAFPRFI/sRdjwoVMpCk/NsuxJHy4yGOciLGIaPfZWR8Op7ulL0JwAuVRpmGA8twMDdZ
	E0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1S1zneIwNjpkvHRDkXShy/fNZi31QyD+YdfZvt+9Qp8=;
	b=R986/wezxcKxKzaxfQrhCiyUbrg5Y3ULTboe6iOZTgaIe2F2ONA1PjAoD0FrMIgrt+
	6L5I8hRPPLv4KjpSTFNcFApbYkhdIX7itzjvd6v+SRJ9QBZmM/kat2kgKhND52UCifTq
	mK2cB6EDc+9AwZg7tuJt0KBuaCb4eO8Qn+kvRV/Xk55fVKr5uKUG7NTlzyCXDcpJi5Ah
	OOyPiSN5/JiSWJsgBw6rkS28CNnTOC1gbtYl2UfBYBnXwvr73iYWCKQ/D7F/ABRNyrAG
	CxqyAQ5QM6pwYsj1rhOzadB1aTc0PpSy34aLua+9Fbif26WrpyPp4D3SVyJ+cPEam8rF
	r4OA==
X-Gm-Message-State: AMCzsaUExJp3WQBA5RWV7Bfwvk/IJu6HQO6tQltym+IMB8e6TZeEtzEy
	e1tjegUbu2qDSOUt3/2bYohVtAD6
X-Google-Smtp-Source: ABhQp+Sb33Lv4Ck4o0LSDfcdGEvgrDcXtyfmO3NDtcm0BPZWUEa+HTXlIV/hZz5iHEtftbVSWNB6cA==
X-Received: by 10.55.137.196 with SMTP id l187mr14026256qkd.134.1508258744929; 
	Tue, 17 Oct 2017 09:45:44 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:54 -0300
Message-Id: <20171017164426.25277-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 10/42] hw: remove "qemu/osdep.h" from
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:56 -0000

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


