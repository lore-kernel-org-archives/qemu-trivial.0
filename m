Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0u-0002b9-F7
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0002Wc-LD
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0003cp-0v
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:56600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0l-0003Z9-SC; Tue, 17 Oct 2017 12:46:35 -0400
Received: by mail-qk0-x242.google.com with SMTP id l194so2826719qke.13;
	Tue, 17 Oct 2017 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rZz9SpYE8cJUXiDMqqgnGSu1BW1/SuO+/tdPI4rNDkw=;
	b=faNEq2Kzugu8LJWdMA+FjV+4NGQZ19wz6NBOw128g9cg8jQEGFb90FRl60pkE5TjUw
	jy2oYccl/KQAXHWzU3345P4aEFqk0RQjMFe6V9OxLp5l9cheFw1Y64Q43G8Jt9ovbNkR
	Oh3p5jxIsR7vp1YVVXLVA4gBTN/NM/MLj0xf+SyiIu0z+Phg+88HUZWwKAFLU9wlvDMS
	5FPUQHK5GULLPpRcMcXVsBjne9lesx2AuibTPOf9m+CF1uY4ZMr5Zo/oxYMEheT5lkgy
	HPqwDbuAM0MQNKBmS7L3M3hgfI64+k5yiPNi3dR5O1FUETY24BWYQoVDOPs+Hy+0gixu
	tdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rZz9SpYE8cJUXiDMqqgnGSu1BW1/SuO+/tdPI4rNDkw=;
	b=ggkL7A/1AYtyXoAbRnPBtjk7Pd0VgtKIAL3bUUrndvGUJUH4mXFgAGLjEae2/5IJO6
	LW2MzEJIRhH3e5lreFOlWFCgp0JhIe1DsgttJzhGvKySnDSSJlrs9w1sbcwMM2ZkeVcc
	89lNXDdptXbqN99NS65uvXHtQAl1RbKkpNcjD28WI0PE/oWQiNcmm2ydIm0re8Tsk/eD
	812ltKtTtMOAork7GvFmahH25CArZ6HGtbxdhikNP2neEHeuqIcE4zDXtE45su+gKi/8
	SZItbCDGg7gxS5ZKuRqvBBcTYJZVZo0yfOMaMAwJaArDI1Oc/sqhHLp5jPyV7bQQ74rN
	jcKg==
X-Gm-Message-State: AMCzsaW5zN5NOpi7VjJ0Bn4x9cPr5KYnsYmw8PXm4GJY4FKnXjmaKy1w
	ecQHawB/eAWXj2DmKT+kFA9fUKJc
X-Google-Smtp-Source: ABhQp+RO1xePLtH+97jEO8iMDyxQBIveFaOCYXkFfNOQqqoHyEI7TmIg8YRxUIrh8Zphucas/1hiXw==
X-Received: by 10.55.127.66 with SMTP id a63mr12699367qkd.90.1508258791049;
	Tue, 17 Oct 2017 09:46:31 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:12 -0300
Message-Id: <20171017164426.25277-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 28/42] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:41 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_passthrough.c | 1 -
 hw/tpm/tpm_tis.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index e6ace28b04..7201844657 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -29,7 +29,6 @@
 #include "sysemu/tpm_backend.h"
 #include "tpm_int.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qapi/clone-visitor.h"
 #include "tpm_tis.h"
 #include "tpm_util.h"
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index d5118e7f60..b07a28aa29 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -28,7 +28,6 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci_ids.h"
 #include "tpm_tis.h"
 #include "qapi/error.h"
-- 
2.15.0.rc0


