Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRPO9-0004e8-R8
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 12:35:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPO2-0004WI-Bw
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPNw-00085T-9j
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:34:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VRPNX-00080W-TY; Wed, 02 Oct 2013 12:34:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CB45E40587;
	Wed,  2 Oct 2013 20:34:12 +0400 (MSK)
Message-ID: <524C4B04.9040208@msgid.tls.msk.ru>
Date: Wed, 02 Oct 2013 20:34:12 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380575089-11408-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380575089-11408-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-char: Fix potential out of bounds
 access to local arrays
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
X-List-Received-Date: Wed, 02 Oct 2013 16:35:00 -0000

01.10.2013 01:04, Stefan Weil wrote:
> Latest gcc-4.8 supports a new option -fsanitize=address which activates
> an AddressSanitizer. This AddressSanitizer stops the QEMU system emulation
> very early because two character arrays of size 8 are potentially written
> with 9 bytes.
>
> Commit 6ea314d91439741e95772dfbab98b4135e04bebb added the code.
>
> There is no obvious reason why width or height could need 8 characters,
> so reduce it to 7 characters which together with the terminating '\0'
> fit into the arrays.

A good one.

Thanks, applied to the trivial patches queue.

/mjt

