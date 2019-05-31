Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWe5W-0002qJ-Hq
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2019 05:44:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hWe5U-0002q8-A0
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hWe5T-000816-C3
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:44:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hWe5T-00080O-6F
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:44:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so1223821wre.7
	for <qemu-trivial@nongnu.org>; Fri, 31 May 2019 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g+7ed+uwrMjQRGI8ZdcsjRc0J1OqCMgBgdTQDPZxKeM=;
	b=AwN0l1GMyDOfosn+GMynjHSPzqG+kE6wr+81kIFymArLUm30p/AUUsAo2QMXXKV6VV
	tyhoRhx7DhEyo2JjA5HlRp6y0E3DunDgAMTNTHmWaGNiG3vuicPjPC5Lfi7vxDIGKcGd
	6YtuvOG5vRXEUePzWxcc2LaO36bYPD7JO09Zl5A8pHee6K9qJPcCApsQHHw4xa3mEZga
	ba2SwmYNMzRh1czGZk/SNoOkQVOQaK3DQFde8GW9u88tQ7ZO6R/2SHd8pR5Vb4YLWasK
	E/ntOzxZVRbQ7Z/7uDyqAZpctNWUSOOMHnfJvSY5jYkbp1SA97n3FMYqAOY2FZeDhJ5M
	0vKQ==
X-Gm-Message-State: APjAAAUn3dE17N/e5pkJGDV7YKNKGzyOX6v0IYAidpDXZSegBIJhaKUW
	mOD02FK+Lzymh7uaSMRVfALBtg==
X-Google-Smtp-Source: APXvYqyGJZkR2z2lOnShCoJ0K+PY6a9wyN+4PBzaexnYRQx7SF+hhf4Uw6tPPBwE1zAwYU770jDCPA==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr5830200wrq.28.1559295873732; 
	Fri, 31 May 2019 02:44:33 -0700 (PDT)
Received: from [192.168.1.43] (183.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.183]) by smtp.gmail.com with ESMTPSA id
	a125sm1676971wmf.42.2019.05.31.02.44.32
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 02:44:33 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20190530173824.30699-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5d985216-8521-f4a2-a9c3-7a00c6066b2f@redhat.com>
Date: Fri, 31 May 2019 11:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530173824.30699-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util: Adjust
 qemu_guest_getrandom_nofail for Coverity
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
X-List-Received-Date: Fri, 31 May 2019 09:44:37 -0000

On 5/30/19 7:38 PM, Richard Henderson wrote:
> Explicitly ignore the return value of qemu_guest_getrandom.
> Because we use error_fatal, all errors are already caught.
> 
> Fixes: CID 1401701
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/guest-random.c b/util/guest-random.c
> index e8124a3cad..00a08fd981 100644
> --- a/util/guest-random.c
> +++ b/util/guest-random.c
> @@ -56,7 +56,7 @@ int qemu_guest_getrandom(void *buf, size_t len, Error **errp)
>  
>  void qemu_guest_getrandom_nofail(void *buf, size_t len)
>  {
> -    qemu_guest_getrandom(buf, len, &error_fatal);
> +    (void)qemu_guest_getrandom(buf, len, &error_fatal);
>  }
>  
>  uint64_t qemu_guest_random_seed_thread_part1(void)
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

