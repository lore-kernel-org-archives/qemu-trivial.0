Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WHBLf-0001Lu-9U
	for mharc-qemu-trivial@gnu.org; Sat, 22 Feb 2014 07:06:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WHBLY-0001BN-1I
	for qemu-trivial@nongnu.org; Sat, 22 Feb 2014 07:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WHBLS-0003Nf-3I
	for qemu-trivial@nongnu.org; Sat, 22 Feb 2014 07:06:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WHBLF-0003ML-Tt; Sat, 22 Feb 2014 07:06:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4DC1542E2C;
	Sat, 22 Feb 2014 16:06:01 +0400 (MSK)
Message-ID: <530892A9.9000406@msgid.tls.msk.ru>
Date: Sat, 22 Feb 2014 16:06:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] bswap: Clean prototypes of st*
	functions
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
X-List-Received-Date: Sat, 22 Feb 2014 12:06:26 -0000

19.02.2014 09:11, Stefan Weil wrote:
> These modifications avoid type conversions for non optimized code.
> 
> ld* function prototypes will follow later.
> 
> [PATCH 1/2] bswap: Modify prototype of stb_p (avoid type
> [PATCH 2/2] bswap: Modify prototypes of st[wl]_{le,be}_p (avoid type

Thanks, applied to the trivial patches queue, with s/function/functions/
change in description for the second patch.

/mjt

