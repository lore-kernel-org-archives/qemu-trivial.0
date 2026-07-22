Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A23C44532
	for <qemu-trivial@archiver.kernel.org>; Wed, 22 Jul 2026 10:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmUeY-0002mY-GA; Wed, 22 Jul 2026 06:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmUeX-0002kx-GO
 for qemu-trivial@nongnu.org; Wed, 22 Jul 2026 06:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmUeU-0001kw-RV
 for qemu-trivial@nongnu.org; Wed, 22 Jul 2026 06:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784717893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ys/RxOdeYZj+JqS3E0bNSb8lxGtyzn4JdO0ML2/d+9w=;
 b=WzYEbc95MH9iTb5Pq6H6AI9rUTq5jAeGgIwmIw80zbIZCKWyv+VVDoBqoitvM8rP+FY6xY
 jTEZI0Wzx5mEyC8UFlY1g8FSoLqjnUb6he/Mfxidh3tC4qyN+Vn8tJVY81caueWcxpghLN
 kf/LpLV7c3nzVA6r3eimnV+Sd4DcYNI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-kTAJVOQmMAGIJJDDLIFC-w-1; Wed, 22 Jul 2026 06:58:10 -0400
X-MC-Unique: kTAJVOQmMAGIJJDDLIFC-w-1
X-Mimecast-MFC-AGG-ID: kTAJVOQmMAGIJJDDLIFC-w_1784717889
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-472a798fc7cso7488250f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 22 Jul 2026 03:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784717889; x=1785322689;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ys/RxOdeYZj+JqS3E0bNSb8lxGtyzn4JdO0ML2/d+9w=;
 b=pA7pbDqPbhfHGIOYX8Y9fc11JNtYSHOUd8nQ5xo9/CzlzVtPgYpdYtHa7EnhhZQzle
 A0HizHRC3ZsBMUX0jQiCSB0LP8o0+v9nveiAq7aVffFXLzkC0lcn9N6//OHH7um9ro8b
 9TMj9ts3fuezjCd205UkO4NeJVyd6bmSd0KrUNlVZFYX4kM3SJp8p4EyhGnw3xXw8hTq
 kpGIPdQEyremFyGuNHxHCkodtdKYCq+qSKIxRgUPXoyCKh1PTsR076WqlQhTGzRDRMyM
 jB6166K3DBy3fWuJ1cReFk74MD7781twpSqrnXV8jqlcnTaJ9XxaePMZFKUGcFZBjYBT
 WrAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUM5GbDXrPuTigcaLfDQQf05ynsV+/UiZdni67AqNk7Z+wv1jJO+LnhOc9qabP783GNVT8j+IeO1TXYXE=@nongnu.org
X-Gm-Message-State: AOJu0YxHQzGy4ncFUFOp7A/q+UwUfTFiJNzRTGRbXNN2iV5R8PhlVJzH
 RL3y24S++1sRxr6UM7hqQ/CvvAyFseWJUa3/yki3TJBfMc0DGPrW49ZCXFN49+DHCSW0Tp5mRKd
 mVSkmYJIhAMGaBAHHJzi28aNAtF6K7Jj7dSB6I5cQ5s6PqTXZ2WxZ81kI6WI=
X-Gm-Gg: AR+sD10sEYLcuKjp7hUObW+aQv5kpTnMKe3nFcnD7qV8i/+P964MlTG6CtiM1rduMPK
 dD6cKvNZ3iJZy1knb0+hP2IDF0v/x+emz1ju+VTyKlS8531h6FMguiZ3l3Q++ft8t+eUWfthA7M
 KrEj6C2zT446KfhfXY0RCf+uYX055Nw4sgVL8c/dRHwmSWHGQsY17yqnWUrN4tutmoUTsWRyY/y
 vq5Gv0Yi24VsnLgMS2i9Lu4GxZx939mPsuZShg8HieInbDrt8UVZO/l2gLJMKYtCOXbbdUpJrTP
 t0WpBNL0giYzPrJqHQo54UNp5QpTVxtXTTKC8GhwFiq14qpqgqueTIC9mPqGWEAgqG73m4wZ7g=
 =
X-Received: by 2002:a05:6000:60e:b0:475:f0f0:9ec8 with SMTP id
 ffacd0b85a97d-47f6233b609mr25972228f8f.51.1784717889269; 
 Wed, 22 Jul 2026 03:58:09 -0700 (PDT)
X-Received: by 2002:a05:6000:60e:b0:475:f0f0:9ec8 with SMTP id
 ffacd0b85a97d-47f6233b609mr25972199f8f.51.1784717888854; 
 Wed, 22 Jul 2026 03:58:08 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.188])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a60asm5208666f8f.3.2026.07.22.03.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 03:58:08 -0700 (PDT)
Message-ID: <0d365d35-1890-4d99-9840-055411754e35@redhat.com>
Date: Wed, 22 Jul 2026 12:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/ide: replace assert with proper error handling
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, qemu-block@nongnu.org, qemu-stable@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260722104836.351387-1-f.ebner@proxmox.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260722104836.351387-1-f.ebner@proxmox.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qofR8URjJ3UrrxOoOD7fU-qVGL9GBwsG9n21mXddj_U_1784717889
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 22/07/2026 12.41, Fiona Ebner wrote:
> From: Artem Nasonov <anasonov@astralinux.ru>
> 
> In ide_dma_cb(), the call to prepare_buf() might return a negative
> result and cause an assertion failure. This was found during fuzzing
> and can be triggered with some qtest commands. Replace the assert with
> proper error handling in case the result is negative, but keep the
> assert for failing to respect the limit upon success. If that happens,
> it is an implementation error.
> 
> Found by Linux Verification Center (linuxtesting.org) with libFuzzer.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: ed78352a59 ("ide: Fix incorrect handling of some PRDTs in ide_dma_cb()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/2777
> Signed-off-by: Artem Nasonov <anasonov@astralinux.ru>
> Link: https://lore.kernel.org/qemu-devel/20250116111600.2570490-1-anasonov@astralinux.ru
> [FE: improve commit message
>       keep assert for failing to respect the limit]
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> Changes in v2:
> * Update the code comment accordingly.
> * Keep the assert() when the limit is not respected upon success.
> 
>   hw/ide/core.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index f78b00220b..4c1ee19d8e 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -921,8 +921,12 @@ static void ide_dma_cb(void *opaque, int ret)
>       s->io_buffer_index = 0;
>       s->io_buffer_size = n * 512;
>       prep_size = s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size);
> -    /* prepare_buf() must succeed and respect the limit */
> -    assert(prep_size >= 0 && prep_size <= n * 512);
> +    if (prep_size < 0) {
> +        ide_dma_error(s);
> +        return;
> +    }
> +    /* If prepare_buf() succeeds, it must respect the limit. */
> +    assert(prep_size <= n * 512);
>   
>       /*
>        * Now prep_size stores the number of bytes in the sglist, and

Thanks for the update!

Reviewed-by: Thomas Huth <thuth@redhat.com>


