Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXPHc-0000ma-2m
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 05:59:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dXPHa-0000kn-0i
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 05:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dXPHZ-0000Mi-8R
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 05:59:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dXPHM-0000Gz-AA; Tue, 18 Jul 2017 05:58:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32FEA4A705;
	Tue, 18 Jul 2017 09:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 32FEA4A705
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 32FEA4A705
Received: from localhost (ovpn-117-165.ams2.redhat.com [10.36.117.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B2A177DD2;
	Tue, 18 Jul 2017 09:58:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
In-Reply-To: <20170718061005.29518-7-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	18 Jul 2017 03:09:42 -0300")
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-7-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 18 Jul 2017 11:58:47 +0200
Message-ID: <87bmoiysko.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Jul 2017 09:58:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 06/29] migration/block: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 09:59:11 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  migration/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/block.c b/migration/block.c
> index 9171f60028..498c72ad59 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -933,7 +933,7 @@ static int block_load(QEMUFile *f, void *opaque, int =
version_id)
>                  ret =3D bdrv_get_info(blk_bs(blk), &bdi);
>                  if (ret =3D=3D 0 && bdi.cluster_size > 0 &&
>                      bdi.cluster_size <=3D BLOCK_SIZE &&
> -                    BLOCK_SIZE % bdi.cluster_size =3D=3D 0) {
> +                    QEMU_IS_ALIGNED(BLOCK_SIZE, bdi.cluster_size)) {
>                      cluster_size =3D bdi.cluster_size;
>                  } else {
>                      cluster_size =3D BLOCK_SIZE;

Reviewed-by: Juan Quintela <quintela@redhat.com>

Should I take this patch, or does it go through the block layer?  Your
call.

Later, Juan.

