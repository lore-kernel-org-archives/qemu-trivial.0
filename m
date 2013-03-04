Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UCYzt-000387-8q
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2013 12:16:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UCYzq-00036Y-Dn
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 12:16:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UCYvn-0001a5-6d
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 12:12:11 -0500
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:64014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UCYvZ-0001Vm-F5; Mon, 04 Mar 2013 12:11:53 -0500
Received: by mail-wi0-f169.google.com with SMTP id l13so2479769wie.4
	for <multiple recipients>; Mon, 04 Mar 2013 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=LjWC8fA4O3UKywbDj+gvsXcWfJODI04K6/jHdihXYdM=;
	b=DUAxkYHsO+fpArWxox8l1xCBx6gT8YYWV2tMkPt46tox6U3ye/DhFERlDcDzj0ULk5
	Zwcqkt/KRCKo7p0YJs6LQ+0FiYCB05gdu1PS4EoiCLCN/oIpIBMyIdFfMTkNgpccuzK1
	+rNos2JfMht4mpMrjqcIZ2dQ1wYXWdL0otxNRpSxkzvhZT1oOBNYYjLCpSUTutaxDKXv
	v1lxDb+RitXJc5ocbj/X0zrQ96QoBAaM55RTmkhUQ/HPwyehWyhf+4rtMdtjMkQcNM8s
	dVUs36tPrRiDd4tDlOQOJmdage8NkWtC9GTlVsldaj5OWoIU9bMy8LyNw/bEMV1VfE0v
	jwig==
X-Received: by 10.194.123.130 with SMTP id ma2mr25458885wjb.46.1362417112110; 
	Mon, 04 Mar 2013 09:11:52 -0800 (PST)
Received: from playground.lan (93-34-176-20.ip50.fastwebnet.it. [93.34.176.20])
	by mx.google.com with ESMTPS id ek4sm15313036wib.11.2013.03.04.09.11.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 09:11:50 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  4 Mar 2013 18:11:47 +0100
Message-Id: <1362417107-27069-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial@nongnu.org, michael@walle.cc
Subject: [Qemu-trivial] [PATCH] lm32: remove unused function
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
X-List-Received-Date: Mon, 04 Mar 2013 17:16:19 -0000

The milkymist-minimac device in fact does not exist at all.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/milkymist-hw.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/hw/milkymist-hw.h b/hw/milkymist-hw.h
index c8bd7e9..5def311 100644
--- a/hw/milkymist-hw.h
+++ b/hw/milkymist-hw.h
@@ -170,22 +170,6 @@ static inline DeviceState *milkymist_ac97_create(hwaddr base,
     return dev;
 }
 
-static inline DeviceState *milkymist_minimac_create(hwaddr base,
-        qemu_irq rx_irq, qemu_irq tx_irq)
-{
-    DeviceState *dev;
-
-    qemu_check_nic_model(&nd_table[0], "minimac");
-    dev = qdev_create(NULL, "milkymist-minimac");
-    qdev_set_nic_properties(dev, &nd_table[0]);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, rx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, tx_irq);
-
-    return dev;
-}
-
 static inline DeviceState *milkymist_minimac2_create(hwaddr base,
         hwaddr buffers_base, qemu_irq rx_irq, qemu_irq tx_irq)
 {
-- 
1.8.1.4


