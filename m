Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zbQ-0004W2-A4
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zbN-0004Q0-Jl
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zbM-0003AG-Es
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42946
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zbM-00039d-Ak
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG+mVOsbeOP/NekfgFiczINtLuBGhgItgPZqznYZNGg=;
 b=eo95uE38fFskl2uHQw9Qd9iGkOjF9AVe0RwGLynKToqOYSkAZd8FJKkr+hNSHxCX78s5yv
 JJej17O0qQFA/l1tIhHwBlBac2nRFTG1CpQljgQ3TnnK+6679lgPq6WfJn9ai7I1xwPV0J
 sOMW9mWRT8Ymmf373uXbJKg+Gzo06GE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-cnpB31cQNYKadkgpCQkfyQ-1; Tue, 18 Feb 2020 04:55:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63201882CD1;
 Tue, 18 Feb 2020 09:55:29 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F4E90533;
 Tue, 18 Feb 2020 09:55:09 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:55:07 +0000
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
Subject: Re: [PATCH RESEND 06/13] hw/m68k/next-cube: Remove superfluous
 semicolon
Message-ID: <20200218095507.GI3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-7-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cnpB31cQNYKadkgpCQkfyQ-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:55:38 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 956a78118bf
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/m68k/next-cube.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index e5343348d0..350c6fec78 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -734,7 +734,7 @@ void next_irq(void *opaque, int number, int level)
>      switch (number) {
>      /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
>      case NEXT_FD_I:
> -        shift =3D 7;;
> +        shift =3D 7;
>          break;
>      case NEXT_KBD_I:
>          shift =3D 3;
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


