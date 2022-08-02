Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIqjr-00067A-9Y
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2022 08:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqjb-00062a-Fz
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqjY-0007Vl-6Y
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659442247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpA5237/0R5XllHtYKelBe1siNACiUEnLhZWzbQCqQ4=;
 b=Uvxb8o916nj6Wyc0W7jHeAoS6zVKg0XuU5SxX3itUwUS3LjGVpjcPFTR1uTYa7pdCKnK+I
 2jPfOMXnKIL4eA20RquGJuKgMIG/ASRgqI0Y4fGMC7seAgMhYdZ9RDrfic7qtP8DFWsPRH
 OgoqUvGj2FkX7kQTfJryxpjTQtaKln4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-RSesUhV3MFaovgKoQfidKg-1; Tue, 02 Aug 2022 08:10:46 -0400
X-MC-Unique: RSesUhV3MFaovgKoQfidKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso3491822wrg.21
 for <qemu-trivial@nongnu.org>; Tue, 02 Aug 2022 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MpA5237/0R5XllHtYKelBe1siNACiUEnLhZWzbQCqQ4=;
 b=nzyjL0qh+INz3887Q4DTuptTi8Z5mPv06YQVnzWTDRJ1DvQ7NaiT0iDDZ+ZFvAo1zF
 wTPX29GsrVPkDY77yiqP1RkLZofVZxLeu87tSqBvcIrOak1xw7NGxkx30lht0jRQ/99Y
 fRpKBtVi7MeYwhOfgbiToNH6Oht3Pp2HFwfm4Qbph7faggCiKZGDhNBDefOL1PtSzSYW
 MqOTo5k91EfoiZjj6olZsD8wEnXigAsaxM2xlkTfX6o61uyqvopEW/ZX8C2RPVmQmhtG
 yL+l8m08a1GTvDQZWiCynOR+gEe8zQF+UGeUFRQbWkzCdr4BP/Zo+0zXwrc2ko0z0N+v
 hgzg==
X-Gm-Message-State: AJIora9BnVK0O+Irc7tCsIjhQbhZYDJ5RPPCqYnzxvWZJMdiup88SeIB
 8qnTl/bdnBJA8lxCU7LYvqtIq0bdFVkXdZPZhMEy246jo1IKBHUQl359DemQs0IEJsr+zBoCaOo
 J987Kr87Vg9cczYsYzQ==
X-Received: by 2002:a05:600c:114e:b0:3a3:6cd6:1d3e with SMTP id
 z14-20020a05600c114e00b003a36cd61d3emr13506139wmz.124.1659442245063; 
 Tue, 02 Aug 2022 05:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJQvFO+ugqwFKfMs6ZLy1fhbz/TLdX67tYjwZcpluwU+3Zp5tGIRzy6kygfxkFoiGj+U8BFA==
X-Received: by 2002:a05:600c:114e:b0:3a3:6cd6:1d3e with SMTP id
 z14-20020a05600c114e00b003a36cd61d3emr13506110wmz.124.1659442244734; 
 Tue, 02 Aug 2022 05:10:44 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm17568190wmb.44.2022.08.02.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:10:44 -0700 (PDT)
Message-ID: <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
Date: Tue, 2 Aug 2022 14:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220802112447.249436-3-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Aug 2022 12:10:58 -0000

On 02/08/2022 13:24, Eugenio Pérez wrote:
> Few steps allocate new resources, and all of the allocated can be
> checked to avoid trying to free an invalid one.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 303447a68e..ac1810723c 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
>                                                    &has_cvq, errp);
>       if (queue_pairs < 0) {
> -        qemu_close(vdpa_device_fd);
> -        return queue_pairs;
> +        goto err;
>       }
>   
>       if (opts->x_svq) {
> @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           if (invalid_dev_features) {
>               error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>                          invalid_dev_features);
> -            goto err_svq;
> +            goto err;
>           }
>   
>           vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> @@ -640,7 +639,6 @@ err:
>           }
>       }
>   
> -err_svq:
>       qemu_close(vdpa_device_fd);
>   
>       return -1;

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


