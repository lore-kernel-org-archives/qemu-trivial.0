Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfSg-0003ak-1m
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSb-0003TQ-Uf
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSa-0001Ql-Kr
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:13 -0400
Received: from mail-pd0-f169.google.com ([209.85.192.169]:48839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSa-0001QM-Dn
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:12 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so9551960pdj.0
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 00:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=dTr3lQW0ZIm7kAGETuDu8iKWqGZyKZ0zUu9QOoqQnyk=;
	b=mSeksouUYu2tJOtV4rvPs7fMWhTlGksNYdd0KlyPwaipQBi2W6ftOqdRekrDgt+vze
	E1SbIEYCnty2Tv/Ts7jKDUf7M+NwJMJjjo2wPpbyRkMEFyR2CvcACtgxbgKS4j7vm4Fi
	GucrcfFH09yjVhwOEwIkCBFAM7v0JIsH/v9JyHuA8slzFTCNg7tBcjK6AvQ5XRD2gsyi
	zRIUtR4uKO26lpPiM4kUkcaJ1gdMdOyJfk8YXZJKG3LDnDT6eDNxVKa6eyf8+tq3uyQ7
	mOYDI1LlhNJ53uhNmSfkxPpajgUC5ZODOlh3pIJOdO0viI7B+lHeGyODkUvNJUCyocEN
	+y0w==
X-Received: by 10.66.20.66 with SMTP id l2mr22233678pae.205.1371022031639;
	Wed, 12 Jun 2013 00:27:11 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fp2sm18055499pbb.36.2013.06.12.00.27.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:27:10 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2013 17:26:53 +1000
Message-Id: <1371022015-7576-3-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQm3l5/Otd37gF4J2oqtMQYyMCbzDiA7ukjULtBKOA3rq5eSnkHFcJUrC0BeCLAe9pt6UA34
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.169
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 2/4] KVM: S390: Add dummy
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
X-List-Received-Date: Wed, 12 Jun 2013 07:27:16 -0000

The common KVM code insists on calling kvm_arch_init_irq_routing()
as soon as it sees kernel header support for it (regardless of whether
QEMU supports it).  Provide a dummy function to satisfy this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target-s390x/kvm.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index 862fb12..4d9ac4a 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -928,3 +928,7 @@ void kvm_s390_enable_css_support(S390CPU *cpu)
     r = kvm_vcpu_ioctl(CPU(cpu), KVM_ENABLE_CAP, &cap);
     assert(r == 0);
 }
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
-- 
1.7.10.4


