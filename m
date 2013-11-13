Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vgf7u-0002ft-40
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 13:25:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vgf7m-0002Vj-5G
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vgf7e-0002x0-Iz
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:25:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vgf7R-0002nV-U0; Wed, 13 Nov 2013 13:24:50 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C1FBE417A9;
	Wed, 13 Nov 2013 22:24:46 +0400 (MSK)
Message-ID: <5283C3EE.7020300@msgid.tls.msk.ru>
Date: Wed, 13 Nov 2013 22:24:46 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
	<5283BF4E.1020009@weilnetz.de>
In-Reply-To: <5283BF4E.1020009@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Krupa <JKrupa@suse.com>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PULL 00/16] [for-1.7] Trivial patches for
	2013-11-13
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
X-List-Received-Date: Wed, 13 Nov 2013 18:25:16 -0000

13.11.2013 22:05, Stefan Weil wrote:
[]
> The two trace.h related patches moved include statements from .h files
> to .c files.
> I compiled the resulting code on 64 bit Linux, also with cross
> compilation for
> MinGW, so win* won't be a problem.
> 
> Nevertheless there remains a risk because my builds don't include all QEMU
> options (especially not spice, rbd, nss, libusb, seccomp).
> 
> Both patches were not marked for 1.7, so please skip them when pulling
> for 1.7.

How about all other patches, because none of them were marked for 1.7?

Thanks,

/mjt

