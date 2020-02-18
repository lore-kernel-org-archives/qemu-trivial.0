Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zbQ-0004WH-Gt
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j3zbN-0004QK-QA
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j3zbM-0003AT-Iw
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j3zbM-00039n-Ew
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cJzAc12RVZRNEnjQBJhzyiL3IOCizN0eERxIa09ET0=;
 b=ZEG1ofHs+LC6qQawtVNyVTFn7I5L3wzfANjepgtTM0wg7agrQuLo9PJ8DzDwg10AXaf3cX
 G/Kc3ftXvO3xnPFzJgT8FzeTSHTMbMtb3kcJx83jD72C4UdoXwesITDvKhFkq8XhxTmYGd
 D8165w+Rv8i4Av2wjd9zxO/XwWVqcb0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-kMMw_8kUPjSobTceQWHjQA-1; Tue, 18 Feb 2020 04:55:33 -0500
Received: by mail-wr1-f71.google.com with SMTP id n23so10515461wra.20
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HgFqoSoARH3uk7odBpEdG6HCEcZqvIBJgyeE0i3cD20=;
 b=YHlNrG3ZnNHLTxsLkD9GJdSSh11ZQkf+GJBoBufZiCxYyBiBghGfrv+/7JFADBhqNK
 P6YCkuk+s6sFt+ZFk/1/Q9s97xt2ZmcRorIIfKbVMOJoEUXvDyvElGIuTen8lSmZ60z7
 AVwTysWk41iKgrEwd53irOcNvqdurBUXWi5qqC/R0FsFg/At/sRK5vwn65DZtSSNUfGA
 4nI+JT10R6PZA7kjfuLRd8jIkpxuVyl35zfGpc55xwzSPitN+GxAURWWrb/zFIhDZEGF
 jf3VDmHAYvyLMer1jfqb8TlQC36wh+Z25oUohgj4mMdPQGvQ+hHj9LW61cmyZEiCgHcg
 pK7A==
X-Gm-Message-State: APjAAAXTiRGm14mqr/UmoMvLOg/o32O61aCXO0Mtv5w3GmxN7hbiUZQ4
 5buAfe4unGwwmi8qnHtLP7ICrU0eTWg6+wo9onWuC/wUG6RLcDWsRT26bPdhjVZFZ1C3fHPlcZi
 T0GXQprbH49VQF834JA==
X-Received: by 2002:adf:a453:: with SMTP id e19mr27305844wra.305.1582019732563; 
 Tue, 18 Feb 2020 01:55:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZIgwzQofXO7sILwU2QL82ipDu8k4lihQNI4Pu2DEIWsf5g/MijuhSe9qBXuQpibLr2FwL4A==
X-Received: by 2002:adf:a453:: with SMTP id e19mr27305806wra.305.1582019732327; 
 Tue, 18 Feb 2020 01:55:32 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id 25sm2912651wmi.32.2020.02.18.01.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:55:31 -0800 (PST)
Date: Tue, 18 Feb 2020 10:55:28 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Message-ID: <20200218095528.3i26z4shmvqznput@steredhat>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com>
X-MC-Unique: kMMw_8kUPjSobTceQWHjQA-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:55:39 -0000

On Tue, Feb 18, 2020 at 10:43:53AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

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


