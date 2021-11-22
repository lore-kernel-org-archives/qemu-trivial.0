Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp8GI-00080J-6z
	for mharc-qemu-trivial@gnu.org; Mon, 22 Nov 2021 07:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8GF-0007yF-Ry
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 07:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8GD-0005QJ-IZ
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 07:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtaloi5R+LH/p1amxef3z86CYMvQ7bGT240F6mebXq8=;
 b=efpjBfvganhWL73hYbnPH+8N+D71XcAQ5PaMk8CeYTOvV1JkZRTYY0oPCEVJkvjDKrttW9
 b/k182OOo4+fJi/MmlmE3SfV+CIeyKkwn2Wv/1b4xfi1ipLYi1nw4vA9xcOUCf01vM8bUf
 Ya6RPE/0+o4UAoi99wcfU8U1TIyQ2C8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-I6T8W33-OTKR3YK0UeD8oQ-1; Mon, 22 Nov 2021 07:17:23 -0500
X-MC-Unique: I6T8W33-OTKR3YK0UeD8oQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so4149282wme.0
 for <qemu-trivial@nongnu.org>; Mon, 22 Nov 2021 04:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtaloi5R+LH/p1amxef3z86CYMvQ7bGT240F6mebXq8=;
 b=WkYUrDFR5RAIruzPYPAKnMDbYXJ9+GUlM15oMYBbGCl1mkd27KqLExfcMOq/3EGW5/
 fqs3W/hFFc870JoKW6Grn+PY0oK4FOo++htMiQ/gEN34Bz7Q4bcDLI/HpXSmUXSJsBbF
 TNSspvOv6Pkop3fnP/vN6Mr2Yf0pzDU2BjyOlESqSK/moyhaduLTF8HCMxKvV0ytA7Xv
 oLpCOZJkCehXpwwmCkYptz4V+Pv+aLyLu6GgTB45rTC8Vj47JYz8UpvddwPmBseHIKaW
 djSIz3tT2dG8wyWgDrbOhVDmBJGjcliDXKVOhkaScF7867dUT8d94ZH9L9ZqC6u0ErcL
 /rXA==
X-Gm-Message-State: AOAM531TW0TvnOGxAM7lzt1XGt2IgoKY2b1Nk3Mya8BjOq1cMghoMM9j
 NN/tAPuA0gN8MPUv1eUAaqoBTwsVBV3YM0EzO1I4hA2F6x0rC0fIU7s+64pR2NvYGX3k7l+aKGG
 7ubib7Pb6UQxAGSZrsA==
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr37090427wrc.165.1637583442033; 
 Mon, 22 Nov 2021 04:17:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyut/Tst1nlHd4W6dCshnzM2Owz2NdBVxKRr1JGcEeOrdYRXxyVzXwhsY7m9j+SyWQCF3LZjA==
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr37090359wrc.165.1637583441651; 
 Mon, 22 Nov 2021 04:17:21 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm8684577wro.68.2021.11.22.04.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:17:21 -0800 (PST)
Message-ID: <a605fb86-d86f-e200-de80-e5802254f52e@redhat.com>
Date: Mon, 22 Nov 2021 13:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for Hyper-V VMBus
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rvkagan@yandex-team.ru>, "Denis V . Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 22 Nov 2021 12:17:28 -0000

On 11/20/21 19:46, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This way there is at least some contact point for incoming patches.
> 
> We'll see whether the code still gets just a random patch a few times
> a year or whether it requires a permanent maintainer to take care of it.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c12c..7f57e7fda73b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1729,6 +1729,12 @@ F: include/hw/block/fdc.h
>  F: tests/qtest/fdc-test.c
>  T: git https://gitlab.com/jsnow/qemu.git ide
>  
> +Hyper-V VMBus
> +S: Odd Fixes
> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> +F: hw/hyperv/vmbus.c
> +F: include/hw/hyperv/vmbus*.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thank you!


