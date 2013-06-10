Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um42I-0007vA-82
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 11:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um42G-0007rP-1I
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um42E-0004in-T0
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:29:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um42B-0004hy-3v; Mon, 10 Jun 2013 11:29:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AA28410E7;
	Mon, 10 Jun 2013 19:29:24 +0400 (MSK)
Message-ID: <51B5F0D3.2030504@msgid.tls.msk.ru>
Date: Mon, 10 Jun 2013 19:29:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<b61bfd22e26fd08d9cca73e875c6074a9664c49c.1370236013.git.peter.crosthwaite@xilinx.com>
	<51B5EE24.5010400@msgid.tls.msk.ru>
In-Reply-To: <51B5EE24.5010400@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 1/3] char/serial: cosmetic fixes.
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
X-List-Received-Date: Mon, 10 Jun 2013 15:29:33 -0000

10.06.2013 19:17, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 03.06.2013 09:12, peter.crosthwaite@xilinx.com wrote:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> Some cosmetic fixes to char/serial fixing some checkpatch errors.
>=20
> These are all cosmetic fixes indeed.  I weren't sure we're
> applying stylistic changes by its own.  But apparently
> people don't object so I don't see why not, either, except
> that I don't really want to open a can of worms with other
> stylistic patches to come ;)
>=20
> Applied all 3 to the trivial patches queue.

Actually I didn't apply these.  Since patch 2/3 weren't sent to
-trivial, and 3/3 does not apply without it, I'm not sure I want
to apply either of these.  Maybe all 3 should be sent to the same
tree?  Should I pick the 2/3 too, which wasn't submitted to
-trivial?

Thank you!

/mjt


