Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daOET-00073j-Mk
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 11:28:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1daOES-00073Y-GI
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 11:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1daOEP-0002Mn-A0
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 11:28:16 -0400
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1daOEP-0002MB-55
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 11:28:13 -0400
Received: by mail-wm0-f49.google.com with SMTP id m85so70836088wma.1
	for <qemu-trivial@nongnu.org>; Wed, 26 Jul 2017 08:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J06TL7lJ+stV2QruT7z14+092fCt0gi+K4xRtpf4JKQ=;
	b=Mkb+gkooT5RCRwwjrQ0Lm1aNBaL4wnLEty7Lld9P4ulk1wF05xBxFEJk1dXRBREYip
	AglFsad0CtitmfrHkC7vd4SMN3h7MR229aCwPpWQGPjKu5tg72onB4fAhsuhjdfX7Ort
	yQrQGQQ1UG2kEC8GjO2srgHgJWMJs9BimLvQg9UZEUoIhWXYzslWIBn9tdTdsk+uxPYe
	G5e1rIR5qj4e6mQyiDn1uxnFoHKggCbN8eiwLc1y5Cf89+DlRjagW29N0x7IIDD/dT/R
	aI5LAr4IAHB2qHjV7Rl25Rg0o7s6PYA1+uWqIEHVNXcPHy2m907bkYmQ+QBC3jRz5MCz
	hM1g==
X-Gm-Message-State: AIVw113IvNLjl1uzHkz74Lg6hpdbzUUpsENYYM6hcB+djMw1zMzQmFkd
	rCcwTzKDUAV8m4CGbgjMpA==
X-Received: by 10.28.135.193 with SMTP id j184mr1034219wmd.96.1501082891884;
	Wed, 26 Jul 2017 08:28:11 -0700 (PDT)
Received: from [192.168.10.165] (94-39-195-172.adsl-ull.clienti.tiscali.it.
	[94.39.195.172])
	by smtp.gmail.com with ESMTPSA id n19sm210302wmd.40.2017.07.26.08.28.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 08:28:10 -0700 (PDT)
To: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20170726150446.20381-1-otubo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4568463e-566f-538b-9be2-dae026670378@redhat.com>
Date: Wed, 26 Jul 2017 17:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170726150446.20381-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.49
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix qemu-system-unicore32
 crashing when calling without -kernel
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
X-List-Received-Date: Wed, 26 Jul 2017 15:28:17 -0000

On 26/07/2017 17:04, Eduardo Otubo wrote:
> Starting qemu-system-unicore32 without the -kernel parameter results in
> an assert() returns false and aborts qemu. This patch replaces it with a
> proper error message followed by exit(1).
> 
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> ---
>  hw/unicore32/puv3.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
> index e9d1a60b6f..ff62efb4df 100644
> --- a/hw/unicore32/puv3.c
> +++ b/hw/unicore32/puv3.c
> @@ -92,7 +92,10 @@ static void puv3_load_kernel(const char *kernel_filename)
>      if (kernel_filename == NULL && qtest_enabled()) {
>          return;
>      }
> -    assert(kernel_filename != NULL);
> +    if (kernel_filename == NULL) {
> +        error_report("kernel parameter cannot be empty");
> +        exit(1);
> +    }
>  
>      /* only zImage format supported */
>      size = load_image_targphys(kernel_filename, KERNEL_LOAD_ADDR,
> 

Cc: qemu-trivial@nongnu.org

