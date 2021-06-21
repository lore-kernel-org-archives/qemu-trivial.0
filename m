Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lvGp5-0000q9-09
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jun 2021 06:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGp1-0000kE-Fx
 for qemu-trivial@nongnu.org; Mon, 21 Jun 2021 06:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGoz-0002uZ-Vh
 for qemu-trivial@nongnu.org; Mon, 21 Jun 2021 06:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAMNCMMhbrJ2T96gQmYlohqSXYGyVVmUM7cG9LRhDNk=;
 b=K+qQL2ctS9P6Ka8zpKNfm2BeI+g8CsGVK416o+taRk2EAAcA+06rLwAmB0pQmV94LrnCQh
 MjfXIPBT4kAzLDknQV9ELOwsFhh/QuK7Af1A+ioQi5BkdvBUxRWg+NxIM/SuHA9XIBADeA
 GOwDjRuS7nyCnPWlAJ/i+hK0QyzFTq4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-HlWHJT9DM-eO3QprQf6rhg-1; Mon, 21 Jun 2021 06:06:23 -0400
X-MC-Unique: HlWHJT9DM-eO3QprQf6rhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020a5d61820000b029011a6a8149b5so7808214wru.14
 for <qemu-trivial@nongnu.org>; Mon, 21 Jun 2021 03:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XAMNCMMhbrJ2T96gQmYlohqSXYGyVVmUM7cG9LRhDNk=;
 b=mbCnyGaP50tewI22dFmbAetZfTN4PH6tsIxKeMHzDH7Y23GT0PBOxKHdOJLP+1ijue
 FgV9Tio03i2unXw0NSa+XjNvQ8uA5xthaV8jMfnfR4I+gGxgZJaJEuggyGtRWQ5ktDRB
 7eQQNfsCqSFy43lM283y5CiyIDAD5MVqDyDFUwcVVzPNMlr0tVWpdgcGGZQJ0qn2zQy3
 7yrz80z+CNiAtaMmugGlsF48oqIzf+fAnz+mY/fTZfijOuhV1r5UbKK5LIPzz33hgMKb
 WBmgOT0UM1G//H8RsT4qUGkgJrl/q7NSvwfSBqAAcpy6kmWljSHymUnOYen11DO/tB4K
 J/zA==
X-Gm-Message-State: AOAM530wqxJXxKwBQa+X0ITr1MY7oURs5X/Dmxdkvz1m0RSVFRk+DvV4
 1s1lPhVm9O/ikhxvqd9ec8SYyEZnqc/c1BTo10sfTv6EDF5xFykx44YUiKRRHX5Vi+eOD1cIgAA
 EMEsY2IIhJGOciZHavw==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr27274701wrt.281.1624269982527; 
 Mon, 21 Jun 2021 03:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiyabIv05U/g3Q/0fW8PBh8QDsGubAGcGpC4JneJiE0sza7UkLNhSmMm3Dx5Iwb/C/9zBNVQ==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr27274677wrt.281.1624269982383; 
 Mon, 21 Jun 2021 03:06:22 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l12sm17271269wro.32.2021.06.21.03.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:06:21 -0700 (PDT)
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210523094040.3516968-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3198f6b-3bce-1686-2123-e1c44479bdf9@redhat.com>
Date: Mon, 21 Jun 2021 12:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523094040.3516968-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
X-List-Received-Date: Mon, 21 Jun 2021 10:06:27 -0000

ping?

On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: only one space before end of comment (mst)
> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..130e3568409 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;
> 


