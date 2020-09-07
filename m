Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFJkk-0000JO-0h
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2020 12:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFJki-0000Im-Ko
 for qemu-trivial@nongnu.org; Mon, 07 Sep 2020 12:12:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21253
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFJkh-0004n9-1e
 for qemu-trivial@nongnu.org; Mon, 07 Sep 2020 12:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599495138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QJ3ySGLm2F5RdkOJa+FxARfpt07Wxn2Vh1ICoKOfuEM=;
 b=TGAnuEeWWba42pwsWq56OnZtYVc8nyoPP99+1JEQ53PX2Ako/+r4DMl59+R2IrqkIHGH3J
 koS6Pcqv19nMVIB52oMnOFeQSUxxkJfqXBvlNtjkZao7tZ4u3dTB0EK3VtQ64txieZZ5RX
 DKnVwrQo/U6bA787gAJV1FvSe7jo6F0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-KOvxvzGJO7m3QP3koSrIlw-1; Mon, 07 Sep 2020 12:12:16 -0400
X-MC-Unique: KOvxvzGJO7m3QP3koSrIlw-1
Received: by mail-ed1-f70.google.com with SMTP id f16so1393762edm.10
 for <qemu-trivial@nongnu.org>; Mon, 07 Sep 2020 09:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QJ3ySGLm2F5RdkOJa+FxARfpt07Wxn2Vh1ICoKOfuEM=;
 b=BLxW+kcYaZtd5PIv0wMEN3ivlOxjDwdRmg0GroSXb+xug3EtUho2z3gap1Acd8o06s
 Y0U134T4ldDQ3l3vVGjbvytLB8fMG6WWmFemaODU4EciAo6uwvuH2tnOjaQ0EZYCbSGh
 LelnLhtfe9jNj3VB2LMCw6QRgOLuL+M3qzxvYoBBMs41tqhyjItbOxWHGU8sOpjXk9GO
 oOkJ7isfIf/IsnIML4NXHd03CLkL72YlVwPxrvSEVzeejrz4An5T+tmFEiW4dZQ+Dlhj
 5VQjW15c3rZ7LexLc+fw6WMxTe0MO0kuDe9AHWfwnfXlp9Og4UWj2nfRFVM98cLwpuGt
 eAzg==
X-Gm-Message-State: AOAM532LlxgpKuke6xYqpnImodeGp4JfW+smTl53Ni6AowpPQRpKV5Fh
 d7QBsSi9hvt3tqic1iGFfaf/FStqW1ulqCDGPmRulps/+uHGMUgIdc41h+wxodx+wIaD63dwYwA
 OoNYQ/H04gW7daE6ycw==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr22254869edr.55.1599495135108; 
 Mon, 07 Sep 2020 09:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwopzjUriSBdYe4ZfYjmGNzMFKvf2y+B+0ogaLP3c/YPQVJRHBMNbP6qX+tpqX+FyeMd8ep4w==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr22254845edr.55.1599495134922; 
 Mon, 07 Sep 2020 09:12:14 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id f17sm3868285eds.45.2020.09.07.09.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 09:12:14 -0700 (PDT)
Subject: Re: [PATCH] scripts/git.orderfile: Display meson files along with
 buildsys ones
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20200907161051.41527-1-f4bug@amsat.org>
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
Message-ID: <33178d75-d99d-d31e-c658-f85be3a7cf3b@redhat.com>
Date: Mon, 7 Sep 2020 18:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907161051.41527-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 07 Sep 2020 16:12:20 -0000

On 9/7/20 6:10 PM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit a56650518f5 ("configure: integrate Meson in the build
> system") we replaced many Makefile by Meson files. Adapt the
> git.orderfile script to display the new file at the same position.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Bah wrong profile :(

> ---
>  scripts/git.orderfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 73fd818d7f3..a021afc2d51 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -18,6 +18,7 @@ docs/*
>  configure
>  Makefile*
>  *.mak
> +meson.build
>  
>  # qapi schema
>  qapi/*.json
> 


