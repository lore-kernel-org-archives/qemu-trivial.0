Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs8c-0007Nz-OM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8X-0007JZ-TL
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8X-0002Vn-0J
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:29 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36819)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8W-0002Vj-S9; Fri, 14 Jul 2017 00:23:28 -0400
Received: by mail-qk0-x242.google.com with SMTP id v17so8479882qka.3;
	Thu, 13 Jul 2017 21:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j4gWDwDdx0Hi4wxeJNLjnpO+knLqk/Kknn8y60/4NtI=;
	b=hs4+jpEUEMD/P53j13oTtj4Ebx5Itb6a+Unafla7KhQGbk7vbZhGLKmTJkz2vvB9Zh
	H0ZuAu9flWiQwbLik2Lr82jn8ktmIIP7vMtpj01EmVB01pekIbn+01DLCGujkdBCaMiH
	MilYXTYYM8/WydxcX1bDr26zXe1JNcBj/egLniZGCxPLYIQg657mgyS9pyHMH9msdP29
	103XBmI84yXwUvI7fsOjKn8U/Hcsjy8XD8lKxFm/ZFJ5TA7ASJBaLggM9/LTh0FtjPS1
	4Yp58QOOcahoGLKQE0lga4vfNH2TuqV/d7CdXQHhiff3OWlTh2PuG9f9b5dE0zo2Ifni
	jBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j4gWDwDdx0Hi4wxeJNLjnpO+knLqk/Kknn8y60/4NtI=;
	b=i6C+b271/0qtdyOUGinyXqtU/wN5ohTsXM58FWSRq/tGpumv7PxKTFR+Yemgw6HkUS
	qGoTAcuoXEGWNcPOCsRn2tmc2wwDWo1J338e9KQrtsa6tCtezsfpAeqN6j5qF3qc9HuF
	2L3fQmWULZurFUoKnD3RPKmclXapzAsVfXgLbv+dAKXgaLScjTTY7hhKgchvPu0jX78N
	Wm8Chs/7QAEvxYi8B/H9wiR9U4IQSSssInptx0GWcL6djPHyBGJrczP7Y1Kc5ctETYVP
	SaoSvxMVaD04DtHigFxZQodpKwMKrngp9zkX4fOFU6C64TxPpgnQNBewd6bE4KfxlOxI
	yX5A==
X-Gm-Message-State: AIVw110pXfYpa6gTnhQ/x3kv4Y+yRsLLYAL/qp+qUyTOnxBJftvgbdaa
	42io9RZFBlTVTw==
X-Received: by 10.55.146.133 with SMTP id u127mr9529843qkd.17.1500006208423;
	Thu, 13 Jul 2017 21:23:28 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g39sm6219601qtc.12.2017.07.13.21.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:23:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <498283b2-0a64-dc41-5a05-583971022b72@amsat.org>
Date: Fri, 14 Jul 2017 01:23:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/29] ui: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 04:23:33 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   ui/cursor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/cursor.c b/ui/cursor.c
> index 5155b392e8..2e2fe13fa6 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -118,7 +118,7 @@ void cursor_put(QEMUCursor *c)
>   
>   int cursor_get_mono_bpl(QEMUCursor *c)
>   {
> -    return (c->width + 7) / 8;
> +    return DIV_ROUND_UP(c->width, 8);
>   }
>   
>   void cursor_set_mono(QEMUCursor *c,
> 

