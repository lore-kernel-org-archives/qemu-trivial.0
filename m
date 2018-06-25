Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqR-0001Od-PU
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqP-0001Lm-Oq
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqO-0007ii-V5
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:45 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:33603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqM-0007h5-23; Mon, 25 Jun 2018 08:43:42 -0400
Received: by mail-qk0-x231.google.com with SMTP id c131-v6so7370120qkb.0;
	Mon, 25 Jun 2018 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+dMOwVwWsV1ekYTem4+xUaMUvfilyxHnQ6xvBi0DQCo=;
	b=XlsPLnSA3XAdSqlGqamU3eAH1GX/pDsfpHxk9jEAZfFiwaLtsePgvTjYx5aJAEbeqF
	cuRSoNkQ0Ortv5/VK7izgzr01IxkQ5PIl9fo5MzV2mN8sC1czS5adlGj3YUtKH6P1rFG
	CI5ykXnP38QnIs9zjeX+j4zXw2GHsVLPOvSRqgqUcO2z1gqTA36Lg4Q+/Wu2Iz2p9B4z
	75XPJq5ZFvPnYNtGSv0D5v1vPUsjON0dDRyLkn46cFFqstzdw72S+sokVEOrlpcOQjWX
	kNOVFQV5e0IgUSO0p6bSTzgkbwVUGCuoSI8jFMeb4+SvdrbWKSm5IcojhWZNOMVobjCE
	EmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+dMOwVwWsV1ekYTem4+xUaMUvfilyxHnQ6xvBi0DQCo=;
	b=KJU7z8dSzp9t0ipvIMU1o9zfmtU3dThb5wf/+7E86gvgsZox5wxTG2By9u/MRfAiG2
	2K3rQRo3lbyqarxHV438mlD7+XCLTrAIhxA12/U2UBFP4WyN5fluLradVjJPd6Plu86U
	yE1Kky/OoWtfME1goGPPqc1DD/DOAZMF3InV00OqC8P5MHcDbXTDwoiJVYSzWZpX0EXI
	cWzG9hNIKEyS43I+Tmk9Qtd9/h64g4opaWsyeIQ+IlhPwzH8zj2mQk3ZQAPxUt1Gm+xk
	pYKxGl5TjK+LuTqj2osvKEdplFd/jNRlUVuj8IJ+e9hV6maCP9Psa/T1D+BqHd4xaXJP
	L2eA==
X-Gm-Message-State: APt69E2AsR02jSzjrYIvQeywjKISbPlZeEiUB7ipdDFtGwnT+aCuNI+F
	h/O0Q53SvuIT94ISoVVST/YF8Q4bWXc=
X-Google-Smtp-Source: ADUXVKJuumF1Hko4OoH2wQURQqwvWDR+9no8YQgpUAhwjlQz7LmfKZQvuwOfWGMkynqoI44If91/GA==
X-Received: by 2002:a37:9704:: with SMTP id
	z4-v6mr10710222qkd.272.1529930621559; 
	Mon, 25 Jun 2018 05:43:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Mon, 25 Jun 2018 09:42:04 -0300
Message-Id: <20180625124238.25339-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-trivial] [PATCH v5 12/46] hw/tpm: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:46 -0000

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
2.18.0


