Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgid-0002HH-3d
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgia-0002ET-Pe
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgia-0004ZI-1T
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:24 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:42474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiV-0004SZ-Iq; Thu, 14 Dec 2017 22:31:19 -0500
Received: by mail-qk0-x243.google.com with SMTP id a193so158695qkc.9;
	Thu, 14 Dec 2017 19:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gN8GnwYReil4DLlvsMXU0h+w1RkfziU+E5V8kCi5dFs=;
	b=dwHa04vOK5Pyi9bkWUPDmfYEHSXPAI1jVrRs8atOzJeKbNdS1Clwxzi8PSpI3FCO3q
	Tw29vJpTeQh1z+kvHg+0S935S9wYJpopVDcTgJAF+cMEtt8gyIEQ7LsQrQ2F7cLIripE
	RSsKW5cbSLdnitseZOsB/UENQJ6OotMvnl8xlGcFgbGVYAm7h/yq9nu3oEbzujSK/RNO
	ZKCoWTD5m8CwOStAIeyfgllZLlhbnTmW8K1d5ch5R9XDkcDFJ/0BHmR4AouAElyCcaBu
	pMuGkCYIeJ/7qG1Qb7RYZkhfZBg+GT08IpMGyZWexI8AvDQt33QANZ3QIM7RCNaXFD7Y
	NSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gN8GnwYReil4DLlvsMXU0h+w1RkfziU+E5V8kCi5dFs=;
	b=dRjisgUwJ+nKgd1U702iNTEsrvawBiQyd5YK8eqJd3hbVpAvGriIyRBq8HLoHfhPFW
	RDoP1LwRSvRpf3q0P818sGGTMzA0kgVVmPIe7ZL6Syh7SqPqARNvcyUCy3UbsrgD4uNT
	ucWah2XMCMMltknb6IKH0elhrd3Os8+a5rvf6WiEcXKyl8l5EGl4jcOGX3pVe1I6Wr55
	6/Q58ShH4ZvJTMEvRYgy9852k568tchxaP/tHBGgAHAPLarxTPOBND93ANWvlI7sGNWO
	dg3CBIgBiwraS54LnDB8ENuRDblLDlpjwYoL8zj/p1GPwVTkS4Bw08XkRpQBmkBwKoqQ
	7mdQ==
X-Gm-Message-State: AKGB3mKhxsZ1FwFTky/ezSgQKGmhO6Is7cab/xGfDYJjTD1diM+sVVAl
	SJCnB+ngbTjh9e1karvixzk=
X-Google-Smtp-Source: ACJfBotkVcXGXRt44RqjfcwGjNQmm/mV2O8yaKxwI1Gw6M/TOnHn22RV79cGfD6Vfp52Cf1ZuP9g0A==
X-Received: by 10.55.87.65 with SMTP id l62mr17701132qkb.255.1513308679085;
	Thu, 14 Dec 2017 19:31:19 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:sPAPR)
Date: Fri, 15 Dec 2017 00:29:46 -0300
Message-Id: <20171215033015.738-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 14/43] ppc: remove duplicated includes
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:25 -0000

applied using ./scripts/clean-includes

not needed since 7ebaf795560

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 1 -
 target/ppc/kvm.c     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index be22a6b289..51eba52e86 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -13,7 +13,6 @@
 #include "trace.h"
 #include "kvm_ppc.h"
 #include "hw/ppc/spapr_ovec.h"
-#include "qemu/error-report.h"
 #include "mmu-book3s-v3.h"
 
 struct SPRSyncState {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 9d57debf0e..4664a3ce9d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -47,9 +47,6 @@
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
 #include "qemu/mmap-alloc.h"
-#if defined(TARGET_PPC64)
-#include "hw/ppc/spapr_cpu_core.h"
-#endif
 #include "elf.h"
 #include "sysemu/kvm_int.h"
 
-- 
2.15.1


