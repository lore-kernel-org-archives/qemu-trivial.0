Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3A4i-0008ER-Dr
	for mharc-qemu-trivial@gnu.org; Wed, 15 Nov 2023 02:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r3A4g-0008CY-Js
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 02:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r3A4e-0000GE-MU
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 02:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700032351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KtiVRAyjBbYE/OAjNbxz25haFD/kXG0gA5r5hENmdcc=;
 b=FwVg3Vi4UFj6C5R9GSqVxWrpNA57JmR38/fifJr4w590BiTucl959kT9RY1jfkLkTQHtLs
 x5zdBPtAor7qun5G76jTVOzp3KX67hveW90k9vaa/Eqvkzd1UDkC1B7U1BpGHerAwXdN6C
 b055GorGfjJpn2uHQQcQAVbMeXtaqOI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-Cv1BI6VANJiPnLaytVq2iw-1; Wed, 15 Nov 2023 02:12:30 -0500
X-MC-Unique: Cv1BI6VANJiPnLaytVq2iw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9e31708ad72so443302066b.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 23:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700032349; x=1700637149;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtiVRAyjBbYE/OAjNbxz25haFD/kXG0gA5r5hENmdcc=;
 b=OEPWd9N2HpZlGKcbTVueKanvJ1V/MbizlBTNhwElZc9ChVTAcQGcSyTySaDFqlw+9R
 Aq1Ghw8+Xy4E0aDE8WmnJBfpXTIqx0RFa7VIV+x56rJABvMQ8M5H8yo9CKIC1AHAMVMA
 gu9aMtEaNbIRtxsZjqVG9e7XgXuZoabFvioHdxirE6S13mAJ9MFNBoy8tD9V494uzlVI
 TUs2ppvQAPi6lWRkJ8NIsGY5LkyKojLVdQVsRqE5m2WSqTc9OSwgjPx/3uXO53PAxJgX
 NJp9NXjkZBWhhWrdk4KQEzwKsbyTwPsk5yHRqcSUTCwKX92Xs1+T+OwQEBQ7T7XbHwJZ
 mYXQ==
X-Gm-Message-State: AOJu0YzB0OKwDuOG3dX7MhtTVmGxBIRMGULdkwZ6YDoHRBvyhwbNr0M6
 ob+Hj/p66ZDMa/vCLXInoD24BPC7qjI4Rit6XKjcGImXjfQr1880W2Xi+JVx+XfeHtS9RKCf+Yh
 OYc/bGzUMmWi6LAFmBbRibe68cQ==
X-Received: by 2002:a17:906:e215:b0:9d3:8d1e:cf0 with SMTP id
 gf21-20020a170906e21500b009d38d1e0cf0mr7948576ejb.54.1700032349144; 
 Tue, 14 Nov 2023 23:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMBDPSgk2cDP7yfp/mZPbgFrD8ncPtKcHR9zzQlxU8VmnUA56gAokROvA9W2y9HPSX70PcOw==
X-Received: by 2002:a17:906:e215:b0:9d3:8d1e:cf0 with SMTP id
 gf21-20020a170906e21500b009d38d1e0cf0mr7948565ejb.54.1700032348939; 
 Tue, 14 Nov 2023 23:12:28 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-176-122.web.vodafone.de.
 [109.43.176.122]) by smtp.gmail.com with ESMTPSA id
 lt7-20020a170906fa8700b009a1a5a7ebacsm6554420ejb.201.2023.11.14.23.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 23:12:28 -0800 (PST)
Message-ID: <c33b464c-5fe0-4931-8cc0-dbfdc53b481f@redhat.com>
Date: Wed, 15 Nov 2023 08:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 12/21] hw/mem/memory-device.c: spelling fix:
 ontaining
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-13-mjt@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231114165834.2949011-13-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 15 Nov 2023 07:12:34 -0000

On 14/11/2023 17.58, Michael Tokarev wrote:
> Fixes: 6c1b28e9e405 "memory-device: Support empty memory devices"
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/mem/memory-device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index e0704b8dc3..a1b1af26bc 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -29,7 +29,7 @@ static bool memory_device_is_empty(const MemoryDeviceState *md)
>       /* dropping const here is fine as we don't touch the memory region */
>       mr = mdc->get_memory_region((MemoryDeviceState *)md, &local_err);
>       if (local_err) {
> -        /* Not empty, we'll report errors later when ontaining the MR again. */
> +        /* Not empty, we'll report errors later when containing the MR again. */
>           error_free(local_err);
>           return false;
>       }

Reviewed-by: Thomas Huth <thuth@redhat.com>


