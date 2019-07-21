Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hp1Jo-0006To-B8
	for mharc-qemu-trivial@gnu.org; Sat, 20 Jul 2019 22:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tcminyard@gmail.com>) id 1hp1Jh-0006Ta-QH
 for qemu-trivial@nongnu.org; Sat, 20 Jul 2019 22:11:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tcminyard@gmail.com>) id 1hp1Jc-00069t-3p
 for qemu-trivial@nongnu.org; Sat, 20 Jul 2019 22:11:13 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tcminyard@gmail.com>)
 id 1hp1J5-0005lV-H2; Sat, 20 Jul 2019 22:10:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id o101so36671336ota.8;
 Sat, 20 Jul 2019 19:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+bovzgwNIaowu/9If/S9UV/uafetSfX0BxgWeCFHE/c=;
 b=oZJaxUrszvGOLkisheXp6/Ygzlg/jDaxg2mt84g/DZf9+m+dEDcSC47i/CA649Q5Vt
 n3RN5aLSHM2YUL5lggX9EmXczhOo+n6OtAsIdIIP0rxirbk/60CjD9VVTPh4wawSSVYc
 LC+0lAsL9mj4YdnytcXut+rxRz3P+CF+3sE8vmf+/35+bTu3+/69K4daVzWgcrnFV6+/
 lvpRZIgZC8AsX91Jqminkm3Hh+CnAaRF8bev2zlnWEHlm+xk8ZFSAQ5v+xcPyGnZJU4E
 TBRCaM1SHNr1CzjI5gV0BI9EQdjWAG5Yd2KkfeZaguJg94QtQFriEECgrfXkdA6GxTxS
 RIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=+bovzgwNIaowu/9If/S9UV/uafetSfX0BxgWeCFHE/c=;
 b=rtC30dbqadJqrrZuGrtJSnN+jXJhmZ7qOVlO17V7o18eybVJHCIADGJUYwBIqLkCxj
 Z9x3hftVgnfBFlB7y9f5OuSCSM2YtAzOn/Aa+kn4v9Ldg8XSdXAYtekqfv+TudIaVTEb
 kFVPEG2E97ZYDmXt123JQRH+SjHAgDi4vqseUUXVGXi0US+UYWbH87rJmH89ymRDlZto
 vnZugAgs+Uy4OX/i9TyMJT21DPy8UwgNfSf19gyEy3peM13LjCrahHYpz+qpN8Mf5WPO
 FsMxdBjGFIYWWgTE95JqPqb5cbCYZSRG/brRe3XaaufLjhPyuQ6WiWuydAD9EL5bme6S
 QrDg==
X-Gm-Message-State: APjAAAXNmuY78VlfGTsqnCT/DJNWoPKJ3yfJuVauGyY/NWzSpcKPAddd
 buTbs05YYoXdXdUYbNh/hA==
X-Google-Smtp-Source: APXvYqwO6q2eHI9DweGOcy6aCzokg194JKLixQMGyNqN4/RPG/2EG7UnVGYOfZUh53VIkpa4Lk6TaA==
X-Received: by 2002:a9d:27c3:: with SMTP id c61mr43800996otb.291.1563675034351; 
 Sat, 20 Jul 2019 19:10:34 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
 by smtp.gmail.com with ESMTPSA id f84sm12359350oig.43.2019.07.20.19.10.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 19:10:33 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:dda3:f567:355c:6b0])
 by serve.minyard.net (Postfix) with ESMTPSA id 3C5DF1800CD;
 Sun, 21 Jul 2019 02:10:33 +0000 (UTC)
Date: Sat, 20 Jul 2019 21:10:16 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Message-ID: <20190721021016.GG3066@minyard.net>
Reply-To: minyard@acm.org
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190719131425.10835-5-philmd@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH-for-4.1? 4/7] hw/ipmi: Rewrite a fall
 through comment
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
X-List-Received-Date: Sun, 21 Jul 2019 02:11:19 -0000

On Fri, Jul 19, 2019 at 03:14:22PM +0200, Philippe Mathieu-Daudé wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=2:
> 
>   hw/ipmi/ipmi_bmc_extern.c: In function ‘addchar’:
>   hw/ipmi/ipmi_bmc_extern.c:178:12: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     178 |         ch |= 0x10;
>         |         ~~~^~~~~~~
>   hw/ipmi/ipmi_bmc_extern.c:181:5: note: here
>     181 |     default:
>         |     ^~~~~~~
>   cc1: all warnings being treated as errors
>   make: *** [rules.mak:69: hw/ipmi/ipmi_bmc_extern.o] Error 1
> 
> Rewrite the comment using 'fall through' which is recognized by
> GCC and static analyzers.
> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ipmi/ipmi_bmc_extern.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index c0a8dac346..d4cbd210c4 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -176,8 +176,7 @@ static void addchar(IPMIBmcExtern *ibe, unsigned char ch)
>          ibe->outbuf[ibe->outlen] = VM_ESCAPE_CHAR;
>          ibe->outlen++;
>          ch |= 0x10;
> -        /* No break */
> -
> +        /* fall through */
>      default:
>          ibe->outbuf[ibe->outlen] = ch;
>          ibe->outlen++;
> -- 
> 2.20.1
> 

Well, whatever, this is fine.

Acked-by: Corey Minyard <cminyard@mvista.com>

