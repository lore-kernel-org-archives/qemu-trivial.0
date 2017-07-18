Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQOL-0005cM-KX
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:10:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dXQOJ-0005Zb-Um
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dXQOJ-00072K-2B
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:10:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dXQOC-0006sY-Uf; Tue, 18 Jul 2017 07:10:05 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 24E904163B;
	Tue, 18 Jul 2017 14:09:55 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 084015E9;
	Tue, 18 Jul 2017 14:09:55 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-20-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <61936111-d9d8-a472-1689-bf7c0bd32779@msgid.tls.msk.ru>
Date: Tue, 18 Jul 2017 14:09:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 19/29] disas: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:10:12 -0000

18.07.2017 09:09, Philippe Mathieu-Daud=C3=A9 wrote:

> @@ -151,7 +151,7 @@ static int print_insn_objdump(bfd_vma pc, disassemb=
le_info *info,
>      info->read_memory_func(pc, buf, n, info);
> =20
>      for (i =3D 0; i < n; ++i) {
> -        if (i % 32 =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(i, 32)) {
>              info->fprintf_func(info->stream, "\n%s: ", prefix);
>          }
>          info->fprintf_func(info->stream, "%02x", buf[i]);

This does not seem to be related to _alignment_ per se, it is
just formatting, 32 entries per line, so that output looks
more-or less compact and stays readable.  To me it is a
strange move, not so much logical.

It doesn't matter much either way, but with IS_ALIGNED, to me
at least, it looks a bit less logical than now.

Thanks,

/mjt


