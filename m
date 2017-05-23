Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDBL9-00038c-OV
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 11:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBL8-00037V-6z
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 11:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBL7-0008Jt-FF
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 11:03:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDBL3-0008Fo-KZ; Tue, 23 May 2017 11:03:09 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE294418EB;
	Tue, 23 May 2017 18:03:08 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B65A43F6;
	Tue, 23 May 2017 18:03:08 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ad362ec8-86c5-1573-8d1e-755b2f55fc67@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 18:03:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 00/11] various easy cleanups
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
X-List-Received-Date: Tue, 23 May 2017 15:03:15 -0000

09.05.2017 02:39, Philippe Mathieu-Daud=C3=A9 wrote:
> various easy patchs added while coding around:
> - remove old comments
> - add/remove includes
> - use TYPE_ names when available
> - use ARRAY_SIZE() macro
>=20
> Philippe Mathieu-Daud=C3=A9 (11):
>   hw/net: removed obsolete comments
>   hw/pci: define msi_nonbroken in pci-stub
>   hw/misc: add missing includes
>   ide/ahci: add missing includes
>   hw/mips: add missing include
>   hw/arm: removed unnecessary include
>   hw/arm: use defined type name instead of hard-coded string.
>   hw/sparc: use ARRAY_SIZE() macro
>   target/sparc: fix DEBUG_MMU DPRINTF() arguments
>   register: display register prefix (name) since it is available
>   MAINTAINERS: self-appoint me as reviewer of the Register API

From this set, I've applied 4 patches:
 [PATCH 05/11] hw/mips: add missing include
 [PATCH 06/11] hw/arm: removed unnecessary include
 [PATCH 08/11] hw/sparc: use ARRAY_SIZE() macro
 [PATCH 10/11] register: display register prefix (name) since it is avail=
able

Thanks,

/mjt

