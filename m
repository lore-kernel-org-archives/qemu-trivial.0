Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhGkG-0008VD-QF
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:07:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhGk9-0008Mt-13
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhGk2-0003Kc-St
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:07:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhGjq-0003FJ-62; Mon, 05 May 2014 07:07:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9516D406D6;
	Mon,  5 May 2014 15:07:13 +0400 (MSK)
Message-ID: <536770E1.9020002@msgid.tls.msk.ru>
Date: Mon, 05 May 2014 15:07:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
	<20140505110545.GB4370@T430.nay.redhat.com>
In-Reply-To: <20140505110545.GB4370@T430.nay.redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] docs/memory.txt:
 Fixes on whitespace and MMIO operations
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
X-List-Received-Date: Mon, 05 May 2014 11:07:39 -0000

05.05.2014 15:05, Fam Zheng =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Mon, 05/05 18:59, Fam Zheng wrote:
>>
>>
>> Fam Zheng (2):
>>   docs/memory.txt: Put one whitespace between sentences
>>   docs/memory.txt: Fix document on MMIO operations
>=20
> Michael, this is based on Peter's
>=20
> [PATCH] docs/memory.txt: old_portio has gone, so don't mention it
>=20
> So you could apply on top.

I'd rather drop the Peter's patch and apply your first version, so
we don't have 2 halves but one whole :)   I can pick it from your
initial submission ;)

Thanks,

/mjt

