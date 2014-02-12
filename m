Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDaH4-0000qe-SL
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2014 08:54:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDaGy-0000jX-G7
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 08:54:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDaGu-000828-04
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 08:54:44 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:44605
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDaGk-0007yd-Qb; Wed, 12 Feb 2014 08:54:30 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 49512652CFB; Wed, 12 Feb 2014 14:54:28 +0100 (CET)
Received: from [192.168.100.11] (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id 78A29652BD5;
	Wed, 12 Feb 2014 14:54:27 +0100 (CET)
Message-ID: <52FB7D13.8050801@embedded-brains.de>
Date: Wed, 12 Feb 2014 14:54:27 +0100
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F34A67.7060902@msgid.tls.msk.ru>
	<CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
In-Reply-To: <CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
 stack pointer
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
X-List-Received-Date: Wed, 12 Feb 2014 13:54:49 -0000

On 2014-02-06 09:57, Peter Maydell wrote:
> On 6 February 2014 08:40, Michael Tokarev<mjt@tls.msk.ru>  wrote:
>> >03.02.2014 13:18, Sebastian Huber wrote:
>>> >>A lot of real world LEON3 systems are shipped with the GRMON boot
>>> >>loader.  This boot loader initializes the stack pointer with the en=
d of
>>> >>RAM address.  The application can use this to detect the RAM size o=
f a
>>> >>particular board variant.
>> >
>> >I don't really know much about sparc or leon3 stuff.  But having a
>> >reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
>> >really sure why it can't go to sparc tree instead.
> As far as I'm aware there is currently no sparc tree; Blue is the
> listed maintainer and typically just applied patches directly.
> In the absence of Blue, if somebody else who cares about sparc
> wishes to collect up reviewed sparc patches and submit them as
> a pull request so they don't just get ignored, I'm willing to apply
> that pull.

Ok, how do we want proceed here?  I have an additional patch in the queue=
 that=20
adds AMBA plug and play support to the LEON3 support of QEMU so that you =
can=20
run unmodified binaries for RTEMS, eCos and Linux.

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
Fax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=C3=A4ftliche Mitteilung im Sinne des EHUG=
.

