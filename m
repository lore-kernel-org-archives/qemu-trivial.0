Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGA5y-00006c-S2
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 12:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGA5r-0008U2-8b
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGA5l-0002He-6M
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:01:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGA5Y-0002Fa-Ed; Sun, 01 Sep 2013 12:01:20 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 247654012D;
	Sun,  1 Sep 2013 20:01:17 +0400 (MSK)
Message-ID: <522364CD.3060206@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 20:01:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, av1474@comtv.ru,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.6] adlib: sort offsets in portio
 registration
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
X-List-Received-Date: Sun, 01 Sep 2013 16:01:45 -0000

14.08.2013 13:49, Herv=C3=A9 Poussineau wrote:
> This fixes the following assert when -device adlib is used:
> ioport.c:240: portio_list_add: Assertion `pio->offset >=3D off_last' fa=
iled.

Thanks, applied to the trivial-patches queue.

/mjt

