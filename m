Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95979C87FCA
	for <qemu-trivial@archiver.kernel.org>; Fri, 25 Jul 2025 06:25:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ufBrS-0002ub-JC; Fri, 25 Jul 2025 02:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ufBrK-0002p8-PJ
 for qemu-trivial@nongnu.org; Fri, 25 Jul 2025 02:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ufBrB-0007VK-9l
 for qemu-trivial@nongnu.org; Fri, 25 Jul 2025 02:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753424675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AeQ7Z5jHh0tdelWQ9L9irAjCcWPnkuMCwU1yNoGwdXg=;
 b=aTBr/YwU0fp4/5996+7Wh5H9XIWWUBhI9FCyqvum+Z4qStNCKd3eC12OE66xEIVn9ed6A6
 BPgEh9NnBN6QfaNNou7ywX1nBOIjGDjF6QX36Vceor3hOZRVk4QyTqXmK1iAuFb3sFwmQ6
 1bITyAsHHxZ3TPwAXJ2F+gfyW0fLuP8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-9dLcdvNnMEySleMZ1Vl-UA-1; Fri, 25 Jul 2025 02:24:33 -0400
X-MC-Unique: 9dLcdvNnMEySleMZ1Vl-UA-1
X-Mimecast-MFC-AGG-ID: 9dLcdvNnMEySleMZ1Vl-UA_1753424672
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45626532e27so9756265e9.1
 for <qemu-trivial@nongnu.org>; Thu, 24 Jul 2025 23:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753424672; x=1754029472;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeQ7Z5jHh0tdelWQ9L9irAjCcWPnkuMCwU1yNoGwdXg=;
 b=ptzQf3Kjf04HSlR17bC+V9nW59kdvtrWWTA+gpejmGg6+hV9XXKlWrZA0bnnLAnqlR
 XxhlGSEKSnmlG+akk2JnkAfX6+kO3U5car3ot/IzMyxBzWK91gRjrec7SGX77QlJ1Seq
 jaZeRcTmdFdCBeGOtDSYuUuuEwla1Q8lrr1TyOIeYyireFRHWKF8oTsPTn8EYXMNY2Y3
 8I2lwykA5xcZpk5S/bsfEFkHeoSw3KpYi+9BZXYUBR4Z5vPQV1t8ejXaf5y03deQqsnx
 AOc+GwBobyk/gTbTLovXZ/ShDbEriRfZRdQAUm4jkysFY0J3IdpnR+GSeH4mXP+bnXpr
 yUBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmGzreND2idlzaqIVBcfLVbAE3NpHiQX+4a6jCJN12kNPi4Lghu5ArFl4Tn5QOxkCTsDmIYKf+4jBUOEw=@nongnu.org
X-Gm-Message-State: AOJu0YxPljPDNEjkNvX44AlTAq2O+U92dBw8V0t2qFaUrHOZHhd+cRlG
 zfsVcgAcE9GQSsRcp42KU6EMRc0yp1i85i0J79RqGkdo4yqBn7f6OTO/H5dNro47t3HEgD++Xdr
 +JVCW9uDwQ0cKd5mn4/yXs9tuBcZ7oBs7GU6YhkeRWScsloBs63ECCzGXIYE=
X-Gm-Gg: ASbGncv6DX/UkW98YrmNJd8q08FY/icxgjFSxGl8R0fe4gYuPcCgUKH+awINVihAe5F
 HN4lgl9aHTiTbaPeA5zlS/3AixM7ulPVk8QJcC6g89nnnz9Whmn0fEA7P13R5A7c90tVHQGAzRd
 96IB8IzTHN/CshIsnJ5VXqkjCvcPWls1kWulDbIVCsHI0fVz8lmzQeTWxSYRXdBMUrjsd4sB0Bz
 F3a6sJvJHxmsO+74xKkSWQpVwkFvBo2pA2at8M5sQj5v5J0wxG7Z28L/LQshDZpgjrZD1yTppfZ
 rdRJ8HdQa7tunnO6ME9m2tq3D1VSOfgduCenfiiUpWDbSaRfkVsBVjxp5BWfhKVk6YiAyki0P15
 OR10=
X-Received: by 2002:a05:600c:4ed1:b0:453:1058:f8c1 with SMTP id
 5b1f17b1804b1-45876304c42mr5110935e9.3.1753424671917; 
 Thu, 24 Jul 2025 23:24:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC1Sbgn4lbb/WPvRg0+4drCfb7cCreuRZtunbliTntCYlbDaf48+IL8SoHo+R0UENJNsVoCg==
X-Received: by 2002:a05:600c:4ed1:b0:453:1058:f8c1 with SMTP id
 5b1f17b1804b1-45876304c42mr5110735e9.3.1753424671483; 
 Thu, 24 Jul 2025 23:24:31 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-089.pools.arcor-ip.net.
 [47.64.115.89]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532b5asm41551685e9.5.2025.07.24.23.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:24:30 -0700 (PDT)
Message-ID: <cef1f755-aaf0-4411-8e1c-2c50e3a57770@redhat.com>
Date: Fri, 25 Jul 2025 08:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/qxl-render.c: fix qxl_unpack_chunks() chunk
 size calculation
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Durrant <paul@xen.org>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20250221134856.478806-1-mjt@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250221134856.478806-1-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4t6ZpAPkkb2pWwn2oCzTRedmkxpFaJTG71_GXQXs1Sc_1753424672
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/02/2025 14.48, Michael Tokarev wrote:
> In case of multiple chunks, code in qxl_unpack_chunks() takes size of the
> wrong (next in the chain) chunk, instead of using current chunk size.
> This leads to wrong number of bytes being copied, and to crashes if next
> chunk size is larger than the current one.
> 
> Based on the code by Gao Yong.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1628
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/display/qxl-render.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index eda6d3de37..c6a9ac1da1 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -222,6 +222,7 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
>       uint32_t max_chunks = 32;
>       size_t offset = 0;
>       size_t bytes;
> +    QXLPHYSICAL next_chunk_phys = 0;
>   
>       for (;;) {
>           bytes = MIN(size - offset, chunk->data_size);
> @@ -230,7 +231,15 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
>           if (offset == size) {
>               return;
>           }
> -        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
> +        next_chunk_phys = chunk->next_chunk;
> +        /* fist time, only get the next chunk's data size */
> +        chunk = qxl_phys2virt(qxl, next_chunk_phys, group_id,
> +                              sizeof(QXLDataChunk));
> +        if (!chunk) {
> +            return;
> +        }
> +        /* second time, check data size and get data */
> +        chunk = qxl_phys2virt(qxl, next_chunk_phys, group_id,
>                                 sizeof(QXLDataChunk) + chunk->data_size);

Looks reasonable to me, and I think it's also simple enough for qemu-trivial 
(now on CC:).

Reviewed-by: Thomas Huth <thuth@redhat.com>


