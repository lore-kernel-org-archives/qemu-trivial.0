Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIaCT-0000G1-Kg
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2022 14:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIaCF-0000Cf-Q6
 for qemu-trivial@nongnu.org; Mon, 01 Aug 2022 14:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIaCB-0002pj-JZ
 for qemu-trivial@nongnu.org; Mon, 01 Aug 2022 14:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659378672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BD65Or1AvzGUZjSzKwwbl1NFj3kro8AaM4EBKa8OKaM=;
 b=JeTJqIs5JVudBt7fGprch03lHl4CYCKyFWHdPu9IJGBdDLZpmZL8KuzUdIctdM8PWKj7+D
 2c3Dq0fTXZfMDmTDouHr8Dmay1OApGav47I46jhG5o/N8KD7JaGBXZ21JGUOmq16cKeNZi
 LFqLH17GlYEdyLmGhbLk1W2/5/srdRE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-wdKMxllMNceHRbHgfxs7EA-1; Mon, 01 Aug 2022 14:31:11 -0400
X-MC-Unique: wdKMxllMNceHRbHgfxs7EA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso8436377wmb.4
 for <qemu-trivial@nongnu.org>; Mon, 01 Aug 2022 11:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BD65Or1AvzGUZjSzKwwbl1NFj3kro8AaM4EBKa8OKaM=;
 b=yyTv6bgT/1nLPdTs8zkkK71odwQm4jz/nE1P+xhODgHmqHeJEqns5du4LXFrBidA1u
 I+w3LIzomgnykzcHYx8NlDwt+3wC6NZllvWySZhGpmhA9S7Glzlcn5M/MGpghUO41MCZ
 As0oHTEtfOPRkA8mMVy+fnIheiL3LvN7M9neHbsMCLkC3JiscAVIqycGvRCgarVE5r/r
 cejgrDs+x0nT+Ct59co0QXbFQudwwb4gsOcbf9tQ1X1NCOVSJyeYYiLP+1SFl6JuBO90
 3JPnkTGIFZ1JM4fR4yEiWktcfjWBPWwtWwYMa0JjOPLTuWKxRjIm6aD5jpTLMKCC9Kqn
 qBMw==
X-Gm-Message-State: AJIora8tojyGDob2hP7Le5PPtItBjOMcAOi8b7jJO8Hrzt9f7BxG/nzh
 hjJpHRwvKBxdJqb0Z187aCAqNJvVd02zO+4SObDuqd1EmiBLy8fI9/5NAW9ICQyP8Zassb8nbaz
 NqRB38MwTItRH8dvZeQ==
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id
 o15-20020a05600c510f00b003a3254cb081mr12332244wms.65.1659378670421; 
 Mon, 01 Aug 2022 11:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEfUQCsJGWe2LdnFiSHPCB1YXl+YvKGaEUjki96umfIa1nfvftuYADAoR1p6LcxxbGFUIjVQ==
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id
 o15-20020a05600c510f00b003a3254cb081mr12332234wms.65.1659378670155; 
 Mon, 01 Aug 2022 11:31:10 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a2fb1224d9sm16149603wmq.19.2022.08.01.11.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:31:09 -0700 (PDT)
Message-ID: <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
Date: Mon, 1 Aug 2022 20:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vdpa: Fix file descriptor leak on get features error
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20220801144714.181644-1-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220801144714.181644-1-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 01 Aug 2022 18:31:24 -0000

On 01/08/2022 16:47, Eugenio Pérez wrote:
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

Why don't you use "goto err_svq"?

Thanks,
Laurent


