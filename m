Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfSa-0003Pn-2M
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSW-0003Ii-Gs
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfST-0001NA-Rh
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:08 -0400
Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234]:44530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfST-0001LU-Kv
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:05 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so9399411pbc.39
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 00:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=em+gCqNIXKBYu3FJXDlfrJFM83YsuqSBGAmZ1RmOIzY=;
	b=GiDGj2vPxhlKfu+f/YNqgn7DamMFB5/hA85KgwJeHIC85xU45NU8sH5wjWvDxJj+6+
	rkA8VbYoSbPABkpVPOlzcpMz3Hmymopl83buQni3b0uR2xp/Rcb2K1tVON2qTAW6VyQt
	9vk2obmkX8GrfSGElPxrbUlY9cpodwaaaq2vyI32aco8tTLXVQ29RZVL9AmxOnSJcY99
	blBFA96fIbyGQ8uuaLNyhKWUZS/dG6XT1u1lkr2DM4HMfr+ZRiEsHKPvjtVAzRp3nG57
	7g28I3XxyDnninDN4KBSN8LgiKsRFkNnE3bQos2BE88ZoW3bJ3BvbnF3PM4eU+3oBIHi
	CsDQ==
X-Received: by 10.69.3.65 with SMTP id bu1mr18387566pbd.107.1371022024841;
	Wed, 12 Jun 2013 00:27:04 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fp2sm18055499pbb.36.2013.06.12.00.27.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:27:03 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2013 17:26:51 +1000
Message-Id: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQk4FWZVYODs1lL56fbkdi0J2q2LXeF2GS/ik4lXUnxnRZxrfSH1c6StiPZXfdm7zX8VMGfi
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::234
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 0/4 v2] header update request
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
X-List-Received-Date: Wed, 12 Jun 2013 07:27:10 -0000

We need new headers for live migration and in-kernel interrupt controller support.

However just copying new headers breaks at least PPC so dummy kvm_arch_init_irq_routing()
is required as well.

Changes since v1:
* added dummy functions for ARM and S390 as they are supposed to get broken after
the headers update;
* now headers are from v3.10-rc5 (the previous try was for rc4).


Alexey Kardashevskiy (3):
  KVM: ARM: Add dummy kvm_arch_init_irq_routing()
  KVM: S390: Add dummy kvm_arch_init_irq_routing()
  linux-headers: Update to v3.10-rc5

Scott Wood (1):
  KVM: PPC: Add dummy kvm_arch_init_irq_routing()

 linux-headers/asm-arm/kvm.h       |   12 ++--
 linux-headers/asm-mips/kvm.h      |  138 +++++++++++++++++++++++++++++++++++++
 linux-headers/asm-mips/kvm_para.h |    1 +
 linux-headers/asm-powerpc/kvm.h   |   89 ++++++++++++++++++++++++
 linux-headers/asm-x86/kvm.h       |    1 -
 linux-headers/linux/kvm.h         |   42 +++++++++--
 linux-headers/linux/vfio.h        |    1 +
 linux-headers/linux/vhost.h       |   28 ++++++++
 target-arm/kvm.c                  |    4 ++
 target-ppc/kvm.c                  |    4 ++
 target-s390x/kvm.c                |    4 ++
 11 files changed, 311 insertions(+), 13 deletions(-)
 create mode 100644 linux-headers/asm-mips/kvm.h
 create mode 100644 linux-headers/asm-mips/kvm_para.h

-- 
1.7.10.4


