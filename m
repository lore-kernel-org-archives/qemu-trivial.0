Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jivDN-0005WH-Bw
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2020 03:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jivDL-0005RK-Lf
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 03:31:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55475
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jivDK-0001Yb-Os
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 03:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591774317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ufr9OvMKHx6dilbenCBf6oJ7zVnHo90LqSeQBs4wcOw=;
 b=Jfz+K9jY9BoJQnvHZAEBmEUyMLUQbhR/iJnk+lVxalte+v3IECF46//TFnjyHP2P8e883w
 0YRMzWqVVGvBC4f5x3rq0DdDM1FgCcxKrI/skIFTPXoI+0MNa56JSusXr+EuiRgRefe2BJ
 tXeBukFPpykpI7ShcXsPfFDBDvhm0LU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-TuoAQ5uGPlq2yK_-OkGv1g-1; Wed, 10 Jun 2020 03:31:51 -0400
X-MC-Unique: TuoAQ5uGPlq2yK_-OkGv1g-1
Received: by mail-wm1-f71.google.com with SMTP id 14so176528wmi.8
 for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2020 00:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ufr9OvMKHx6dilbenCBf6oJ7zVnHo90LqSeQBs4wcOw=;
 b=tv9bS5o345wUXUCaoXNlFKoaECUUrwibjTIvodZzSk4nfWsoLLS3Wa8hwHavjYXbge
 BTqsKOHwluWaa6hJoHH2Ubl74LxPxFJnKXZzqxFAyCuPaOMKtxQbGr7KEwuQVbIAeah7
 EHGemvfSYFD6QKHanG5Q2SWjWZLmdpVDYDY2900H2l04nhNUEvtsFIoT1tiExVTLM52Z
 +bv4Q59EjDiJMnf/1Z0M25UifnMvbwAShAPDSAQV1Fd00bsb6OItZU/Vb0TR1fflox68
 ZHeA3wTt0hlNrm9hzJSte9ZNX+b13KOGVH1Bq6ejVUbj2veXJX2/yxfGFr8cCKk94dZr
 Xuvw==
X-Gm-Message-State: AOAM533dzVTIRLEeWtqz3laIMAhnCJbANTsD7QAqmkr35kqiclwh2o3c
 9MODc+YnqBliPs7tZ20lJXZFi/oSu/56i6eGW9vzNW7Fj9z3rUIy+nHmGFWdmkdnBik/Co1zc6s
 35UxbEuB5iWBnIBLk+A==
X-Received: by 2002:a05:6000:1202:: with SMTP id
 e2mr1948931wrx.231.1591774310495; 
 Wed, 10 Jun 2020 00:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2hQgSrh3avXiojSm08oGCfW0D+2HM4aHlqJJ1ZerzJXa+R7WkDZVuEL2AgaxN1HiwOdqThA==
X-Received: by 2002:a05:6000:1202:: with SMTP id
 e2mr1948901wrx.231.1591774310106; 
 Wed, 10 Jun 2020 00:31:50 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id i10sm6650106wrw.51.2020.06.10.00.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 00:31:49 -0700 (PDT)
Subject: Re: [PATCH] hw/vfio/pci-quirks: Fix broken legacy IGD passthrough
To: Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20200610035102.20192-1-thuth@redhat.com>
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
Message-ID: <706060db-46c4-2dee-d746-eba24e6b137d@redhat.com>
Date: Wed, 10 Jun 2020 09:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200610035102.20192-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 21:17:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 10 Jun 2020 07:31:59 -0000

On 6/10/20 5:51 AM, Thomas Huth wrote:
> The #ifdef CONFIG_VFIO_IGD in pci-quirks.c is not working since the
> required header config-devices.h is not included, so that the legacy
> IGD passthrough is currently broken. Let's include the right header
> to fix this issue.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1882784
> Fixes: 29d62771c81d8fd244a67c14a1d968c268d3fb19
>        ("hw/vfio: Move the IGD quirk code to a separate file")

What about shorter tag?

Fixes: 29d62771c81 ("vfio: Move the IGD quirk code to a separate file")

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/vfio/pci-quirks.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index f2155ddb1d..3158390db1 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "config-devices.h"

I've been wondering how we can avoid that mistake in the
future, but can find anything beside human review.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  #include "exec/memop.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> 


