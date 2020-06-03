Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgUXs-00039F-Bj
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 10:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgUXq-00036s-Vm
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 10:39:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23557
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgUXq-00061Z-8T
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 10:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591195145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXHPtyW9vFExceroKt6q4osopK76FLutoW19ieyP1V4=;
 b=CwwUq9jzjGK4DNb29epJvj9nlWyksQXzESfacRX2MTCcmTM8p4TW6h2H5H5LM86wpWJrfB
 iptNiNJbyxWpZLUs4LNTcmvEi4N5jOTlb0a0cINu9VqAsRW2D+aWPgQYBN5HcNgsoUbsX0
 QCLmn8S6wzszADfytfB4lddtdN4Tw1I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Bz5NbR72NiC8Z_Ixe6aiZw-1; Wed, 03 Jun 2020 10:39:03 -0400
X-MC-Unique: Bz5NbR72NiC8Z_Ixe6aiZw-1
Received: by mail-wm1-f71.google.com with SMTP id l26so950117wmh.3
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2020 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DXHPtyW9vFExceroKt6q4osopK76FLutoW19ieyP1V4=;
 b=bkdzD6kWcLPrjkZRbUolWriRdu7YIaLRfIGsRxD8UZ5dgEo6cuAidw05VK9tru4bRk
 okdgc/Tu45iria+EZ2TmJrnU/YspbU9U/7qAem15Y4tsZI23d0Qc3U4QGMZXUmAAe3HQ
 Z1V7qLkuTYodjr+hd3T4lnf+e4nDIFBt82/8vuuTi+oZSaB4ISPxTyJ/UpcAfHzZCl1A
 Q2C7yYgrkXXhSLl0DAR4YM4/bTUpC7L/N3w15kr4nxhY2YjO4atdM1P0dkwzbD+Is4Mx
 bqTuU1/c4828i50JNquKlsJJh8xT1l9fi3NTf6YS+mVmwE9t059c1S4Y2xxaFHp4uMpc
 kngg==
X-Gm-Message-State: AOAM530LQY1wTPDFr3GO80ERcKLY1TWl7PBeBkU6zbde799TFhML4q65
 zM1itpf3WG+3STu8RjbNqtaEyeIZzRMrA5PLEQ1nXOdptd+rKE2PU7ddh+14wiv5UsqKtY+LTXc
 2w+UCrpJ9TgbDmoMqKw==
X-Received: by 2002:a1c:b7d5:: with SMTP id h204mr9510800wmf.39.1591195142496; 
 Wed, 03 Jun 2020 07:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymcbsGbHY7Jgrj+jEO5RGTRJMjU03sIxO4xOx/kCo5X4362KKUWkv3SZxPKxin6etKmcPzOA==
X-Received: by 2002:a1c:b7d5:: with SMTP id h204mr9510780wmf.39.1591195142286; 
 Wed, 03 Jun 2020 07:39:02 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id u13sm3649846wrp.53.2020.06.03.07.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 07:39:01 -0700 (PDT)
Subject: Re: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for
 MacOS
To: David CARLIER <devnexen@gmail.com>, Justin Hibbits <chmeeedalf@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 John Arbuckle <programmingkidx@gmail.com>,
 Mikhail Gusarov <dottedmag@dottedmag.net>, Izik Eidus <izik@veertu.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <CA+XhMqwH6btbKFD0Ei47e+QHN2eBPG5H2PTS92MAje2Tij4Y=A@mail.gmail.com>
 <76587685-fa03-6dd6-5ca3-caeaf3c7504b@redhat.com>
 <20200603090921.64351a28@titan.knownspace>
 <CA+XhMqw2ORNvkN=C+LdvMxDvrX2i25FW-9wXias6Mbu0wGjBrg@mail.gmail.com>
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
Message-ID: <1907cac8-bb91-dbc2-d8d5-c043022f4548@redhat.com>
Date: Wed, 3 Jun 2020 16:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqw2ORNvkN=C+LdvMxDvrX2i25FW-9wXias6Mbu0wGjBrg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 23:55:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 03 Jun 2020 14:39:07 -0000

On 6/3/20 4:22 PM, David CARLIER wrote:
> Good point even tough the libproc api is here in this form since quite a time.

Top-posting is difficult to read on technical lists; it's better to
reply inline.

Also, please don't remove the post content you are replying to...
Because then your answer doesn't make much sense out of context.

> 
> From d23bf60961ee036f8298794f879d1b8b9bd717dc Mon Sep 17 00:00:00 2001
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
> index 062236a1ab..9dd1e1a18b 100644
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
> +        int len;
> +        len = proc_pidpath(getpid(), buf, sizeof(buf) - 1);
> +        if (len <= 0) {
> +            return;
> +        }
> +        p = buf;
> +    }
>  #endif
>      /* If we don't have any way of figuring out the actual executable
>         location then try argv[0].  */
> 


