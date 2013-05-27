Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh3JF-0001Su-UN
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 15:42:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3J9-0001Fv-Le
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3J0-0006z5-CF
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:42:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uh3Io-0006wu-Jp; Mon, 27 May 2013 15:41:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CB0B441CC7;
	Mon, 27 May 2013 23:41:53 +0400 (MSK)
Message-ID: <51A3B700.4010805@msgid.tls.msk.ru>
Date: Mon, 27 May 2013 23:41:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <cover.1369193012.git.hutao@cn.fujitsu.com>
	<c5d67e2881026c5d6cf22fe31bb6e657448da59a.1369193012.git.hutao@cn.fujitsu.com>
In-Reply-To: <c5d67e2881026c5d6cf22fe31bb6e657448da59a.1369193012.git.hutao@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [RFC PATCH v1 08/20] rtc: remove rtc_set_date
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
X-List-Received-Date: Mon, 27 May 2013 19:42:20 -0000

22.05.2013 09:33, Hu Tao wrote:
> Since it's not defined and used anywhere.

Thanks,  applied to the trivial-patches queue.

If the need arises to bring it back, it can be done
together with the implementation and some users :)

/mjt

