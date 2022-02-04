Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG0KP-0003dJ-4K
	for mharc-qemu-trivial@gnu.org; Fri, 04 Feb 2022 10:16:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0KO-0003YQ-20
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0KL-0002K5-0q
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643987804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s07zfb/uBJBeUlib6JwmNqko9j8oKZdJB714Y6P5vfQ=;
 b=K/hp61EjOJH2xGbBGLtS8vb8u0xssPyeMQZM3fWQo+aTqXAucVOhQiLYhkimj4DnQkrcFR
 OB7Nj2qC5GqY+hgIl7NzCC+OJJi/rfwm7IJ+p3VCP+l1rFlFlt8fDKZOv67Cp3UNYhFOif
 dGsCKqWjWSy0e9PA51KhmakPysFv3Ls=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-s_p6r6vuO8SB2G5JbuL3vw-1; Fri, 04 Feb 2022 10:16:43 -0500
X-MC-Unique: s_p6r6vuO8SB2G5JbuL3vw-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020adfbbc2000000b001e2e8baaa1cso463564wrg.18
 for <qemu-trivial@nongnu.org>; Fri, 04 Feb 2022 07:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s07zfb/uBJBeUlib6JwmNqko9j8oKZdJB714Y6P5vfQ=;
 b=Zi6EDMJQbwR7y8Sw4bXyDqAtGnxRTMF6EShHHIZjIBUu9Yu2axdXf/WQ7/AVVfb707
 6ITljz0AeIg7zluytAhtVgc9nHRcgmHFuZlRek9Y95brHJIru5ROfE89LMeHb5fdDRlv
 oCPUh/9dY+OjILP7i+J/vEcKfLd9ckmLVrQZjPI1zVvVdFBCXQ/VK19/ud674GjS7TEj
 iKtoTRrt0do80G19rbVtuU/NCyARlydhH+cPo0gOuF856e+7mztnTw0AkZwqcN9YMaK+
 +6/I+LcephBbFcN+e7JKtksRXVs0MJtrtLE0LWCi+Ue1tXiXXuOnn/TqvfL0FRgGfQS+
 1fbQ==
X-Gm-Message-State: AOAM5314jKoFaCnzoAtFfz57UXltMoFAYT4ZExAjf8qc5XcMXng0xME2
 xuB0VCB3qb0mfpA12gaBTDW2UIvGZCCOyU1G3b7gS5hrEj91+HQrks6Rogcmu8fg94GFZED8To1
 UV7DymsQG88YMDuNN1Q==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr2611826wmh.155.1643987801765; 
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygOHytzevP0bNJOuuNaF32Unw4M12GWfmn7Wyf/L8Zt2MJSuFC2Yd6UqlcdY6XNyZBPG7PFg==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr2611807wmh.155.1643987801533; 
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id z6sm9786131wmf.37.2022.02.04.07.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
Message-ID: <215ee4ad-b2ff-cd6f-1584-b850a9ea4bf1@redhat.com>
Date: Fri, 4 Feb 2022 16:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/10] hw/remote: Add missing include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 15:16:48 -0000

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> Currently "qemu/error-report.h" is implicitly included, however
> if headers in include/ get refactored, we get:
> 
>    hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
>    hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
>      183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
>          |         ^~~~~~~~~~~~
>          |         error_report_err
> 
> Add the missing "qemu/error-report.h" header to avoid that.
> 
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/remote/proxy-memory-listener.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
> index 882c9b4854..0e893f3189 100644
> --- a/hw/remote/proxy-memory-listener.c
> +++ b/hw/remote/proxy-memory-listener.c
> @@ -16,6 +16,7 @@
>   #include "exec/cpu-common.h"
>   #include "exec/ram_addr.h"
>   #include "qapi/error.h"
> +#include "qemu/error-report.h"
>   #include "hw/remote/mpqemu-link.h"
>   #include "hw/remote/proxy-memory-listener.h"
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


