Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFagL-0004th-1M
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 06:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFagJ-0004t5-6a
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 06:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFagG-0007UB-P4
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 06:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599560211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WebVfCtnzcOU4ZkzSEdxHDvpViAhpGMs/3FbW1ey17g=;
 b=jTqGZgp2pdU5oZj2Wx36TqJavObHWC9DwU1UF1v5IDO4jhG9gZhxA4UCa+k/sjbShNCr5B
 no6mksx9fCTtLLB+Arg4dGoLM7rwPGfzEqChrkmUU8+VFN2ffyKZc5eJLg16a6KJQClWFT
 ACDlBgjqE5Vj0DivCG8e00IlJnIchOg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-orZsmoBtM6W8JcCnas5kMQ-1; Tue, 08 Sep 2020 06:16:48 -0400
X-MC-Unique: orZsmoBtM6W8JcCnas5kMQ-1
Received: by mail-wr1-f69.google.com with SMTP id s8so6766610wrb.15
 for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2020 03:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WebVfCtnzcOU4ZkzSEdxHDvpViAhpGMs/3FbW1ey17g=;
 b=F8Lj79RsfsGvh3cWW6vMhHUjrREHfNNkUO84nIUJ3J/LhMGHHA1icO9UIgojiD5zO4
 Zn0XleM9SDBegKhQnjqtRsUWNkyohqzTByCb1qzsPd9FmAifGBDoYHYrWeA+OPkddy8M
 V9VpBTNH6bYwCUPD+DMmvnZIT5f3izyAIp6KL6DvtcjogxAMs4vTZpOmcYwTXomBi3LB
 BOTy+zLTkKELBfwzfVZvZg7LYwGWbrDJRbnNpKbvJlFA58rUO0d9VUmi8OOl/3s1osV5
 Jpliuwy7AZgkgyqxRXiOSyoywHLwHDgYOwwfUw/xuPTloI0IDJPFsizh7tKkHqQLhvnh
 Ts9g==
X-Gm-Message-State: AOAM530DiBE1epbtrrJaxPTmnkPzLaxMEi70ZOeFUmAMblCe58huG0vK
 D5e5g7F4A/2909N2L5o0glBHFlBSnmJ/l8+62dkODuLtSO47nkYxnGJSbYcbCnKr+TYv13RmlsR
 Fm7KYfHxQ1ytoFwRcrQ==
X-Received: by 2002:a1c:bdd4:: with SMTP id n203mr3635581wmf.119.1599560207243; 
 Tue, 08 Sep 2020 03:16:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ryuJQP/6Z2aB2Del9AHjSgI50XxJYIPIVTbIVwSD7QiTiPpAAqW8k57keohNUrLRo0+ghw==
X-Received: by 2002:a1c:bdd4:: with SMTP id n203mr3635562wmf.119.1599560207011; 
 Tue, 08 Sep 2020 03:16:47 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id s2sm22943403wrw.96.2020.09.08.03.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 03:16:46 -0700 (PDT)
Subject: Re: [PATCH] kconfig: fix comment referring to old Makefiles
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20200908094244.26327-1-pbonzini@redhat.com>
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
Message-ID: <683ece2d-43db-064c-4458-20abc3de837e@redhat.com>
Date: Tue, 8 Sep 2020 12:16:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908094244.26327-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Tue, 08 Sep 2020 10:16:55 -0000

On 9/8/20 11:42 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Kconfig.host | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Kconfig.host b/Kconfig.host
> index a6d871c399..4af19bf70e 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -1,6 +1,6 @@
>  # These are "proxy" symbols used to pass config-host.mak values
> -# down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
> -# these two need to be kept in sync.
> +# down to Kconfig.  See also kconfig_external_symbols in
> +# meson.build: these two need to be kept in sync.
>  

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


