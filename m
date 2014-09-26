Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZ3Q-0001y3-Ap
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZ3K-0001q8-7d
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZ3F-0005DP-B3
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:11:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZ34-0005Az-WB; Fri, 26 Sep 2014 13:11:15 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 995CD46F3D;
	Fri, 26 Sep 2014 21:11:08 +0400 (MSK)
Message-ID: <54259E2C.3050303@msgid.tls.msk.ru>
Date: Fri, 26 Sep 2014 21:11:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Adrian-Ken Rueegsegger <ken@codelabs.ch>, qemu-devel@nongnu.org
References: <1410980051-32033-1-git-send-email-ken@codelabs.ch>
	<54244BE4.8060208@codelabs.ch>
In-Reply-To: <54244BE4.8060208@codelabs.ch>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] Ping [PATCH] vmxcap: Update according to SDM of
 September 2014
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
X-List-Received-Date: Fri, 26 Sep 2014 17:11:35 -0000

25.09.2014 21:07, Adrian-Ken Rueegsegger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> As the patch makes simple changes to the vmxcap script that has no
> maintainer listed in the MAINTAINERS file it may be a candidate for the
> trivial patches team. Thus adding qemu-trivial as CC.
>=20
> Link to patchwork:
>=20
> http://patchwork.ozlabs.org/patch/390507/

Applied to -trivial, as it _looks_ like the patch is correct, but I'm uns=
ure ;)

BTW, the script will fail on a modern linux system since there's no /dev/=
msr0,
the device is named /dev/cpu/0/msr.

But I don't know how common these names are.

Thanks,

/mjt

