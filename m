Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO2df-0002FZ-Cz
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 13:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2dd-0002EZ-Ux
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 13:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2db-0006Re-8U
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 13:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601574301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r+CNUKqIZO7ilhvkpa8/nGmgT3DVBTDK+1XJsMnKk8I=;
 b=HvLuVJGAziyZPhY6NQsoUw3Hl6SGR4QnRrFSyRvBWm2sKkgjnf+dnwFExtgSYz7XD2z51m
 BTBL/qUZsFNGEow8k7cx2HG8DMMlia3m4o8yVFbHP3ppHTN1tr8Xb82WbA7iSdVlQwDxaV
 nZx6iG4hA10FAzTkjXjQVfRWUO+lelM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-FqZE0RdcM0umMOwHMm3lzw-1; Thu, 01 Oct 2020 13:45:00 -0400
X-MC-Unique: FqZE0RdcM0umMOwHMm3lzw-1
Received: by mail-wr1-f69.google.com with SMTP id d13so2324761wrr.23
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 10:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r+CNUKqIZO7ilhvkpa8/nGmgT3DVBTDK+1XJsMnKk8I=;
 b=bIVLz2MGQpJp14adM/+2/H0v6nSiYXe6Bws8Yc/TIiLZupNNKwHW5pBG4qoB8s5k8D
 p9q2nGXi/YJFKkDTDwzHqljfx3Rs2/LHAtLVAELRBcg6OUQbXsiErMieIV0VjrQKxv7j
 vuouAmkm3iFaOdkrVRm4UkIb7xEKibklx8atsrFLDPBEpZbVXdJXWOrsixxSve7JPQ/f
 gI7lhNrek5bKiOAYnlOyjX4pU6DQoAyYd60alNLyB3OSUKXSFaK53Qn8S5emdrG46u1b
 t/cd6baE68aSiA92b3CAdyuwnmBmWjz5c0VJ5QZ626IVmhPv7xZrCuu9DOLonT+ah+nW
 jCRw==
X-Gm-Message-State: AOAM533zru3xjp6p5zFWpiLrAVM7s8esRJRun6N4yWoZdeXOrtz4gyAc
 NYfjmgjKtmy0aB1GWXyD8OevG5xpu71za5p0VqeIM4Ph1GgJ0J2/vPUdYmycgzRZ7SBFa/CqZsP
 hDlsQwVUll+sXhuXEmw==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr1081536wma.141.1601574298982; 
 Thu, 01 Oct 2020 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBoMKa+9sqLPPAbzQIDtzYTZsoPpbKEStIkX7GHfHAGPyOTjGlVYhc/86fa429gy5cfOYTnA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr1081521wma.141.1601574298783; 
 Thu, 01 Oct 2020 10:44:58 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id d18sm9962604wrm.10.2020.10.01.10.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:44:58 -0700 (PDT)
Subject: Re: [PATCH] hw/core/cpu: Add missing 'exec/cpu-common.h' include
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20200908123433.105706-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ff99f676-2e6d-2f23-5a09-96cc77fb8469@redhat.com>
Date: Thu, 1 Oct 2020 19:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908123433.105706-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 01 Oct 2020 17:45:06 -0000

ping?

On 9/8/20 2:34 PM, Philippe Mathieu-Daudé wrote:
> cpu_common_reset() uses tcg_flush_softmmu_tlb() which is
> declared in "exec/cpu-common.h". Add the missing header
> to avoid when refactoring other headers:
> 
>   hw/core/cpu.c: In function ‘cpu_common_reset’:
>   hw/core/cpu.c:273:9: error: implicit declaration of function ‘tcg_flush_softmmu_tlb’ [-Werror=implicit-function-declaration]
>     273 |         tcg_flush_softmmu_tlb(cpu);
>         |         ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/core/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 22bc3f974a2..63ece3662d6 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -26,6 +26,7 @@
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "exec/log.h"
> +#include "exec/cpu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/qemu-print.h"
>  #include "sysemu/tcg.h"
> 


