Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QAq4g-0008Ae-CL
	for mharc-qemu-trivial@gnu.org; Fri, 15 Apr 2011 16:57:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QAq4e-00086z-FM
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2011 16:57:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QAq4d-0003TE-O5
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2011 16:57:04 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:57420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1QAq4c-0003SQ-3G; Fri, 15 Apr 2011 16:57:02 -0400
Received: by vws17 with SMTP id 17so2811757vws.4
	for <multiple recipients>; Fri, 15 Apr 2011 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
	:content-type; bh=rY+kbJX53UNMBIgVZgR6pasZ8LeH08i7kvAf2v4y8dQ=;
	b=mqm9IsV4H/teQgrXLsDwUILRVlhthlR8POMRuR3G/CmHhhwkiFp4NQtWR49dJauU1s
	P1spt10PnX3plo8A6sE2pRq+kwrZGiO66L508UtvNHi9Z/QMlKtZcepubnKyNZkfM4Aw
	VvhcbdM9Vo1PhGkiQKrv1qtsCmdRk3bv7q8lI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=r9vsM2QOil49fXonbM3mQXy8TaG5FPV8JFUDS29aGlYnrgIyRJ4U1GhzajqLtBB4Cm
	uHb/yw5pGViWZl3KsVylyXCnsUeW5bICcMfrWb8f6CywHiCo4sj0SXCBfL8sdzMwKRJx
	rxSbwGGJ9BIL8ForvLzObN8btodzik4wTDoWE=
MIME-Version: 1.0
Received: by 10.220.101.7 with SMTP id a7mr677885vco.150.1302901020282; Fri,
	15 Apr 2011 13:57:00 -0700 (PDT)
Received: by 10.220.168.204 with HTTP; Fri, 15 Apr 2011 13:57:00 -0700 (PDT)
Date: Fri, 15 Apr 2011 22:57:00 +0200
Message-ID: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] Bug #757654: UHCI fails to signal stall response
	patch
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2011 20:57:05 -0000

Hi,

I'm sending a patch for bug #757654. The bug does not really break
anything it just makes USB error detection harder.
It's a quick fix and might need some polishing but it works (I am
currently using it).

thx,
jan

PS: I guess you need this line:
Signed-off-by: Jan Vesely <jano.vesely@gmail.com>

diff --git a/hw/usb-uhci.c b/hw/usb-uhci.c
index 346db3e..a51d89b 100644
--- a/hw/usb-uhci.c
+++ b/hw/usb-uhci.c
@@ -732,11 +732,21 @@ out:
     case USB_RET_STALL:
         td->ctrl |= TD_CTRL_STALL;
         td->ctrl &= ~TD_CTRL_ACTIVE;
+        s->status |= UHCI_STS_USBERR;
+        *int_mask |= 0x02;
+        if (td->ctrl & TD_CTRL_IOC)
+            *int_mask |= 0x01;
+        uhci_update_irq(s);
         return 1;

     case USB_RET_BABBLE:
         td->ctrl |= TD_CTRL_BABBLE | TD_CTRL_STALL;
         td->ctrl &= ~TD_CTRL_ACTIVE;
+        s->status |= UHCI_STS_USBERR;
+        *int_mask |= 0x02;
+        if (td->ctrl & TD_CTRL_IOC)
+           *int_mask |= 0x01;
+        uhci_update_irq(s);
         /* frame interrupted */
         return -1;

