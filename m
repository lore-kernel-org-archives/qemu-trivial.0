Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3hs-0002st-8V
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3hp-0002mG-Cr
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3ho-0000Xj-Lw
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:45:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1db3hj-0000PV-2Q; Fri, 28 Jul 2017 07:45:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 47A4A4283F;
	Fri, 28 Jul 2017 14:45:14 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 503575E0;
	Fri, 28 Jul 2017 14:45:12 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <12b23d70-abe8-18f3-f08e-78aecd818289@msgid.tls.msk.ru>
Date: Fri, 28 Jul 2017 14:45:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 00/20] fix bugs reported by
 Clang Static Analyzer
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
X-List-Received-Date: Fri, 28 Jul 2017 11:45:22 -0000

27.07.2017 05:42, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series is the result of [now NOT] having fun with Clang's Static A=
nalyzer
> (see https://clang-analyzer.llvm.org/).

Applied almost all to -trivial, except of the ones wich had NACKs and que=
stions.

Thanks,

/mjt

