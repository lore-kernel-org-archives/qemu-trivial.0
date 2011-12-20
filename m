Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RczTK-0006Ag-91
	for mharc-qemu-trivial@gnu.org; Tue, 20 Dec 2011 08:11:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RczTD-0005ky-7W
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 08:11:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RczT7-0002Ck-KV
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 08:11:03 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:41598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RczT0-0002BQ-3x; Tue, 20 Dec 2011 08:10:50 -0500
Received: by iagj37 with SMTP id j37so11545911iag.4
	for <multiple recipients>; Tue, 20 Dec 2011 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=zllYl6iX879kaWzFH+UuazfMZd2otpk8v61oKpt8zww=;
	b=lL4BOr3m+reAmxhvxE8uBLX0cyguJNPX53P6U8UV46ydpW1Ri1FMsELDgBDIbZCjfX
	7grohXWF1W3Q7DOlGvAOIARFqdmXdv2J5JJbz5ai50YikzRM2mMMTqVOl0pMiisKj7/i
	OuNpeE92XqAeBkSeSYH8DTmhx+jOSS0TEzFdI=
Received: by 10.50.186.165 with SMTP id fl5mr2341220igc.86.1324386649431;
	Tue, 20 Dec 2011 05:10:49 -0800 (PST)
Received: from localhost.localdomain (93-34-178-147.ip50.fastwebnet.it.
	[93.34.178.147])
	by mx.google.com with ESMTPS id gh9sm23956202igb.3.2011.12.20.05.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 05:10:48 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Dec 2011 14:10:36 +0100
Message-Id: <1324386636-25248-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] i440fx: remove piix3 field
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
X-List-Received-Date: Tue, 20 Dec 2011 13:11:09 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/piix_pci.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/hw/piix_pci.c b/hw/piix_pci.c
index 43c85aa..e188c7a 100644
--- a/hw/piix_pci.c
+++ b/hw/piix_pci.c
@@ -81,7 +81,6 @@ struct PCII440FXState {
     PAMMemoryRegion pam_regions[13];
     MemoryRegion smram_region;
     uint8_t smm_enabled;
-    PIIX3State *piix3;
 };
 
 
@@ -320,8 +319,6 @@ static PCIBus *i440fx_common_init(const char *device_name,
     qdev_property_add_child(dev, "piix3", &piix3->dev.qdev, NULL);
     piix3->pic = pic;
 
-    (*pi440fx_state)->piix3 = piix3;
-
     *piix3_devfn = piix3->dev.devfn;
 
     ram_size = ram_size / 8 / 1024 / 1024;
-- 
1.7.7.1


