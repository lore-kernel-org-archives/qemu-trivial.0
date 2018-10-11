Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAZrJ-0007o6-Jl
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 08:14:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gAZrI-0007nF-3a
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gAZrH-0004p3-Fo
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:14:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44282)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gAZr8-0004lm-6r; Thu, 11 Oct 2018 08:14:19 -0400
Received: by mail-pg1-x542.google.com with SMTP id g2-v6so4086044pgu.11;
	Thu, 11 Oct 2018 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oJPUw9eGc+c4/HJRXmrY6G+YLqLvGXQU1VtpKbbv9Ws=;
	b=f59z0haiqB8ykio+6dC0Bra2PCsXg7GRZhatxPyDW3+vJP4WOgWS6k/77DaOjcxiEc
	zWf6CzMlr8qLpTwciSD+axNg9crrsiXIbxsBRiRbW+h0DdV9slNHHOM1vPa6wBBxVmpP
	fWPX+NHpmEk128+wB7YeS+1SY7ay8i1rfd2BcSA7XawvUbaWlVXMaXLv5SCY1LM7eWI4
	1w66qZK73RIggRywb0tM/kGpfSAfONwOdDkoWsaIurJAfFRI+wCkRAn8++9ZvVRAF6T+
	IMseYFYB2y5Yf+q7AX0QCX5587VeQkIBYnAX3jM1HEv6xA8xO2aIJprcf4Tu0wpw0YEU
	G2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oJPUw9eGc+c4/HJRXmrY6G+YLqLvGXQU1VtpKbbv9Ws=;
	b=j4fe/0I5YtLMcZ2OuWSBUD+wis/TBJJBVowucjCu404TSGSxcupfWXwVSPsB7AhnPX
	3wFh/IvW/erXffy519yfxBZwFJBb9iWPjbXTtoUrWPn5qqqlivin7346pQSX4MODNzsl
	QdWTNMDhx1+LOaYuVgMTDP7X7TYcbT5cdwbBDGSQft0muN2m7iPQY7Kq57gme6WKgPnE
	9bVD4xH/lOjlmAm92+sCe+dboFd/kle95tLwZSSSMmMqcNMoztmnEi1b9JU95RxBG8nZ
	cmCGcgFV1JZx4ESuQjgVQBwESTagTPelWLk6qnYRtGsowgv5Vw6e00bLL889TRcrhEMD
	hIdg==
X-Gm-Message-State: ABuFfogLwW4ez+UoJrSTktbNei3s2IBJnFsQ1d5Zy3tAawhk+1rVp6JX
	D9dHsbD9yubEnIjT84iYWVw=
X-Google-Smtp-Source: ACcGV63ayl9P5HIMosd5C2xXbU+VBMEx7RVFjj7H58Lj4Rk8TiDiS8UBP6NMfR2Ori4EfteFkso/gg==
X-Received: by 2002:a65:5083:: with SMTP id
	r3-v6mr1165286pgp.355.1539260056690; 
	Thu, 11 Oct 2018 05:14:16 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([103.65.40.65])
	by smtp.gmail.com with ESMTPSA id
	x186-v6sm39410691pfx.152.2018.10.11.05.14.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 05:14:16 -0700 (PDT)
From: Li Qiang <liq3ea@gmail.com>
To: mst@redhat.com,
	marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Thu, 11 Oct 2018 05:14:03 -0700
Message-Id: <1539260043-4264-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-trivial] [PATCH] i440fx: use ARRAY_SIZE for pam_regions
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
X-List-Received-Date: Thu, 11 Oct 2018 12:14:28 -0000

Cc: qemu-trivial@nongnu.org 

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 hw/pci-host/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 0e608347c1..230d5d2ea3 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -142,7 +142,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
     PCIDevice *pd = PCI_DEVICE(d);
 
     memory_region_transaction_begin();
-    for (i = 0; i < 13; i++) {
+    for (i = 0; i < ARRAY_SIZE(d->pam_regions); i++) {
         pam_update(&d->pam_regions[i], i,
                    pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
     }
@@ -401,7 +401,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
 
     init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
              &f->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
-    for (i = 0; i < 12; ++i) {
+    for (i = 0; i < ARRAY_SIZE(f->pam_regions) - 1; ++i) {
         init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
                  &f->pam_regions[i+1], PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE,
                  PAM_EXPAN_SIZE);
-- 
2.11.0


