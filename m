Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfSm-0003no-6U
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:27:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSg-0003cN-Rt
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSe-0001Ss-UW
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:18 -0400
Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c]:32931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSe-0001SV-MI
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:16 -0400
Received: by mail-pb0-f44.google.com with SMTP id uo1so4648882pbc.17
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 00:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=MCrHX/rMKtG7mDqjJ2ssSZocP4XHg4T4bI8oPT21/Z4=;
	b=nHsqFFEkTHhsY5rN58PS8CrvNJuAGoaYtftkupvSZivTrgd1qsFO+AOuqGbC5sSL3j
	dJFxtJkMeWxh6g9gYrjKhY+DNc9VEy+Z7ABVxeN+KrDmuir1tCl9sQGFTtvTI2+z1tsK
	tJ5vcuidZf8SfJ3o/LRdXTOVe2Rb/S0jY9ekXHWk+Dr16FGT86SoI3FN3PL30xSHRb4/
	zdN8rbu33eaRU5PDzKkA2UuVYqNoBnjuozncxHRcrCXQM8BtfX605EQiYrt5LuEG5CAx
	b64FiR2VRsVYSSwD9LNuBaXLgipMpqqYR0uYD566tABC3eLvyZ2FzkEtYa2PJx6CpzRu
	2e9Q==
X-Received: by 10.66.253.195 with SMTP id ac3mr16923360pad.107.1371022035955; 
	Wed, 12 Jun 2013 00:27:15 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fp2sm18055499pbb.36.2013.06.12.00.27.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:27:14 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2013 17:26:54 +1000
Message-Id: <1371022015-7576-4-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQnnQAdyzmT2JVyOol2QwGkaCbwaFCbK82SwIiRtveyFQB04Lr1m3MhS3NeqVU00JRPDHvXw
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22c
Cc: Scott Wood <scottwood@freescale.com>, aik@ozlabs.ru,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 3/4] KVM: PPC: Add dummy
	kvm_arch_init_irq_routing()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 07:27:21 -0000

From: Scott Wood <scottwood@freescale.com>

The common KVM code insists on calling kvm_arch_init_irq_routing()
as soon as it sees kernel header support for it (regardless of whether
QEMU supports it).  Provide a dummy function to satisfy this.

Unlike x86, PPC does not have one default irqchip, so there's no common
code that we'd stick here.  Even if you ignore the routes themselves,
which even on x86 are not set up in this function, the initial XICS
kernel implementation will not support IRQ routing, so it's best to
leave even the general feature flags up to the specific irqchip code.

Signed-off-by: Scott Wood <scottwood@freescale.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target-ppc/kvm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 3ab2946..2bbc3b8 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1797,3 +1797,7 @@ int kvm_arch_on_sigbus(int code, void *addr)
 {
     return 1;
 }
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
-- 
1.7.10.4


