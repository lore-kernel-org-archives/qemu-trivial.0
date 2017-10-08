Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1Jwf-0006Qc-M1
	for mharc-qemu-trivial@gnu.org; Sun, 08 Oct 2017 18:21:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1e1Jwb-0006PX-4h
	for qemu-trivial@nongnu.org; Sun, 08 Oct 2017 18:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1e1JwW-0005Bk-7b
	for qemu-trivial@nongnu.org; Sun, 08 Oct 2017 18:21:09 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:42711)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1e1JwW-0005B6-0o
	for qemu-trivial@nongnu.org; Sun, 08 Oct 2017 18:21:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 35C60EDA7;
	Mon,  9 Oct 2017 00:21:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-_qxkPsSZHO; Mon,  9 Oct 2017 00:21:00 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:181:c200:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 80108E98D;
	Mon,  9 Oct 2017 00:21:00 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.89)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1e1JwQ-0000U8-Pt; Mon, 09 Oct 2017 00:20:58 +0200
Date: Mon, 9 Oct 2017 00:20:58 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Message-ID: <20171008222058.3ngrwgadmhyucekf@var.youpi.perso.aquilenet.fr>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-37-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171006235023.11952-37-f4bug@amsat.org>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 141.255.128.1
Subject: Re: [Qemu-trivial] [PATCH 36/88] SLIRP: use g_new() family of
 functions
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
X-List-Received-Date: Sun, 08 Oct 2017 22:21:10 -0000

Hello,

Philippe Mathieu-Daud=C3=A9, on ven. 06 oct. 2017 20:49:31 -0300, wrote:
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -869,7 +869,7 @@ net_init_slirp_configs(const StringList *fwd, int f=
lags)
>      while (fwd) {
>          struct slirp_config_str *config;
> =20
> -        config =3D g_malloc0(sizeof(*config));
> +        config =3D g_new0(struct slirp_config_str, 1);

It doesn't really seem like an improvement to me in such case: we don't
have overflow issues here, and using sizeof(*config) makes the line
clearly correct, while expliciting the struct behind means we need to
make sure of the coherency.

> diff --git a/slirp/socket.c b/slirp/socket.c
> index cb7b5b608d..2eccb68c2e 100644
> --- a/slirp/socket.c
> +++ b/slirp/socket.c
> @@ -48,7 +48,7 @@ socreate(Slirp *slirp)
>  {
>    struct socket *so;
> =20
> -  so =3D (struct socket *)malloc(sizeof(struct socket));
> +  so =3D g_new(struct socket, 1);

Similarly, here I'd rather write g_malloc(sizeof(*so));

Samuel

