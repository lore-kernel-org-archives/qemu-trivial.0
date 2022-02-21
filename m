Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nM0Be-0005aj-VW
	for mharc-qemu-trivial@gnu.org; Sun, 20 Feb 2022 23:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0Bd-0005aT-MP
 for qemu-trivial@nongnu.org; Sun, 20 Feb 2022 23:20:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM0Ba-0001fG-Pq
 for qemu-trivial@nongnu.org; Sun, 20 Feb 2022 23:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645417230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhqEIEz2XIvk8vwMBcmNZb4Othdipas2rOp1o6ZvGJ0=;
 b=ZQGx5M2svpFEYcmgSKDMgrUnCIi8TybqF35X06rROrIk0aQ8zTZqWDKgyJqaQxYnQVr7Yh
 DWRcR+rfYH6gq7vXMU8E5Gsz7ZMEQH1Dcc55vW49DCb8XsZv+GOETA0L1SOcA/Sqo47WC9
 jCGS95+AXiyv71PIfgj0kihw53NcEAM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-O16B0Xs4MMuSCpL28pdW5w-1; Sun, 20 Feb 2022 23:20:26 -0500
X-MC-Unique: O16B0Xs4MMuSCpL28pdW5w-1
Received: by mail-pj1-f69.google.com with SMTP id
 g12-20020a17090a714c00b001bc25476de3so1911340pjs.6
 for <qemu-trivial@nongnu.org>; Sun, 20 Feb 2022 20:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhqEIEz2XIvk8vwMBcmNZb4Othdipas2rOp1o6ZvGJ0=;
 b=a8JW6aqIZ9IFzZxVL6PP3bAO0zIFrx1/WxJ+sYcTGkUirWjQfKPfrMB611aFBKRshD
 ea5al56VBSQ6vxM78gLXJD1oc7dvgGaTzmse79p7l9R7rN22getu+5qjm+yT2VkYg+7x
 gVF8X9f9nbSFskuBBkk2piIZmCJUKr+IwllfJE1I2H5IkEjyfcs8Ogp+CIRQJb/Z6Ihl
 KXKdab4CzVtFOVDfYpXZwk+Bida+Ae4WgFECmyRQ0JtyUF37sv+pByysHuLpheHWnH1X
 wkY9FugyIcazJlIRjK727zL+c7sJxrrB8i95rUul6rcGV3Wyb58OmqAt+ekP7w1XlT5F
 pMxg==
X-Gm-Message-State: AOAM533nrSuCJhlnalfd5xbku8a7FHa15+iNuyIGPD8udPWUXcV3E9dz
 cftXYasql1U2zhRs0e2fzaqIByUVsIcA1tZhf2ApTcr1EnUaCvyMS3NJNQQ6yN/YBm7eUeSsqD0
 fb48mEMHKGCcCtzr6sw==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr14817199pgu.62.1645417225430; 
 Sun, 20 Feb 2022 20:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrOG8/ClncQ89zMydNtI6HICTjj2h12ZqbvznAqhL9lnoQU9ynfj4O2ne8n6z17oPZAdqCrg==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr14817183pgu.62.1645417225081; 
 Sun, 20 Feb 2022 20:20:25 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t1sm10856568pfj.115.2022.02.20.20.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 20:20:24 -0800 (PST)
Message-ID: <14062596-e655-1fe3-be46-304d88388ed3@redhat.com>
Date: Mon, 21 Feb 2022 12:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] virtio-net: Unlimit tx queue size if peer is vdpa
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
References: <20220217175029.2517071-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220217175029.2517071-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 21 Feb 2022 04:20:34 -0000


在 2022/2/18 上午1:50, Eugenio Pérez 写道:
> The code used to limit the maximum size of tx queue for others backends
> than vhost_user since the introduction of configurable tx queue size in
> 9b02e1618cf2 ("virtio-net: enable configurable tx queue size").
>
> As vhost_user, vhost_vdpa devices should deal with memory region
> crosses already, so let's use the full tx size.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 49cd13314a..b1769bfee0 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -629,17 +629,20 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
>       NetClientState *peer = n->nic_conf.peers.ncs[0];
>   
>       /*
> -     * Backends other than vhost-user don't support max queue size.
> +     * Backends other than vhost-user or vhost-vdpa don't support max queue
> +     * size.
>        */
>       if (!peer) {
>           return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
>       }
>   
> -    if (peer->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
> +    switch(peer->info->type) {
> +    case NET_CLIENT_DRIVER_VHOST_USER:
> +    case NET_CLIENT_DRIVER_VHOST_VDPA:
> +        return VIRTQUEUE_MAX_SIZE;
> +    default:
>           return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> -    }
> -
> -    return VIRTQUEUE_MAX_SIZE;
> +    };
>   }
>   
>   static int peer_attach(VirtIONet *n, int index)


