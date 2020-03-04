Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9P9g-0000Gs-1y
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 03:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9P9e-0000EH-Fb
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9P9d-0006sF-Ek
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:13:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36332
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9P9d-0006qA-9b
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 03:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583309600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mBnaz0mCEBpN71DEwtXkXBqmLGfYXTDGVbl5aH+grw=;
 b=KQiBdlEiqOYiyFQ3L4Zrpt5JOaDvaNV8Q85oaomEywC/5xqr5jXde8arWR1At5riLafwTn
 n78UuU8OuCHeai6CZQSga7LCGqGiaeHelgx9Ibg7McFdEfOccEjpSHszSX1iw1JxppSujS
 R4uyJlE2aBtH1iMquBvdscEn1uwzAfM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Q0NLBYkQPgONavrOJJYO1Q-1; Wed, 04 Mar 2020 03:13:19 -0500
X-MC-Unique: Q0NLBYkQPgONavrOJJYO1Q-1
Received: by mail-wm1-f69.google.com with SMTP id b23so536227wmj.3
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 00:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWJSsRVzOBoQMTYYqTABgoVY2xa9XWgBbZcEtmX3I4o=;
 b=crRLnVfDcbA+A0ee9W8cDfrQHXOOBXvA6cbH5bKSRzhjalPQT13ie0ruNgmyG2eYcB
 XIOrVCdoUI+DXkATEjsnl8FHuT5eZhdliI2Bxkmhgf7kJSwJ3q1KT4ewbV1GtbxTzb+h
 mksmaD4Vvjsn07PLxxlVwrfuHDxMjIIXBCxK9mCBFfuYgVuKFVSahG/3O6MipOjwZD3L
 7t/I6b7iPIusQFPSFIX9M2dGh61f9LsdJ5nW0iG4hKEntx8xoxlpskn0kJU1vCA1ZvK7
 uc/fsvdthVsAfbkDAr/8s5HWN2LM5wFUvrjR1W1fB/uLHArMG2+ds346ZWco7RmAzSPu
 1f8w==
X-Gm-Message-State: ANhLgQ3aJwQkGUgv9408QKYFGRBQijREVLq3ah/MDdiynZZRZlUS5/WP
 Z2VmhLW7Qmhci3PzB/haBYJ2DaXpegdtPP9eX7BhWSDcHOrqku+t+6JvP4YYAQ5dqvcNLrXECxg
 WnMRNZisXVtPuKVTnvQ==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2285451wma.164.1583309598239; 
 Wed, 04 Mar 2020 00:13:18 -0800 (PST)
X-Google-Smtp-Source: ADFU+vue20tPLBy8vlOvwtl3wfQbY5WuckZcqmTyiMfZZVYd7+SFaZcUEq9dC2GNwrBwqBmemF5K1Q==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2285384wma.164.1583309597613; 
 Wed, 04 Mar 2020 00:13:17 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id j14sm38619493wrn.32.2020.03.04.00.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 00:13:16 -0800 (PST)
Date: Wed, 4 Mar 2020 09:13:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nick Erdmann <n@nirf.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] vhost-vsock: fix error message output
Message-ID: <20200304081314.bwkpny6mumoxqfvh@steredhat>
References: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
MIME-Version: 1.0
In-Reply-To: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 04 Mar 2020 08:13:23 -0000

On Sun, Mar 01, 2020 at 01:03:06PM +0100, Nick Erdmann wrote:
> error_setg_errno takes a positive error number, so we should not invert
> errno's sign.
>=20
> Signed-off-by: Nick Erdmann <n@nirf.de>
> ---
>  hw/virtio/vhost-vsock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 66da96583b..9f9093e196 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -325,7 +325,7 @@ static void vhost_vsock_device_realize(DeviceState *d=
ev, Error **errp)
>      } else {
>          vhostfd =3D open("/dev/vhost-vsock", O_RDWR);
>          if (vhostfd < 0) {
> -            error_setg_errno(errp, -errno,
> +            error_setg_errno(errp, errno,
>                               "vhost-vsock: failed to open vhost device")=
;
>              return;
>          }

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano


