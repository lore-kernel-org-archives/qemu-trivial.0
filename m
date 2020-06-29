Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpqsy-00025d-MD
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 06:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqsx-00023w-4R
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 06:19:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28142
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqsv-0007G3-O2
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 06:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593425972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gIOmuVUTz4GJvqnXTsn4KGEXLAhzbgDObg5/V7YiM7k=;
 b=Vf5m+Yr/WE/Mzw4ypNBxp6fNO3p6dDrfRtr+4NVjk0s39AD1p52fu78PX7t0hnTfzeYGdg
 +38Vj1yMsRSM0Hdw51i+2QPxLGRs7yRqGn+VyQlxUOZZtz3R1zVlhn2tQHGvTlHk+uojNq
 0cPbIe6AW4iNAMUYb1quZdkHHhfqz9c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-nN4FFGHxMBiaJ6cwXP-BZQ-1; Mon, 29 Jun 2020 06:19:29 -0400
X-MC-Unique: nN4FFGHxMBiaJ6cwXP-BZQ-1
Received: by mail-wr1-f71.google.com with SMTP id i12so16308965wrx.11
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2020 03:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gIOmuVUTz4GJvqnXTsn4KGEXLAhzbgDObg5/V7YiM7k=;
 b=F2ZZMwESkKUo83BigcUkP8wtj84G9YJ6f7SOoOlrSLf98UMdo955V4CkWdlFsPBPAE
 4uRbxBz52ktIcd0aLBmqnHFoiGWb/pvKykSrH1OwTrrayzbwErRwYCOz/Qr5fPZBCm//
 ghES489hP/Bmn18pjPRoZwgJLDXyD+o1gU+ai1VpnAlEeAExSbdZLP6Lq9ob3OZf48Bo
 85PmqTu5qgfkp+EUDWHGaz17ana15YYnxr7HaQujcTBs7IaijUET+x5eXMSQnJK1OvGZ
 MIh7q1DtOOhRIRTq+2Y+QPK249uiSdBchr6jJvSgzs2mO6WOArYX/ATdTS5EILew0rWm
 T//g==
X-Gm-Message-State: AOAM531baogIMg6DkoOl4/K9K/iAB5KrAlyUFLkjfqLv27wc3w8tBs8D
 o7P28sQKZupgiJd8GoVaRCmwqj4ko0A6Gn+HkVGUJbUL7oS4x4GbZ+tpA5N6HdEVX4FsYh6PCD2
 5PqD0+CsAj87gqXlG8A==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr15615890wrp.183.1593425968040; 
 Mon, 29 Jun 2020 03:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZIfn7yRazt6qQwzRA6wcX5a8IcEe3G8Ltgxdn5U63PZeKL2dQ4croMZjyOWv2NyRUW7vW3w==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr15615862wrp.183.1593425967778; 
 Mon, 29 Jun 2020 03:19:27 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l190sm27380731wml.12.2020.06.29.03.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 03:19:27 -0700 (PDT)
Subject: Re: [PATCH] trivial: Respect alphabetical order of .o files in
 Makefile.objs
To: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <20200629094934.2081180-1-dinechin@redhat.com>
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
Message-ID: <6e396bb1-ecc9-8f2b-f1b5-68f78b0b156f@redhat.com>
Date: Mon, 29 Jun 2020 12:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200629094934.2081180-1-dinechin@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
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
X-List-Received-Date: Mon, 29 Jun 2020 10:19:35 -0000

On 6/29/20 11:49 AM, Christophe de Dinechin wrote:
> The vmgenid.o is the only file that is not in alphabetical order.
> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  stubs/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index f32b9e47a3..1df8bb3814 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -19,10 +19,10 @@ stub-obj-y += replay.o
>  stub-obj-y += runstate-check.o
>  stub-obj-$(CONFIG_SOFTMMU) += semihost.o
>  stub-obj-y += set-fd-handler.o
> -stub-obj-y += vmgenid.o
>  stub-obj-y += sysbus.o
>  stub-obj-y += tpm.o
>  stub-obj-y += trace-control.o
> +stub-obj-y += vmgenid.o
>  stub-obj-y += vmstate.o
>  stub-obj-$(CONFIG_SOFTMMU) += win32-kbd-hook.o
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


