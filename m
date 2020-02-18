Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zZA-0000g5-H1
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZ8-0000ZM-0O
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZ7-0002Jq-17
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:53:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zZ6-0002J9-TS
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tck/Qr2prpuK61iRLpiXZrSo/5/pOzMSglU8r9C8hvE=;
 b=Y0Lp4iQPwvAwnIOrbjT6ErLutSx4e/qtKBXXi3w5VR4p+hxQicP2UOLlW70p/nCFv/nGBQ
 s7IN+lgMMODoX3hKTBSuXzZ4E0nU/JzicB8llpkpESEgtTO3KwhEXdEauXwwQyZuJp42wC
 NFhxiJK+w0gpwAJcAdb3VjycRy8f49A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-qi0c_oIpNky7_LC2txLCxw-1; Tue, 18 Feb 2020 04:53:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69607107B7D4;
 Tue, 18 Feb 2020 09:53:11 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7278119481;
 Tue, 18 Feb 2020 09:52:51 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:52:48 +0000
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
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Message-ID: <20200218095248.GG3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qi0c_oIpNky7_LC2txLCxw-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:53:19 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 56892fd1ab..a3142ca989 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -187,7 +187,7 @@ static void luring_process_completions(LuringState *s=
)
>                      ret =3D 0;
>                  }
>              } else {
> -                ret =3D -ENOSPC;;
> +                ret =3D -ENOSPC;
>              }
>          }
>  end:
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


