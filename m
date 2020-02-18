Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zgO-0005ZK-65
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgL-0005Ux-JK
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgK-0005lV-I5
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38691
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zgK-0005ka-Dg
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJALTyvcBMpA+vzSfbVeBchj5gcI3zO3pngsiwbXCAk=;
 b=elbf9xNgpU4cXVstjqjHnU4cAfYvIIgRbojsLOXy8DM/jVhb+YsSxDp+hmTlU5JrM8uwXe
 YQbsWCW4ZKEVEOEA6vP88SZ+oCYVipfrNvrKMT5nzzjo1vW5QAfDU3l9ATSqrz99A9pvNq
 /2u0gDah/PbdN7nKXMsdzwg07O3daCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-MINsvDlFOQeXEJF8N6_s-A-1; Tue, 18 Feb 2020 05:00:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020241005513;
 Tue, 18 Feb 2020 10:00:00 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9590E90772;
 Tue, 18 Feb 2020 09:59:40 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:59:38 +0000
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
Subject: Re: [PATCH RESEND 10/13] ui/input-barrier: Remove superfluous
 semicolon
Message-ID: <20200218095938.GM3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-11-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-11-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MINsvDlFOQeXEJF8N6_s-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 18 Feb 2020 10:00:46 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 6105683da35
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  ui/input-barrier.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ui/input-barrier.c b/ui/input-barrier.c
> index fe35049b83..527c75e130 100644
> --- a/ui/input-barrier.c
> +++ b/ui/input-barrier.c
> @@ -455,7 +455,7 @@ static gboolean writecmd(InputBarrier *ib, struct bar=
rierMsg *msg)
>          break;
>      default:
>          write_cmd(p, barrierCmdEUnknown, avail);
> -        break;;
> +        break;
>      }
> =20
>      len =3D MAX_HELLO_LENGTH - avail - sizeof(int);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


