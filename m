Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJYLj-0000iC-U3
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 04:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYLi-0000hF-BT
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 04:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYLg-0000zO-Ry
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 04:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615280895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrj/VOe4Melh+TADD/fVfav2ObnBwe4VywvBA66pCMM=;
 b=bNk28gVELWqfbt4fmFTKbFsP8Ae1dHEuWrUO5Tgw+uQvPIcy7zAeVrzGo3MreT9O1wJd8X
 50lxUiozJXQHaqgTj6XPIWVANWdAzxfEFMmyXYLxqN/dJvVI/PwbM9zTyNu64Ngy12W0U1
 DN1gGfv0s4rUs7Oa8tEenUwAVBBWzxo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-pfPTYRixMJOusZB68PBMGg-1; Tue, 09 Mar 2021 04:08:12 -0500
X-MC-Unique: pfPTYRixMJOusZB68PBMGg-1
Received: by mail-wr1-f72.google.com with SMTP id e29so6130522wra.12
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 01:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rrj/VOe4Melh+TADD/fVfav2ObnBwe4VywvBA66pCMM=;
 b=FSYAuh9yZixPvs3qXue0iSkvxcI6M8fRMbsGX/VbzDMXb/TDK/qSJBhQcLvGr1K+9O
 2T5MAcVEuBHTHdzGjP/aBzBuzgD4KLFrceo1+HszQ20+KFrfszYXahZc8ZEAoobZn51A
 pBQCuCGGlo6QL+3WANnBqBKpf/Gj6FL/DT4cMYmE9HT/MzU1dxZeH9WmmbRQD8ED7dDD
 M7XdaVU7AHEWJkoI2inHXgaXsaW0Mz/nXBml58EzbATVvedpFevCuG35BYaqrH9PeJYd
 dpOBeRIm1gs6pUG19fQgAs2Kq0vZ+7alu46VaHo9XAbMrDmS22s+4tav75aiwgzyYCCV
 JR1g==
X-Gm-Message-State: AOAM531KXmwubyFotWE0RriaEMLnjeIhUdgCxHJRAi3tDcufGU2LZB3c
 2lz76CQ5L/d4t8mB2aySzGTQiLrFLPJ2+CqcUPQpJHoBDlizUEjvO2VBa/BSDbZhQ+ecQQZvG3a
 e/n1vlPJrOE3hYPTFXw==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr2854090wmj.72.1615280890935; 
 Tue, 09 Mar 2021 01:08:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbTROAIX/k1KhJWkdhiKq9rw42uG11HJleWGFHMD2rYz+5E7hyTPfWmCsSXQpjGt6NNoiX1w==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr2854062wmj.72.1615280890525; 
 Tue, 09 Mar 2021 01:08:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v6sm23163637wrx.32.2021.03.09.01.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:08:09 -0800 (PST)
Subject: Re: [PATCH] virtio-gpu: Add spaces around operator
To: lijiejun <a_lijiejun@163.com>, kraxel@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c7918046-a99e-663e-355c-0b9b1c4d817c@redhat.com>
Date: Tue, 9 Mar 2021 10:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-List-Received-Date: Tue, 09 Mar 2021 09:08:18 -0000

(Cc'ing qemu-trivial@)

On 3/9/21 8:42 AM, lijiejun wrote:
> Fix code style. Operator needs spaces forend sides, and delete line space.

"forend"?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: lijiejun <a_lijiejun@163.com>
> ---
>  hw/display/virtio-gpu-3d.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
> index 9eb4890..d989648 100644
> --- a/hw/display/virtio-gpu-3d.c
> +++ b/hw/display/virtio-gpu-3d.c
> @@ -438,7 +438,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>          break;
>      case VIRTIO_GPU_CMD_RESOURCE_FLUSH:
>          virgl_cmd_resource_flush(g, cmd);
> -       break;
> +        break;
>      case VIRTIO_GPU_CMD_RESOURCE_UNREF:
>          virgl_cmd_resource_unref(g, cmd);
>          break;
> @@ -456,7 +456,6 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_CAPSET:
>          virgl_cmd_get_capset(g, cmd);
>          break;
> -
>      case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
>          virtio_gpu_get_display_info(g, cmd);
>          break;
> 


