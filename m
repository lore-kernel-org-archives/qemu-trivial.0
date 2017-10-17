Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FW1-0006oM-KG
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVy-0006ke-6I
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVx-0004d9-AC
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:46 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:54493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVt-0004aP-JM; Mon, 16 Oct 2017 20:13:41 -0400
Received: by mail-qk0-x241.google.com with SMTP id n5so12695qke.11;
	Mon, 16 Oct 2017 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rZz9SpYE8cJUXiDMqqgnGSu1BW1/SuO+/tdPI4rNDkw=;
	b=ELKamTM4QMcRCF4R60v9B/z8QvDRQUcxBiigVuWPxIeNOJpHq0GDZXJ9wLQIqD/1ek
	4s81LXJdnE/WHMYzOp/ng/zCLmRMNuxHc7VY5HQtoESZ8y9J83ebcUG3vUd4bRRkIz2I
	d3vfLuHp4DvxLEQFtl0tmJeZ/5k+NFit9vhqKIl8sVsQe8NZvLN2NsZ8fBfvnUM2qukb
	Ull6mDcCqRmcm0dkdR4vbyxOzNqOU43T8fgZvdxIYtEaJpCw6AflP7u5hwvceiAomjdk
	WGL1tSURlohRmw0JW9AMKN6MZh5loBJILZgD4Pv7JBFrmRzZSchF0SHO8/v/lITjVTPm
	DfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rZz9SpYE8cJUXiDMqqgnGSu1BW1/SuO+/tdPI4rNDkw=;
	b=DM02CEmvA6G/y4wzXVfDeBn/UQ1xBI9nSDU5oEHOCChXTZritbp5BHbD5k2OqsNTNn
	NVG8u8mO8rJ8Xq76GA9u5F9c3YsuDrbIDHypRVcykHwFdp0Yl2/O/tDii94KByDvtFFN
	vbl8S6ykmVOkcevpRjhn/Zec+kz/ApIHwHl8/mY/VCmnSR+5SfRBLKr5/DtqaLXwP63M
	j4ON+eQrydO+T4c9HUZFQTg3b94/NC/Mtt/xHJz3cH3zBYbJ1vdhkATTVm/KfnAmOozU
	R7VMdiTEDnlgZ/4gGQtcfiMqGSxY1T9YTLYCySF38nsO1JQyg57jhes01WxAm0Rz2462
	Rt0w==
X-Gm-Message-State: AMCzsaVsYihPs8PpyEvp7rSJIRhiS0jEs8QdvSEV8qebBM2tgPmcJdlO
	2chTbLOqalAYEtaJTSh/aHU=
X-Google-Smtp-Source: ABhQp+QA05dZykUE2zXGFoqBYEtleWgFCDBdsWnQoMi3ZcmdZrdfih5rqrJQV6aACDdWRn13hJmD1w==
X-Received: by 10.55.127.66 with SMTP id a63mr9639209qkd.90.1508199221174;
	Mon, 16 Oct 2017 17:13:41 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:55 -0300
Message-Id: <20171017001209.32276-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 25/39] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:47 -0000

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


