Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nJo8r-0001kV-LR
	for mharc-qemu-trivial@gnu.org; Mon, 14 Feb 2022 22:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJo8l-0001jq-6I
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 22:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJo8h-0000Wx-6l
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 22:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644894264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOMgHUwkjIv5M9vX91VjKRRVq13u0TmHqkGVHPWAxk8=;
 b=h8sbIFCi3UFRvmEYkoN6GXDzM0HElPyOZQjC63TculOpA/onQauZgMtcD9nrnzt7Y4/XiZ
 fnx9LWTPxzeavwOz05XMigejVAj6BG77or+meoYuXxJS+JujRYPXqCW96lD3CWcwya2xz0
 MOI3scRXbsYeJR05Ap9FL70wpm/xiiA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-J6zx2RGwPxelFyp527rZVg-1; Mon, 14 Feb 2022 22:04:20 -0500
X-MC-Unique: J6zx2RGwPxelFyp527rZVg-1
Received: by mail-lj1-f200.google.com with SMTP id
 v1-20020a2e9601000000b002446a7310a1so6575478ljh.3
 for <qemu-trivial@nongnu.org>; Mon, 14 Feb 2022 19:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lOMgHUwkjIv5M9vX91VjKRRVq13u0TmHqkGVHPWAxk8=;
 b=uRikSxG7A72TuFo2Jl6/KdWOBA7I3kt8jkP5eBP2OVW4FPUxfmOz/SczJQB/yAy34o
 F/+NiBerBdQvuqtDHNo18a7JHICmmoVMbFF27QJfM1Zpx1SSy088oN2fSYHG+gIRsr62
 prKUL32igBOpdfNbGdDxEMKGZW+kDrpA64SfE44W0OgzqqCyEDblQwvC1YmMyxIkO1eM
 VgzpsGsq49/JsRutOBvAkhpZsa9yphu1QQoA4p7KpxPEr7cYlWYSJYiIV/5mlbdloJi1
 EBQfTi7rz3oarhNnY8xrkLpo7JoLWtU9g5bAobl+NXRldi7q4z/YrKaRb/2i/i49s3We
 8kEw==
X-Gm-Message-State: AOAM532TwK87EhKPhhpmnlP/f8MCWKjWTN2fI71dJk2AD91X/IqHUSKi
 oxuW21ICAngF1XgYxAR0qtXk4KkvTNFbnzKN1AszwPe9Fds/Vn2nO5naqnjTmaGXGmHo35hwS4S
 HPzXBrBDkF8KbWHiATXcRZxq8UJlgcF51nQ==
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr1152322ljr.369.1644894258626; 
 Mon, 14 Feb 2022 19:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOVaCwgeC+8Id3n08kCIt8ji+O8Hc/WuVhoF6leB8c3d1Lye5ABLVlMZqTQBKzL3lUFroIwCyBKuyAoenoKlU=
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr1152307ljr.369.1644894258393; 
 Mon, 14 Feb 2022 19:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20220214193415.1606752-1-eperezma@redhat.com>
 <20220214193415.1606752-2-eperezma@redhat.com>
In-Reply-To: <20220214193415.1606752-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Feb 2022 11:04:07 +0800
Message-ID: <CACGkMEukk9jWDnEtwTuoH0NGBBk=ZZ4Xhf6kLUru6UgQZu54vw@mail.gmail.com>
Subject: Re: [PATCH 1/1] vdpa: Make ncs autofree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Feb 2022 03:04:31 -0000

On Tue, Feb 15, 2022 at 3:34 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Simplifying memory management.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4125d13118..4befba5cc7 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>  {
>      const NetdevVhostVDPAOptions *opts;
>      int vdpa_device_fd;
> -    NetClientState **ncs, *nc;
> +    g_autofree NetClientState **ncs =3D NULL;
> +    NetClientState *nc;
>      int queue_pairs, i, has_cvq =3D 0;
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> @@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>              goto err;
>      }
>
> -    g_free(ncs);
>      return 0;
>
>  err:
> @@ -310,7 +310,6 @@ err:
>          qemu_del_net_client(ncs[0]);
>      }
>      qemu_close(vdpa_device_fd);
> -    g_free(ncs);
>
>      return -1;
>  }
> --
> 2.27.0
>


