Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tE5Hs-0003ZS-Cn
	for mharc-qemu-trivial@gnu.org; Thu, 21 Nov 2024 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tE5Hp-0003Yx-OE
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2024 06:23:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tE5Hn-0004K5-4f
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2024 06:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732188223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t7qMvePr7uUUcsEhtBBE/hzKBTUJZ2vBMpomLtHayJ8=;
 b=P2P1ddG9HAdDzmFxH570sfZDV39l6nydYjqimzxJK1U6ZI0ts+daozZ87fjPNfLcGXA3db
 R+G+QonLYmi+koNwljVXA28uFHyuwZbUGuFR6t9txUOukP2RXcrqZLPZP7sDKcuAqJapKK
 VJALkLrZ5YEgX1vBb1VKKw7bpzEtiVk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-7dRaBCG-PbKBKA0s4DmaSQ-1; Thu, 21 Nov 2024 06:23:41 -0500
X-MC-Unique: 7dRaBCG-PbKBKA0s4DmaSQ-1
X-Mimecast-MFC-AGG-ID: 7dRaBCG-PbKBKA0s4DmaSQ
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-539e294566dso522284e87.3
 for <qemu-trivial@nongnu.org>; Thu, 21 Nov 2024 03:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732188220; x=1732793020;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7qMvePr7uUUcsEhtBBE/hzKBTUJZ2vBMpomLtHayJ8=;
 b=ulHQ1jY00NFw8bBgwd/JL6RuVEZEn+c+iSRC+WKtA/47A78Md4fUpy+v8itIm51Tzj
 YOJEEnMcnHkww/vss2infJO8dio2yGyl1kH95Ru4rQCvEDbhT1JSMYzSbzwmTc8fH1s4
 ThgSwtJ1OkeDBE6bbvb7JQDD0cvt/9T85HX1vVyysONHkKYUpEriCi79ig0cZrmekXGX
 riw2FUysPBL88jcdY+5xe/eeZFCqOMVoeyuxBUEyI0GKnt862jYunzrqaRRreQxS2upP
 ZxHz4JQGHVaydPV9Sput81HV3KNlGsMr+2Z9aT7jk38EmsF4bPhVizDR9qt6zkyfH30u
 q7iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyJamXByPjyOKrqVEhqRLWAKeFO1ABFDdkn+wP3wsqqgXESxPVAdVD6Elu3DHE3ME90+tkMg9U1fhR9Us=@nongnu.org
X-Gm-Message-State: AOJu0YzEYO8hhLZfjigB3wQZTLS6LA3NMoK4x9v1jEEpf8TKok+az2/g
 hlTabxd8DWLedKTpmhSQbCaZWYPjg+GUK4lS+KRevce/dpFxukohEJ8hpXyYw96wSfyuvr3kxJV
 dFdedpcQSvR3pdlqlH/cO1WDgfPLahTBrg7KqbOWzUGAHR5lleUDrsAk=
X-Received: by 2002:a05:6512:b84:b0:53d:a8d3:aeca with SMTP id
 2adb3069b0e04-53dc133ae0dmr3136726e87.28.1732188220322; 
 Thu, 21 Nov 2024 03:23:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiqDQw7Vx2btXe7l/Oru39oAyFh+IdSudpcT4GB7SlEM+A2rwI7xi18GFk4/0Inbf7Cl4PHw==
X-Received: by 2002:a05:6512:b84:b0:53d:a8d3:aeca with SMTP id
 2adb3069b0e04-53dc133ae0dmr3136714e87.28.1732188219905; 
 Thu, 21 Nov 2024 03:23:39 -0800 (PST)
Received: from [192.168.10.3] ([151.49.91.173])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3825490c674sm4688174f8f.33.2024.11.21.03.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:23:39 -0800 (PST)
Message-ID: <4549dfdb-f0b3-4a97-a8cf-3501a6051771@redhat.com>
Date: Thu, 21 Nov 2024 12:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb: Use __attribute__((packed)) vs __packed
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Roque Arcudia Hernandez <roqueh@google.com>, richard.henderson@linaro.org,
 jansene@google.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241101211720.3354111-1-roqueh@google.com>
 <6f67908f-7ca7-4aa2-86e2-99b79aa6b4e7@redhat.com>
 <ff07945a-3c82-489d-92db-3fc76ab24172@tls.msk.ru>
 <68860810-cb4e-44c6-9466-a117bd4fcd49@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <68860810-cb4e-44c6-9466-a117bd4fcd49@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yxt_wxzlCEGrV8lchDEIQDZBUQidjGkjaxn66UFFJj8_1732188220
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Nov 2024 11:23:50 -0000

On 11/21/24 11:24, Thomas Huth wrote:
> On 21/11/2024 11.01, Michael Tokarev wrote:
>> 04.11.2024 10:37, Thomas Huth wrote:
>>> On 01/11/2024 22.17, Roque Arcudia Hernandez wrote:
>>>> __packed is non standard and is not present in clang-cl.
>>>> __attribute__((packed)) has the same semantics.
>>>>
>>>> Signed-off-by: Erwin Jansen <jansene@google.com>
>>>> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
>>>> ---
>>>>   include/hw/usb/dwc2-regs.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
>>>> index 523b112c5e..b8b4266543 100644
>>>> --- a/include/hw/usb/dwc2-regs.h
>>>> +++ b/include/hw/usb/dwc2-regs.h
>>>> @@ -838,7 +838,7 @@
>>>>   struct dwc2_dma_desc {
>>>>           uint32_t status;
>>>>           uint32_t buf;
>>>> -} __packed;
>>>> +} QEMU_PACKED;
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> Actually, the struct only consists of two 32-bit values, so I doubt 
>>> that the "packed" is needed here at all. Maybe we could even simply 
>>> remove it?
>> To me it is important to mark structures as packed if it is
>> important for them to have strict layout like in this case,
>> even if de-facto it does not change the actual layout.  It's
>> just like an annotation saying this structure can be used
>> on wire or somesuch.
> 
> Well, it can have an impact on your binary, too. On architectures that 
> don't support unaligned memory accesses, the compiler has to generate 
> code that reads the values of packed structures in a more cumbersome 
> way. So if you used "packed" though it's not really necessary (i.e. 
> everything is naturally aligned, and you can be sure that the starting 
> address is also properly aligned), the compiler generates worse code 
> than necessary in that case.
Well, in this case the struct is downright unused. :)  But we can't know 
if it is naturally aligned or not in guest memory, so it is advisable to 
keep the QEMU_PACKED.

Paolo


