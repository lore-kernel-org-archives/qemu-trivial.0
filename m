Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLlQw-0000U3-VQ
	for mharc-qemu-trivial@gnu.org; Mon, 15 Mar 2021 07:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLlQq-0000Ss-Oe
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 07:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLlQo-0005Dm-8q
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 07:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615807839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cP0BACdI23ahBtG0WzSoXD8RnBI0wEAFglPKu/uN4OM=;
 b=UjV7OlBxcVXMyn032yzJi3KuZt7wuIJAN8JgU78zGobAX6gFBxJF/n1wHfq3ga+iyeo3WL
 Byj1dhmDyUgoRy+PMM8k6xyBulPbRcjPnNtOJ84npfvaYU2fg10zUH6dXSsPW0CZ0JRCLX
 SejocdoL1Sw0mnLV4saCF2Ohreg/CIs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-QbSEazXqMROWMxS8KR2Fag-1; Mon, 15 Mar 2021 07:30:35 -0400
X-MC-Unique: QbSEazXqMROWMxS8KR2Fag-1
Received: by mail-ej1-f72.google.com with SMTP id fy8so11816240ejb.19
 for <qemu-trivial@nongnu.org>; Mon, 15 Mar 2021 04:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cP0BACdI23ahBtG0WzSoXD8RnBI0wEAFglPKu/uN4OM=;
 b=Mxb72Fv3mLOngMQ/WQJOMd3yalNJVaXaLIEN4dHaZJrHjXIuu6JMf3P5UkJMLNwPVH
 o+XD+6ZegWpGb811xLqeX5qK7qJYkZbWh7EP8qViOaon5BjVweMp8Xnh6YnLcGA8COLw
 dSzhICXjigi/EPCuGVpKisvZRU04d/h5AlLkxfOpSBe2iMXzmUBy7uIaNx8nvJ2T8zzt
 jZ3884PoVi9v4W5HtF1SzAhW4+tH0ayc7hDS+1IlTAuzZskeHXw0hfwIOZyK5yPtRfRZ
 WDhM9Qs3ipGvA/Pi4FVlRM5g9pIC5Rv6FoOMGUV0ZwB8/BixdxOYj1/c2r3FkJhlP2Jc
 4PHA==
X-Gm-Message-State: AOAM531k5s1HVkn9YegP7iyujxWaXWuoP8DJukI12umqdGpJhGzxnFMJ
 OWuWEnQ/5BumVkVZgMYKRhoLQyYpu349Ac3zHcNKyXiBhIRuB6/Skggop2KLkfdyVDXJiHNONhj
 WQrxaXVVtnMQEco4vkg==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr22465224ejj.204.1615807834422; 
 Mon, 15 Mar 2021 04:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynvA5k6/x1t1rCXzhSthvxfNELyPrE+adW7TxlJ7O7fEhuH+0SRwwj+ajv81wozbXkC6c40A==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr22465168ejj.204.1615807833866; 
 Mon, 15 Mar 2021 04:30:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id y2sm7275394ejf.30.2021.03.15.04.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:30:33 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210307222625.347268-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
Date: Mon, 15 Mar 2021 12:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 15 Mar 2021 11:30:46 -0000

On 07/03/21 23:26, Philippe Mathieu-Daudé wrote:
> TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
> MemoryRegion with sysbus_init_mmio(), so we can use the generic
> sysbus_mmio_get_region() to get the region, no need for a specific
> pflash_cfi01_get_memory() helper.
> 
> First replace the few pflash_cfi01_get_memory() uses by
> sysbus_mmio_get_region(), then remove the now unused helper.

Why is this an improvement?  You're replacing nice and readable code 
with an implementation-dependent function whose second argument is a 
magic number.  The right patch would _add_ more of these helpers, not 
remove them.

Paolo

> Philippe Mathieu-Daudé (4):
>    hw/i386/pc: Get pflash MemoryRegion with sysbus_mmio_get_region()
>    hw/mips/malta: Get pflash MemoryRegion with sysbus_mmio_get_region()
>    hw/xtensa/xtfpga: Get pflash MemoryRegion with
>      sysbus_mmio_get_region()
>    hw/block/pflash_cfi01: Remove pflash_cfi01_get_memory()
> 
>   include/hw/block/flash.h | 1 -
>   hw/block/pflash_cfi01.c  | 5 -----
>   hw/i386/pc_sysfw.c       | 2 +-
>   hw/mips/malta.c          | 2 +-
>   hw/xtensa/xtfpga.c       | 3 ++-
>   5 files changed, 4 insertions(+), 9 deletions(-)
> 


