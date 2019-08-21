Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0P6W-0003G1-8k
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cminyard@mvista.com>) id 1i0P6H-0002tP-Gx
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cminyard@mvista.com>) id 1i0P65-0005bU-JW
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:48:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1i0P65-0005Z2-E7
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:48:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id r20so1744085ota.5
 for <qemu-trivial@nongnu.org>; Wed, 21 Aug 2019 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=AW9Aza1TEvwspyDbs7aPZWP45Hb1BkJSaT00iSk5rnc=;
 b=GiPg01eBdESO299rYhjWIpjUbq4Xpd29s6Adekes/DX/h/arsBWeEoxHNVi79v55Ih
 1KnL6/icq54vZAyyOyu8YvgMJaLz4c9yFh+caWcn7O60lSIknqlAhJsb2wVWXnfdrO9L
 UZnyuOPCSTS0UnYdhpyeKSl0OppVhHfHLmPsght/VXoHqJM/8jGxANCb/BvXeJRM8rPX
 wzICbHNWCMYl9P+ZMv+DbKQ0VB4u4aFjMMkI0zKK2v1ptVOczslDjcyMa0iecHcijc5h
 SRwNzhcCvHqHAoPu+dPfTwmibZnB5AzRzlPYTPTDzOudfDuyIrUGjs87nM8fKKpY+jJK
 XJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=AW9Aza1TEvwspyDbs7aPZWP45Hb1BkJSaT00iSk5rnc=;
 b=Ve5YIt3oGur7H1htQEEalvpt73B1jumyTT3jcbgVhDAo4VSf+jzNu00DIS4sEf78PP
 dcIghPGXWe+n3of6PJ1KeaX2mmD9WRWh3/s7DX3rd3oolOfw/bzBPrysfi2+t6lXeSUd
 roi+J9A0ZczeSAJNTcKOq84GFfsswajgU7CiWG++Gzi9qMSJZ6GpiMqYgEyhlu56Vk5y
 6FW/r3qz0DqiIdfSraYW8VvqvyqJsDlm9PnQ2LM1tj6xVv2XI2rZcnv4GxzxmVSNdqph
 iIHxFZJTcHcvG3vB8gehD5S+X2SDm+iBtJ+T0b4TEP4DmvA2zvRLw6A3oeQOFRcQJK58
 Pggw==
X-Gm-Message-State: APjAAAW5djdWflb6lr1JC+EAZ7lINJASYMcpbieFsxEDCsvwrPfdYHP1
 xOVs8PkRDAS3NFk2HEbXDxgRWQ==
X-Google-Smtp-Source: APXvYqwDtdO58I/k0iMqEil2P+W+x0BKb6ScBD+vA1OBd9B83cgx6sFuLV9qRMDK7xN26KGwn3CcjQ==
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr3948668oti.182.1566388090578; 
 Wed, 21 Aug 2019 04:48:10 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
 by smtp.gmail.com with ESMTPSA id j6sm7437156otq.16.2019.08.21.04.48.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 04:48:09 -0700 (PDT)
Date: Wed, 21 Aug 2019 06:48:07 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Message-ID: <20190821114807.GT445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190821111947.26580-1-laurent@vivier.eu>
 <20190821111947.26580-10-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821111947.26580-10-laurent@vivier.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [PULL 09/14] hw/ipmi: Rewrite a fall through
 comment
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
X-List-Received-Date: Wed, 21 Aug 2019 11:48:32 -0000

On Wed, Aug 21, 2019 at 01:19:42PM +0200, Laurent Vivier wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
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

Looks good, thanks.  I've pulled it into my tree, but if you want
to queue it someplace else:

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Message-Id: <20190719131425.10835-5-philmd@redhat.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/ipmi/ipmi_bmc_extern.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index 573428eca1b2..87da9ff99cf5 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -177,8 +177,7 @@ static void addchar(IPMIBmcExtern *ibe, unsigned char ch)
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
> 2.21.0
> 

