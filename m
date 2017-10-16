Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e44cI-0002WJ-12
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 08:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1e44cA-0002So-0D
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 08:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1e44c9-0006DF-8U
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 08:35:26 -0400
Received: from jessie.kos.to ([212.47.231.226]:52366 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <voipio@kos.to>)
	id 1e44br-000609-KI; Mon, 16 Oct 2017 08:35:20 -0400
Received: from kos.to (jessie.kos.to [212.47.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 3444A2C19B0;
	Mon, 16 Oct 2017 12:35:06 +0000 (UTC)
Received: (nullmailer pid 4674 invoked by uid 1000);
	Mon, 16 Oct 2017 12:35:05 -0000
Date: Mon, 16 Oct 2017 12:35:05 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: Carlo Marcelo Arenas =?utf-8?B?QmVsw7Nu?= <carenas@gmail.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-trivial@nongnu.org
Message-ID: <20171016123505.GC1918@kos.to>
References: <20170926041420.32673-1-carenas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170926041420.32673-1-carenas@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [PATCH] linux-user: remove duplicate break in
 syscall
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
X-List-Received-Date: Mon, 16 Oct 2017 12:35:33 -0000

On Mon, Sep 25, 2017 at 09:14:20PM -0700, Carlo Marcelo Arenas Bel=C3=B3n=
 wrote:
> likely introduced in 3532fa7402cda16f7b95261b0339c58630051f0b
>=20
> Signed-off-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>

Applied to linux-user, thanks

> ---
>  linux-user/syscall.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9b6364a266..3ef4d1c568 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3131,7 +3131,6 @@ set_timeout:
>          case TARGET_SO_RCVLOWAT:
>  		optname =3D SO_RCVLOWAT;
>  		break;
> -            break;
>          default:
>              goto unimplemented;
>          }
> --=20
> 2.14.1
>=20

