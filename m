Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOOlv-0005w5-M5
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 13:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kOOls-0005sq-Hq
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kOOlp-0001kW-QF
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601659380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/HVzgTA/hiH5z/et12sQaOcAcRrIPvkF5F7FilN1wGo=;
 b=U0p/16KZSYbS6WxGYsX+ueBh7EpTM6BStA38L3KVlmWZcteHThf3BBjo0s8TAgupCZNTnt
 tAPYYqfX+J4cLbh7t2o3+4d0FMptLRP9UO2m709ltrgLeMV2Q+/FKkA2bhk0go5u+y4bm9
 UEMhktk5CxVYnQu0eb4OHm99hSf80ws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Kk4FS61HPuq0XTJ4supp_g-1; Fri, 02 Oct 2020 13:22:58 -0400
X-MC-Unique: Kk4FS61HPuq0XTJ4supp_g-1
Received: by mail-wm1-f70.google.com with SMTP id 13so643604wmf.0
 for <qemu-trivial@nongnu.org>; Fri, 02 Oct 2020 10:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/HVzgTA/hiH5z/et12sQaOcAcRrIPvkF5F7FilN1wGo=;
 b=UoAgkjrMe3KvcbhvzciC+cPChAQIkhSBJmsznSGLQCa45pn31+5WZMC3C7KGpnpYgV
 Bfe//5lcGyRGu6gReUcASgjLqs2LdiC80FJ0/0xYms4Nxb22aBZzbNNO+pX+9/jj9qFd
 2xr7ZPYWqtCOimjMX7/zCQVt0RmKd7fHx6iyhZwt6oML57MkK7UXZlVct/o8O1RdU5+y
 DtDBs+ALQf3F0kxsnYUD6Vfvr8IciBD8XjF/IWnZJaQEpxduRgatlrUdUafm6diVMBXg
 r90eGQ8w7Cx+7lN8vJsWn9nlI6lcjR37iyuMzM2B0XtkE2zFd/roUnU9hTka93rcWioM
 I91g==
X-Gm-Message-State: AOAM531Z9HsKneF4vr8apUdUPd+0PVlE0oBanwxjlm0adIwc5A2THb3d
 DdweYLi9WcsxgWIleo2uHWiCrXVd0vJCfPcj3mOgUcXO7mzYgllDPVhii2pmnGisn+nbv+2QiYe
 cwU9svTBY4nmhozELhA==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr4144902wmb.183.1601659377599; 
 Fri, 02 Oct 2020 10:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKivAgqNgwoT9UGV0cK6mqKlIOs0tvwQ9X+Xhxvxf1Pw2ZBPzMMwPPjPI8MGEtncnqRZzRxw==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr4144873wmb.183.1601659377281; 
 Fri, 02 Oct 2020 10:22:57 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id i14sm2733353wro.96.2020.10.02.10.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 10:22:56 -0700 (PDT)
Subject: Re: [PATCH] tests/test-char: Use a proper fallthrough comment
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20201002171343.283426-1-thuth@redhat.com>
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
Message-ID: <5e51097c-e1d5-8e78-a4ef-69256d5b0a6a@redhat.com>
Date: Fri, 2 Oct 2020 19:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002171343.283426-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Fri, 02 Oct 2020 17:23:06 -0000

On 10/2/20 7:13 PM, Thomas Huth wrote:
> For being able to compile with -Werror=implicit-fallthrough we need
> to use comments that the compiler recognizes. Use "fallthrough" instead
> of "no break" here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/test-char.c b/tests/test-char.c
> index d35cc839bc..9196e566e9 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -70,7 +70,7 @@ static void fe_event(void *opaque, QEMUChrEvent event)
>              h->openclose_mismatch = true;
>          }
>          h->is_open = new_open_state;
> -        /* no break */
> +        /* fallthrough */
>      default:
>          quit = true;
>          break;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


