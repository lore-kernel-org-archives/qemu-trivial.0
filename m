Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXZI-0006LP-5p
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXZA-0006Bc-N2
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXZ5-0006jX-KP
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:10:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXYu-0006iQ-Qv; Sun, 24 Aug 2014 09:10:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 15E77449BA;
	Sun, 24 Aug 2014 17:10:22 +0400 (MSK)
Message-ID: <53F9E43D.2020103@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 17:10:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Dmitry Fleytman <dmitry@daynix.com>
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
	<53F9D55D.6060804@msgid.tls.msk.ru>
	<A9C9B9DB-AEEE-4D79-A968-E0F34671C865@daynix.com>
In-Reply-To: <A9C9B9DB-AEEE-4D79-A968-E0F34671C865@daynix.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Tamir Shomer <tamirs@daynix.com>,
	qemu-devel@nongnu.org, Ben Draper <ben@xrsa.net>,
	Stefan Hajnoczi <stefanha@redhat.com>, Yan Vugenfirer <yan@daynix.com>
Subject: Re: [Qemu-trivial] [PATCH] vmxnet3: Pad short frames to minimum
	size (60 bytes)
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
X-List-Received-Date: Sun, 24 Aug 2014 13:10:45 -0000

24.08.2014 16:28, Dmitry Fleytman wrote:

> Hi Michael,
>=20
> I=92m the maintainer of vmxnet3/pvscsi devices in QEMU. Thanks for CC=92=
ing me.

Maybe you can add yourself to MAINTAINERS file as well? :)
I dunno if that's actually needed, but at least this should
stop "strain" patches like this to be sent to -trivial alone... ;)

> I think this patch is correct and needed.
>=20
> As we saw a few times already on different operating systems,
> vmware drivers expect short packets to be padded as required
> by corresponding RFC. Therefore this patch fixes a real bug.

Okay, since there's no entry for vmxnet in MAINTAINERS, and with
your blessing, and since this is a rather specific device which
is not in common use, I'll apply it to -trivial, for now, unless
you want to pick it up and send a pull request for it.

Given your description, I think it should be Cc: qemu-stable@.

> Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>

Thanks,

/mjt

