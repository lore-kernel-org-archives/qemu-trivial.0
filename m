Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3Jb-0007Cf-9U
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3JY-0007AH-FP
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3JX-0000Dx-AV
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:20:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1db3JT-0000AM-7x; Fri, 28 Jul 2017 07:20:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 862184284B;
	Fri, 28 Jul 2017 14:20:10 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 903895E0;
	Fri, 28 Jul 2017 14:20:08 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20170728012542.29975-1-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <7b3268cc-fbcb-8b13-25a0-eafd50e8dca3@msgid.tls.msk.ru>
Date: Fri, 28 Jul 2017 14:20:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 11:20:17 -0000

28.07.2017 04:25, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi, following Cleber Rosa example I cleaned more invalid references.
>=20
> Eric said this can wait 2.11, however these patches don't change any co=
de
> generated, I think the 2.10 users deserve an up-to-date doc :p

Applied all to -trivial, thanks!

/mjt

