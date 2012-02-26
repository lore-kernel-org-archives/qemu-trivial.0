Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1ifk-00020Q-5p
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 13:18:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1iff-0001uB-Rv
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1ife-0001Jx-LY
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:18:07 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:42780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1ife-0001JO-A8
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:18:06 -0500
Received: by qabg40 with SMTP id g40so1113746qab.4
	for <qemu-trivial@nongnu.org>; Sun, 26 Feb 2012 10:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates
	10.224.185.207 as permitted sender) client-ip=10.224.185.207; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	peter.maydell@linaro.org designates 10.224.185.207 as permitted
	sender) smtp.mail=peter.maydell@linaro.org
Received: from mr.google.com ([10.224.185.207])
	by 10.224.185.207 with SMTP id cp15mr7930496qab.72.1330280285192
	(num_hops = 1); Sun, 26 Feb 2012 10:18:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.185.207 with SMTP id cp15mr6715335qab.72.1330280285056;
	Sun, 26 Feb 2012 10:18:05 -0800 (PST)
Received: by 10.229.50.85 with HTTP; Sun, 26 Feb 2012 10:18:04 -0800 (PST)
In-Reply-To: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
References: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
Date: Sun, 26 Feb 2012 18:18:04 +0000
Message-ID: <CAFEAcA_82UCPWVukhAWcxGjeRQfkb+_E7OOdx8fh9y-6Ya_OMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQndzAzIFXYE5251O+lYWJmFjUudyPWJwgtTQgwE+atyfHb+LeefEGfP/DGWG0hfiYywN1Ak
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Spelling and
	grammar fixes in documentation
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
X-List-Received-Date: Sun, 26 Feb 2012 18:18:10 -0000

On 26 February 2012 13:30, Stefan Weil <sw@weilnetz.de> wrote:
> @@ -217,10 +217,10 @@ the card using the following functions:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VCardStatus vcard_add_applet(VCard *car=
d, VCardApplet *applet);
>
> =C2=A0 Add an applet onto the list of applets attached to the card. Once =
an applet
> - =C2=A0has been added, it can be selected by it's aid, and then commands=
 will be
> + =C2=A0has been added, it can be selected by its aid, and then commands =
will be

While you're changing this line, it looks like 'aid' here should be 'AID'
(it is capitalised elsewhere in the doc except where referring to a functio=
n
parameter name).

> =C2=A0 routed to it VCardProcessAPDU function. This function adopts the a=
pplet the
> =C2=A0 passed int applet.

The sentence "This function..." clearly needs correcting as it doesn't
make much sense as it stands, but I'm not sure what it should be changed to=
.

> Note: 2 applets with the same AID should not be added to
> - =C2=A0the same card. It's permissible to add more than one applet. Mult=
iple applets
> + =C2=A0the same card. It is permissible to add more than one applet. Mul=
tiple applets
> =C2=A0 may have the same VCardPRocessAPDU entry point.

-- PMM

