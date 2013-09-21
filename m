Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VNTlP-00066s-Jb
	for mharc-qemu-trivial@gnu.org; Sat, 21 Sep 2013 16:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1VNTlO-00066l-9B
	for qemu-trivial@nongnu.org; Sat, 21 Sep 2013 16:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1VNTlN-0004uP-CX
	for qemu-trivial@nongnu.org; Sat, 21 Sep 2013 16:26:46 -0400
Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233]:33354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1VNTlK-0004tt-I2; Sat, 21 Sep 2013 16:26:42 -0400
Received: by mail-ob0-f179.google.com with SMTP id wn1so2142962obc.38
	for <multiple recipients>; Sat, 21 Sep 2013 13:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=EtDqXRTvsUaHJN7rHwQ2dXysATkWQLWw4qOZjqHAstI=;
	b=zj0s7Om5b7k9ZgxJAfeP/M6nJugwskCenjD4qjxBOg/pANoWLL2UGRcQhrCUMs+opQ
	a9P5vV5BmJnhRvfwhBUvUw11zXEkkMrpRbazipFuRNH+S6Y2Ifd3pYhZhS88/9jFs1Zy
	YgqHY4AO9mjc4FzMPicHhdu2tvQH6opYxpa+oxFrL/nF4wGUrGCsbzWU550w2lX0MUeo
	hk/0VXHkzFfsy2WQ4IInJtdJX492lL0P9cw8c/LorMccljIqcEu6GETJLZMpxxmycIwl
	S76wFE/xtUgtmm461y97tL+Gy1Y11ke+J2izsfcVFcDTZbHqhi7vthO1CCi5BomnXa6m
	verw==
MIME-Version: 1.0
X-Received: by 10.60.44.193 with SMTP id g1mr58865oem.47.1379795201712; Sat,
	21 Sep 2013 13:26:41 -0700 (PDT)
Received: by 10.60.18.200 with HTTP; Sat, 21 Sep 2013 13:26:41 -0700 (PDT)
Date: Sat, 21 Sep 2013 16:26:41 -0400
Message-ID: <CA+K+NcStLJod1P3MhWqPJ=jhfMwMuV_cxuivi-QXduwnT2uwqg@mail.gmail.com>
From: =?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>
To: QEMU <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::233
Subject: [Qemu-trivial] [PATCH] pci-ohci: Add missing 'break' in
	ohci_service_td
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
X-List-Received-Date: Sat, 21 Sep 2013 20:26:47 -0000

Device communication errors need to be reported to driver.
Add a debug message while at it.

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
 hw/usb/hcd-ohci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 35f0878..0396e33 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1143,7 +1143,9 @@ static int ohci_service_td(OHCIState *ohci,
struct ohci_ed *ed)
             switch (ret) {
             case USB_RET_IOERROR:
             case USB_RET_NODEV:
+                DPRINTF("usb-ohci: got DEV ERROR\n");
                 OHCI_SET_BM(td.flags, TD_CC, OHCI_CC_DEVICENOTRESPONDING);
+                break;
             case USB_RET_NAK:
                 DPRINTF("usb-ohci: got NAK\n");
                 return 1;
-- 
1.8.1.5

