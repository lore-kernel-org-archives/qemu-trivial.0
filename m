Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tE4MR-00072Y-I9
	for mharc-qemu-trivial@gnu.org; Thu, 21 Nov 2024 05:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tE4MQ-00072F-Cx
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2024 05:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tE4MO-0002cx-QM
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2024 05:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732184667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mZrdLD+Qsz7HxH5gn/0809vT6FJZzwumRaL0bY1IA0A=;
 b=NYh8FFtsPn7uq3/nNvfQNxAxpbMyVh4TFpqNksy/Fuyz1yx8wMX/K54vlAoj9JZoa/ieam
 /s+9UzfGZC2sum5UH5zQBoW7rezKg2tLQdaf1E6dpg1mHVtX5J1vl0LDMi0+OSUJckOEr7
 vNXM8UNPXSG2agNfM/JZQ5wqn4SjAWM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-0uWww_IzP3e8HIbfJulwcA-1; Thu, 21 Nov 2024 05:24:25 -0500
X-MC-Unique: 0uWww_IzP3e8HIbfJulwcA-1
X-Mimecast-MFC-AGG-ID: 0uWww_IzP3e8HIbfJulwcA
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b15a8e9ff1so89824185a.1
 for <qemu-trivial@nongnu.org>; Thu, 21 Nov 2024 02:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732184665; x=1732789465;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mZrdLD+Qsz7HxH5gn/0809vT6FJZzwumRaL0bY1IA0A=;
 b=Qy0FWV395Lqa80eE0ewSSzd8MnyDJefq0dQ3Xw5TODThSBKELP9ba7etlcUtSgj09p
 VDEEqG5AaZGMcYO5LVkBz5v203Mt9YFKgun9GbLENJ83IbyKZ20boFbAxIs2Y1sLgczw
 0bYHJKONKyHUda5/BUQIjwvCwiQhXGocJcUQDai3J8jPF4hbAPLn3oZf+AMmSnPM1Bzf
 HeA2mWq+U/xB2gjo+RBri8eFEXl42gZnHsw0Hoh0/g+M15ZOI8enIgvPmKqtOxnP6NJO
 GNmMBrzXrjeVgavRrvISpmsEvsTaRc2wlQW7hUTEDpYS48EBzr4R1EknzHEyEWeBwg5i
 hFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUinKUvQbKi9jt6sIJAZoesAJqCJnBOppMDcLE+IZ0AidkD9Z061IpFinu2inWvmHYVOxMwPWkH7eaaDiQ=@nongnu.org
X-Gm-Message-State: AOJu0YzSTw/G8cgeJCkX0MRKRjp0UWqVkfVq3+IEkK1GvV7uMYTqQO8X
 +DRAby9LVo1yFrSmWYIpiItun6oV4wyfhOgcLPSzpWu63pTiSJdxMQG7/7LIa9cUu6WkQ8DGmDl
 E5vVpbrD/mH64F66y55kVF4iDv+iKQafmGUE4jZd9Xmm1ShRv8SSrl70=
X-Gm-Gg: ASbGncvhLcEEkVtw+Ox1//pVA8OZz2Y1tmVfkOZsOGPou47W+nlmpsOpT0Rilg7QT5x
 SXl+xk9fqrFczXSTcXaueu7/pM5BuF5wv05EdSMNZPNRRpoX7zO4fuHwAJR5cq3WWozj8RKh021
 TUor1vokeut2pEVmqrEc/xJ6efxcERixY12OdLwgpnYNRVDO0DSyLME0QFSDomhCP7qGXcLu0qi
 WQgVfBtpMa1CF6lUQ6fnnzLdgt72D3uaX/rC4Q+n1qQ2px8zPU95e75HfaJfBnw4SXDHUfzs7kQ
 tzA=
X-Received: by 2002:a05:620a:bc1:b0:7b1:1cb8:198c with SMTP id
 af79cd13be357-7b42edb9c0fmr823943885a.4.1732184665322; 
 Thu, 21 Nov 2024 02:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHCRMbAbDS/AlFwcA38kH7qI0asiGdwtxlh9m3xVcqCYpBaT48H0w0djDWdIndobEQkR2sDw==
X-Received: by 2002:a05:620a:bc1:b0:7b1:1cb8:198c with SMTP id
 af79cd13be357-7b42edb9c0fmr823941885a.4.1732184665047; 
 Thu, 21 Nov 2024 02:24:25 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b479d429a8sm192656385a.27.2024.11.21.02.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 02:24:24 -0800 (PST)
Message-ID: <68860810-cb4e-44c6-9466-a117bd4fcd49@redhat.com>
Date: Thu, 21 Nov 2024 11:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb: Use __attribute__((packed)) vs __packed
To: Michael Tokarev <mjt@tls.msk.ru>,
 Roque Arcudia Hernandez <roqueh@google.com>, richard.henderson@linaro.org,
 jansene@google.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241101211720.3354111-1-roqueh@google.com>
 <6f67908f-7ca7-4aa2-86e2-99b79aa6b4e7@redhat.com>
 <ff07945a-3c82-489d-92db-3fc76ab24172@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ff07945a-3c82-489d-92db-3fc76ab24172@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ih7usbK8roIhhJprZ9lJssZpddHPND8tinq9JjuXsA_1732184665
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 21 Nov 2024 10:24:30 -0000

On 21/11/2024 11.01, Michael Tokarev wrote:
> 04.11.2024 10:37, Thomas Huth wrote:
>> On 01/11/2024 22.17, Roque Arcudia Hernandez wrote:
>>> __packed is non standard and is not present in clang-cl.
>>> __attribute__((packed)) has the same semantics.
>>>
>>> Signed-off-by: Erwin Jansen <jansene@google.com>
>>> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
>>> ---
>>>   include/hw/usb/dwc2-regs.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
>>> index 523b112c5e..b8b4266543 100644
>>> --- a/include/hw/usb/dwc2-regs.h
>>> +++ b/include/hw/usb/dwc2-regs.h
>>> @@ -838,7 +838,7 @@
>>>   struct dwc2_dma_desc {
>>>           uint32_t status;
>>>           uint32_t buf;
>>> -} __packed;
>>> +} QEMU_PACKED;
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> Actually, the struct only consists of two 32-bit values, so I doubt that 
>> the "packed" is needed here at all. Maybe we could even simply remove it?
> To me it is important to mark structures as packed if it is
> important for them to have strict layout like in this case,
> even if de-facto it does not change the actual layout.  It's
> just like an annotation saying this structure can be used
> on wire or somesuch.

Well, it can have an impact on your binary, too. On architectures that don't 
support unaligned memory accesses, the compiler has to generate code that 
reads the values of packed structures in a more cumbersome way. So if you 
used "packed" though it's not really necessary (i.e. everything is naturally 
aligned, and you can be sure that the starting address is also properly 
aligned), the compiler generates worse code than necessary in that case.

  Thomas


