Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgiJ-0001zL-7A
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiG-0001xs-Qn
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiD-00041b-Mf
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:04 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiB-0003vf-GU; Thu, 14 Dec 2017 22:30:59 -0500
Received: by mail-qk0-x241.google.com with SMTP id b184so8878454qkc.13;
	Thu, 14 Dec 2017 19:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dE9/VrLXUsd9QSinJYetmJuectThn+ECLZQ4N/p5ghI=;
	b=Jqep8Rr86NwvvuA3sRq5u+vaD04t+CqiRBENUrZLTyNt+cbzYQLGe8Ty8XSAp2Xm9E
	MnXEGV0tEePuvs296Cj7+nUdaNoMIwfTakKXvKx+RZayJ4PdfH5ZF9Y6mQinG3qlXRYS
	IN4hrtBi/JTK74do1KlNKsYNxmmUseaa/84P8Gh5NTOIQg5j488p50nEEqDQPCH1ABSI
	yPUZeDUUH33qKtLg1l1wuhRpIf3SkxFd/tQ8q2FWI/3qAZRAlrm3MVAey0Gglls3ba1f
	jbBWVMU6X/cWy/eJwg4Ai3PLr6LTCTlV0u9fCskukayZjBjEiwPV8Nd74ScK1+4+6MTp
	ydUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dE9/VrLXUsd9QSinJYetmJuectThn+ECLZQ4N/p5ghI=;
	b=rhPzP6bPVRUZNJinUt8JbbUDjmIiG24a+/IN+9GRx57Qh2qGGKbnPjSp6AgJarCWnT
	SpwE8ZGspdjGBOpYMris/bJ4hlu//1dY8JpawtdIFrKEwsOy4HPL8teN9KoL9l5CccZL
	CzTYr0TFIYJR4DEtI2aMr1ytRHONLDLlymjm3Ms3ozEYMISI281p7h2tBnOjeTXoyavX
	MsEaqpy0vWssdFvKl74b7DtTLKcaSdlLdTxYlcY6hBjHczM4+ZrRfAMq+o+gdNlplUJl
	qT9cTC8YqLa5lbWwb8i4EBHqqPxaL9sFY/oxQ4LGV8yaEBeD5dE5H4IRyZ2vozzMAYYu
	Q8BA==
X-Gm-Message-State: AKGB3mKpsaM3WTqUO1l3dRk9hhJq4GEgVDzqbQ2uDAICGccI2OwHz2eM
	GhNC8e68L1LsgCtylsgD7xrQ+IXCbLA=
X-Google-Smtp-Source: ACJfBotIQxJpYTM34sL3kqwAVxxA/UJ6fZ+d7nMu02MfA/OVKkcE56NBdftmjZDh/Gr4QbieUvF1vg==
X-Received: by 10.55.97.135 with SMTP id v129mr18075943qkb.305.1513308658896; 
	Thu, 14 Dec 2017 19:30:58 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:ppc4xx)
Date: Fri, 15 Dec 2017 00:29:42 -0300
Message-Id: <20171215033015.738-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 10/43] hw: remove "qemu/osdep.h" from
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:06 -0000

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
2.15.1


