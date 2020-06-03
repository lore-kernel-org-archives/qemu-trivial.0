Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgMa3-00047i-A6
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 02:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgMa1-00047K-Mm
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 02:08:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24352
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgMa0-0002Du-HU
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 02:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591164527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H5XRR0E5wDnBuldvO8/QMrY+SkuT4VpjNYQ6hyrsgoI=;
 b=BaiVB8ktGswYUWh1F8J2uN73ZUlIqbQZpiWxeB5Fb8+8gDhxBYySEsdv3e9+UwwNyL4LE6
 JCdXxrnp24d+lxkT+Fpijql1S+9YQCrgfX78PF0tAXtz1JlUXPEdXLmnadWcHBODDMTHm3
 hk9oQlDx2et6/vT9ryNnDdjtceCSGQ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-zkt8If-lOIyB05OZqDTxRQ-1; Wed, 03 Jun 2020 02:08:45 -0400
X-MC-Unique: zkt8If-lOIyB05OZqDTxRQ-1
Received: by mail-wr1-f69.google.com with SMTP id h92so632321wrh.23
 for <qemu-trivial@nongnu.org>; Tue, 02 Jun 2020 23:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H5XRR0E5wDnBuldvO8/QMrY+SkuT4VpjNYQ6hyrsgoI=;
 b=Gx82wH0sSbeUWp2WK5SeQ/KIPd4Zv/trysgNTjiGgfl6aTKW/I0LLQVWKqGxgCKRhp
 T2iOwgp7a0byk9jPOY7RoeQjCc5aB0PSLfXGjkQLRhBANrk7YtpQM7qYJj90kNjOlov+
 R80pPlfWzRUKdrYtGmj4pd0KugvjCO6bPq07E6AT8cG27VpQ6SX20gJ9d8wlMbS6aHAi
 9aAhCOm/O3YSjlEtbfPNsOYeBlzoTMxwUe/B5J5S0NWNmNGTslqfJC0co/47EYz148Um
 DSAHsEE0Ho4jwEPvLn6FkIslpXS5qnp/foA0SKkUF+L+Pe+6+gVmizXTdLsogYsslcrO
 5+lQ==
X-Gm-Message-State: AOAM531pYdRghV/3/XSHUlWaLYy9HudyivOURkVGcH+z80d7ksvA3stc
 7gzSPzzLjduJ9ToOcW6rAFDcGjT2TqW8pFAGM76IYDQxmIGlRoQRIrwRdSEcwlp8jqj2q+nuULl
 uVOSa4W6svnrp5uSPpA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr7081472wma.101.1591164524172; 
 Tue, 02 Jun 2020 23:08:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMMQKWlp9a22v/Vbt7Xyr6l8Ntj87qiZYFAlaP/vnMYRM44JgD9IjeKja0PcyEFA8eYgPekA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr7081454wma.101.1591164523970; 
 Tue, 02 Jun 2020 23:08:43 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l5sm1283979wml.27.2020.06.02.23.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 23:08:43 -0700 (PDT)
Subject: Re: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for
 MacOS
To: David CARLIER <devnexen@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, pbonzini@redhat.com,
 John Arbuckle <programmingkidx@gmail.com>,
 Justin Hibbits <chmeeedalf@gmail.com>,
 Mikhail Gusarov <dottedmag@dottedmag.net>, Izik Eidus <izik@veertu.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <CA+XhMqwH6btbKFD0Ei47e+QHN2eBPG5H2PTS92MAje2Tij4Y=A@mail.gmail.com>
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
Message-ID: <76587685-fa03-6dd6-5ca3-caeaf3c7504b@redhat.com>
Date: Wed, 3 Jun 2020 08:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqwH6btbKFD0Ei47e+QHN2eBPG5H2PTS92MAje2Tij4Y=A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 06:08:49 -0000

Cc'ing more developers.

On 5/26/20 10:40 PM, David CARLIER wrote:
> From b24a6702beb2a4e2a9c1c03b69c6d1dd07d4cf08 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Tue, 26 May 2020 21:35:27 +0100
> Subject: [PATCH] util/oslib: current process full path resolution on MacOS
> 
> Using existing libproc to fill the path.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/oslib-posix.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 062236a1ab..96f0405ee6 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -55,6 +55,10 @@
>  #include <sys/sysctl.h>
>  #endif
> 
> +#ifdef __APPLE__
> +#include <libproc.h>
> +#endif
> +
>  #include "qemu/mmap-alloc.h"
> 
>  #ifdef CONFIG_DEBUG_STACK_USAGE
> @@ -366,6 +370,15 @@ void qemu_init_exec_dir(const char *argv0)
>              p = buf;
>          }
>      }
> +#elif defined(__APPLE__)
> +    {
> +        uint32_t len;
> +        len = proc_pidpath(getpid(), buf, sizeof(buf) - 1);
> +        if (len > 0) {
> +            buf[len] = 0;
> +            p = buf;
> +        }
> +    }
>  #endif
>      /* If we don't have any way of figuring out the actual executable
>         location then try argv[0].  */
> 


