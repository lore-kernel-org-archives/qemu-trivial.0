Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrlJh-0008SY-0C
	for mharc-qemu-trivial@gnu.org; Sat, 04 Jul 2020 12:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrlJf-0008S5-EM
 for qemu-trivial@nongnu.org; Sat, 04 Jul 2020 12:47:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53138
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrlJd-00075m-HB
 for qemu-trivial@nongnu.org; Sat, 04 Jul 2020 12:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593881220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tUnP0Wk+S20UiKNkYK+bT8ylXVFKHlZoWY6QjHpV6JA=;
 b=cOBJe5lXbwQPlnnQ4gRx8bEoSEOw3si6YlnLPefr81le4vHXWkvDWK6iEcFhmbSgdLmx6o
 uVF/D/zoGtJ93X0pFtIQTrsjoA38q+Lh+SvxJqxmnYFUnOIcUuEBnwJhrHlHgqJgPRK0sz
 dG1kKTnVOU7NUsnN6MXjLd4Qlb7y/EQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Q30Mge68MyC9pHuWt3JFRw-1; Sat, 04 Jul 2020 12:46:57 -0400
X-MC-Unique: Q30Mge68MyC9pHuWt3JFRw-1
Received: by mail-wr1-f69.google.com with SMTP id j16so30808221wrw.3
 for <qemu-trivial@nongnu.org>; Sat, 04 Jul 2020 09:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tUnP0Wk+S20UiKNkYK+bT8ylXVFKHlZoWY6QjHpV6JA=;
 b=OyuPZ3Lx71wnz2FySlTIySgHXqW9A1p0hykvNen+9txmNSKpMpBi+sm+VbBNvez/vb
 7oIOjX5NjFESn/UiK+E8bxAtOVSbSip94KZnQtGSlrRqiL7+Yp8qZiwY8bwEaEsllzr/
 sqDD/93R7KZW9VFDBZnNuaRTHc8ew7zQLdlti50s08Srv6BdRGrWOv0dnCDkJ1m6T2rc
 FIT9ITZB+6KW8En6/bLdSJFMTypySAmwDJlK4N6GZ4tTaEcAvinDBpWk6AxtkSiidgEp
 zUvLCd3UVWeBk7hfxZ2ZvLC5qgVlv+Iu3Me9koorngWQvwJrHUOdhWKRjTRkeeoIzzBj
 LvUA==
X-Gm-Message-State: AOAM532D3pMYVsXs242EhudZujQJI/fFcJx0wj6peWiW2UMy89KSv3xu
 osmrhkBbXB5rxTNA4FAuKt3egD2iUgOV47qpgditvSzfimXOsGd5QxPboTms7LZRZku0Mo8kVA2
 d8pMS1IZfKeNB0D7Opg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr43252782wmb.61.1593881215970; 
 Sat, 04 Jul 2020 09:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBdTCRNZgA4yWRcw+aa8QhvXOHUS820A8U8jU6jBOUOUlk9dey3abvuI4X2mFVLHBXwwncdg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr43252759wmb.61.1593881215700; 
 Sat, 04 Jul 2020 09:46:55 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v18sm18334219wrv.49.2020.07.04.09.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 09:46:54 -0700 (PDT)
Subject: Re: [PATCH v2] util/qemu-option: Document the get_opt_value() function
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200629070858.19850-1-philmd@redhat.com>
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
Message-ID: <6f29f849-ca31-86b7-6b97-f0dbe8c5b52e@redhat.com>
Date: Sat, 4 Jul 2020 18:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200629070858.19850-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
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
X-List-Received-Date: Sat, 04 Jul 2020 16:47:03 -0000

Cc'ing qemu-trivial.

On 6/29/20 9:08 AM, Philippe Mathieu-Daudé wrote:
> Coverity noticed commit 950c4e6c94 introduced a dereference before
> null check in get_opt_value (CID1391003):
> 
>   In get_opt_value: All paths that lead to this null pointer
>   comparison already dereference the pointer earlier (CWE-476)
> 
> We fixed this in commit 6e3ad3f0e31, but relaxed the check in commit
> 0c2f6e7ee99 because "No callers of get_opt_value() pass in a NULL
> for the 'value' parameter".
> 
> Since this function is publicly exposed, it risks new users to do
> the same error again. Avoid that documenting the 'value' argument
> must not be NULL.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Drop confuse comment (Damien Hedde)
> ---
>  include/qemu/option.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/qemu/option.h b/include/qemu/option.h
> index eb4097889d..ac50d25774 100644
> --- a/include/qemu/option.h
> +++ b/include/qemu/option.h
> @@ -28,6 +28,19 @@
>  
>  #include "qemu/queue.h"
>  
> +/**
> + * get_opt_value
> + * @p: a pointer to the option name, delimited by commas
> + * @value: a non-NULL pointer that will received the delimited options
> + *
> + * The @value char pointer will be allocated and filled with
> + * the delimited options.
> + *
> + * Returns the position of the comma delimiter/zero byte after the
> + * option name in @p.
> + * The memory pointer in @value must be released with a call to g_free()
> + * when no longer required.
> + */
>  const char *get_opt_value(const char *p, char **value);
>  
>  void parse_option_size(const char *name, const char *value,
> 


