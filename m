Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puqPn-0004ZP-RM
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2023 04:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puqPj-0004VQ-C6
 for qemu-trivial@nongnu.org; Fri, 05 May 2023 04:03:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puqPe-0002X1-KD
 for qemu-trivial@nongnu.org; Fri, 05 May 2023 04:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683273811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFAZGtt20jjfxFOWddyez5tj/P7elvG1aIyda0Udr64=;
 b=VsgThq4xt3qjYOnk/c/yrJRAfHuAHvg3NjylneH/TPIHaIjUMB7k5PXlg4IJvEiRtEEHoN
 MJeWjdRJ6mAJm9uyQ1CBTd6W/h8YmDRw5li/jDQ7lB2QHV5EUVXOfTATQkU9M0J7A/BQp0
 nn3h61QX8xBVTaxPfdrIhK4aQhwqVWk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-F7KGuDLqN0iFO6vUHrGaWA-1; Fri, 05 May 2023 04:03:30 -0400
X-MC-Unique: F7KGuDLqN0iFO6vUHrGaWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f3fe24912cso9638085e9.0
 for <qemu-trivial@nongnu.org>; Fri, 05 May 2023 01:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683273809; x=1685865809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFAZGtt20jjfxFOWddyez5tj/P7elvG1aIyda0Udr64=;
 b=Vp5A8h5omx/aeqXHk+Hi69mn/u8kipyA5kXkVVwd3oIjf4cf8pLJ3Bym8mVxlGqynm
 ha/UJ8D+L8WM9h0Q9Hv9rYdkBd0sU28F+Mu2fCASkHh5r9W16l+ucc853MKNLwa8rEuJ
 yvmamef0jUKzWXZVnILJDZTi2ttOtO9522Gha/T0jprydrqTlg6ATcEb7FXIiFRk65JF
 2MiXpcEe61XUFx0NAvIm3qfg1lTsCDPsGFKD+hlcTZtGabCtiBegPS+S41vEgDqIJ+fI
 ePGE7TwYUOAScX+p3TzgzmYNZNf6RziChS6VVphrera6/CJdi2JUWAoz9DtgpgjVx3G2
 /0dA==
X-Gm-Message-State: AC+VfDwv1GVcs2qYDvvXdZxZVp8gOwRK3FqQGgMI5Lz6e9ReN6s50MzR
 w9++C7jJF1h4zcXTd6HKf5CKML0s99DMERxWI2THxF83HcJvtKrXkNanId6FZrluVaaDtCxie/e
 j7Er9aJez34XLal5Uwfr6Og54AQ==
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr414915wmj.19.1683273809413; 
 Fri, 05 May 2023 01:03:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IgW4LpLerY7nDGpska6phJavNFcAvC/Va1g1I7WQwFaQE/fYo7poYMvsFKxEdXlmM7UqHkg==
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr414894wmj.19.1683273808956; 
 Fri, 05 May 2023 01:03:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003ed2c0a0f37sm7198369wmg.35.2023.05.05.01.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:03:28 -0700 (PDT)
Message-ID: <1cf86174-b3eb-0674-7669-1bc7b4bc3eac@redhat.com>
Date: Fri, 5 May 2023 10:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/ppc/Kconfig: NVDIMM is a hard requirement for the
 pseries machine
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230504180521.220404-1-thuth@redhat.com>
 <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 05 May 2023 08:03:41 -0000

On 04/05/2023 23.19, Daniel Henrique Barboza wrote:
> 
> 
> On 5/4/23 15:05, Thomas Huth wrote:
>> When building QEMU with "--without-default-devices", the pseries
>> machine fails to start even when running with the --nodefaults option:
>>
>>   $ ./qemu-system-ppc64 --nodefaults -M pseries
>>   Type 'spapr-nvdimm' is missing its parent 'nvdimm'
>>   Aborted (core dumped)
>>
>> Looks like NVDIMM is a hard requirement for this machine nowadays.
> 
> Ouch.
> 
> I believe this has to do with this comment in hw/ppc/spapr.c, in
> spapr_instance_init():
> 
>      /*
>       * NVDIMM support went live in 5.1 without considering that, in
>       * other archs, the user needs to enable NVDIMM support with the
>       * 'nvdimm' machine option and the default behavior is NVDIMM
>       * support disabled. It is too late to roll back to the standard
>       * behavior without breaking 5.1 guests.
>       */
>      if (mc->nvdimm_supported) {
>          ms->nvdimms_state->is_enabled = true;
>      }
> 
> It seems like you found out another side effect of this nvdimm situation 
> that Igor
> documented 2 years ago in 55810e90 ("ppc/spapr: cleanup -machine 
> pseries,nvdimm=X
> handling").
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> I'll send a PPC PR in the next few days. Let me know if you want me to queue 
> it.

Yes, please add it to your queue!

  Thanks,
   Thomas


