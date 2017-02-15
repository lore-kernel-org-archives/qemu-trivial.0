Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwgq-0003re-Q7
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:20:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwgk-0003lZ-0G
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:19:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwgj-0007M7-3D
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:19:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwgd-0007K6-N5; Wed, 15 Feb 2017 05:19:47 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AC830421B6;
	Wed, 15 Feb 2017 13:19:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0088B264;
	Wed, 15 Feb 2017 13:19:46 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org
References: <20170214225535.6880-1-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <14f5cd23-bf50-e52b-ce90-6f199a3ee6d1@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:19:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170214225535.6880-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] register: fix incorrect read mask
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
X-List-Received-Date: Wed, 15 Feb 2017 10:20:00 -0000

15.02.2017 01:55, Philippe Mathieu-Daud=C3=A9 wrote:
> The register_read() and register_write() functions expect a bitmask arg=
ument.
> To avoid duplicated code, a new inlined function register_enabled_mask(=
) is
> introduced.

Applied to -trivial, thanks!

/mjt

