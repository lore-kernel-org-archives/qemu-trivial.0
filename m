Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYY-00076a-LC
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYW-00074T-HK
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYV-0000wT-PQ
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:00 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYR-0000r5-Fx; Mon, 28 May 2018 19:27:55 -0400
Received: by mail-qt0-x241.google.com with SMTP id q13-v6so16573214qtp.4;
	Mon, 28 May 2018 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/mcnQlssau2qNs+MOnfgSdw4GtT8U7I6zxg582DyCiU=;
	b=lGLUxcMBJ7XZ0sN31D0sQBb5caUndbPQKX8v6A3DzlVtyULfgxQP6nEy43Req+9cDH
	DKyDDjmd61vtzX/ias0/eoRYiS3erEeWQtx01Qgvd6Tptm9l4YOambZGqAkVmNYKHQF2
	+HP+T0gkqR1MGSspri0XZQOFN4tEFC9x3z+GJBMQ8jmndyswJFfPQCMtuculWLqVADD0
	vEct8XQk0SGa3RzxGgCuknMiUmQnjHIR69FB6xw9EbW8iPjYR/ZC+1dPcdV21esrRC44
	2WWypC6PmHM8PFNmK6uhHJis7SqQ4FzTEaXSbgAMiYV/FPEZ+dxvKcWVCeYTrHUqw4SM
	aosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/mcnQlssau2qNs+MOnfgSdw4GtT8U7I6zxg582DyCiU=;
	b=bSAUagw3fHLj1SVzAp802AZIkBDjc18zFLltZdUai8navQ22/EF7m4RSPJeKC/GKak
	TLnCGO9ZgBCXgEEkuzoFAV2a/cReQwxvv5o3F8ah+tjBazxpvZE24bMsikDWQFjeWCBt
	fDMYKg5X67FC+Hd04nXHj34mqDza+KcUr11OKjl4rqaOkx13qvuaFKqqu9t8RQLjkCFm
	tCCnS2nGb3sL3g860HFKcwEz2g8grgGu2TDDaEL99blmFBXv+FM/GJFcLqq/hf+R33Ua
	lryKIqUq32B9SAvtGqIyD5+SKTYMDdJIJvmZlbbBP3Cq3yiqsKb7kzl6FqPgYPs2ZUaV
	o2SQ==
X-Gm-Message-State: ALKqPwd6uOavR+/rZJ2xKcA3C60D+Eab+YCKUodEhrMthFoNFXgVYoUZ
	vrWCAjBX0R1hVinEvl2wnrg=
X-Google-Smtp-Source: ADUXVKL2ZrUFq4Fdsz4kDw3Tw6SnmouUWvL8pOPBdh1j+TAI5VuK+bzbYvBedHg4lek5O3BNLmF86w==
X-Received: by 2002:ac8:b07:: with SMTP id
	e7-v6mr14173701qti.266.1527550075036; 
	Mon, 28 May 2018 16:27:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:PowerPC)
Date: Mon, 28 May 2018 20:27:05 -0300
Message-Id: <20180528232719.4721-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 07/21] target/ppc: Include
 "exec/exec-all.h" which provides tlb_flush()
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
X-List-Received-Date: Mon, 28 May 2018 23:28:01 -0000

Since it inception this include uses tlb_flush() declared in "exec/exec-all.h".
Include the other header to allow further includes cleanup.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/helper_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index 84fd30c2db..5efd18049e 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -21,6 +21,7 @@
 #define HELPER_REGS_H
 
 #include "qemu/main-loop.h"
+#include "exec/exec-all.h"
 
 /* Swap temporary saved registers with GPRs */
 static inline void hreg_swap_gpr_tgpr(CPUPPCState *env)
-- 
2.17.0


