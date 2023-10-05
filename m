Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qoPOu-0005xr-4y
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2023 10:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qoPOn-0005sD-AP
 for qemu-trivial@nongnu.org; Thu, 05 Oct 2023 10:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qoPOl-0005cK-6H
 for qemu-trivial@nongnu.org; Thu, 05 Oct 2023 10:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696516337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=By4HQqu0HduQ7XjjwLx5typ/4r8lacldykqjQcqGRTc=;
 b=b5tWKzkdpvb3VhpbuUHv+9YvzHckOdMeQpvcm1B5JK49KNJlGY5Gls4oi/k4GYgYFoYa+q
 pjR12tYz/O0OKU9DXvVmc90ANFkjjXUWW+YoiDWAKQA2jsvXDHTzWqtdaUpsUKIJhz7hiE
 BMFNhRtZftswJYSCukBXtHL6aTfl308=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-VUUQ7eIANrKvVvvVKowNQA-1; Thu, 05 Oct 2023 10:31:56 -0400
X-MC-Unique: VUUQ7eIANrKvVvvVKowNQA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae70250ef5so248013966b.0
 for <qemu-trivial@nongnu.org>; Thu, 05 Oct 2023 07:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516312; x=1697121112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=By4HQqu0HduQ7XjjwLx5typ/4r8lacldykqjQcqGRTc=;
 b=qGRn4DT90OdwjcLBI+v4foNgBgGAnu9Nbup0DJp1KUBQ4A4GX5HC8xUuUS1aubJsNb
 KPoQchk/0320YwzDm90pEUCuys0MTqcAapZGbO+v0HJGQIh2kB23tVPeONBPHoGHJQyU
 UPGoMKDYbtcB7LVTlcq5wqmGVAE9cWbnczwhyaXaKx86grR+oi+AeBlq/Dh6BVP4SwdL
 8mUmzMmhCewSjVCQ2Bc/GnBcxLtJGiaAQ04ZXWt7GU3Ha3irVPvfm+E9iIxKYRA3id3f
 SI6Xh1fBfzU7AVY0MBC2uXzt8mXMrXlU0ZR+V2uY6ibOtLOT9KriCyhhVf7H9zDcsp1S
 6d6w==
X-Gm-Message-State: AOJu0YxST7UePGMxEI+VGljvf2LuKbazKEvCsaKt5ebxo5Q743YHIWa7
 aX6cRrTmh4Iv+zNOqzfA0LzUBEDfGUxWJRbfDgb12oFJA/rbVBjfHIS751KqOvSQgcWLmaMjxWv
 qEvZRdJ/EDDC8l19b6A==
X-Received: by 2002:a17:906:fd84:b0:9ad:e3fd:d46c with SMTP id
 xa4-20020a170906fd8400b009ade3fdd46cmr1345925ejb.10.1696516312430; 
 Thu, 05 Oct 2023 07:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzJxESbg25EcO47evB/Wk6Y/mZjG+/kz15xGe0N33SUr3R/XB5rZQJ8J8IsBrd9KJ00snGlg==
X-Received: by 2002:a17:906:fd84:b0:9ad:e3fd:d46c with SMTP id
 xa4-20020a170906fd8400b009ade3fdd46cmr1345900ejb.10.1696516311987; 
 Thu, 05 Oct 2023 07:31:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-27.web.vodafone.de.
 [109.43.176.27]) by smtp.gmail.com with ESMTPSA id
 t8-20020a17090616c800b009a1be9c29d7sm1291106ejd.179.2023.10.05.07.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:31:51 -0700 (PDT)
Message-ID: <454b4732-d9ce-3cc5-e018-8fe2f88cc406@redhat.com>
Date: Thu, 5 Oct 2023 16:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230929141918.397096-1-thuth@redhat.com>
 <ZRb3aTLxBSnVGGr2@qc-i7.hemma.eciton.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZRb3aTLxBSnVGGr2@qc-i7.hemma.eciton.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.219, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Oct 2023 14:32:23 -0000

On 29/09/2023 18.12, Leif Lindholm wrote:
> On Fri, Sep 29, 2023 at 16:19:18 +0200, Thomas Huth wrote:
>> These files belong to the sbsa-ref machine and thus should
>> be listed here.
> 
> First of all, thanks for this.
> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   MAINTAINERS | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 874234cb7b..fc415d3cea 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -954,6 +954,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>   L: qemu-arm@nongnu.org
>>   S: Maintained
>>   F: hw/arm/sbsa-ref.c
>> +F: hw/misc/sbsa_ec.c
> 
> Yes, pure oversight, sorry about that.
> 
>> +F: hw/watchdog/sbsa_gwdt.c
>> +F: include/hw/watchdog/sbsa_gwdt.h
> 
> I just want to clarify that this is not "the watchdog for the SBSA
> platform", but "the watchdog defined by Arm's SBSA specification"
> (and belatedly the BSA specification)" - the specification that
> sbsa-ref (intends to) provide a compliant platform implementation for.

Thanks for the clarification!

> Another such component is the "generic UART", but since that is a
> subset of pl011 there is no real value in providing a dedicated model
> of it.
> 
> Which I guess is a long-winded way of saying: this component does not
> necessarily want/need the same maintainers as the sbsa-ref platform.
> I'm still happy to maintain it, and it may make sense to keep it under
> this header for now.

I think as long as the sbsa-ref machine is the only one in our git tree that 
uses this device, it's fine if we add the sbsa watchdog to this section 
here. If there will ever be another machine that uses this device, we can 
still reconsider and create a dedicated section for it in the MAINTAINERS 
file if necessary.

> (In which case
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> )

  Thanks!
   Thomas



