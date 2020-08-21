Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k99hJ-0000DH-DT
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 12:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99hI-0000CN-Na
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:15:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48238
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99hG-0004r8-30
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598026517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eUgoO24hS+D6zjzqUvY62NzTgMyiy1iDv24lMut+jR4=;
 b=dL3LSmpFFgv3SOxal+2Hb99QdM0hSJixy+xBmGc48qyjVhMTXRhVjtshkr4J9qjy2sL1Km
 6Irqggy7ZUKYS3lIsUQchxUfLG4Kf0gYKaKtPR+I75f3vHYdoluCnpjnvd3lNsBOrsBxVt
 qE6DhJXmzblfWkWHzYB8GTzEiR2Q6xQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-lpSC96YENXGZJ2bJPZryEg-1; Fri, 21 Aug 2020 12:15:15 -0400
X-MC-Unique: lpSC96YENXGZJ2bJPZryEg-1
Received: by mail-wr1-f69.google.com with SMTP id g3so561722wrx.1
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 09:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eUgoO24hS+D6zjzqUvY62NzTgMyiy1iDv24lMut+jR4=;
 b=Q9DqI6FogK6CCWkQs38UiS5qa/8E7iZJJEoP1PHmbRVp6h1qpugwuO1iOG1TZiVrF3
 uZA3OKaBVReEaOUmkOnW4s54ktIJsgsX3gGjaCcVPzkOGTgP2QrUY9y4e5/PT2aciXFx
 Rx8XoMB+dU9QSCb5d4Me1PDN2AV34ePp8azuTFgO0JAllq1OVi0HuPviiwSfmaUSqnLI
 AITU3+iBARQI4ImLIk/GqIBLgcATvvfnb7BNfg61SFNe14JYpqOb3uw/cB2M+utLw/a+
 CHcJx2RuxnfKxSkIEmwkIyghTvrI8a9QyiJ2NCyK1Adn3HliV3FKFDx3VcyaxS139jLo
 QIlw==
X-Gm-Message-State: AOAM533q2HEw4zl7H3JSuJH0aWbOb7ocGGJbkclB7+AZAnZLsrI0OaPF
 MipTgpbSA4zZ9utXBNhrQc0o7bIkq1GPr3ghXPPUkdviVRkUm8RjlV382pdx9TkJ/ZQIByg+ktx
 UTC6GnQDW4dkycnQn4Q==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr4188577wmi.65.1598026514239; 
 Fri, 21 Aug 2020 09:15:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGIehxxQAFYL6xRhiI7wrpmMdYq9F8CjQ+bKqniyTq0imgfHPr+lDccWiiCVSg6czwPAmkSQ==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr4188562wmi.65.1598026514078; 
 Fri, 21 Aug 2020 09:15:14 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id h5sm3296731wrt.31.2020.08.21.09.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 09:15:13 -0700 (PDT)
Subject: Re: [PATCH] configure: Silence shift warning in version_ge()
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20200821151416.1240494-1-philmd@redhat.com>
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
Message-ID: <a70425ae-734e-325f-8a06-72b3829d8b37@redhat.com>
Date: Fri, 21 Aug 2020 18:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821151416.1240494-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 21 Aug 2020 16:15:21 -0000

On 8/21/20 5:14 PM, Philippe Mathieu-Daudé wrote:
> As we might expect less than 2 argument, only shift again
> if there is arguments to shift.
> 
> This fixes:
> 
>     ../configure: line 232: shift: shift count out of range
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 4e5fe332110..cf044ad2d25 100755
> --- a/configure
> +++ b/configure
> @@ -229,7 +229,7 @@ version_ge () {
>          set x $local_ver1
>          local_first=${2-0}
>          # shift 2 does nothing if there are less than 2 arguments
> -        shift; shift
> +        shift || shift

As Stefano noted, this does not work as intended, so please discard
this invalid patch.

>          local_ver1=$*
>          set x $local_ver2
>          # the second argument finished, the first must be greater or equal
> 


