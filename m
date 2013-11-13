Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgZ2R-0002w3-SM
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 06:55:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ2G-0002bv-F4
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ2C-0001Ez-1y
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:55:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgZ1z-0001BG-Kp; Wed, 13 Nov 2013 06:54:47 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CF8CC41736;
	Wed, 13 Nov 2013 15:54:46 +0400 (MSK)
Message-ID: <52836886.5030407@msgid.tls.msk.ru>
Date: Wed, 13 Nov 2013 15:54:46 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384095499-12255-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384095499-12255-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] console: Remove unused debug code
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
X-List-Received-Date: Wed, 13 Nov 2013 11:55:15 -0000

10.11.2013 18:58, Stefan Weil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> The local function console_print_text_attributes is no longer used sinc=
e
> commit 7d6ba01c3741bc32ae252bf64a5fd3f930c2df4f.

Thanks, applied to the trivial-patches queue.

/mjt

