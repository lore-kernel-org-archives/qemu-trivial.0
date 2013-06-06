Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkRMA-0007AA-JR
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 23:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRM7-00078Z-K8
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRM6-0007zR-OK
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:19 -0400
Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b]:43989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UkRM6-0007zJ-KD
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 23:59:18 -0400
Received: by mail-ie0-f171.google.com with SMTP id s9so5895878iec.16
	for <qemu-trivial@nongnu.org>; Wed, 05 Jun 2013 20:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=gvN8g0fw9U18RcIgKLxTEH1NklhMgymoncjGvJsENYE=;
	b=Wm9BiLm3gSscNtj4u+Nu92Cr6ZszoGPKlNgZLkRQxPQCse5/ZrZ1q9HEzGxK3zQH0t
	fmmuXCDS4VnHqbjcuoq8Kj8GpBXAE5PzA0l0lpGTnGpGb5FADoWH7MsQq00UhP1Ni9tY
	qVmhwmr91jbpSjoavQTrcOE8XHuQiuGQBzF7zV/O2By5l40MwSrRGdWZO7dr+Lelmy7a
	O576YdsruqSq+SGOZnIJtLhO+Gt2NTAl8PWUTZ9nyccf15KzBLwyqh0dKN3toNP4zrVV
	8COypPOQ6t4IfsmReYr7JbwTTVW06Xhrua+kcZ2a8Ur5fl1QF89RHkPnlQYokRtX/bGG
	nhmA==
X-Received: by 10.50.3.70 with SMTP id a6mr4691826iga.6.1370491157305;
	Wed, 05 Jun 2013 20:59:17 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	ik6sm9610874igb.3.2013.06.05.20.59.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 20:59:16 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu,  6 Jun 2013 13:59:04 +1000
Message-Id: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkalXMEh8uqj20siCV42lFuyIopO0pYAV6HyUVDoNB8qLt+kn+DeFa155B880dqEcYP6Bb2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::22b
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Scott Wood <scottwood@freescale.com>
Subject: [Qemu-trivial] [PATCH 0/2] header update request
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
X-List-Received-Date: Thu, 06 Jun 2013 03:59:21 -0000

We need new headers for live migration and in-kernel interrupt controller support.
However just copying new headers breaks PPC so dummy kvm_arch_init_irq_routing() is
required as well.


Alexey Kardashevskiy (1):
  linux-headers: Update to v3.10-rc4

Scott Wood (1):
  KVM: PPC: Add dummy kvm_arch_init_irq_routing()

 linux-headers/asm-arm/kvm.h       |   12 ++---
 linux-headers/asm-mips/kvm.h      |   55 +++++++++++++++++++++++
 linux-headers/asm-mips/kvm_para.h |    1 +
 linux-headers/asm-powerpc/kvm.h   |   89 +++++++++++++++++++++++++++++++++++++
 linux-headers/asm-x86/kvm.h       |    1 -
 linux-headers/linux/kvm.h         |   42 ++++++++++++++---
 linux-headers/linux/vfio.h        |    1 +
 linux-headers/linux/vhost.h       |   28 ++++++++++++
 target-ppc/kvm.c                  |    4 ++
 9 files changed, 220 insertions(+), 13 deletions(-)
 create mode 100644 linux-headers/asm-mips/kvm.h
 create mode 100644 linux-headers/asm-mips/kvm_para.h

-- 
1.7.10.4


