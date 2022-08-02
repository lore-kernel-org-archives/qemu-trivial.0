Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIqgD-0001oz-5Z
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2022 08:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqgA-0001mT-Bg
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqg3-0005b7-32
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659442028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUsTOLHt9XVH7jinwJei5WXXxCYMQBLV+QrxsUjQLb4=;
 b=gH9I5t7e+clSFVT+sxulNb4tu3T9uDjw0tQcirUse61dgR83m1ImDdOCmt6tPtBTELulIQ
 YL3TXOSYkTn5aTOXhrtmmxvg/sAhzfyBoY2HZZNQIDOdKL9fdDhFpsnHgSXTx94iXPZ4fP
 KNsTgvgfrDif38c9IrSMlU8+Yuuh7T4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-GQHBYm9sOIy9SPiIvqligQ-1; Tue, 02 Aug 2022 08:07:07 -0400
X-MC-Unique: GQHBYm9sOIy9SPiIvqligQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m4-20020a7bce04000000b003a386063752so1912440wmc.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Aug 2022 05:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MUsTOLHt9XVH7jinwJei5WXXxCYMQBLV+QrxsUjQLb4=;
 b=iVmel+RQtxwpp9caHnhyKCBRZE54SvWUxMBwYrTpVY58gz3oxRfviF5l+ReLXR/TvN
 OT0IzySkg/yq+4vHIhd1Dy/hap1nbuj/srrQrKaXE/7GeItqb2r2nmZyyS8Ql0czkOlY
 355WDTzt+PgmgNnGWbNhfuWbWLfpLe/gNER1GyFhWoLQQKhyiaBCcLO0bkYq011xe6Yd
 9wki26LG/dPrrfWjyxJ5Ze5U7bc6Hy8wW0jLX8qYkkjPVc6kxaE0F2q+/4ZiEtAFtc2q
 tKWcvevwRN5qEPCMOwbqkzwah2ZsF9ov3XHMWxsw39JOtSe34Dx10TCQXi5HdTq8FYmZ
 yxPA==
X-Gm-Message-State: ACgBeo34K/D4yLZg952CQiohIDg+/Mz6iZVE4kMb2deKdUPnrxcyfLyQ
 k15zU1ygTkLy6JCkL8iZUWqnLuKeDBLZrNYnnup+DqxuVMd6Ho9OgK2jP95GGtlgb7/xME0tdS8
 CpfMqQp8uKt6J2FgnjQ==
X-Received: by 2002:a05:6000:888:b0:21f:bc6:cc12 with SMTP id
 ca8-20020a056000088800b0021f0bc6cc12mr13134670wrb.90.1659442026526; 
 Tue, 02 Aug 2022 05:07:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7T/RRX4AklHsZBxutnKVEU9bIUQgsvjAHyujqP8Z4i4eN+77n2FwZ1nJd+65odectXa/iYfA==
X-Received: by 2002:a05:6000:888:b0:21f:bc6:cc12 with SMTP id
 ca8-20020a056000088800b0021f0bc6cc12mr13134636wrb.90.1659442026204; 
 Tue, 02 Aug 2022 05:07:06 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm17558520wmb.44.2022.08.02.05.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:07:05 -0700 (PDT)
Message-ID: <aa7f3a8c-0f1d-8652-b574-48f824d2bd37@redhat.com>
Date: Tue, 2 Aug 2022 14:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] vdpa: Fix file descriptor leak on get features error
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-2-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220802112447.249436-2-eperezma@redhat.com>
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
X-List-Received-Date: Tue, 02 Aug 2022 12:07:19 -0000

On 02/08/2022 13:24, Eugenio Pérez wrote:
> File descriptor vdpa_device_fd is not free in the case of returning
> error from vhost_vdpa_get_features. Fixing it by making all errors go to
> the same error path.
> 
> Resolves: Coverity CID 1490785
> Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6abad276a6..303447a68e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       g_autoptr(VhostIOVATree) iova_tree = NULL;
>       NetClientState *nc;
> -    int queue_pairs, r, i, has_cvq = 0;
> +    int queue_pairs, r, i = 0, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   
>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>       if (unlikely(r < 0)) {
> -        return r;
> +        goto err;
>       }
>   
>       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

I can take this one via the trivial branch.

Thanks,
Laurent


