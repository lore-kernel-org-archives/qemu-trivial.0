Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r19OF-0007wn-PU
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2023 13:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r19OE-0007wb-WC
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 13:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r19OD-0002CH-Dc
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 13:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699553064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uEtIEd4N5xrKhq59wV8DOMN8I8bPTHQ579TnoP45/7M=;
 b=JcJvGNstu82VzGH+7AMevmF8Z9NnYYbdstD/encb8cpPNKGzY/NSd1nVITGQcQyQhAhJ6w
 XNcDj5CXidY7HwYM9AhTMGJBmgJ5VORq4jCqzosC76HUghAQ1lg0VQpnGB55YTfkRGoDS1
 lU4nTFsjFjouv3guGLfaMrTH6jq/PkI=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-8mfHEDiAPLC39lJP2mhihg-1; Thu, 09 Nov 2023 13:04:23 -0500
X-MC-Unique: 8mfHEDiAPLC39lJP2mhihg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1bf00f8cf77so1018622fac.0
 for <qemu-trivial@nongnu.org>; Thu, 09 Nov 2023 10:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699553062; x=1700157862;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEtIEd4N5xrKhq59wV8DOMN8I8bPTHQ579TnoP45/7M=;
 b=XVo9BZ73vKlZbZQ6EgnVVdUISlGWTkXWMN6A6r5Gi/+jsq99S9TcKAKU79XvzxV907
 A764s4uflqQ6uXZB8Alf7jEOKmauB7VlRqohtLTM6lXiZM8WoqokxoNgFQE119rqZ4Z4
 LZSjUfkBcUVeZOPFYcBe9WGubhnz2JIqvXrfV90qUQWwM1CdXN1S0QSPTD/bZiR0naf9
 R3O3Auoz/sIkaD1JMOE7nbc02ZBejMsU0o3lNQsEOhx9oGPK+ePvDd3xPL0KYdTYmplF
 feYSITehpmQ6rA2roxQnjMWByKyM+zpcWtdBuxaphmtmbyvnQMxgvxEdn80GOWuwX9AO
 yttQ==
X-Gm-Message-State: AOJu0Yx0p7S5uyLQiDwZJod6Jxf5oZ6b0gPa6wtYA3zXtAjROaPxojuv
 arkinmMsbuRka7ws2SyPO3X3RdaKGEhYVtbvQdPlAMPNSO8TDPW06iOEPaTlJ/36NFQFIGpOhd5
 NcWauFlv2idCbp8yxSQ==
X-Received: by 2002:a05:6870:a11e:b0:1c8:c2df:a927 with SMTP id
 m30-20020a056870a11e00b001c8c2dfa927mr6822501oae.53.1699553062565; 
 Thu, 09 Nov 2023 10:04:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg9Z7WRhGPc1lkMZrQKHewK3ItaY1FDXX+oUZ09dm7Wt3t7ZIUedO5p7LgwsF+L/YD1w4rrA==
X-Received: by 2002:a05:6870:a11e:b0:1c8:c2df:a927 with SMTP id
 m30-20020a056870a11e00b001c8c2dfa927mr6822483oae.53.1699553062310; 
 Thu, 09 Nov 2023 10:04:22 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 ov2-20020a05620a628200b0076ce061f44dsm82052qkn.25.2023.11.09.10.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 10:04:22 -0800 (PST)
Message-ID: <39fbfff2-1a39-4104-b1e3-76dea9498ce0@redhat.com>
Date: Thu, 9 Nov 2023 19:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/audio/es1370: Avoid four-letter word
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <20231109173544.375129-1-thuth@redhat.com>
 <CAFEAcA_MK9-jzQx-po06-CnLLBHQSA2_VB3g7UFVCCiJskyCeg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA_MK9-jzQx-po06-CnLLBHQSA2_VB3g7UFVCCiJskyCeg@mail.gmail.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Nov 2023 18:04:27 -0000

On 09/11/2023 19.01, Peter Maydell wrote:
> On Thu, 9 Nov 2023 at 17:36, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Using certain four-letter words is not good style in source code,
>> so let's avoid that.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/audio/es1370.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
>> index 91c47330ad..bd460c810e 100644
>> --- a/hw/audio/es1370.c
>> +++ b/hw/audio/es1370.c
>> @@ -670,8 +670,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
>>       cnt += (transferred + d->leftover) >> 2;
>>
>>       if (s->sctl & loop_sel) {
>> -        /* Bah, how stupid is that having a 0 represent true value?
>> -           i just spent few hours on this shit */
>> +        /* Bah, how stupid is that having a 0 represent true value? */
>>           AUD_log ("es1370: warning", "non looping mode\n");
>>       } else {
>>           d->frame_cnt = size;
>> --
>> 2.41.0
> 
> We could be more usefully clear here anyway:
> 
> /*
>   * loop_sel tells us which bit in the SCTL register to look at
>   * (either P1_LOOP_SEL, P2_LOOP_SEL or R1_LOOP_SEL). The sense
>   * of these bits is 0 for loop mode (set interrupt and keep recording
>   * when the sample count reaches zero) or 1 for stop mode (set
>   * interrupt and stop recording).
>   */

Since you already formulated that, could you please send it as a proper 
patch? I'll drop my trivial patch here then.

  Thomas


