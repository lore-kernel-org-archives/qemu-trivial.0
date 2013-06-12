Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfSb-0003Sx-L4
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:27:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSY-0003Lt-Pr
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSX-0001PZ-5D
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:10 -0400
Received: from mail-pd0-f173.google.com ([209.85.192.173]:43218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSW-0001PB-VW
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:09 -0400
Received: by mail-pd0-f173.google.com with SMTP id v14so5672220pde.4
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 00:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=yFs/RMsynl9ZXpS6/rotYIjDsRoz0PTDv0QFg0pgWFg=;
	b=ada0tWtz2en1OoNDY1vQmaIllIvKgLsrb2tuD0Wudcq0Y5JD7NkOSxBkN2xslwn5H2
	jKzxrjAIZmLbySR1+U/yrGGWxJ53QMhd6+DqkDs+pQzlFN9C8+WkufJCzj1c5ayCRQ3E
	FLYvFFCLN4V1k6lkMz8/SypNxawrHCU5E+d5D7HEVnC3QtDslqkQGp5DEDmvLxF5E628
	WsEJKXgvYNH+QF1laeSdcADQnLsQH5z6PAT3qtnMwEzE+lhAdERuwqTyXzLxi3uKXZqq
	BRwevEL1vokRIEBlxrrcZam22FIBvOTWN4/IvHwnQeg2+PMUwBo0oN0Xjcwh2yxqXIcC
	EMRQ==
X-Received: by 10.68.229.138 with SMTP id sq10mr18388191pbc.38.1371022028239; 
	Wed, 12 Jun 2013 00:27:08 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fp2sm18055499pbb.36.2013.06.12.00.27.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:27:07 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2013 17:26:52 +1000
Message-Id: <1371022015-7576-2-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQkc58DP0teMqh2LmHbeINOw/FVAPHX/uk4I0AGf/l/DLu4MVV0MG40DrqVjdmt3mZtVSTZl
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.173
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 1/4] KVM: ARM: Add dummy
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
X-List-Received-Date: Wed, 12 Jun 2013 07:27:12 -0000

The common KVM code insists on calling kvm_arch_init_irq_routing()
as soon as it sees kernel header support for it (regardless of whether
QEMU supports it).  Provide a dummy function to satisfy this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target-arm/kvm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index b9051a4..7a90d38 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -493,3 +493,7 @@ void kvm_arch_remove_all_hw_breakpoints(void)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
 }
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
-- 
1.7.10.4


