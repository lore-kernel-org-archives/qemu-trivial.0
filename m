Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwACc-00008N-6w
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 12:56:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dwACZ-00006j-NS
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 12:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dwACZ-0007Et-1R
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 12:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1dwACU-0007Ai-MC; Sun, 24 Sep 2017 12:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73DBE356CE;
	Sun, 24 Sep 2017 16:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 73DBE356CE
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mlureau@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66B6668D5C;
	Sun, 24 Sep 2017 16:56:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D7751809547;
	Sun, 24 Sep 2017 16:56:12 +0000 (UTC)
Date: Sun, 24 Sep 2017 12:56:11 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: Liang Yan <lyan@suse.com>
Cc: samuel thibault <samuel.thibault@ens-lyon.org>, pbonzini@redhat.com, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <1327714502.20871949.1506272171027.JavaMail.zimbra@redhat.com>
In-Reply-To: <20170922225533.1928-1-lyan@suse.com>
References: <20170922225533.1928-1-lyan@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.112.11, 10.4.195.1]
Thread-Topic: chardev/baum: fix baum that releases brlapi twice
Thread-Index: 6nz1Gd2bctgobkIGKXodg2DnFzbWMw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sun, 24 Sep 2017 16:56:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] chardev/baum: fix baum that releases
 brlapi twice
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
X-List-Received-Date: Sun, 24 Sep 2017 16:56:20 -0000



----- Original Message -----
> Error process of baum_chr_open needs to set brlapi null, so it won't
> get released twice in char_braille_finalize, which will cause
> "/usr/bin/qemu-system-x86_64: double free or corruption (!prev)"
>=20
> Signed-off-by: Liang Yan <lyan@suse.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/baum.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 302dd9666c..67fd783a59 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -643,6 +643,7 @@ static void baum_chr_open(Chardev *chr,
>          error_setg(errp, "brlapi__openConnection: %s",
>                     brlapi_strerror(brlapi_error_location()));
>          g_free(handle);
> +        baum->brlapi =3D NULL;
>          return;
>      }
>      baum->deferred_init =3D 0;
> --
> 2.14.1
>=20
>=20

