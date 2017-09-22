Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4U-0004R8-3C
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:40:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4Q-0004OL-SM
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4M-00031L-Hn
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:50 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4C-0002pT-PD; Fri, 22 Sep 2017 11:40:36 -0400
Received: by mail-qk0-x243.google.com with SMTP id g128so877900qke.0;
	Fri, 22 Sep 2017 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=A+X4NjKdSZ98YfB3XO+lOzZQXjpxyvOtYDVm50DKHRg=;
	b=JGqj/z72UgyzlUNYMZW4M/zFSGXeOGIQeUIShXfx1HcwFMXda4PzE50lVpwwgTMYHj
	ePOVuTkqFrOHXHQAfSQIMzyQTtsfeYRTh8RH4mpGwZFfd7XYHP9lp/sTMVCgzS+jXRFE
	oDJg6f0WrSL/F8ObMx/z2kCN1OZrtBISQ4Owk6cAywPHFajRJv4Oa3vkVeVqm3nlGxju
	H/ZTJsDwlCuf2OhXxwe3jZ6KYrbTJ/jiz0vdMAtVOspfAVjnpvgOWlBn8NKa06lpH1Ha
	zsRQGlTkIE4JnVzVVmmlRpmCIY2clUW/87k4U8fRPsr66h4wiCRlFO9gy3MK5YnWdLyx
	a0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=A+X4NjKdSZ98YfB3XO+lOzZQXjpxyvOtYDVm50DKHRg=;
	b=Iok9SroOpbqXBXbPs00lRUcluefkt3dxId3x+xQQlwfouVqFMXVDR7GihbA+fSP/6S
	FQIzlIR4RG7VQGVA0UaO7LqopUkmWmYoGJeUufJwGHpO/Jijwg/W5obcZiYJdyq2zclY
	vZ28rile2LSK8B152rCYqtqtBMdNo9Fcd1XQHNzWRgvo0CYvwygHyPtOfVzjtMTnXgVK
	oAMiWiHulXt9Djj3cmDYgAQ0ZNT92iPui058bH8cUzATFwfpuPeuK4qhTzDkc8uxWLAS
	J2v+LQoGf/uuHxWM3Ck4fkXh/6WjtzTP0Bo+yoK0QXrGQAOxUyDAlNWZt9NyhOyVO6H0
	ckVQ==
X-Gm-Message-State: AHPjjUhkQ8mS9oSv8bjBfGv7oVK7N0r71qksFmnUgdOQJV9+ZeIXIQgx
	RzkTMuaifg0bCqk1HYDH+Og=
X-Google-Smtp-Source: AOwi7QA62JhGBrVWba08PBQuY0ArCARosGRA62DNsvSjX543NggHpXkND/zHrsY5img4s33JVxDgrg==
X-Received: by 10.55.130.197 with SMTP id e188mr7916425qkd.203.1506094836160; 
	Fri, 22 Sep 2017 08:40:36 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Corey Minyard <minyard@acm.org>,
	Balaton Zoltan <balaton@eik.bme.hu>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:42 -0300
Message-Id: <20170922154014.29350-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 02/34] hw: remove "qemu/osdep.h" from header
 files
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
X-List-Received-Date: Fri, 22 Sep 2017 15:40:53 -0000

while here, add entries for ppc4xx_i2c in MAINTAINERS

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

Zoltán you might want to add yourself a reviewer entry on ppc4xx :)

R: Balaton Zoltan <balaton@eik.bme.hu>

 include/hw/acpi/ipmi.h      | 1 -
 include/hw/cpu/core.h       | 1 -
 include/hw/i2c/ppc4xx_i2c.h | 1 -
 MAINTAINERS                 | 2 ++
 4 files changed, 2 insertions(+), 3 deletions(-)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index 762e37bfd6..7f49f1d046 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,7 +945,9 @@ M: Alexander Graf <agraf@suse.de>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc4*.c
+F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
+F: include/hw/i2c/ppc4xx_i2c.h
 
 ppce500
 M: Alexander Graf <agraf@suse.de>
-- 
2.14.1


