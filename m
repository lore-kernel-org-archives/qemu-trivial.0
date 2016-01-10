Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIKM7-0001KV-NR
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 13:04:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKM5-0001IF-OW
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 13:04:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKM5-0006iG-1H
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 13:04:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIKM0-0006hf-Q9; Sun, 10 Jan 2016 13:04:36 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5738C40359;
	Sun, 10 Jan 2016 21:04:36 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929D32.3050702@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 21:04:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, jslaby@suse.cz, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Convert to realize()
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
X-List-Received-Date: Sun, 10 Jan 2016 18:04:42 -0000

18.12.2015 11:55, Cao jin wrote:
> for educational PCI device

Applied to -trivial, adding "hw/misc/edu:" prefix to the subject line, th=
anks!

10.01.2016 13:14, Cao jin wrote:
> Hi mjt,
>     seems the patch is still pending in qemu-trivial, and besides, I ha=
ve several others also pending in there=EF=BC=8Cmay I know how are they g=
oing?

I didn't process almost anything before 2.5.0 release, and next
there were Cristmas and New Year holidays.  As you can see, some
patches are now going.

Thanks,

/mjt

