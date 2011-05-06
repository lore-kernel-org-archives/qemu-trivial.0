Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QIG4Y-0004I0-9i
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2011 04:07:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QIG4U-0004Cf-VV
	for qemu-trivial@nongnu.org; Fri, 06 May 2011 04:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QIG4U-0001GT-0B
	for qemu-trivial@nongnu.org; Fri, 06 May 2011 04:07:34 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:61417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1QIG4S-0001G7-2Q; Fri, 06 May 2011 04:07:32 -0400
Received: by vxb37 with SMTP id 37so3683737vxb.4
	for <multiple recipients>; Fri, 06 May 2011 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4jxm9abmouaWdwrVnR93ubE3ZyXZ9VxIB30QI+jLaXc=;
	b=QVzM3Z5Q7WytxilEQqlYekDnoOHN/baugB4InPCk3tMLvhpvNoSGFOZkiRteoOcdOg
	hIkr9M6AXgpPNa08xGlbwP6raRWoHLOEDk834mNeFvTh0tGRCVXYo0HVge3LTY2ZEJC0
	l8XH2uNLBhUr0R3mY8fxsgYOutgLG0NvIrOFo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=OSp81yr1gh6iuzbb8GQExaiAnuNyjbPsPvws87LT/2M71nTSBc8ZUshkxWFQPdq+tZ
	A5GM9Kd6uBlpzTgeSzm0FshYZ0Uhm1ObXXef7M5FMM5z8biNviHsX1HBndMbp5LzJ0Ts
	+uPQFp+g5GHwuNNUoZiSN4tpNoAddcrDqu1Ag=
MIME-Version: 1.0
Received: by 10.220.198.139 with SMTP id eo11mr781910vcb.271.1304669250868;
	Fri, 06 May 2011 01:07:30 -0700 (PDT)
Received: by 10.220.158.131 with HTTP; Fri, 6 May 2011 01:07:30 -0700 (PDT)
In-Reply-To: <4DC29287.5030106@redhat.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
	<4DC29287.5030106@redhat.com>
Date: Fri, 6 May 2011 10:07:30 +0200
Message-ID: <BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 06 May 2011 08:07:36 -0000

hi,
using the modified (single line) patch only works half-way, it sets
the value in status register (guess that's what that line does :))
but hw interrupt is not generated.

I tried adding uhci_update_irq and this patch:

diff --git a/hw/usb-uhci.c b/hw/usb-uhci.c
index a65e0b3..1e9c1e7 100644
--- a/hw/usb-uhci.c
+++ b/hw/usb-uhci.c
@@ -702,11 +702,15 @@ out:
     case USB_RET_STALL:
         td->ctrl |=3D TD_CTRL_STALL;
         td->ctrl &=3D ~TD_CTRL_ACTIVE;
+        s->status |=3D UHCI_STS_USBERR;
+        uhci_update_irq(s);
         return 1;

     case USB_RET_BABBLE:
         td->ctrl |=3D TD_CTRL_BABBLE | TD_CTRL_STALL;
         td->ctrl &=3D ~TD_CTRL_ACTIVE;
+        s->status |=3D UHCI_STS_USBERR;
+        uhci_update_irq(s);
         /* frame interrupted */
         return -1;

works.

jan

On Thu, May 5, 2011 at 2:05 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> diff --git a/hw/usb-uhci.c b/hw/usb-uhci.c
>> index 346db3e..a51d89b 100644
>> --- a/hw/usb-uhci.c
>> +++ b/hw/usb-uhci.c
>> @@ -732,11 +732,21 @@ out:
>> =C2=A0 =C2=A0 =C2=A0case USB_RET_STALL:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td->ctrl |=3D TD_CTRL_STALL;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td->ctrl&=3D ~TD_CTRL_ACTIVE;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0s->status |=3D UHCI_STS_USBERR;
>
> Just this line should be enougth.
>
>> =C2=A0 =C2=A0 =C2=A0case USB_RET_BABBLE:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td->ctrl |=3D TD_CTRL_BABBLE | TD_CTRL=
_STALL;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td->ctrl&=3D ~TD_CTRL_ACTIVE;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0s->status |=3D UHCI_STS_USBERR;
>
> Likewise.
>
> Tried that?
>
> cheers,
> =C2=A0Gerd
>
>

