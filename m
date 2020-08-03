Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2Xts-0005fD-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2020 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2Xtr-0005ey-6W
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 06:40:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42211
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2Xto-00009v-Pg
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 06:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596451255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PeebLyrtgcCSb/7QihtGi620myhbHVKajsU0CKZTXN4=;
 b=jPMlqwbC7CkZK8VshVfFi5hGaVAaZe/y/srKIEyUDMFxo/uflP+LxK66hSUevWEV7Mj1yQ
 gpRtXykCKG/OrOKzcJiIQvGJduc0ncxaD69FWG+E5NBnTGaWBjFLje2vMWq5PVrfZS6XvM
 B69aTr3JtexJefkEiHfUnZ9VX2VL5kw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-yebBWvBGPMikYSakjv_TaQ-1; Mon, 03 Aug 2020 06:40:53 -0400
X-MC-Unique: yebBWvBGPMikYSakjv_TaQ-1
Received: by mail-wr1-f70.google.com with SMTP id m7so11474533wrb.20
 for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2020 03:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PeebLyrtgcCSb/7QihtGi620myhbHVKajsU0CKZTXN4=;
 b=eKKdxyAHLW4A76KlSmNnJpKZsciT1+HxrlNkRxdg/VNu/T8dxdEF8dv4iJ+jRzJ9WD
 c0E+ptdxr+JjxdTRKyZrgGamLgqbQAG/Eov2FJoLxtx6nn+sBg6leEh4f/q6y6rHY0Iy
 Oa1/DFWcbxYfzHnd8GU2q84lUfP4dzf2Ye0O6my9Kji015+n+Q70wvpU7O8Vp32zHN43
 d9gRcIQWcVPYRVp1ejf6eZwpB8NERH6YBUHpPdrnvWl1yGusW2QG0S7m88mgVF/yFPCZ
 POCSGARFuKyrIgUxA8pltH5dZ4XSYyF9tvcqrCi9tUxyB8wCZT6e5x+VDwhoJ65Ap6bG
 bY0A==
X-Gm-Message-State: AOAM533O4j08qZQYbHYsgypM0fdTGpI06EfFH3OY+dd4jI4K4G4lAG4n
 l94wAYMDosXiBGSLShmXUE+ysNDGE2ECKZaTix81fTXCW5cCKOSY9cTo7odOKzzPJ4d4Tddq4YM
 ULDazqnFRfjjvRg7PjQ==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr14628324wrf.206.1596451252073; 
 Mon, 03 Aug 2020 03:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye60xoX9EEeqHCd6vgQlCT/pQUHdQWEUHYYihljv/wCbuKZ2hWsoYvohzGDBlDYhe4Qy1eBA==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr14628309wrf.206.1596451251854; 
 Mon, 03 Aug 2020 03:40:51 -0700 (PDT)
Received: from [192.168.1.43] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id i9sm23355211wmb.11.2020.08.03.03.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 03:40:51 -0700 (PDT)
Subject: Re: [PATCH] tests/Makefile: test-replication needs CONFIG_POSIX
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20200803070554.21655-1-thuth@redhat.com>
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
Message-ID: <d32638fa-d01c-09cf-d919-5304f30338b8@redhat.com>
Date: Mon, 3 Aug 2020 12:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200803070554.21655-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 01:24:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Aug 2020 10:40:59 -0000

On 8/3/20 9:05 AM, Thomas Huth wrote:
> test-replication uses sigaction() and friends which are only available
> on posix-like systems.

"POSIX-like" (acronym)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 1e5ca3b585..430119db74 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -155,11 +155,13 @@ check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-afsplit$(EXESUF)
>  check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PRIVATE_XTS)) += tests/test-crypto-xts$(EXESUF)
>  check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-block$(EXESUF)
>  check-unit-y += tests/test-logging$(EXESUF)
> -check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_REPLICATION)) += tests/test-replication$(EXESUF)
>  check-unit-$(CONFIG_SOFTMMU) += tests/test-bufferiszero$(EXESUF)
>  check-unit-y += tests/test-uuid$(EXESUF)
>  check-unit-y += tests/ptimer-test$(EXESUF)
>  check-unit-y += tests/test-qapi-util$(EXESUF)
> +ifeq ($(CONFIG_BLOCK)$(CONFIG_REPLICATION)$(CONFIG_POSIX),yyy)
> +check-unit-y += tests/test-replication$(EXESUF)
> +endif
>  
>  check-block-$(call land,$(CONFIG_POSIX),$(CONFIG_SOFTMMU)) += tests/check-block.sh
>  
> 


