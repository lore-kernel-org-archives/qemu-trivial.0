Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo58A-0004xt-Pe
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 02:08:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo583-0004op-F1
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 02:08:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo57x-0001WF-A0
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 02:08:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wo57k-0001VJ-OS; Sat, 24 May 2014 02:08:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4618342B94;
	Sat, 24 May 2014 10:08:03 +0400 (MSK)
Message-ID: <53803741.8050801@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 10:08:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>	<1400631039-7208-3-git-send-email-tamlokveer@gmail.com>	<537FAF29.3080600@msgid.tls.msk.ru>
	<CACrq+iK9+ARbYgkXeAFfdeLMmjb+EE04skdVk-POTyUSgY+xmw@mail.gmail.com>
In-Reply-To: <CACrq+iK9+ARbYgkXeAFfdeLMmjb+EE04skdVk-POTyUSgY+xmw@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 2/2] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Sat, 24 May 2014 06:08:29 -0000

24.05.2014 10:01, Le Tan =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I will fix the whitespace issues and resend this series with a new
> version later.

Please note, once again: I applied (with fixups) other 3 your patches,
so there's no need to resend those 3.

This one, besides a whitespace problem, needs an ACK from block subsystem
maintainers, because it touches too much code there.

Thanks,

/mjt

