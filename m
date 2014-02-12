Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDcrg-0002bI-Ue
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2014 11:40:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WDcrZ-0002Y3-3M
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 11:40:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WDcrS-0006ow-MK
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 11:40:40 -0500
Received: from cantor2.suse.de ([195.135.220.15]:37442 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WDcrF-0006lF-Fe; Wed, 12 Feb 2014 11:40:21 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2A930ABA6;
	Wed, 12 Feb 2014 16:40:20 +0000 (UTC)
Message-ID: <52FBA3F1.8080503@suse.de>
Date: Wed, 12 Feb 2014 17:40:17 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>	<52F34A67.7060902@msgid.tls.msk.ru>	<CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
	<52FB7D13.8050801@embedded-brains.de>
In-Reply-To: <52FB7D13.8050801@embedded-brains.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
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
X-List-Received-Date: Wed, 12 Feb 2014 16:40:47 -0000

Am 12.02.2014 14:54, schrieb Sebastian Huber:
> On 2014-02-06 09:57, Peter Maydell wrote:
>> On 6 February 2014 08:40, Michael Tokarev<mjt@tls.msk.ru>  wrote:
>>> >03.02.2014 13:18, Sebastian Huber wrote:
>>>> >>A lot of real world LEON3 systems are shipped with the GRMON boot
>>>> >>loader.  This boot loader initializes the stack pointer with the
>>>> end of
>>>> >>RAM address.  The application can use this to detect the RAM size
>>>> of a
>>>> >>particular board variant.
>>> >
>>> >I don't really know much about sparc or leon3 stuff.  But having a
>>> >reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
>>> >really sure why it can't go to sparc tree instead.
>> As far as I'm aware there is currently no sparc tree; Blue is the
>> listed maintainer and typically just applied patches directly.
>> In the absence of Blue, if somebody else who cares about sparc
>> wishes to collect up reviewed sparc patches and submit them as
>> a pull request so they don't just get ignored, I'm willing to apply
>> that pull.
>=20
> Ok, how do we want proceed here?  I have an additional patch in the
> queue that adds AMBA plug and play support to the LEON3 support of QEMU
> so that you can run unmodified binaries for RTEMS, eCos and Linux.

Whether or not someone submits a pull for the reviewed patches, you'll
need to post your second patch for review. You can add either a tag in
[PATCH ...] or indicate textually after --- that it depends on this
patch, you don't need to wait for it to get applied first.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

