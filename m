Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7mI-0002Oj-Qr
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7mE-0002L2-A8
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7m9-0003bZ-Tm
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:18:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7m4-0003Xy-Ej; Mon, 31 Jul 2017 06:18:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C9C2F42ABB;
	Mon, 31 Jul 2017 13:18:07 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id CB545B77;
	Mon, 31 Jul 2017 13:18:05 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20170727154537.15303-1-marcandre.lureau@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <dcc381fd-2391-9943-7cff-941d735d6982@msgid.tls.msk.ru>
Date: Mon, 31 Jul 2017 13:18:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727154537.15303-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests: test-netfilter && pxe-test
 require slirp
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
X-List-Received-Date: Mon, 31 Jul 2017 10:18:21 -0000

27.07.2017 18:45, Marc-Andr=C3=A9 Lureau wrote:
> If slirp is disabled, it will fail with:

Applied to -trivial, thanks!

/mjt

