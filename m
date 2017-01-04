Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOn8B-0005YU-PN
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 10:05:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOn89-0005XB-16
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 10:05:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOn88-0001kd-AR
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 10:05:33 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cOn84-0001cV-2a; Wed, 04 Jan 2017 10:05:28 -0500
Received: by mail-wm0-x243.google.com with SMTP id c85so53645795wmi.1;
	Wed, 04 Jan 2017 07:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1HAUjyAnYj40C7YyTqBbnV0VC+jFXhOTqhiDkxjyJB4=;
	b=AG2CBUjyUQ0XfdY8rxjbfB+BpVUgML+QHYpZHfu80MxEbiOH4nBW+vgOwopr8tddAj
	7tIhr1WlN8qFVnKHTetQS9moR8Uf8TQgMF9Xq82pQggHwD/zAzeoNRSaSUrH2ck1VeyI
	rshqm1jf/9qTES4mvFCazh6Km3dmSFgtwOVjN5+W5oeWr3Mg56XcMf0IpHNxcC3vpYIN
	bzSlo5kpcPokyecGOR5T1Bm1eRWTD+b7e+T5yrxni9xT+CE0uyrbH178lfBt87mfcFk/
	vqpy92L7XB2WVoEbpPh15vRrCAz5vB1punuhVlzoOwllCW9FRwrVYqpz7FXrs4cOU6Cd
	KDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1HAUjyAnYj40C7YyTqBbnV0VC+jFXhOTqhiDkxjyJB4=;
	b=UCSKYMed1poWesepb83Ia89R+Dr4lt3EaY9M+giKdHkss9WhdapLwJ2czelyCr+E6n
	Ue2kU9XbhJdqTPlPvdVXdnMOthLCGLzKeAgnNUOu9D24xGTN9PD1om06It3LHufeBXQc
	niSWgCPyHaWlGwd9x+p16h1QmQXAFGdK0PH+UitcHZjHpjEb6RX5DtnqeNY0hNi3eqzR
	I24UBMMjks0MFRSR3FJC1N9JUopix50qihaJ4g0oFo43ArUttotu6WorSMnc+Hr7Qh9J
	nOOEb6AVnhcAIS7O/UYxER6NA1hsWg1S2eZuKcKyIVfF1U/XurqCpRCvSFBnCy92dnF8
	S81g==
X-Gm-Message-State: AIkVDXLInJdZUX05Ygi5L8/z3tS09sZAIqtdjCUBG7NkT26NNASTCnlaRCE/6Vew9xsiag==
X-Received: by 10.28.28.19 with SMTP id c19mr54494021wmc.28.1483542326627;
	Wed, 04 Jan 2017 07:05:26 -0800 (PST)
Received: from donizetti.lan (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.gmail.com with ESMTPSA id
	204sm95380445wmj.7.2017.01.04.07.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 07:05:25 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 Jan 2017 16:05:25 +0100
Message-Id: <20170104150525.4246-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-trivial] [PATCH] pci-assign: avoid pointless stat
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
X-List-Received-Date: Wed, 04 Jan 2017 15:05:33 -0000

Just check the errno value after fopen and follow it with fstat.
This shuts up Coverity's complaint about TOC/TOU violation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pci-assign-load-rom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-rom.c
index 0d8e4b2..fd59076 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -39,19 +39,19 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev, struct Object *owner,
              "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/rom",
              domain, bus, slot, function);
 
-    if (stat(rom_file, &st)) {
-        if (errno != ENOENT) {
-            error_report("pci-assign: Invalid ROM.");
-        }
-        return NULL;
-    }
-
     /* Write "1" to the ROM file to enable it */
     fp = fopen(rom_file, "r+");
     if (fp == NULL) {
-        error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+        if (errno != ENOENT) {
+            error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+        }
         return NULL;
     }
+    if (fstat(fileno(fp), &st) == -1) {
+        error_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
+        goto close_rom;
+    }
+
     val = 1;
     if (fwrite(&val, 1, 1, fp) != 1) {
         goto close_rom;
-- 
2.9.3


