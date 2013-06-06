Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkRMO-0007ao-Bu
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 23:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRML-0007Tz-G5
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRMK-00083p-0R
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:33 -0400
Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230]:36615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRMJ-00083g-QC
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:31 -0400
Received: by mail-ie0-f176.google.com with SMTP id ar20so3286007iec.35
	for <qemu-trivial@nongnu.org>; Wed, 05 Jun 2013 20:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=MCrHX/rMKtG7mDqjJ2ssSZocP4XHg4T4bI8oPT21/Z4=;
	b=NItXSJYqYSc7LUCZYhvOTbL9XRdyE5m+3qvyQoeQcBfygG+p3UKWx3nOuSiqoe5UK9
	CVhROltbuO0Ruf0kv18ehZeuOyPU51Wy0xqbdgKIO2KxnTIUTHQtDX+S0GUP0b9ZTrfJ
	FuW9obWOmveKEJfClX0QHrYhr4whKVwW6a6jKkVynOi2cSVUlM0MCGThLzkL4Rt9vuRY
	Z7cL1fy+r3wwFCE0I61T/swMLELUf9CuiUMNbTkPqQVohrMPspCgi1CBKCecKxMsaaxe
	Ro275n1AglFkR2nYWPM7pvGRRvCdmOZC2YaKhwzi+vRzLB/TGawLkIeDTvUhw+VDKoV6
	tQAg==
X-Received: by 10.50.8.10 with SMTP id n10mr4821770iga.20.1370491171169;
	Wed, 05 Jun 2013 20:59:31 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	ik6sm9610874igb.3.2013.06.05.20.59.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 20:59:29 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu,  6 Jun 2013 13:59:06 +1000
Message-Id: <1370491146-10778-3-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
References: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQmvxgcS8kN96P+20BLbackuox3ZpsulbtUs+xtNZzBm1RXnMcMlAG/JqTOBVAZN6fsvjCfs
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::230
Cc: aik@ozlabs.ru, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Scott Wood <scottwood@freescale.com>
Subject: [Qemu-trivial] [PATCH 2/2] KVM: PPC: Add dummy
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
X-List-Received-Date: Thu, 06 Jun 2013 03:59:34 -0000

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


