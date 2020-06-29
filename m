Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpqX1-0002LC-9B
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 05:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqWz-0002K1-Fs
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:56:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58900
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqWx-0003hl-RV
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593424611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8O0V2gQEgDJIq00JSbimMW72yN6AB6lkyq3zxUwchFw=;
 b=WHllcyxP+VchlDNLmM/FtXG6lHONbR8/tGdVYS/gX3NafhYJrUBN9Z2Vebr2zWdZNkSBVT
 FVVz0ioF5/w96Y3qmQ9ZpM2flH/eD0F02imS7/hiq/KdtpxXT0rq8rLn6rmpSP8x1jtjZP
 rhmJBoTW0vuJJ4+4yG1hyD0644tQF1Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-EEv_E_EKMw2uQSOrn_zSNw-1; Mon, 29 Jun 2020 05:56:49 -0400
X-MC-Unique: EEv_E_EKMw2uQSOrn_zSNw-1
Received: by mail-wr1-f72.google.com with SMTP id y16so16292633wrr.20
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2020 02:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8O0V2gQEgDJIq00JSbimMW72yN6AB6lkyq3zxUwchFw=;
 b=N8GH/q1BR8CxcOkukK3XMT6D/WqL6e7dAszepLSNky2gaFXQ/p09tZpCqocpU4v5Mu
 cQ+7FJuk+SozOG34TtPPpMtPlWrFbsb5uYpX3z8wahjc01GyX/xAUtoCjtjTQmKl3S+c
 XXgFqCtkGu3mJPbh2amU8vjPNcklxm1krHFyLMA69l4qSJFQ0RM+mSEkr3mVQXCTcRVz
 xUGAqDliHt4R1e7emR0+u6uZwgmHIckdtN7wtbKPwI1INXbBUa0AV3WTHEwvZvgyq7pj
 O3mpXNvsHws+jGFF0nUTNsZWcwNAWhRJfuoFcVLDGxnbORXcA/FJwUyBbSHfBo3ql28r
 5Gog==
X-Gm-Message-State: AOAM53053c1eX0A6ajN+MyT4XZv9utKoipnpMlZpToH7TrmguZJLkfxf
 XmxXqFAmDj+SIq+IjYUF56AoIIpKE+f9PcrLgCgq/7QnCIqugLWJS2dGPPA56RiYv8eOsdYDpAf
 JcKwvFdHCWRY1JTCymQ==
X-Received: by 2002:adf:f608:: with SMTP id t8mr16552164wrp.308.1593424606695; 
 Mon, 29 Jun 2020 02:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrJ5WCX5bkJg1Y3LbjrmF/f2XOB7yLimWeNuktPQu76q/5GZvZLRp34zFIb5dJEmkYf7UQXg==
X-Received: by 2002:adf:f608:: with SMTP id t8mr16551944wrp.308.1593424602803; 
 Mon, 29 Jun 2020 02:56:42 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u10sm27585130wml.29.2020.06.29.02.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:56:42 -0700 (PDT)
Subject: Re: [PATCH 06/10] trivial: Remove extra trailing whitespace
To: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-7-dinechin@redhat.com>
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
Message-ID: <998efa7a-f1ab-72e7-2a44-d6ec267d7527@redhat.com>
Date: Mon, 29 Jun 2020 11:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200626164307.3327380-7-dinechin@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:37:37
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
X-List-Received-Date: Mon, 29 Jun 2020 09:56:53 -0000

On 6/26/20 6:43 PM, Christophe de Dinechin wrote:
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  hw/display/qxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index d5627119ec..28caf878cd 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -51,7 +51,7 @@
>  #undef ALIGN
>  #define ALIGN(a, b) (((a) + ((b) - 1)) & ~((b) - 1))
>  
> -#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9" 
> +#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9"

From CODING_STYLE.rst:

  Comment style
  =============

  We use traditional C-style /``*`` ``*``/ comments and avoid // comments.

Let's switch to the C-style format :)

>  
>  #define QXL_MODE(_x, _y, _b, _o)                  \
>      {   .x_res = _x,                              \
> 


