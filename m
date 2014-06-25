Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wzrpy-0004y7-32
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 14:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wzrpn-0004jU-OC
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 14:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wzrpe-0006Hz-IL
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 14:22:15 -0400
Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f]:37090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WzrpM-00065e-9l; Wed, 25 Jun 2014 14:21:48 -0400
Received: by mail-ig0-f175.google.com with SMTP id h3so6341123igd.2
	for <multiple recipients>; Wed, 25 Jun 2014 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MgigGooLPqllxY+mGbLwWs+yCCpliSiSJHqV4/O+sAo=;
	b=uX0BkOwTeW8nNIn5m5FBrrmDRrme20Xqwp++eBslnGgpLhRpUdm/BKknCE8rOfwAn7
	vaWN+V6SU7+q2PWIP66FyGWVYhrb1Nvi3ejFMbe+u1UV34+9X+2Aq5ofEBxuTzqV2kr2
	mQ/RvfC2fadlWvV15fzyPMrsX92lZuqbOv3pYAVPP4PQNKU7gloHLCD2KNyO/hy6uGNA
	7Ji/beG8+gAYqCAUlsbVbImvbbbGqeIH+I7dryhfUyB6EEboThJ4Og3O/bOmHiqrOgfN
	xWtroffRTV/8YoV2POnJGpQn3cLblBmavztAPkSfSduG9R1DrWDqSc1un8osmlW7cvaS
	7DhQ==
X-Received: by 10.42.120.80 with SMTP id e16mr8967742icr.55.1403720507654;
	Wed, 25 Jun 2014 11:21:47 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-159-176.cust.vodafonedsl.it. [37.117.159.176])
	by mx.google.com with ESMTPSA id m1sm8813662ige.22.2014.06.25.11.21.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 11:21:46 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Jun 2014 20:21:37 +0200
Message-Id: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c05::22f
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] serial-pci: remove memory regions from BAR
	before destroying them
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
X-List-Received-Date: Wed, 25 Jun 2014 18:22:25 -0000

Otherwise, hot-unplug of pci-serial-2x trips the assertion
in memory_region_destroy:

    (qemu) device_del gg
    (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021: memory_region_destroy: Assertion `((&mr->subregions)->tqh_first == ((void *)0))' failed.
    Aborted (core dumped)

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/serial-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 6c25296..7340c8d 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -148,6 +148,7 @@ static void multi_serial_pci_exit(PCIDevice *dev)
     for (i = 0; i < pci->ports; i++) {
         s = pci->state + i;
         serial_exit_core(s);
+        memory_region_del_subregion(&pci->iobar, &s->io);
         memory_region_destroy(&s->io);
         g_free(pci->name[i]);
     }
-- 
1.9.3


