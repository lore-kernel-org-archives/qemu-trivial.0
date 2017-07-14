Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw8K-0007zG-3Z
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw8I-0007xj-9n
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw8H-0002MG-Et
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:30 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw8H-0002Lx-AL; Fri, 14 Jul 2017 04:39:29 -0400
Received: by mail-qk0-x244.google.com with SMTP id a66so10273901qkb.0;
	Fri, 14 Jul 2017 01:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oW/40XQXJbpMXkAozMgnh0lQuGdFJyc+je4EF9Ppu84=;
	b=oo+eOcCjSR+Gf+2xy00BfbaPgNI56OaNfqdEkYAjX0H003j9mWbP+kwTueP8lO+E16
	RKttes8zz3bnEaPm04GU9OnB3VuysdUnwaTqvobRrZJsyE/05XN3Oq5MUMhnvH0Fyo6W
	z0Z9W7lTmTCJqgSxWAY6hE/rYUQeOOKqn7pkOA66iqAbiANBxS0Ii+GHa/DjT4yw/QMZ
	UHHO2wzaXc79lHhiVS23XYl6vyu+xnVyjSL5XR0omnhSBoNDYhzbRpWqi+QPHcVzO/W/
	EMnB8tcBLmjWTt8qze0XTgBPU8M+uvAVYetHgbjbA9WF/YNWq2f85aos19k9nv1z981x
	52Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oW/40XQXJbpMXkAozMgnh0lQuGdFJyc+je4EF9Ppu84=;
	b=WPnf3kNH7/mAnlkCfk4Fas/9t4sH0DG7ToS6ttMM7IA10r1YC24d/NwviJuL5IKMLA
	xt/VhSyonG8X8ojduNyBaT2jbcigDW4GV4bwy7w4ZEdJCFHmV3p9SebcGYeMz2sEZGea
	S5imbWlIinurztwZBUnibNO6Ol2BhACtzVXKuOArs6Q/j4oJptOlPZfT5KmBBKEGWYSQ
	imYBEIi9/z7dEiC6216PWvs6PZVxASrh1IVaEqZTs6/20Pj0I3z1cHtkCbVhgPvwvuuH
	WlRIW8sJUNGCSNANvBTYjgEd4nDzNKcQ7yRcZOypL6nSrpQwWWzX4E2rSKtn2siesaKn
	P2uw==
X-Gm-Message-State: AIVw112cmnVO73BWOv/8oOa9lo9K+5TQXTf8OrfuKRRzfOwhNd6zeiwk
	o49jzPhqE1snYA==
X-Received: by 10.55.81.198 with SMTP id f189mr10563042qkb.82.1500021568793;
	Fri, 14 Jul 2017 01:39:28 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	y17sm6439711qtb.37.2017.07.14.01.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:39:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-19-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e94f793a-39cf-4862-278f-371deae7c42e@twiddle.net>
Date: Thu, 13 Jul 2017 22:39:24 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-19-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 18/29] piix: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:39:31 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/pci-host/piix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

