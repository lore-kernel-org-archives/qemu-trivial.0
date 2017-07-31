Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7iP-0000L9-04
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:14:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7iJ-0000I8-L3
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7iI-0001am-Qf
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:14:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7iA-0001Uy-Dh; Mon, 31 Jul 2017 06:14:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8AD9E42A9D;
	Mon, 31 Jul 2017 13:13:56 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 26CD5B77;
	Mon, 31 Jul 2017 13:13:54 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
References: <20170728224608.3598-1-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <bf468f87-db9e-6d4a-3066-ae3d4df64d82@msgid.tls.msk.ru>
Date: Mon, 31 Jul 2017 13:13:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Mon, 31 Jul 2017 10:14:19 -0000

29.07.2017 01:46, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Michael, you already applied this series to -trivial, however I upda=
ted the
> commits message, not requested but not a heavy task to do neither. Sinc=
e you
> didn't not sent PR yet, if you mind can you take those instead? Else it=
's not
> a big deal. Thanks!

Applied to -trivial, this one, instead of the first version.
I've also word-wrapped longish commit comments to fit in 80c.

Thanks,

/mjt

