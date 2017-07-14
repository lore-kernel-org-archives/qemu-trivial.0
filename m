Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs8L-0007At-5I
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8I-00079g-Qf
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8F-0002Sx-Lg
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:14 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8F-0002Sr-HU; Fri, 14 Jul 2017 00:23:11 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so10786624qki.1;
	Thu, 13 Jul 2017 21:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FTokxPIdn5bxMPYVJhlOUVmlEABmdiok1q/0whGc/dY=;
	b=SVqwxWnWJuIlHYYsGHXCFNyCvUiVZwH4irVTU8lK656QI2J8pye8ksThP84uIy443L
	cWIemA0axpLnmb5O3niC8bmyExSJ09vYVpbaZNGjUFyioQn9CO3GuV/c6AYgvIMFuXpK
	lg30lKq7kQD8plfS/JQrLaY19peiiHzLmYIkOjAhXATIJyXcRenPse9PDZvZ5XUquobF
	4sSxePsKZ+UNQvYC+cIhPbyvamgXKeSZSHs3EiXqV2Xmwgx3BPWMVvo5IdtfbCHjcwmT
	MKo7KUM4ck1RrVv/ATWklsRbElkfQSK2Jb4Q3LYwjIGd/a9sP0oIV6viT27ZKRROWdTx
	zbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FTokxPIdn5bxMPYVJhlOUVmlEABmdiok1q/0whGc/dY=;
	b=kN1wUWuGlE7fBEl2ashdm+U3+5ek+KViGR+QURni6/9iNn9ASQrOrAWvbpvgbfd81i
	+tsJDVeGYctsXbkxIG+6012UMDNS5uSo359s2HmVMOCPrUypm9CzYfL9Dy1w3tIM7IeE
	kSG3jbjLoK29YvVjnnUHnmJ93PJU/6c7h7GCZU3rlhh1nTsvwojMTHHoyF2u+i9PS3Iy
	bjIftRinsdt1tVQl0xlSo/gRF8MaBnpGyVjBfTz7hnu8FvxMGnCcFZEJGAxhxFjwAKJH
	w2t6SCcHN5XqlIhWc48jK8Fw6nPunXl2iQ7AuAG6OFJl4ANbUoOIo6SLrWIQl3Q8Aj8u
	P1BA==
X-Gm-Message-State: AIVw1118ZMVyZo6+Gg6xXDA1ykIZu9Mjpu8oB8v80jcwnZfRqZFso1Kw
	seceScPTmOcBHg==
X-Received: by 10.55.70.76 with SMTP id t73mr8376034qka.41.1500006191041;
	Thu, 13 Jul 2017 21:23:11 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	y58sm6086317qtc.36.2017.07.13.21.23.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:23:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-17-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2dcce37a-b757-7a2d-63f3-8e7984b2692a@amsat.org>
Date: Fri, 14 Jul 2017 01:23:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-17-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH v2 16/29] console: use DIV_ROUND_UP
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 04:23:15 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   include/ui/console.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 7262bef6d3..8024878bae 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -328,7 +328,7 @@ static inline int surface_bits_per_pixel(DisplaySurface *s)
>   static inline int surface_bytes_per_pixel(DisplaySurface *s)
>   {
>       int bits = PIXMAN_FORMAT_BPP(s->format);
> -    return (bits + 7) / 8;
> +    return DIV_ROUND_UP(bits, 8);
>   }
>   
>   static inline pixman_format_code_t surface_format(DisplaySurface *s)
> 

