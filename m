Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLTNW-0000ql-Ac
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 03:37:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VLTNQ-0000h0-4c
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 03:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VLTNL-0007VI-29
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 03:37:44 -0400
Received: from nodalink.pck.nerim.net ([62.212.105.220]:35694
	helo=paradis.irqsave.net) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1VLTMP-0006wj-Pb; Mon, 16 Sep 2013 03:36:42 -0400
Received: by paradis.irqsave.net (Postfix, from userid 1002)
	id 300E987468E; Mon, 16 Sep 2013 09:36:38 +0200 (CEST)
Received: from irqsave.net (unknown [192.168.77.1])
	by paradis.irqsave.net (Postfix) with ESMTP id 423BD874648;
	Mon, 16 Sep 2013 09:36:35 +0200 (CEST)
Date: Mon, 16 Sep 2013 09:38:30 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20130916073830.GA5105@irqsave.net>
References: <1379316040-19320-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1379316040-19320-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
Cc: qemu-trivial@nongnu.org, benoit.canet@irqsave.net, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: ignore
	test-throttle
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
X-List-Received-Date: Mon, 16 Sep 2013 07:37:49 -0000

Le Monday 16 Sep 2013 =E0 15:20:40 (+0800), Fam Zheng a =E9crit :
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index d11cc22..ae5280e 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -5,6 +5,7 @@ check-qjson
>  check-qlist
>  check-qstring
>  test-aio
> +test-throttle
>  test-cutils
>  test-hbitmap
>  test-iov
> --=20
> 1.8.3.1
>=20
>=20

Reviewed-by: Benoit Canet <benoit@irqsave.net>

