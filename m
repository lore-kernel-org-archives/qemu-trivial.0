Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zYZ-0007tR-TR
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zYW-0007lf-Md
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zYV-00027I-Ln
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:52:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29858
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zYV-000272-Gs
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZX3chkrwvDhLB1ewTZIHUP1V/2meRWAQMlNE8/MgjsU=;
 b=PtoERlT7r3dvEIUkDpzLkd1puR46rJBAV7y8GS0hG4DewR5IlUBAA9uqWHCYxxK1dznTBx
 uTBr4F2cjbS4/pIna+zuRAFQkVwvWol7JWOZ+lSVwtvCkOB+jjXElk200lc853KTcXoyv8
 lj+IijmpwBolrb+xZIdHTXyT7ICym0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-13CTc3uKNJiuDkp9RAwOBw-1; Tue, 18 Feb 2020 04:52:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC29800D50;
 Tue, 18 Feb 2020 09:52:33 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146088CCC5;
 Tue, 18 Feb 2020 09:52:14 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:52:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Subject: Re: [PATCH RESEND 03/13] block: Remove superfluous semicolons
Message-ID: <20200218095211.GF3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-4-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 13CTc3uKNJiuDkp9RAwOBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 18 Feb 2020 09:52:41 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 132ada80c4a
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/block.c b/block.c
> index 9c810534d6..9db0b973fe 100644
> --- a/block.c
> +++ b/block.c
> @@ -2435,13 +2435,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverStat=
e *child_bs,
>      if (bdrv_get_aio_context(child_bs) !=3D ctx) {
>          ret =3D bdrv_try_set_aio_context(child_bs, ctx, &local_err);
>          if (ret < 0 && child_role->can_set_aio_ctx) {
> -            GSList *ignore =3D g_slist_prepend(NULL, child);;
> +            GSList *ignore =3D g_slist_prepend(NULL, child);
>              ctx =3D bdrv_get_aio_context(child_bs);
>              if (child_role->can_set_aio_ctx(child, ctx, &ignore, NULL)) =
{
>                  error_free(local_err);
>                  ret =3D 0;
>                  g_slist_free(ignore);
> -                ignore =3D g_slist_prepend(NULL, child);;
> +                ignore =3D g_slist_prepend(NULL, child);
>                  child_role->set_aio_ctx(child, ctx, &ignore);
>              }
>              g_slist_free(ignore);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


