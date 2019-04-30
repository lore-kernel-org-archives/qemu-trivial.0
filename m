Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLWag-000832-NW
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2019 13:30:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLWad-0007zj-PR
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 13:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLWab-0005ot-PM
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 13:30:47 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hLWab-0005mI-DT
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 13:30:45 -0400
Received: by mail-pl1-x642.google.com with SMTP id x15so7051219pln.9
	for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2019 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uihYHrYj3HakLhRkBBdSUDTDHGZaCyGKyU0mzSpESvQ=;
	b=mCDQBdunO0hUngRO5ZFWMRAjbF81vr8Bgn/0CTyWhREDYSg451LHElqXYoX9LqR/Tx
	72O+yUOHH1XIAMZztm3MzrIkJi2Ay3MT1xV1q4B8PlvR3Z9zPjE2ncs/EXovH1hidaju
	Nl8+DaTTshFZ36ftBLGA1JV27PhbYnz2/cRjaud+rFto0iaO0tfZOv901S3fDezVNwiu
	bigZsA2l277flNS3XhgkYGD4Z4kt0ZMIQkR28fw29of2jN1kHMmo0DDdkVw2eVorzx2d
	oPnhxjSRlse+3T7qGwn01OvFdhT87jOzbVVJ1nylQ2hGQB1+V/Vtsr2Th09I6T+EDeyd
	3JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uihYHrYj3HakLhRkBBdSUDTDHGZaCyGKyU0mzSpESvQ=;
	b=rWsnsoX023GJ7sxY0vn61kAvritanBAIGZBVp/x+BWhnT7tGQNtbAvxrkJuX0G6JWj
	kgBeruugkgs5C7DyziG9Bxq4zkeb0dHgPLRkXDqjRIMrKNU0b8ZPed1gmyzL0SYDbqMD
	amtLsA7P03w3G4iXavHkzyT4DM6Gpdm1E1P438pDIY+H+sNx4yiEu1IjWdk2iaxq47qh
	8y1H7kBv4CDNwJJT8WV67Yq4SAe4qaOEkFKQMAj4Y+yHq9J+kdIQxmrqacY4XPuCaokn
	K4lqUKvfRqCFio+bx14xLkHN+bJj++TkCPEWul/NPunAgSFpIbj9ZBN84vKjuX/rqUOi
	2/1Q==
X-Gm-Message-State: APjAAAVzTyVx3rRn4ETWlfZ3+UdJBu3zBJqx/Nfk9a+y/dR8/6zkxbmk
	Gdj0W4NEZkwqKF4xRi82QxLehQ==
X-Google-Smtp-Source: APXvYqx6/LFfPEs0Dp5RlilHCosSrXJ38nNHAZ4al6ZrPwF3s57vL3GxCnkJ4dpv2ncX7/uTttysLA==
X-Received: by 2002:a17:902:26b:: with SMTP id
	98mr41541345plc.30.1556645442060; 
	Tue, 30 Apr 2019 10:30:42 -0700 (PDT)
Received: from MBP.local.hk ([175.159.180.1]) by smtp.gmail.com with ESMTPSA id
	y23sm52407101pfn.25.2019.04.30.10.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Apr 2019 10:30:41 -0700 (PDT)
From: Boxuan Li <liboxuan@connect.hku.hk>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Boxuan Li <liboxuan@connect.hku.hk>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org (open list:PowerPC)
Date: Wed,  1 May 2019 01:28:42 +0800
Message-Id: <20190430172842.27369-1-liboxuan@connect.hku.hk>
X-Mailer: git-send-email 2.13.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-trivial] [PATCH] target/ppc/kvm: Fix trace typo
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
X-List-Received-Date: Tue, 30 Apr 2019 17:30:48 -0000

Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
---
 target/ppc/kvm.c        | 2 +-
 target/ppc/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 02e22e2017..1a9caf8f40 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1721,7 +1721,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             trace_kvm_handle_dcr_write();
             ret = kvmppc_handle_dcr_write(env, run->dcr.dcrn, run->dcr.data);
         } else {
-            trace_kvm_handle_drc_read();
+            trace_kvm_handle_dcr_read();
             ret = kvmppc_handle_dcr_read(env, run->dcr.dcrn, &run->dcr.data);
         }
         break;
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 7b3cfe11fd..3dc6740706 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -22,7 +22,7 @@ kvm_failed_put_vpa(void) "Warning: Unable to set VPA information to KVM"
 kvm_failed_get_vpa(void) "Warning: Unable to get VPA information from KVM"
 kvm_injected_interrupt(int irq) "injected interrupt %d"
 kvm_handle_dcr_write(void) "handle dcr write"
-kvm_handle_drc_read(void) "handle dcr read"
+kvm_handle_dcr_read(void) "handle dcr read"
 kvm_handle_halt(void) "handle halt"
 kvm_handle_papr_hcall(void) "handle PAPR hypercall"
 kvm_handle_epr(void) "handle epr"
-- 
2.13.2


