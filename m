Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJNWK-0000tk-2R
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 06:16:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QJNWI-0000sK-71
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 06:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QJNWH-0004Rh-9n
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 06:16:54 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:56184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1QJNWF-0004R3-HE; Mon, 09 May 2011 06:16:51 -0400
Received: by vxb37 with SMTP id 37so6592627vxb.4
	for <multiple recipients>; Mon, 09 May 2011 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xxLe6T747+4vXNyvyMJ2Tjv3Nyr6+GqyYPgo/65rbeE=;
	b=lIoh1zfdWx6/W4TfiNfuSiObJ7NiCuCu/tVWSSbP/2v15i34qqj6N3TQPOj/ZgdEak
	z5hiBBvzTte5BgQmIbA1w3ZXEtuPou9tI3wihDO78paEmPz1DylxlJ3VhijvC+7QMYgW
	EgudLeaIBllR8TckmOpydRZ/ErEFz1CDqqlaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=U6gg8qXZQp39JtiX+7U2sRL4GU2cb1eXbYNHKUBwq7qJvM3jH0Lyeo6GvCHhl0KCv9
	9cXgrB+DQQrPyDj9C3KUcXuMxbHbPD1+8tjVN2zLWzpSX543Av1xpATFMxiWUEy27A9S
	WNfIyzVpJSozmLM3FSrbmbPjVaB1KQn7m9C+8=
MIME-Version: 1.0
Received: by 10.52.179.69 with SMTP id de5mr1045580vdc.304.1304936210253; Mon,
	09 May 2011 03:16:50 -0700 (PDT)
Received: by 10.220.158.131 with HTTP; Mon, 9 May 2011 03:16:50 -0700 (PDT)
In-Reply-To: <4DC79DEC.50401@redhat.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
	<4DC29287.5030106@redhat.com>
	<BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>
	<4DC79DEC.50401@redhat.com>
Date: Mon, 9 May 2011 12:16:50 +0200
Message-ID: <BANLkTimMGis4pBnZvbP=KwKtaOp8rDCfBQ@mail.gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Bug #757654: UHCI fails to signal
	stall response patch
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
X-List-Received-Date: Mon, 09 May 2011 10:16:55 -0000

UHCI host controller status register indicates error and
an interrupt is triggered on BABBLE and STALL errors.

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
 hw/usb-uhci.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/hw/usb-uhci.c b/hw/usb-uhci.c
index a65e0b3..1e9c1e7 100644
--- a/hw/usb-uhci.c
+++ b/hw/usb-uhci.c
@@ -702,11 +702,15 @@ out:
     case USB_RET_STALL:
         td->ctrl |= TD_CTRL_STALL;
         td->ctrl &= ~TD_CTRL_ACTIVE;
+        s->status |= UHCI_STS_USBERR;
+        uhci_update_irq(s);
         return 1;

     case USB_RET_BABBLE:
         td->ctrl |= TD_CTRL_BABBLE | TD_CTRL_STALL;
         td->ctrl &= ~TD_CTRL_ACTIVE;
+        s->status |= UHCI_STS_USBERR;
+        uhci_update_irq(s);
         /* frame interrupted */
         return -1;

-- 
1.7.3.4

