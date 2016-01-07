Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aHIcV-0008Qq-Us
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 17:01:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>) id 1aH9kx-0005eD-8x
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>) id 1aH9kt-0007d5-Si
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:33:31 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:58729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1aH9kt-0007cp-M8; Thu, 07 Jan 2016 07:33:27 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost.zedat.fu-berlin.de (Exim 4.85) with esmtp
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id <1aH9ks-0048sT-6X>; Thu, 07 Jan 2016 13:33:26 +0100
Received: from z6.physik.fu-berlin.de ([160.45.34.66])
	by inpost2.zedat.fu-berlin.de (Exim 4.85) with esmtpsa
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id <1aH9ks-0048Gm-2u>; Thu, 07 Jan 2016 13:33:26 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <1451382673-5345-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA8Vd8q5JXSwUaD6-i+Z4aHkO2NiXJ2TMSG3rfyXJijoQw@mail.gmail.com>
	<568E56BA.8020706@physik.fu-berlin.de>
	<CAFEAcA-b47=1XD2hT2iBj9HSp_MXtmKKKeWkk8XjnTzH+tqyww@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <568E5B16.1050006@physik.fu-berlin.de>
Date: Thu, 7 Jan 2016 13:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101
	Icedove/42.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-b47=1XD2hT2iBj9HSp_MXtmKKKeWkk8XjnTzH+tqyww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: 160.45.34.66
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 130.133.4.66
X-Mailman-Approved-At: Thu, 07 Jan 2016 17:01:22 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <Laurent@Vivier.EU>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] linux-user: enable
 sigaltstack for all architectures
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
X-List-Received-Date: Thu, 07 Jan 2016 12:33:32 -0000

On 01/07/2016 01:18 PM, Peter Maydell wrote:
> No. "Reviewed-by" means I just code reviewed it.

Yeah, that is clear :-).

> it will be picked up by a subtree maintainer (either the
> -trivial subtree or the linux-user one). That person will then
> at some point send me a pull request for their subtree which
> will result in the commit getting merged into master when I
> apply that pull request.

Ok, I didn't know qemu has subtrees as well as the kernel. I
thought it would be easier to send in drive-by patches as
in systemd, for example.

PS: In order to make qemu-sh4 actually usable again, it would
    be great if the setup_frame changes by Laurent Vivier [1]
    could be merged as well. Without the fix, qemu-user reproducibly
    segfaults when emulating sh4 [2].

> [1] https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg04883.html
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=805827

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

