Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lid28-0000YJ-VL
	for mharc-qemu-trivial@gnu.org; Mon, 17 May 2021 09:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lid27-0000Wq-VY
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 09:11:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lid26-0006qT-AY
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 09:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621257101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KZDBDdaTBZCZ4OZbD2Q67Qucxj3mSvEfsMAq9+a7VY=;
 b=jKkswDW9SY7SXdMxzS7RO8x1+5p4a2zL97+KJwSVJh2FyDv0sW2TChrI+XmYYJoi4/0mSb
 rRsIhOBFTiqdyTMO2ecbRly5WxE1jZ8CewmaKF4Z+eM3jolpnDtqTzPk18NXyxfPdy1ZwX
 xBvzTPHkBOZljyBvwLc7M+ICZxfJ4qg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-V5hSvXKTNAmvaiI7LHfJFw-1; Mon, 17 May 2021 09:11:40 -0400
X-MC-Unique: V5hSvXKTNAmvaiI7LHfJFw-1
Received: by mail-ej1-f69.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so831304eje.12
 for <qemu-trivial@nongnu.org>; Mon, 17 May 2021 06:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KZDBDdaTBZCZ4OZbD2Q67Qucxj3mSvEfsMAq9+a7VY=;
 b=Gj1J8+ISfoQUs0OaQv5NykjdT5U27S+3hOqH2vUdYeVGdEVtmVjrLEynXZ+MKgzKZm
 rViqMBOPufeT/7zzmBV3VxPVxnaz2p2ml4ZZxWyzDt7VBBPe3ZAOcJfviCj5YWRA8GPY
 b8X7LXci31qmvCKaUOu1dbH+qcDIlNzikwwzLIwIFSuYZy5UZcrTL834MbU9N6OoKlur
 uEAzdRdQiV9Viwn1bkL7UDcNBPyKWIMFB+IwDkOBkkziHgxiwvcxUPVPbQaeFLjGL3IY
 zgtauRE1WfdM+IP/DSreUeB0ZWwOusKiWWHlVxjGC9HHdhfWucCdf3kKKbGXTk9YzvcT
 IYBA==
X-Gm-Message-State: AOAM532cY4cXaMTywEww638P4TK2Ptz47cyqdUjZR0wfxTlOURQNAufG
 xRGQDxMBdJGV1oXWgtYi0ixWXUWPRXqH91oXmnDScYHHqhqM/TSUV8OFxJ6mn1JyirFUeMmWyE1
 gJPnidnnmPtjkCOIVMjnnkv1KuKy/Jp4Lyq2tnHuu5hB41WYDJyQVOIvo/XYlvw1Pq5c=
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr29071508ejf.450.1621257098334; 
 Mon, 17 May 2021 06:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ+wMDUpX4maduDT13SMy/DazKZf2ELdt8RLuqI3cMpJaxAYi7L94sE1Hx7oQPNzq0Ll3Lbw==
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr29071488ejf.450.1621257098171; 
 Mon, 17 May 2021 06:11:38 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d17sm1429510ejp.90.2021.05.17.06.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:11:37 -0700 (PDT)
Subject: Re: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com, jasowang@redhat.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210517123246.999-1-xieyongji@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d00aed97-cc58-0c8a-dc7d-9ae8945c3af4@redhat.com>
Date: Mon, 17 May 2021 15:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517123246.999-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 May 2021 13:11:44 -0000

Cc'ing qemu-trivial@

On 5/17/21 2:32 PM, Xie Yongji wrote:
> The symbol address_space_memory are already declared in
> include/exec/address-spaces.h. So let's add this header file
> and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 1 +
>  include/hw/virtio/vhost-vdpa.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8f2fb9f10b2a..ee51863d280b 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -18,6 +18,7 @@
>  #include "hw/virtio/vhost-backend.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "exec/address-spaces.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "trace.h"
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 28ca65018ed7..ae9ee7adb2d0 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
>      struct vhost_dev *dev;
>  } VhostVDPA;
>  
> -extern AddressSpace address_space_memory;
>  #endif
> 


