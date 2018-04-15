Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJQ-0004oj-HQ
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJL-0004j2-Nb
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJK-0000VV-Un
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:55 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJK-0000VA-Pa; Sun, 15 Apr 2018 19:43:54 -0400
Received: by mail-qt0-x242.google.com with SMTP id b13so996607qtp.12;
	Sun, 15 Apr 2018 16:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nmCdF5MsAweB5uqhkMasSfF67mlBlWWDsqJZ1BXm6iA=;
	b=htL10zK2//3EbFEAOdbjrJge4hATnJLydz+vFRkzkGCNINRIbmwvxnWetV5PvPBgST
	oH0Nc4xjzWP2zSFmxCJIrNqdXXBq2dwMnfSqtQ/jDxwqVUEljzHclKaDQG0uhqIF6sWu
	qte193FA2xhq1WoTH3J832Kn+erGRvexrcV5UaBGC3Kbqy6GgXwmse4VB4v+GJxN2uVI
	24GY4+1OgomIr3kv/QlFr0RypkLjmLPivmELMVq63wznCC574yX4cRBEDcv2DcT5Rwfq
	rjtyiwz7+zq86cb2LPmnaxXekwNlgxknnql+vVa1VzmhKBJV6wJ0/p9NxCGG378pjnoO
	cAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nmCdF5MsAweB5uqhkMasSfF67mlBlWWDsqJZ1BXm6iA=;
	b=dTm8jzIAFxaD5sGQmyvXO+qLKNLL2wKm5eABmF4+Xf+Da0qF4qtikjjbBPevk/ozV7
	vg7D2G1y9j9+217oEeCGC7Bq32UvwNHiitj3+caodJzAWJlJ2K7eSgHgq1YhmDa1sJAa
	FnCTqTm3bIgXorBF0ohpovvsvKl2AT7/0dQIKFDpnbTDp8UvmD80361BCqYXbbLZlTTu
	EPUUVtpnhAzhYTN1Po/E470OjxePMgEJa06m/n7bI5io/Rx8GipSfofPNDgKeZhQS6P0
	H1WizHbbcW68sjG7qV48WQkiUyPrfAk2gvLqeJt+7vGGW+zWT++Ust401YK/SrQwBZJN
	nDsg==
X-Gm-Message-State: ALQs6tBXQFWkvhWYBrHFBcQDf1gqlWtTQKRNSSiVXdZ3hqnMdQt/gqf6
	VX5MnXycOKPwVIBl2FySoXw7qfON
X-Google-Smtp-Source: AIpwx4+lZihLXvm6zxYiMxlV4KNF6WlYY8YEh0vVOTkixpPCT7dRJlK1g/LSmYufdnuGUrlJvG1BkA==
X-Received: by 10.237.47.100 with SMTP id l91mr10133233qtd.216.1523835834093; 
	Sun, 15 Apr 2018 16:43:54 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Sun, 15 Apr 2018 20:42:38 -0300
Message-Id: <20180415234307.28132-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 12/41] hw/tpm: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:59 -0000

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
index 46ac4dc581..5c72efe999 100644
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
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * K_BYTE)
 
 #define TPM_TCPA_ACPI_CLASS_CLIENT  0
 #define TPM_TCPA_ACPI_CLASS_SERVER  1
-- 
2.17.0


