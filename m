Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJa7a-00054y-LQ
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 06:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa7Z-000522-2t
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 06:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa7V-00070t-TY
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 06:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSmBVfmvDg5V71s96eZDH4WbhzzxCQljYeeSD89WUy4=;
 b=RVDgHfW+yyRPgDPeRPFj0isUU7tR1VxSqZY1huOYqwlEFGgyHirwgtYyLnZNiVhLY8tYvo
 V4e6ZEJkHM5dbZe6NOls0GThaOr+OPt+TwrjEBJJoAUjGdGMj73IxY9P7buYTeJW8/FoIh
 1wowIOtUNUlyGQqVRtpn5ccSCDlA6D4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-B2Wu0cnpPrG9qr_ZCN7FaA-1; Tue, 09 Mar 2021 06:01:43 -0500
X-MC-Unique: B2Wu0cnpPrG9qr_ZCN7FaA-1
Received: by mail-wm1-f70.google.com with SMTP id a63so305908wmd.8
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 03:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kSmBVfmvDg5V71s96eZDH4WbhzzxCQljYeeSD89WUy4=;
 b=tNZLNHqQ4L7sPUjr1PqKORLl1djEwxgv1n3BWfU7gjhiQz049Dpoj58Y5Ai5QIUB5i
 LO8yEoOSJrdBkpGreV567kiDGSiiyBgyOlsL3kU22DP4y1/KUYZtO0UegiLFjF18WjAb
 W06/t6AqAaYOtDW9Ysq3vHd9h4JMtDmREkGb4S6IJGgLtHxyyjGe5zkatLzzzuIP7CoL
 tFOOR4Irf934sEcQTMY+QZyHj9Lu/0uYGDrwt8QrAnON6fhGjR1FSaAQSRJ3assfqzPv
 xuRuG7Mnb07le3/ZBi9bK7TVmSp/b+xqPLsgdbLla1mJluGNUdQtMYWu0ejnZlkmF4CU
 DRTQ==
X-Gm-Message-State: AOAM532VQH+veQtmhRg0Vpoc7f883Erl7Edp5d0LzISbk6vFe77Mbffb
 TcknvnG2suTIGAB2ee0oyyQDfFPpoUZfCMO9X5ZdfFuQo2Xn4a7ibsbRzVfuWOBTt7snclG9WV5
 qdG+EWJ9RC2mHzDpR6g==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26736070wrc.276.1615287701966; 
 Tue, 09 Mar 2021 03:01:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+q4FP6gFCN6P/EVD+HmDHwLHR4hwGoc1FyhsSTZ3TjDZF5AMMSXseYTjR0hh3G5O37ne6Bw==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26736057wrc.276.1615287701840; 
 Tue, 09 Mar 2021 03:01:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s16sm23563958wru.91.2021.03.09.03.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:01:41 -0800 (PST)
Subject: Re: [PATCH 1/4] hw/i386/pc: Get pflash MemoryRegion with
 sysbus_mmio_get_region()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210307222625.347268-1-f4bug@amsat.org>
 <20210307222625.347268-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8d4e1da-7654-cc24-2ca9-882fa531afe9@redhat.com>
Date: Tue, 9 Mar 2021 12:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307222625.347268-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 Mar 2021 11:01:49 -0000

Michael, Paolo, if you Ack this patch I can queue the series
via pflash-next.

On 3/7/21 11:26 PM, Philippe Mathieu-Daudé wrote:
> TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
> MemoryRegion with sysbus_init_mmio(), so we can use the generic
> sysbus_mmio_get_region() to get the region, no need for a specific
> pflash_cfi01_get_memory() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/pc_sysfw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 9fe72b370e8..caad9cbd5eb 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -297,7 +297,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
>                          0x100000000ULL - total_size);
>  
>          if (i == 0) {
> -            flash_mem = pflash_cfi01_get_memory(system_flash);
> +            flash_mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(system_flash), 0);
>              pc_isa_bios_init(rom_memory, flash_mem, size);
>  
>              /* Encrypt the pflash boot ROM */
> 


