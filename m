Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTfX8-0000zo-Pk
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 19:54:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aTfX5-0000zD-Sc
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 19:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aTfX0-0006jd-ST
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 19:54:55 -0500
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:34173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aTfX0-0006jU-L9; Wed, 10 Feb 2016 19:54:50 -0500
Received: by mail-pa0-x232.google.com with SMTP id dk10so7078422pac.1;
	Wed, 10 Feb 2016 16:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qvkVfjIOeP8npcj6ypoQ5XEV9ccWVP6u95DK+7SUIms=;
	b=UY5TCcBZI1rftDtu9Io++zc5P4gL+peK+hoWECfS6w7WywkJ5YwNl0bOof7oIbjZxi
	MFSs9e8cfJUV7/TzMhAgyxkXvwGNoInYqyoxmORbpmtrYR43WE3inH7j6luDO99R9bvC
	liW4QmeaT5w/ay0AfZoA2ddEw3lS8eG7G/rImHuw76q+BWj7MpC5fHBFRiV705NYzY53
	JKisNqqjzPi/MoQ+VxWs8/hscx2pjW9Mk/ommhVpFwnB9BAazex2n1oACDDyIGtlPdYI
	57wmUVQO1t+eh3kJhDAyYLSACazeceaI0vPv91GuKW+3CZ4I2jk+uEDJPp8ynHPi0WNt
	zqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qvkVfjIOeP8npcj6ypoQ5XEV9ccWVP6u95DK+7SUIms=;
	b=EkHIM/IqWBe06JrfRomf/3HlX1S0IhDleQXpeP7ivTmy9ZN9qYWHDWqjwZ2gi030vF
	Wb+Elrt0a+RshUUR+faeq++Iv7APSkSX/ohzDgktGOdIVclTcvNN3GmaWzaxPM9gAc/m
	t1cc8MkIOVTEQ/4pce8d6rYFJJKEXti5xw7Yi++6fgBy5Ozhal6NsRm0heiv8APh7HEz
	iWouaRyKXfNvlU7PLYAXLExuUGVmCEzyT2i1DLD6iD3R70/ur+zhJEWLWaPcI9EuoV9q
	M6BSNhXquMtHYZo4IuDL2n+WQSJpaGL1aqbPlm4f9lQJAlYeke62FEtdKWrNuQvFFP4d
	10Kw==
X-Gm-Message-State: AG10YOR8YB9puj2LTAKT4TaxMqn5LdciLfmRVTC9uLO+LsoWOicZFs0buqBqbdp5GdReKQ==
X-Received: by 10.67.1.129 with SMTP id bg1mr16212868pad.63.1455152088352;
	Wed, 10 Feb 2016 16:54:48 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	mk3sm7797463pab.20.2016.02.10.16.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 16:54:47 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: alex.williamson@redhat.com
Date: Thu, 11 Feb 2016 00:54:27 +0000
Message-Id: <1455152067-19900-1-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::232
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH] vfio/pci: replace 1 with PCI_CAP_LIST_NEXT
	to make code self-explain
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
X-List-Received-Date: Thu, 11 Feb 2016 00:54:56 -0000

Use the macro PCI_CAP_LIST_NEXT instead of 1, so that the code would be
more self-explain.

This patch makes this change and also fixs one typo in comment.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 hw/vfio/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1fb868c..17d1462 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1472,7 +1472,7 @@ static uint8_t vfio_std_cap_max_size(PCIDevice *pdev, uint8_t pos)
     uint8_t tmp, next = 0xff;
 
     for (tmp = pdev->config[PCI_CAPABILITY_LIST]; tmp;
-         tmp = pdev->config[tmp + 1]) {
+         tmp = pdev->config[tmp + PCI_CAP_LIST_NEXT]) {
         if (tmp > pos && tmp < next) {
             next = tmp;
         }
@@ -1661,7 +1661,7 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos)
     int ret;
 
     cap_id = pdev->config[pos];
-    next = pdev->config[pos + 1];
+    next = pdev->config[pos + PCI_CAP_LIST_NEXT];
 
     /*
      * If it becomes important to configure capabilities to their actual
@@ -1675,7 +1675,7 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos)
      * pci_add_capability always inserts the new capability at the head
      * of the chain.  Therefore to end up with a chain that matches the
      * physical device, we insert from the end by making this recursive.
-     * This is also why we pre-caclulate size above as cached config space
+     * This is also why we pre-calculate size above as cached config space
      * will be changed as we unwind the stack.
      */
     if (next) {
@@ -1691,7 +1691,7 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos)
     }
 
     /* Use emulated next pointer to allow dropping caps */
-    pci_set_byte(vdev->emulated_config_bits + pos + 1, 0xff);
+    pci_set_byte(vdev->emulated_config_bits + pos + PCI_CAP_LIST_NEXT, 0xff);
 
     switch (cap_id) {
     case PCI_CAP_ID_MSI:
-- 
2.5.0


