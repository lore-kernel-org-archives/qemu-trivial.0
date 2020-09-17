Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIv8B-0007Rv-5w
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2020 10:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIv89-0007P7-Mj
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 10:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIv87-0006lP-Ry
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 10:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600353802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RpQKpTZP9Hz6upOzj3ZNbGCC8FqJKupPnlZTQK4JVu0=;
 b=DplU0nO7N7fW9UrDV70C8U1s2cL4RcJwR0EPRXijXBK/l2M8MR3xnLCwTpiI+kEDd/9zvK
 qs0U5iz3EVyupzo6rOui6UH9Pq6PWcXPuabN0XeD+47IZ7yyAk+pcI1qCNBH24Ke6D/T+k
 7ElyHj0Tww3J//h6BS1oMTWetUq5M8M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-fPJSP4MJMK-XO7BBYgLkWw-1; Thu, 17 Sep 2020 10:43:06 -0400
X-MC-Unique: fPJSP4MJMK-XO7BBYgLkWw-1
Received: by mail-wr1-f69.google.com with SMTP id 33so984763wre.0
 for <qemu-trivial@nongnu.org>; Thu, 17 Sep 2020 07:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RpQKpTZP9Hz6upOzj3ZNbGCC8FqJKupPnlZTQK4JVu0=;
 b=h+kN1nhij7s4dbv50bgICwbRHjnER6AsBmN/8PyNaMeAaBoyC5ielfxjkfA3J+I5dA
 rBAos0FkGWHJM/ANvZNVifHDBJnGJS+aCte+zyBVxlPusZP4uuCo2qNrSLB2CXTKxOmX
 Vt8zWdUZnxY21oSBrZUgRvxwXVojXYGWs2Gphyq91uZECL6duWn6czC7JKfNNR3l2FY6
 gzjMcdUK5sNDZxLpOhuIQ0ulilg3sev94cxWX8OfaenyB49Dl1oJsvKE7xVpXXV6lsl6
 APcdlmOeJQ8gqSJ4SAaytkCp7pmZ8VbZYc3l0NpPo61NMp75wbbuvd6v8rgBxnyjj3M9
 rumA==
X-Gm-Message-State: AOAM533SO3Iol4LmsmO4qNKd+MD3QQUUuJWTLMtJGpwKlWE2jzNE/6wx
 rZRVR5IBYobyD2CoSymTjK+oUxQ9TQPz7JJ80OD2aQPijoFby6Zi4CWSaexMVr9+mPWBdcrGMz6
 o7wICRsy6/mdZjEMLjQ==
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr10665383wmd.48.1600353784811; 
 Thu, 17 Sep 2020 07:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO3Iz+linhDZviOC7JMz3zAS5QXHJ4vz/e4hTXW5pHAm4mE/8vPOPWzSClNhzGLp1M6Jkn4A==
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr10665368wmd.48.1600353784608; 
 Thu, 17 Sep 2020 07:43:04 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id h16sm41834352wre.87.2020.09.17.07.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 07:43:02 -0700 (PDT)
Subject: Re: [PATCH] meson: fix static flag summary
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200917140700.673171-1-lvivier@redhat.com>
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
Message-ID: <b4dc586a-dfd0-0fe9-bf23-0a2a6ab2c260@redhat.com>
Date: Thu, 17 Sep 2020 16:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200917140700.673171-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 17 Sep 2020 14:43:25 -0000

On 9/17/20 4:07 PM, Laurent Vivier wrote:
> 'static build:' must display value of CONFIG_STATIC rather than value of
> CONFIG_TOOLS.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 5421eca66a02..c174f0ab0948 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1374,7 +1374,7 @@ summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
>  summary_info += {'sparse enabled':    meson.get_compiler('c').cmd_array().contains('cgcc')}
>  summary_info += {'strip binaries':    get_option('strip')}
>  summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
> -summary_info += {'static build':      config_host.has_key('CONFIG_TOOLS')}
> +summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>  if targetos == 'darwin'
>    summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
>  endif
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


