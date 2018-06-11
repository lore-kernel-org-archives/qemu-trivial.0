Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRV-0005HZ-7Q
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRP-0005Et-TA
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRO-0002ss-UY
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:15 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:33706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRK-0002pl-RV; Sun, 10 Jun 2018 21:16:10 -0400
Received: by mail-qk0-x230.google.com with SMTP id c131-v6so3504028qkb.0;
	Sun, 10 Jun 2018 18:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BDeKJGQrUivq4RhBXjZALkC83H4jw6eGFc6jLVbQq/8=;
	b=h81vH3atl5TgDeqgRifEjAsoYHZ4UorwKSibIfeyRFPcCHylb3Regd2fW5d/f8ZLAg
	IWh6EQ6kVMKEw4m9nScy4PJXxvVjp5zdm4lbVvaxM7BmChcNerH6dPG3VbaeRWaMsNiZ
	GC4XvoLJMBaIgTZIsO/hffuq+6seVrdE18XGVtVqt7SWrjfGLOJHggSnhe+POPT2sWOt
	I6E5uCvGV/d/d9F3B+dRgOoyPAS+cSlRh5shRm5tilh3evpJTp7IZlRV2SKBmAUJb2cz
	ueWAWVfyKVJ1Qz88C915fxBl+uwEn87E5xcVLCcUcst+xrdE5NFgpQQMupOMsX2odQih
	YWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BDeKJGQrUivq4RhBXjZALkC83H4jw6eGFc6jLVbQq/8=;
	b=NXl5SXOm8gMKozB+vQ4/UKz/POMF3HydtJH2yoOYlWnOpULJPWsryeU9EJVvYiBZfj
	DRZUe6m5ckk/yZkurIFuFdJuF7EusHmIwjDUDIe62JKlCOO93DYWwh8z8R8YHHcH7JFJ
	PT/cC+DUVCThbcRARu8eqEa/wEHOQm6bNMiH2ZKQwQMrjWT459v5fKbbq/AFmurYrnCR
	DL7XZxrNHEHSWm1K7Ce0urcAKL6agcaEGaWJ2Ucg3FSMtU27TLpKAzYTqhDH82E2KZK2
	4Lp8aVEVkhzeFEQMDs6mRJzawaMckHlPWK+gQuHO1Vo7CYRBkvoaJDePNk8TzaTFQnhz
	/eCw==
X-Gm-Message-State: APt69E1zgv/CwecaCUP9ZFTWmP1kjZoiNNvFG//NfnV7xSJG6mZG09Dz
	LvSoQ3FbhUjfpaZ/SHX87Zc=
X-Google-Smtp-Source: ADUXVKK1cwzRGSAGMseiubQCXFR3vm79G4sCR6Lp4LoG7fm8Sal8CorJDLr5/LQNJjfMDaS5kKP1hQ==
X-Received: by 2002:a37:66c5:: with SMTP id
	a188-v6mr13099942qkc.201.1528679770416; 
	Sun, 10 Jun 2018 18:16:10 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Sun, 10 Jun 2018 22:14:33 -0300
Message-Id: <20180611011501.10235-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-trivial] [PATCH v4 12/40] hw/tpm: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:19 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/acpi/tpm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 46ac4dc581..3580ffd50c 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -16,6 +16,7 @@
 #ifndef HW_ACPI_TPM_H
 #define HW_ACPI_TPM_H
 
+#include "qemu/units.h"
 #include "hw/registerfields.h"
 
 #define TPM_TIS_ADDR_BASE           0xFED40000
@@ -176,7 +177,7 @@ REG32(CRB_DATA_BUFFER, 0x80)
 #define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + A_CRB_CTRL_REQ)
 #define TPM_CRB_R_MAX               R_CRB_DATA_BUFFER
 
-#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * 1024)
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * KiB)
 
 #define TPM_TCPA_ACPI_CLASS_CLIENT  0
 #define TPM_TCPA_ACPI_CLASS_SERVER  1
-- 
2.17.1


