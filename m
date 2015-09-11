Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaJA2-0001zs-9F
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaJ9v-0001pl-Ks
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaJ9u-0001Sx-Pa
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:54:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaJ9o-0001SI-Kj; Fri, 11 Sep 2015 03:54:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 64F8E41207;
	Fri, 11 Sep 2015 10:54:03 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 545FDA52;
	Fri, 11 Sep 2015 10:54:03 +0300 (MSK)
Message-ID: <55F2889B.4040109@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:54:03 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 00/11] qemu-log,
	perfmap and other logging tweaks
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
X-List-Received-Date: Fri, 11 Sep 2015 07:54:16 -0000

03.08.2015 12:14, Alex Benn=C3=A9e wrote:
> Hi,
>=20
> This is mostly just a re-base to keep current with master. I've added
> a couple of outstanding s-o-b and r-b tags. There are also two new
> patches in this series which seemed to be worth keeping together:
>=20
>  - a simple patch to dump invocation info in the log
>  - the cputlb logging clean-up posted as an RFC last month
>=20
> Could folks interested in TCG stuff have a look over the light
> re-factor and perf map patches please?
>=20
> It would be nice to get these in the next cycle but I'm unsure who's
> tree I should be targeting? Most of the top level files touched
> (cputlb, translate-all, qemu-log) just have the list marked as the
> maintainer ;-)

With this many review comments and somewhat hot discussion about some
patches, I think I have a good excuse to not apply this series
to qemu-tivial tree ;)

Keep up the good work please!

/mjt

