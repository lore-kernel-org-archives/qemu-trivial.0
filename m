Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kK1kl-0005v6-UN
	for mharc-qemu-trivial@gnu.org; Sun, 20 Sep 2020 11:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kK1kk-0005uV-FG
 for qemu-trivial@nongnu.org; Sun, 20 Sep 2020 11:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kK1kh-0005Zm-L4
 for qemu-trivial@nongnu.org; Sun, 20 Sep 2020 11:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600617585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yxRreecpExonCtRIqnjC33TEQ8q5htv8TV35rQdcdAY=;
 b=OqvjlNecDcMLYoE/2YyfSnEknZ+Eh2nnS78xL6hqw3DhH5l4avjB9y7AMjvwD0cXoQR1h+
 EbsFB/tHzoIOwKYEij4Y+Q44MWXFfRPwuqzsg9YTu4kxSXYyu9+7dAo/IvnOdz54MWXcUy
 f7D9DL4keGxIEmorAANR+2m4b4lNAmY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-K5ZL_zsrOGm4Ib3JM2j8ow-1; Sun, 20 Sep 2020 11:59:43 -0400
X-MC-Unique: K5ZL_zsrOGm4Ib3JM2j8ow-1
Received: by mail-wr1-f71.google.com with SMTP id l15so4714592wro.10
 for <qemu-trivial@nongnu.org>; Sun, 20 Sep 2020 08:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yxRreecpExonCtRIqnjC33TEQ8q5htv8TV35rQdcdAY=;
 b=X+LDfztILWZpEYsez5MM+KRDh2mwNR9AVSwJa/hXuWB3oGFWh3A9U+MgrieBt/feJh
 SztJFLES0zJnhoCklNCIUc5q4lyFWcp3w5HA8i5g1MiyrpoHNqhGwQuEuccvZdy9F6d3
 ZaE9gpPENw+94RMrqSz57jTpq/6tggTIb5tyW5seifICh0nL+igJGcoJiCu6FAKL/+dw
 pnQhPr06gAJk6n+4vlzEbQjRvQE+fsTcHv7Qdsi5ut5K1HagPPPhCW69yT/FzNknr1Qx
 Q/xHrNF85vdxdoUQ26CbQHFQ3JvFe66a5fMQ2OQOybXGRrcsRKKclOBh1Kd8cWZixjAh
 9O4A==
X-Gm-Message-State: AOAM531k7kH1kMMWmmwVpMW8GS/x83zm0Wmc3Okb3VvGO8NsiN2Auf/A
 tZ340xSWrW6eOeiBtMQxhsbPnQbjjOazrE3l5zGd5PhHEU0sDKtz8qTsO0jZJvCL6OAXxiTkzUM
 pG/W9zovZXzFJE3DUXg==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr25620127wmf.75.1600617582448; 
 Sun, 20 Sep 2020 08:59:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb2KVTvgrUWjDksS0inAfymz6Nu6vpbrI7uyN0vHw+X8oD7ramZ5+wY91Pb77YIoeBH6/ekQ==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr25620114wmf.75.1600617582263; 
 Sun, 20 Sep 2020 08:59:42 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q186sm15887856wma.45.2020.09.20.08.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 08:59:41 -0700 (PDT)
Subject: Re: [PATCH] vhost-vdpa: remove useless variable
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200920152024.860172-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8793d489-3961-f53a-df69-21a7eda85f22@redhat.com>
Date: Sun, 20 Sep 2020 17:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200920152024.860172-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 11:14:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 20 Sep 2020 15:59:50 -0000

Cc'ing qemu-trivial@

On 9/20/20 5:20 PM, Laurent Vivier wrote:
> in vhost_vdpa_listener_region_del(), try_unmap is always true and so,
> vhost_vdpa_dma_unmap() is always called. We can remove the variable
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4580f3efd8a2..c6cae6a6cabf 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -153,7 +153,6 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>      hwaddr iova;
>      Int128 llend, llsize;
>      int ret;
> -    bool try_unmap = true;
>  
>      if (vhost_vdpa_listener_skipped_section(section)) {
>          return;
> @@ -176,11 +175,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>  
>      llsize = int128_sub(llend, int128_make64(iova));
>  
> -    if (try_unmap) {
> -        ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> -        if (ret) {
> -            error_report("vhost_vdpa dma unmap error!");
> -        }
> +    ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> +    if (ret) {
> +        error_report("vhost_vdpa dma unmap error!");
>      }
>  
>      memory_region_unref(section->mr);
> 


