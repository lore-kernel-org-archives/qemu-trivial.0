Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyhaX-00070q-0W
	for mharc-qemu-trivial@gnu.org; Tue, 26 Feb 2019 13:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gyhaU-00070U-Lx
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 13:36:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gyhaT-0000rx-J9
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 13:36:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gyhaT-0000oQ-AL
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 13:36:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id n19so3415777wmi.1
	for <qemu-trivial@nongnu.org>; Tue, 26 Feb 2019 10:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=90kB0p17FsuY2A/CfNKFuoVXR9x3rdM0ahSNbS3aJcU=;
	b=nFP3dBdoKIryFgUpIxjeYhGcF7eko0RRvvk9E4ecp39sQnyQni/5AnCKewvVGcUP2Z
	KV1uIMAbfHKU1xcqMqrl7XM6q8vLdkLZge7UXPmSrJTm60vEmvuhmSxNGAnFWWZu87kw
	ES6T4hFPLuJnAgITNRecJTpWQhEQCCR+ZjW+Uk75jDKhnn+xIVgfQdiR8u5hBG2byZMH
	JU7Sv5SjYwOzH2aEocYFhFiRXI8Ld+067vqETVyZPZqrZzIGey6iz4uuMw+IAKEvbjLV
	6kjncl9zDcpNVriQqsNu849tCzAkRh3JH3edRG8hdE01BtcMKasWrwYulMEs/rR0chdd
	/5Ig==
X-Gm-Message-State: AHQUAuYZbQ/0GEzAc3Vl5LcJtq3Zlz8bKM3ZNfEDt5M40+Rr73xvrOVe
	AcHyt4yjARFi2hGxWFZ/W+eckA==
X-Google-Smtp-Source: AHgI3Ialn1mM4IkWRjF0h9/ZqeAztmivW8mSUm+BNnDK/81D+z46jbPMNM+H+9ykwDgiOm1zy9ZBAA==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr3550836wmj.152.1551206175421; 
	Tue, 26 Feb 2019 10:36:15 -0800 (PST)
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43])
	by smtp.gmail.com with ESMTPSA id a8sm275166wmh.26.2019.02.26.10.36.14
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 10:36:14 -0800 (PST)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
References: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6e2fa68d-2d4b-d0ee-bc03-c1cd1c7a8cc6@redhat.com>
Date: Tue, 26 Feb 2019 19:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bswap: Fix accessors syntax
 in comment
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
X-List-Received-Date: Tue, 26 Feb 2019 18:36:19 -0000

On 2/26/19 3:21 PM, Greg Kurz wrote:
> All accessors that have an endian infix DO have an underscore between
> {size} and {endian}.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/qemu/bswap.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index a684c1a7a298..5a70f78c0ba4 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -255,9 +255,9 @@ typedef union {
>  /*
>   * the generic syntax is:
>   *
> - * load: ld{type}{sign}{size}{endian}_p(ptr)
> + * load: ld{type}{sign}{size}_{endian}_p(ptr)
>   *
> - * store: st{type}{size}{endian}_p(ptr, val)
> + * store: st{type}{size}_{endian}_p(ptr, val)
>   *
>   * Note there are small differences with the softmmu access API!
>   *
> @@ -293,10 +293,10 @@ typedef union {
>   *
>   * For cases where the size to be used is not fixed at compile time,
>   * there are
> - *  stn{endian}_p(ptr, sz, val)
> + *  stn_{endian}_p(ptr, sz, val)
>   * which stores @val to @ptr as an @endian-order number @sz bytes in size
>   * and
> - *  ldn{endian}_p(ptr, sz)
> + *  ldn_{endian}_p(ptr, sz)
>   * which loads @sz bytes from @ptr as an unsigned @endian-order number
>   * and returns it in a uint64_t.
>   */
> 
> 

