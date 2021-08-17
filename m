Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFtU0-0003TO-7S
	for mharc-qemu-trivial@gnu.org; Tue, 17 Aug 2021 03:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtTy-0003Qc-6L
 for qemu-trivial@nongnu.org; Tue, 17 Aug 2021 03:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtTw-0002v2-5J
 for qemu-trivial@nongnu.org; Tue, 17 Aug 2021 03:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629185155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQiWS+17fddQjqxqxwyUxh75iVOLOV3BUQ1Tr6ikgu4=;
 b=PDC2sCoBoJNJ+MPYT6nwUmYBWjcKnpVt/Ui4bXzqwihT8ilscqXAAljL0GUBTWW0hLhcXR
 DZ+OJHjqVoBPNG2WK9vlo5NZeojsB98ic9SSBW4xQJXmgHvGLxKih1Xmxkq3dNu/nFE3BV
 OedDG2c8lktK0osKCWZmEc86GeaN9Us=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-a-nj5x0kPyKqf_QGxLzbdQ-1; Tue, 17 Aug 2021 03:25:53 -0400
X-MC-Unique: a-nj5x0kPyKqf_QGxLzbdQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so5650790ejj.0
 for <qemu-trivial@nongnu.org>; Tue, 17 Aug 2021 00:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dQiWS+17fddQjqxqxwyUxh75iVOLOV3BUQ1Tr6ikgu4=;
 b=lqJ7B56iMCjTkLDZYRMSC1sgOhTzpoFK/GPsjb7uKcRaOhTehhkAgOykL49Cby+WUg
 xQ8U+Nm0qBunRY31dniMps3FJg5RIpBgS2UTmD0e5a5mpaUqx+iQ676zJQIuikhh9uJa
 JBl0AFPQ/pE6vs8DK4qDqFgLTBJK9XDTq23MaymGk41BV0yLuovFrxQYpxEI1eRWsMXQ
 P9ANDuHdcYO2ej0CuC9N3pvCYTPrz8QV+a6wpnmXpgIKGm7goxCzdWIsurUwIkUsFsuW
 Xp+L/6O4iW2iYQ+d6Qg4t1+SwJhQnjBvcdWun1FxZw0xYKYKWXTlxfmGu6SttjRf7zbr
 raJA==
X-Gm-Message-State: AOAM533YKwTvRi2hBIzOqknbSsCMP3qWhZUd+d0/4gGQT9TfENZ1sp5A
 51/Q7URc3ouLoODqC8gLBvfiZS9I0PIq5OKym5HjhXCoxE9WgE51C1GqICk6sZVkEAl3nTw3ZDO
 BNOpuR+zkQMMMqC735bxkzjSvg7WHPIhj3mgX8zOMapywvkBEeHyabJC4MLfeBLz2jw==
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr2586931edb.281.1629185152633; 
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwACNlBN0nqKjjvgtcwKGJzCtzG533o3HEaEVIeTMDeB4NzSka40jkDOkkcT7fPr0KeLoCb+w==
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr2586907edb.281.1629185152435; 
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83fdd.dip0.t-ipconnect.de.
 [217.232.63.221])
 by smtp.gmail.com with ESMTPSA id m15sm579084eds.92.2021.08.17.00.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
Cc: philmd@redhat.com, kraxel@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210816135504.9089-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
Date: Tue, 17 Aug 2021 09:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210816135504.9089-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 07:25:58 -0000

On 16/08/2021 15.55, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>   hw/display/vga-isa.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..30d55b41c3 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,6 +33,7 @@
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>       MemoryRegion *vga_io_memory;
>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>   
> +    /*
> +     * make sure this device is not being added twice, if so
> +     * exit without crashing qemu
> +     */
> +    if (qemu_ram_block_by_name("vga.vram")) {
> +        error_setg(errp, "'isa-vga' device already registered");
> +        return;
> +    }
> +
>       s->global_vmstate = true;
>       vga_common_init(s, OBJECT(dev));
>       s->legacy_address_space = isa_address_space(isadev);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


