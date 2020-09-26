Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kM8HX-00065M-2A
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2020 07:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kM8HV-00064n-Dp
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2020 07:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kM8HT-0005GU-MU
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2020 07:22:21 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601119338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xrL19vi8WXvoi3wJR5wG9hBuStNz7G2lwELW4szrFs0=;
 b=iCL2M32hbSa4WczRXUe2eQ+GCpxKPPCGDT1fadnJ6HXF1Z3ikv50ydUXDJbGXh+lz55bOW
 wxqdaR2zDct6ncV8dERw9bKt9Wr9BQzeIblhkOVmipN2O5R31azfq5Iqys2hh5sJmvC+3W
 TrUQV7lqpbVq0fPJN/fgO/j2+SB7aJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-vQMdLfoPPaqgr4Pq5k2I8Q-1; Sat, 26 Sep 2020 07:22:14 -0400
X-MC-Unique: vQMdLfoPPaqgr4Pq5k2I8Q-1
Received: by mail-wr1-f70.google.com with SMTP id d9so2272252wrv.16
 for <qemu-trivial@nongnu.org>; Sat, 26 Sep 2020 04:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xrL19vi8WXvoi3wJR5wG9hBuStNz7G2lwELW4szrFs0=;
 b=P18ECWkrJIGYaHPuBhBnwrbA4x7qV7wlNPuoJl7RXYeRoavzI7jmDMZZTvKB2jacsH
 fm1F65GmwOUmHrVBkETqDjez5E6g8yyIxhXXGiSe0NF6wCR1tkT0DXSbya+hls3WRUF5
 2XKQS7zGy8R0Fqh9WCdO03FU6pbVdS+nbm2TEp9GG7HfR8Lju2+ZBikSAwpNKVADUFAz
 c0WzI/JJcM4BOp79Mi3j61t6ideXiZCgOCBtdPj0iVJ7pIU38vzxVVGir9yAGtrFS/sR
 gzXdwlbgvafb40Rmz/tnMyIEmVR20aj/w7QpW4PGjWrV243yT5bnTIgYya9bADQ527M/
 +nfQ==
X-Gm-Message-State: AOAM532eoJIYMC33w1GCibSz/qMPrynZpEseW1jsIls7QWZfBglCFRff
 mLPKd004DPVZIMtVCKGQm1/bm89184J2ltTJPq5gsqYkWKrKhWs951ucHUCvHHAiCG1dJWAA3wa
 byQKQp0k6vAmTTyiIKg==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr2337144wmi.121.1601119333687; 
 Sat, 26 Sep 2020 04:22:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7vJWY441fbGosMcPAQr2K5o605LCMa9B1Kj/kYogePqHgSnMY5c/5bY9IXLxs42blKGpuMw==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr2337121wmi.121.1601119333354; 
 Sat, 26 Sep 2020 04:22:13 -0700 (PDT)
Received: from [192.168.1.34] (234.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.234])
 by smtp.gmail.com with ESMTPSA id v128sm2365079wme.2.2020.09.26.04.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 04:22:12 -0700 (PDT)
Subject: Re: [PATCH 1/3] Include endian.h for Haiku to solve bswap* macros
 build
To: Carlo Arenas <carenas@gmail.com>, David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqxQ3o_h7_Fwho7gu9x9Pw5jCw=z-goVMyzJgQYqZR-cgA@mail.gmail.com>
 <CAP+75-XwpLiutpW6-J3DLKFGXOVd=tLF2fG2=0=nP9+KZ0UYug@mail.gmail.com>
 <CA+XhMqwWuMrnUsFx7re5K6Yo7UP5xdF5kNaPmVsabf-4LU9Rfw@mail.gmail.com>
 <CAPUEspiBbM1N_=2or8P7VuFtpHNWvcjD2orkUFNOFOW-ytHx8w@mail.gmail.com>
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
Message-ID: <f1cebe94-5017-562e-70a2-12b8ab9e7e8f@redhat.com>
Date: Sat, 26 Sep 2020 13:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPUEspiBbM1N_=2or8P7VuFtpHNWvcjD2orkUFNOFOW-ytHx8w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/26 07:13:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.213, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Sat, 26 Sep 2020 11:22:21 -0000

On 9/26/20 12:31 PM, Carlo Arenas wrote:
> FWIW the 32 bit image (haiku-r1beta2-x86_gcc2h-anyboot.zip[1]), uses
> gcc 2.95.3 as system CC
> a newer gcc (the same version that is used for the 64 bit port) is
> provided as an alternative though

This GCC is too old to build QEMU: since commit efc6c070aca
GCC 4.8 is required.

The image provided by David (Haiku shredder 1 hrev54154+115)
provides GCC 8.3.

> 
> Carlo
> 
> [1] https://www.haiku-os.org/get-haiku/r1beta2/
> 


