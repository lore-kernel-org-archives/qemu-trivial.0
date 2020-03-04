Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9Pop-0001zj-Mz
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 03:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9Pon-0001zI-2H
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9Pok-0000gA-Jy
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:55:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54652
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9Pok-0000cz-7x
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583312149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hiDKf+1FRP7Qsn6NU2jsLDyFS+cOtFP+Bpiumr4sdU=;
 b=F7fCgJ+f5/+Dz8wnafbOs5wDiUFksZ9HCVj1jWEUNSjjBnuocD+pJtDC9Tga4pDUG8n5QD
 ugyLiNtrY84F+EUpyGrfXruZ7K8w8PCDqqsOuhWIU7g99wpK6zUPaVD2lnG+X91LEoYGrp
 2dXbY6KAIW7kIEQ3LiUaaS1xJvQPV+I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-yn_wcgXAOWa7GCvjO6yXXw-1; Wed, 04 Mar 2020 03:55:45 -0500
X-MC-Unique: yn_wcgXAOWa7GCvjO6yXXw-1
Received: by mail-wr1-f69.google.com with SMTP id p5so551632wrj.17
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 00:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=esVLzDgs8QjiaS788crFRrla9njdU+b+E9+Nys4J2VQ=;
 b=HSskRB6QDLJK/b+wwMknNuwnlbfM2c9a3q9HXIhMelSM/YZFP2BFIh3h7JlMc8DHr9
 Bdpo5GBYGoS/LRnT3E/tfha/BgKYW+QRr9zUnFtOygEw4O1SWfx1i+7G5I+LFjKQkNkS
 ArV1wsyDbL57yU3cdlZ+NL8B14yRZ1p+lKGWnHCfk9FZPcuArbzHJifOLtMkVHtEgmJx
 B1PBBtYuW5Ef+ONSnnUsSX1RC2SjKMRYpd5zL4CtIr/7+tiP93YdfnMc/+a6ZosHXjh5
 HDDsXe0rbYi9S9bbJF+AFcr5rJVSlD1XdyMVgs46xAh1F3Dh0vcacnlYz7i8Wx+i7jP+
 rOUg==
X-Gm-Message-State: ANhLgQ0tAswJHyA1BkSh43KRSlxPwrLdSr544f9HOBowrTVBfu8mnfG5
 z3qWdNdwlbVTn/8WVUoIeWxQjU82Jw8E2p1IRuX46JaaagVF+YUsHkM4W6rI/lAWrmhu9UG8jdt
 zdnV7pgxTuIvaGWog4g==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr3197041wrx.292.1583312144547; 
 Wed, 04 Mar 2020 00:55:44 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtlFpqQK3JvcZAcFaxLj8iGluCqNJWsGAtE4XN4jCRtHeYTRt5AMCtk0Avb1gMUPfqQ/8skjw==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr3197020wrx.292.1583312144295; 
 Wed, 04 Mar 2020 00:55:44 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id z14sm35043325wrg.76.2020.03.04.00.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 00:55:43 -0800 (PST)
Date: Wed, 4 Mar 2020 09:55:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Joe Richey <joerichey94@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Liam Merwick <liam.merwick@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Joe Richey <joerichey@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] optionrom/pvh: scan entire RSDP Area
Message-ID: <20200304085541.cyirmrx5dozhf63a@steredhat>
References: <20200303105246.66390-1-joerichey94@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200303105246.66390-1-joerichey94@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
X-List-Received-Date: Wed, 04 Mar 2020 08:55:54 -0000

CCing Paolo

On Tue, Mar 03, 2020 at 02:52:47AM -0800, Joe Richey wrote:
> From: Joe Richey <joerichey@google.com>
>=20
> Right now the PVH option rom scans for the RSDP from 0xE0000 to
> 0xE1FFF. This is probobly a typo, it should scan from 0xE0000 to
> 0xFFFFF.
>=20
> This is actually an issue on some QEMU versions/machines. For example,
> when I run QEMU the RSDP is placed at 0xf5ad0 which will not be picked
> up by the current implementation.
>=20
> This bug still allows a Linux guest to boot (in most configurations) as
> the kernel will just scan for the RSDP if one isn't provided.
>=20
> Signed-off-by: Joe Richey <joerichey@google.com>
> ---
>  pc-bios/optionrom/pvh_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
> index a015e1bf22..28e79d7fc4 100644
> --- a/pc-bios/optionrom/pvh_main.c
> +++ b/pc-bios/optionrom/pvh_main.c
> @@ -29,7 +29,7 @@ asm (".code32"); /* this code will be executed in prote=
cted mode */
> =20
>  #define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
>  #define RSDP_AREA_ADDR          0x000E0000
> -#define RSDP_AREA_SIZE          2048
> +#define RSDP_AREA_SIZE          0x00020000
>  #define EBDA_BASE_ADDR          0x0000040E
>  #define EBDA_SIZE               1024
> =20

The patch LGTM!

When I wrote this code I followed [1], where it is written that it can
be found in the "memory region from 0x000E0000 to 0x000FFFFF", so it
should be a typo.

Thanks for fixing it!


Fixes: 2785dc7b17 ("optionrom: add new PVH option rom")
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


[1] https://wiki.osdev.org/RSDP#Detecting_the_RSDP


