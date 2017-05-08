Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFf-0004vw-Tw
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFd-0004tU-Ln
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFd-0002Dr-0P
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:37 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFb-0002Ae-4A; Mon, 08 May 2017 19:39:35 -0400
Received: by mail-qk0-x241.google.com with SMTP id y128so12357749qka.3;
	Mon, 08 May 2017 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fIrWJJY5bruHpLpl8JCMpZRtwe8SsnFtV3Fm/aZw//c=;
	b=UOcADpy7OdTtebVX4EzrkYjF92TfxXztkkVvLeZnICRZBoBEuE/CmJ4j2oUSpEwirK
	/+P9gnENDqDnMj3NgIafG8N39usTpapMJzRYDsPHstNkU2fk2tpC0W8AWVPdmi21AFGT
	Zclw2MiY3LoTdTfpYrxpu5mk0vAbvPFKfJ/2NWfYj+iNI8yuEVuQ6xOdzGQbsLKc+StM
	ptXbbqoBpPC4hhtrwxBC/WTzFtylz0NV+IAo73D5VP2BjqUaKTY348k1Z1VC3mlWS6BQ
	rxXslEOXLA4i/XKb7CoAcfNZdFs46fjVHAcEXMi4cmEtcf56rF/Dbl9Zyc52VDLiyxZQ
	0a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fIrWJJY5bruHpLpl8JCMpZRtwe8SsnFtV3Fm/aZw//c=;
	b=FdgVBEr+4mlFWcG9wGSL9H88yTxeqe2FPZgMUyLimZFFKTAdNQEVzquAEEcmuOj8w1
	dQrGFKt0aPxIn5qJ2v/15na1VRLrOf/YgNBtIlP8EtCEIHZ5QjpnBL/+99a7TO9+Olxx
	YN+4pNRUJELDp1I/Ax1RCAUsUbqVDXLru3L0nArBDEAXTTANVcjceECu/9SNN3P3mFaE
	l6WMoN+hw8/hSmaDPNcbCd8zB39jRq9Mzb68ohb8lzDXbtjLxYvv8tk/sjZFt4wJIn8h
	uS832FngwV88Iuim1jwmaqn0W6C4s78pX1MjQy/LaTiyW1qOihL0Cu98NlVUlmfF9Gl/
	8Srw==
X-Gm-Message-State: AN3rC/5gHCe0YcBLb0uwdtWdrDpIySl9FPMaASmWCl4LxIPCUoxsFbxP
	h8blTNBc4uSJkA==
X-Received: by 10.55.131.7 with SMTP id f7mr26664274qkd.0.1494286774571;
	Mon, 08 May 2017 16:39:34 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:09 -0300
Message-Id: <20170508233918.9043-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [RFC PATCH 02/11] hw/pci: define msi_nonbroken in
 pci-stub
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
X-List-Received-Date: Mon, 08 May 2017 23:39:38 -0000

This field is accessed in hw/intc/arm_gicv[23*].c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci-stub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 36d2c430c5..ecad664946 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -24,6 +24,9 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "qmp-commands.h"
+#include "hw/pci/msi.h"
+
+bool msi_nonbroken;
 
 PciInfoList *qmp_query_pci(Error **errp)
 {
-- 
2.11.0


