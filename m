Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOic-0006gL-Ql
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:37:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOia-0006fC-OD
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOiZ-0002fU-Qm
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:37:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOiU-0002WQ-DW; Thu, 14 Sep 2017 03:37:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 234CF412CF;
	Thu, 14 Sep 2017 10:37:31 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 01FC05B9;
	Thu, 14 Sep 2017 10:37:29 +0300 (MSK)
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <20170328184959.5550-1-sw@weilnetz.de>
	<6a5b9248-312c-cb66-c189-9a3e1651013a@weilnetz.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <4c4af348-80c7-0f9f-5d00-be5e555ea463@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6a5b9248-312c-cb66-c189-9a3e1651013a@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for-2.9?] configure: Remove unused code
 (found by shellcheck)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 07:37:49 -0000

16.08.2017 15:57, Stefan Weil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> It looks like this patch got lost somehow.
>=20
> Stefan
>=20
> See also https://patchwork.codeaurora.org/patch/210129/
>=20
>=20
> Am 28.03.2017 um 20:49 schrieb Stefan Weil:
>> smartcard_cflags is no longer needed since commit
>> 0b22ef0f57a8910d849602bef0940edcd0553d2c.

Applied to -trivial.. finally :)

Thank you!

/mjt

