Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9nSb-0007rB-0S
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1j9nSY-0007n1-Aj
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:10:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1j9nSX-00039B-5M
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:10:30 -0500
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:50999)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1j9nSW-00031Z-Va
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:10:29 -0500
Received: from player697.ha.ovh.net (unknown [10.108.57.50])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4D9CE7F53D
 for <qemu-trivial@nongnu.org>; Thu,  5 Mar 2020 11:10:26 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 3A4601016F37D;
 Thu,  5 Mar 2020 10:10:19 +0000 (UTC)
Date: Thu, 5 Mar 2020 11:10:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] virtfs-proxy-helper: Make the helper_opts[] array
 const
Message-ID: <20200305111015.10ad9479@bahia.home>
In-Reply-To: <20200305010446.17029-4-philmd@redhat.com>
References: <20200305010446.17029-1-philmd@redhat.com>
 <20200305010446.17029-4-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14992764638741895459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddutddgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhtrhhivhhirghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.173
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 10:10:31 -0000

On Thu,  5 Mar 2020 02:04:46 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Reduce a bit the memory footprint by making the helper_opts[]
> array const.
>=20

... and, maybe most importantly, make it clear helper_opts[] is
not supposed to be modified at runtime.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Assuming this goes to the trivial tree:

Acked-by: Greg Kurz <groug@kaod.org>

>  fsdev/virtfs-proxy-helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index aa1ab2590d..de061a8a0e 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -43,7 +43,7 @@
>  #define BTRFS_SUPER_MAGIC 0x9123683E
>  #endif
> =20
> -static struct option helper_opts[] =3D {
> +static const struct option helper_opts[] =3D {
>      {"fd", required_argument, NULL, 'f'},
>      {"path", required_argument, NULL, 'p'},
>      {"nodaemon", no_argument, NULL, 'n'},


