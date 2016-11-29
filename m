Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBjlY-0004tI-2R
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2016 09:52:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <po-hsu.lin@canonical.com>) id 1cBZBk-00040g-KJ
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 22:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <po-hsu.lin@canonical.com>) id 1cBZBg-0004zp-0C
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 22:34:36 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:35396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <po-hsu.lin@canonical.com>)
	id 1cBZBf-0004ze-MT
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 22:34:31 -0500
Received: by mail-pf0-x233.google.com with SMTP id i88so28759926pfk.2
	for <qemu-trivial@nongnu.org>; Mon, 28 Nov 2016 19:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=canonical-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9Hhvg3yq103cVleRE171xQ+poWjJ/hQJb3hZYnGJ+rI=;
	b=MUU7WGUfSwn6dolHiBlz5h5USAbzR2yGDHt6xhXuG0ejljjMWeju/N0LNMC2rnLRY6
	c7EfpY46YDc+k608wAv/JiPJ58X907FAtlSz7qk70FRMCbKqr4F4T8L0Ju2THFEAfjdo
	P/sdV2qpmubQUKYwdt9Qc8Zvvb3TjhlegIJBfYf7KEZFI2xnMatdxWZHwZH0bbrAgxKV
	tu83bh4+bWReZkAYur4Y8DRbWefqtjIOaUvaVwhuKzqmrpZQ2DEz0k5z9EUEm/AHarSJ
	v3aen7OXDPmrYu2npOADruFhh4DqwmoA4JTzg86c2/0CeXDfNPeksGEiybiQZbIp3lgV
	pBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Hhvg3yq103cVleRE171xQ+poWjJ/hQJb3hZYnGJ+rI=;
	b=X1kVfE5xxE6FsdtCXfyjs5RSY6v+STE1Y+MTpad9F+6AqMk8pfV6N6XR0acUVyYOCs
	MflPM3/EVuYGcSap9mwh3cPL9OmYsC1tcF6m0AJNqJ50CjMcQ7M8z5lVfr2/u7NNsqPE
	OgJhTEKrBU5N42DUrArRtix7IsFb09jTd4NMSaOjInKiEO2wa4uJJK/E8J4huvwcHv1z
	qO2kXK3qlgLYlR9sT7gNQTI/FUYRuf50ePlB1WcQCPiZVPI+iMuXVdecBnZAs6MR4rMF
	B2475RsfgvabT5b8F3rMHxdr2mNOaCHFGftxjS8W2WA8nVerzqFFmzG7DzHizofx/nMh
	HrRg==
X-Gm-Message-State: AKaTC02SKy03zCIlwx5rWKwn9BdDtBF2K4ZFvqKKinnUBoPvFq30FlknY7MBuWaSab3JKRnX
X-Received: by 10.99.60.11 with SMTP id j11mr46724776pga.26.1480390469574;
	Mon, 28 Nov 2016 19:34:29 -0800 (PST)
Received: from localhost.localdomain ([175.41.48.77])
	by smtp.gmail.com with ESMTPSA id
	y2sm90394879pff.82.2016.11.28.19.34.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 19:34:28 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 29 Nov 2016 11:34:22 +0800
Message-Id: <1480390462-14130-1-git-send-email-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::233
X-Mailman-Approved-At: Tue, 29 Nov 2016 09:52:15 -0500
Subject: [Qemu-trivial] [PATCH] qemu-options: cleanup duplicated help
 message for kernel_irqchip
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
X-List-Received-Date: Tue, 29 Nov 2016 03:34:37 -0000

Remove the duplicated help message for 'kernel_irqchip'.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 qemu-options.hx |    1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 4a5b29f..76689c4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -32,7 +32,6 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                selects emulated machine ('-machine help' for list)\n"
     "                property accel=accel1[:accel2[:...]] selects accelerator\n"
     "                supported accelerators are kvm, xen, tcg (default: tcg)\n"
-    "                kernel_irqchip=on|off controls accelerated irqchip support\n"
     "                kernel_irqchip=on|off|split controls accelerated irqchip support (default=off)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                kvm_shadow_mem=size of KVM shadow MMU in bytes\n"
-- 
1.7.9.5


