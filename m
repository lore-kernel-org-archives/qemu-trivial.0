Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzIcD-00020a-2H
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 07:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIcB-0001w8-2w
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 07:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIc9-0001QN-3F
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 07:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610453851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAUyZBsa04A6Am3+mCJMywqqLqXJ6wZLHseqHSSXZ3E=;
 b=YJ2g5QHYVWNm3jX/6Scpj/FiyHZxHpS92KoskiVGAuirx6VJf4XHeMdh5i5rzDvruPMWiq
 NXXITfrnkkCGdVh9r8rfELh8rpflc2W/0FVCMgI6XbSw6XOubeHDChvj6drKaLlaehvjap
 /0b9eHAGyncUdUxsBCFl53Xep6Bt8uA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-0rDCBslePXKC_jzNPWkFoA-1; Tue, 12 Jan 2021 07:17:30 -0500
X-MC-Unique: 0rDCBslePXKC_jzNPWkFoA-1
Received: by mail-wr1-f71.google.com with SMTP id g17so1072821wrr.11
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 04:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uAUyZBsa04A6Am3+mCJMywqqLqXJ6wZLHseqHSSXZ3E=;
 b=lcvYrdoWgH/Ubnk2N/JvFgXX8RdoqVUwgILgB9uMiCW/z1DUhKDBmCpuaqQActp064
 fbVg7oSrH7kurqwfMtjeBxev46n12HadquoMNDlqi6PweGP1FYjs4W2VI/ZKzVw+WYYg
 0yBiyuCRF4B5qz5nF8M5gTPQYA0IzSUEBExAiYbOU+Rdlvw3YakEOqnqU9ANBq6yNwvP
 WcV7ofDAkI7+bbSowC+FCWG5F2sbVyd0oy1TCZwJXXFG8vKTIxb/yUZNDjyMbJSpR6WM
 DQlLBlkdySH0BLIqttEc4QF2Z/sOMhvpVONwznlRgEpYvOhnrL3CtCezvv4iX6Dq7aLi
 pPHw==
X-Gm-Message-State: AOAM530pQfGLzAEsaC8yBiDbnKCOoYADzUv408CyxXzwc+QAagFviUmH
 IkVoBVt/S6z+1mu4qfI8y/fFCFQy8Zn/iqP3bmsIq9c0pLDv2qhq0YbHsK09U+jh8QiBC/U4xPg
 Ta378DFfmG9QZEKttXQ==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr3280967wmb.137.1610453849268; 
 Tue, 12 Jan 2021 04:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg7Q3nJIWPHm0tCAvuS7ietSfBuyDkJG3bdb54ee8Xc1Hjb6No8JsoJTLzj+aotnYPadyAyA==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr3280945wmb.137.1610453849089; 
 Tue, 12 Jan 2021 04:17:29 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id y68sm4185801wmc.0.2021.01.12.04.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:17:28 -0800 (PST)
Subject: Re: [PATCH v3 2/2] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, david@gibson.dropbear.id.au
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-3-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b1e528e4-fb5b-2348-4d4a-d420413e9e56@redhat.com>
Date: Tue, 12 Jan 2021 13:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112112705.380534-3-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-List-Received-Date: Tue, 12 Jan 2021 12:17:35 -0000

On 1/12/21 12:27 PM, Gan Qixin wrote:
> When running device-introspect-test, a memory leak occurred in the mos6522_init
> function, this patch use timer_free() in the finalize function to fix it.
> 
> ASAN shows memory leak stack:
> 
> Direct leak of 96 byte(s) in 2 object(s) allocated from:
>     #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
>     #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
>     #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
>     #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

As the change from v2 -> v3 is a rebase suggested by
Peter, you can keep David's tag IMO:

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/misc/mos6522.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index ac4cd1d58e..1c57332b40 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -490,6 +490,14 @@ static void mos6522_init(Object *obj)
>      s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
>  }
>  
> +static void mos6522_finalize(Object *obj)
> +{
> +    MOS6522State *s = MOS6522(obj);
> +
> +    timer_free(s->timers[0].timer);
> +    timer_free(s->timers[1].timer);
> +}
> +
>  static Property mos6522_properties[] = {
>      DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
>      DEFINE_PROP_END_OF_LIST()
> @@ -519,6 +527,7 @@ static const TypeInfo mos6522_type_info = {
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(MOS6522State),
>      .instance_init = mos6522_init,
> +    .instance_finalize = mos6522_finalize,
>      .abstract = true,
>      .class_size = sizeof(MOS6522DeviceClass),
>      .class_init = mos6522_class_init,
> 


