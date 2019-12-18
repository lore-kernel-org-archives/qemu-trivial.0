Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iheb7-0006tW-BY
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 14:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iheb5-0006sx-0L
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 14:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iheb3-0002uY-Ia
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 14:02:58 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34343)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iheb3-0002pQ-7C
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 14:02:57 -0500
Received: by mail-pg1-x541.google.com with SMTP id r11so1773000pgf.1
 for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019 11:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJ/NneotDbdMSFVuPbzyvFrv1Tr9LGEV2bZJOOTXNiI=;
 b=aSRFguwBr1Ow/cSRojBnPFp9j4Jjn4JrETCIGaY3le2iOWCL8LWt4C5pIzckBxGWwP
 cSgjyZZ85mBSGuKUIL4FmyRVYl8lVCcIK8EgkXJptukhtHLoi9Ug9xDXGpTzhk02SHZ2
 L8diBObziQOTXjXaTlYgF4azVzHJbLVWcHoKlBUE+xVE380B2OVH8M37zYFLGvEEqOsr
 LDiIbX5ShJBaN/4T7fPey1cCiitsa/9YFRlOQzt+vzKXsYYIKNt1coBlu3/kKTowrfFz
 MtrQZmZSsTNJi1fND7UOvmRn0CEcWHqBrW5DW2v74aQcrzeqRVaDVAQW0lQnGYkjGQGl
 kj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FJ/NneotDbdMSFVuPbzyvFrv1Tr9LGEV2bZJOOTXNiI=;
 b=LqJB3j46PJ1pzSArUVOQtRip08eSE3jkhG/+lNmtT3ZkiFoyYxn0o0BMIRC48Lyfhw
 uS7BDmAMxctnw2MKwALHf5033RV8ezpK+k3kzdHMhsi0VYWGgNShvhaRfirhEfv5b6LH
 OizMtnspqj/oLrX4afp14RgxBh9j0rDhCDQ+Wz1HmQKMrkIHhk8SV9ktadpcI+WEyuII
 b9LBt2ShxHG1hwjAUazFoUF17IyEF3fYyYXDTTFcz4Md4/0uvT3saZ7nAjXF95HV1qbC
 1Of766ikKrnjsS6YPHPm33yzg3qcrkESKkSkRA3RnXYzf/QVbQ0bxyCqE+VBXjHYfvLJ
 IlOg==
X-Gm-Message-State: APjAAAVqMZaIu8vES0gFFoO4BW/ZNTk05owhKCCDpjCudzoXyvIcZzxG
 mSCDCjdOz9jg22AZkNPzVY4gbg==
X-Google-Smtp-Source: APXvYqzcwxyXLPKp2/mLkUCoJF2oLqyfnkpCDx71XG7uQXmtyWau8qNYkclOYWq3+iv/jyRgyDE/Dg==
X-Received: by 2002:a63:604:: with SMTP id 4mr4877617pgg.406.1576695775769;
 Wed, 18 Dec 2019 11:02:55 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id b22sm4393194pfd.63.2019.12.18.11.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 11:02:55 -0800 (PST)
Subject: Re: [PATCH 5/6] hw/scsi/megasas: Silent GCC9 duplicated-cond warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-6-philmd@redhat.com>
 <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
 <71c58178-6bd5-bbb9-5691-77bdae7d2788@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f861e54-946e-df71-fb8c-458399ac17bb@linaro.org>
Date: Wed, 18 Dec 2019 09:02:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <71c58178-6bd5-bbb9-5691-77bdae7d2788@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Wed, 18 Dec 2019 19:03:00 -0000

On 12/18/19 7:52 AM, Philippe Mathieu-Daudé wrote:
>>> -    if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>>> +    if (MEGASAS_MAX_SGE > 128
>>> +        && s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>>>           s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
>>>       } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
>>>           s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
>>>
>>
>> I'm not keen on this.  It looks to me like the raw 128 case should be removed
>> -- surely that's the point of the symbolic constant.  But I'll defer if a
>> maintainer disagrees.
> 
> Is that approach acceptable?
> 
> -- >8 --
> @@ -54,6 +54,9 @@
>  #define MEGASAS_FLAG_USE_QUEUE64   1
>  #define MEGASAS_MASK_USE_QUEUE64   (1 << MEGASAS_FLAG_USE_QUEUE64)
> 
> +QEMU_BUILD_BUG_MSG(MEGASAS_MAX_SGE > 128,
> +                   "Firmware limit too big for this device model");
> +
>  static const char *mfi_frame_desc[] = {
>      "MFI init", "LD Read", "LD Write", "LD SCSI", "PD SCSI",
>      "MFI Doorbell", "MFI Abort", "MFI SMP", "MFI Stop"};
> @@ -2382,9 +2385,7 @@ static void megasas_scsi_realize(PCIDevice *dev, Error
> **errp)
>      if (!s->hba_serial) {
>          s->hba_serial = g_strdup(MEGASAS_HBA_SERIAL);
>      }
> -    if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
> -        s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
> -    } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
> +    if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
>          s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
>      } else {
>          s->fw_sge = 64 - MFI_PASS_FRAME_SIZE;

Eh.  I suppose.  But what's the point of leaving the hard-coded 128?  There's
certainly something I'm missing here...


r~

