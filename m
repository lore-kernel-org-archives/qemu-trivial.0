Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmTWO-00044J-6H
	for mharc-qemu-trivial@gnu.org; Sun, 14 Nov 2021 23:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTWM-00043c-DU
 for qemu-trivial@nongnu.org; Sun, 14 Nov 2021 23:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTWK-0004Ti-Be
 for qemu-trivial@nongnu.org; Sun, 14 Nov 2021 23:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636950183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIZeWQ4TDZbu8fedh6UFUZKhYT1CiOuH70tNC6lXnnA=;
 b=YalMgF+I1fG4I4Co86FmQbTAWgjAzbe7ul00TYjAS8BaqAhSuchcLcdTaQ3GAiWUIwUC/4
 Xp52EDOwavNHI9nh++HFrk96BAbW7kiy2Eh+twdhVlzIjAVpT7Eh/q/RjUAqL0oEHoK02Q
 2PfNL906GismQWlh36yYkQDojF55UMA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-FjZ096_oNUGSo6reds9NvA-1; Sun, 14 Nov 2021 23:23:02 -0500
X-MC-Unique: FjZ096_oNUGSo6reds9NvA-1
Received: by mail-lj1-f200.google.com with SMTP id
 d20-20020a05651c111400b00218c6372b7eso4743584ljo.16
 for <qemu-trivial@nongnu.org>; Sun, 14 Nov 2021 20:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uIZeWQ4TDZbu8fedh6UFUZKhYT1CiOuH70tNC6lXnnA=;
 b=hpRwI6t+DRdWahEEDGsfCCSTV0+Nuan0QaNY27FBjF3tBs02LThAwo2poCtv9wsauT
 vT19zG0/xm2+PnUKyunF8A7e5l33YAIwSC7JVx71Ae38EPVefKwWCnZcI2XRqpxpKuSG
 YsT6yQ7FZkVafzn6OH49CE8DEYvk8Dlk5AfCf7EjEtltFRvgFJlP9743T02Wj9JSjIT9
 Qhg/cgK8/Olur/uMYwymnUD6QJ/d6KEy3yJpnM0hcaEUf9/7onAybAkjpFbY5iSTPkA9
 5kS8/MN/HDGXA5QYhHbOtXONhPHAbtBxz79vWEdqIOYRJOQoQddM0Clx+Iq/G7pCJxiV
 eE9w==
X-Gm-Message-State: AOAM530MdFXqZuaVfcIz9KKgiSjDqt3//br/Wwrnz/cIAQQx4DTFePxC
 F5YZJLuqsTWgNsddwue8udBaINQ4Lufa9k7cNRvvzUhBMHqlJGUY6uUkb8+bgl/+TNxxspfhzef
 8sSKEcUm7iLuiqPns1WdueGqYKV2mq8FGbQ==
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr30933557lfr.348.1636950181027; 
 Sun, 14 Nov 2021 20:23:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8eiGrx0+jITCGj3R8pu3cSlzXs6lnnhcmCTu0RrlZqfRjnt1FZTDLKERm4Rv3vZoVKgBhJx8ZgBjLmQUq5hw=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr30933539lfr.348.1636950180814; 
 Sun, 14 Nov 2021 20:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112193431.2379298-1-eperezma@redhat.com>
 <20211112193431.2379298-2-eperezma@redhat.com>
In-Reply-To: <20211112193431.2379298-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Nov 2021 12:22:49 +0800
Message-ID: <CACGkMEuSL-LuLjo_uH=8bVbRyr2drn8rhS=TtvfpdqiD3aAT8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] vdpa: Replace qemu_open_old by qemu_open at
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>, 
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 04:23:06 -0000

On Sat, Nov 13, 2021 at 3:34 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> There is no reason to keep using the old one, since we neither use the
> variadics arguments nor open it with O_DIRECT.
>
> Also, net_client_init1, the caller of net_init_vhost_vdpa, wants all
> net_client_init_fun to use Error API, so it's a good step in that
> direction.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 49ab322511..6ffb29f4da 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -261,7 +261,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
>
> -    vdpa_device_fd =3D qemu_open_old(opts->vhostdev, O_RDWR);
> +    vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp);
>      if (vdpa_device_fd =3D=3D -1) {
>          return -errno;
>      }
> --
> 2.27.0
>


