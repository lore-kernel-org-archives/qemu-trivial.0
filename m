Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aHIcV-0008Qb-SN
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 17:01:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>) id 1aH9T0-0005h1-8F
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:14:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>) id 1aH9Sw-0002Fg-7O
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:14:58 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:60803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1aH9Sw-0002BR-0z; Thu, 07 Jan 2016 07:14:54 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost.zedat.fu-berlin.de (Exim 4.85) with esmtp
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id <1aH9Ss-0041Xu-1j>; Thu, 07 Jan 2016 13:14:50 +0100
Received: from z6.physik.fu-berlin.de ([160.45.34.66])
	by inpost2.zedat.fu-berlin.de (Exim 4.85) with esmtpsa
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id <1aH9Sr-0046NA-Td>; Thu, 07 Jan 2016 13:14:50 +0100
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1451382673-5345-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA8Vd8q5JXSwUaD6-i+Z4aHkO2NiXJ2TMSG3rfyXJijoQw@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <568E56BA.8020706@physik.fu-berlin.de>
Date: Thu, 7 Jan 2016 13:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101
	Icedove/42.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vd8q5JXSwUaD6-i+Z4aHkO2NiXJ2TMSG3rfyXJijoQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: 160.45.34.66
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 130.133.4.66
X-Mailman-Approved-At: Thu, 07 Jan 2016 17:01:22 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 07 Jan 2016 12:14:59 -0000

Hi Peter!

On 01/07/2016 12:52 PM, Peter Maydell wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Has this been committed yet? I can't see the change in cgit.

Cheers,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

