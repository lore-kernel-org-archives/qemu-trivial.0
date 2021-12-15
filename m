Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxRei-00022T-Cl
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 05:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxReX-0001xj-Su
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:36:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxReV-0007uP-A5
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptKoSAfT5SsWIhv5lmYV8KPEM4zjV9bjMbcaoWPndEY=;
 b=R7gR8gjGzMN9Cyd5vApRyburHobYgRRfZbDp5dkzsOt4PzXmOeVEjfqsrtfqHkjmVPPDG0
 SWrkp8MkYYIoeQPqOkW/TOwEDkFC/+55KNooXZpB2CDT5q77nWxbV3YeminPQ74q1gtHWe
 xxRhhkUD0xU/fC8EO9IcYfBRTbqR0eQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-w93Se6saNGGNdnRYIkP4CQ-1; Wed, 15 Dec 2021 05:36:49 -0500
X-MC-Unique: w93Se6saNGGNdnRYIkP4CQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m12-20020adff38c000000b001a0cb286eacso1536629wro.9
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 02:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ptKoSAfT5SsWIhv5lmYV8KPEM4zjV9bjMbcaoWPndEY=;
 b=DyPQiMLZ7aMefLsX/DhcXOYAbq0QEMU7vLAO2H04a2G8LgW/dC2Jm3LonMevgJwufD
 etMp8Pn90+ZR6Tn3gGpwETClwrDtUVaNQy0oiCDX9DbTPsn1YJw6GosE58Ytkj+NZ1ra
 cfEWoSBcYYchTfpt8dCdOraBcKUQXwzfBb0YFjW+hoJapFVpJAKHKPSuRVv3tuFTqQp4
 dkEuex2DLxCygz5WuSoeMfDQ5dNBxIjt7sIVnv2f8f3yScqEmeOaUglTAoWkyQq0UQTe
 YBUGyfASTQFSO9Or3+0YgPF2Oi7/dvIWeYH8uwFwVY+D7E3KEdZIO4yaSoArrkH6mMCk
 gNDg==
X-Gm-Message-State: AOAM5313KdijqdV3l8TOAoBMAEL+7/qBjQpNN/oNH/8neHqJWQ7oiv1J
 43uDD/AS0MgVkmos1L20VaAqAzU0r+y1bPTLmKAYFM7bgZCxJs6J/UtIwtSXpXzBkU5/U9FPiWr
 DDFrC1oOrwe2d+NFVlQ==
X-Received: by 2002:adf:e545:: with SMTP id z5mr3752092wrm.444.1639564608415; 
 Wed, 15 Dec 2021 02:36:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBnUf22YjzKJbcPC/wjehGcYrBCnzHHS+4oHxIIgmKjGoySZZ7bBKyLwVNBvgSyN8jPjVkHw==
X-Received: by 2002:adf:e545:: with SMTP id z5mr3752079wrm.444.1639564608279; 
 Wed, 15 Dec 2021 02:36:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t8sm1902442wmq.32.2021.12.15.02.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:36:47 -0800 (PST)
Message-ID: <03770439-52cd-ba59-8ae2-643671d3b682@redhat.com>
Date: Wed, 15 Dec 2021 11:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-trivial@nongnu.org
References: <20211116193955.2793171-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116193955.2793171-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 15 Dec 2021 10:36:54 -0000

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 11/16/21 20:39, Philippe Mathieu-Daudé wrote:
> QEMU coding style mandates to not use Linux kernel internal
> types for scalars types. Replace __u32 by uint32_t.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 5a698bde19a..13f8e30c2a5 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
>      c->edx = cpu->hyperv_limits[2];
>  
>      if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> -        __u32 function;
> +        uint32_t function;
>  
>          /* Create zeroed 0x40000006..0x40000009 leaves */
>          for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
> 


