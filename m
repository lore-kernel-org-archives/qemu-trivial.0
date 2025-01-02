Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tTFAI-0001tl-EP
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2025 01:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTFAH-0001tY-0S
 for qemu-trivial@nongnu.org; Thu, 02 Jan 2025 01:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTFAF-0007Ld-Ad
 for qemu-trivial@nongnu.org; Thu, 02 Jan 2025 01:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735801116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pmTGTzE3ce42yoMuXJXv8TOh6qO7eBO9hHNMIsHDKL4=;
 b=Wg7Z2iGBbJDIar5foniN+4MYSqEcaw91ldimoGsuaivSPIZfL4ygRK/jkm89ohUIQ2fSpY
 L491qbaxgZngBBY+itDyWsxcBE9qzodAM0Q4e0Go7fqKn/0lhTal3sjBJDDTsc4vd1nfA8
 tbWxoP9U6lDGOwMqYlu5sHgzXftu9Ag=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-1o_8W_P6Mmy2yoHl8-gOYA-1; Thu, 02 Jan 2025 01:58:35 -0500
X-MC-Unique: 1o_8W_P6Mmy2yoHl8-gOYA-1
X-Mimecast-MFC-AGG-ID: 1o_8W_P6Mmy2yoHl8-gOYA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3860bc1d4f1so6096209f8f.2
 for <qemu-trivial@nongnu.org>; Wed, 01 Jan 2025 22:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735801114; x=1736405914;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmTGTzE3ce42yoMuXJXv8TOh6qO7eBO9hHNMIsHDKL4=;
 b=GxoHWmECJR+hNweR85U+HADXyf3bVxDB8+Z0GqlgovovnHziIyPOrFW4/JwHiwVBTU
 hSmQBrBYDepHrYVJCvYLJOVnyG5f5oXkVFCPg17W/zrKeskVW03ENFfccd+/AZrpQItE
 LHY/nUarswOTY6kyaMEfnFR+k95xz2PMLtusfLxMiJbYw1vIFqrvzubX1TNEUwR25/Tu
 KzmZmabaa+JTOf+qaH4Y7BwwhXF9eweyAvht5v8Q3j5J2msOJEC7THJC2dhIhVZ/iZeA
 NhDl/kgDanQ9DP90fv/EMA0lnyR6RUaTn1a7WkqLM4JYbFTf3QhsKMijHL+MwxB1rq/9
 XzHA==
X-Gm-Message-State: AOJu0YwEQXS9jot4YilMcaoWm/xoXRWNuieaqNPH2NsXk3TBHcjI7sVR
 CtKgJgqAkdzBkYazqd7QwDzzmZUarwMmUZ0wwsma3ilx1lnW5uoyHTz+AUMKGQKk71yQfuA98ON
 DYyj6gybO7evl3MNxGtNynZv9hED8bgmfYHbThrOAlKtqRLKFRg9liHc=
X-Gm-Gg: ASbGnctdHyYiYPh/RP/28v6dHxK+418Dn9Ru8VKY6tJSSxW2y/BWOJGoZQzp8KgSjHq
 6nUKZnuZnqokYsSX9CD0el2dX0yRJ2+s7MnyghLRDYs5WoOX09jk2n+6RGi0j9gXuso3v7Qwv7t
 xGNLfgYN5M5gIA6Pmh4i7aMs0uDpPmrZwOrPzltWq/Ob6rfLEixXGRVQewx8gxbOgnKEg4Ir/Zp
 35FeBebZYCJRoD6Z+sxFDgxHVdXETqXFvVZrOzyOheIcBoKCYMRg4HhljDUs4Ooy8Qbb8zFPZ4E
 iUGNxwEbH2JX
X-Received: by 2002:a05:6000:4612:b0:385:df5d:622c with SMTP id
 ffacd0b85a97d-38a221f36e3mr32973556f8f.30.1735801114183; 
 Wed, 01 Jan 2025 22:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnOi1WW70u14AlaYMcfDrpKDNORC5naofOworlZUzsQPXLlrAIAVkbcnFYabw1kRzbzGB16Q==
X-Received: by 2002:a05:6000:4612:b0:385:df5d:622c with SMTP id
 ffacd0b85a97d-38a221f36e3mr32973541f8f.30.1735801113815; 
 Wed, 01 Jan 2025 22:58:33 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-148.web.vodafone.de.
 [109.42.51.148]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e261sm37899593f8f.76.2025.01.01.22.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2025 22:58:32 -0800 (PST)
Message-ID: <06eb9dfd-dab4-47b3-8e75-f7c14b34c7ab@redhat.com>
Date: Thu, 2 Jan 2025 07:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update copyright date to the year 2025
To: Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20250101080116.1050336-1-anisinha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250101080116.1050336-1-anisinha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uDEmMCKoImImPQZKU-sQ_vPbo9bjarS-v-iHkyOfIl0_1735801114
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.186,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Jan 2025 06:58:41 -0000

On 01/01/2025 09.01, Ani Sinha wrote:
> We are already in January 2025! Update copyright notices.
> 
> Cc: peter.maydell@linaro.org
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---
>   docs/conf.py              | 2 +-
>   include/qemu/help-texts.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks! I've queued it for my next pull request.

  Thomas


