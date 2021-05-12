Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgf3I-0002uj-RG
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 22:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3E-0002tY-51
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3C-0005Qe-1v
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7dgJ2VBvYgXlW8nrgz1xqOSk080AmTGIBqPcItbHJ8=;
 b=SFWdZyvSgl47wG4Ei0yYdiRMxoea0SmUuuK+w6Zv8m9XFTcn5xz09fycNFe0DoJKFI7V4s
 E0C8wDbTHpNx8q3o0ECWakmTMBjEEbpz+ogLk9wwa7S9cN1TiKw5q3ArKS1/3UDw7GmHwG
 WjMylHO7eOtqEonKfhhgduWdH9E7oo0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-cX9_v0p6N6CPZCS5AGS5RA-1; Tue, 11 May 2021 22:56:40 -0400
X-MC-Unique: cX9_v0p6N6CPZCS5AGS5RA-1
Received: by mail-pj1-f69.google.com with SMTP id
 lc4-20020a17090b1584b029015c16096342so2753874pjb.5
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 19:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=H7dgJ2VBvYgXlW8nrgz1xqOSk080AmTGIBqPcItbHJ8=;
 b=NhEbR+4zXy2Nujp1IGMljf1CkaXWCPHPRRFulIfeKwlcLPJkYzUYbB1ZJC0bZWkcYo
 thKeRqLK+sbaXsY0uMdsoQ0rnwoiymXHsII0AWPFdLm+FS7Ls2DUHu7d65A9qm62g7GU
 sz+LzqVybFV8nE7nFcXvSs4LHxAVzyLoHI4uQ8QTxKY7q9F9I2QdDMe8Bdxktlgmhnki
 ikRHW3Ob1tlWF7IEp37EcviyFayaQ7TDISqdQazEGSPcr5c6I61vM1/WAFX/oRuD4V9r
 e1hrGGWIMIlXMtaJkqfbX+7yd/s8dGzkpEDj8gjCHjZ8znKB0cBNao7CHF21LBe6VIiz
 UvJQ==
X-Gm-Message-State: AOAM533sM3EwiyxuHvgOsItHLalZN88tTJcCwcGKI+FggI3M0/jBGJHA
 Na/MoHJ9OwlubNurWePshFy9CleHOz/5HvxQsSrircQBtyrd7Kx3Pu1cC5PkZnSL5z6PKAppdAj
 MLlWpTmCfCWvHzmPeMk9YN27p4UnqK1ZWrNRirrcdDCELa1TevERQGM35tVPSzdumD8N0Gw==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr5939464pjb.92.1620788198620; 
 Tue, 11 May 2021 19:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSQ2rjJhej6j6lVXtiuyX9Ti34Cim6flcy/ZudBCjb5vmVDZAeSFIqKEFIM6drUWAoT7BAVQ==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr5939429pjb.92.1620788198246; 
 Tue, 11 May 2021 19:56:38 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m2sm4803460pgu.85.2021.05.11.19.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:56:37 -0700 (PDT)
Subject: Re: [PATCH 2/3] virtio-blk: Constify VirtIOFeature feature_sizes[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
 <20210511104157.2880306-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ceeaa52d-4a76-4ce9-d355-61a909040ed8@redhat.com>
Date: Wed, 12 May 2021 10:56:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 12 May 2021 02:56:44 -0000


在 2021/5/11 下午6:41, Philippe Mathieu-Daudé 写道:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/virtio-blk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index d28979efb8d..f139cd7cc9c 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -40,7 +40,7 @@
>    * Starting from the discard feature, we can use this array to properly
>    * set the config size depending on the features enabled.
>    */
> -static VirtIOFeature feature_sizes[] = {
> +static const VirtIOFeature feature_sizes[] = {
>       {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
>        .end = endof(struct virtio_blk_config, discard_sector_alignment)},
>       {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,


Acked-by: Jason Wang <jasowang@redhat.com>



