Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDo7O-0002Dw-J0
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 06:36:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hDo6w-0001pA-IK
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 06:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hDo6v-0000uc-Iu
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 06:36:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34245)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hDo6v-0000uH-99
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 06:36:13 -0400
Received: by mail-wr1-f66.google.com with SMTP id p10so20236011wrq.1
	for <qemu-trivial@nongnu.org>; Tue, 09 Apr 2019 03:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hpXbdlw7PdaJYcTg8shkgWQ2Iuma1R4+F70kszDPHKo=;
	b=IipgHPcL1b7yaYIxxLVMzUlx+RsxnyOfxZLYXBQ46TvTbIf7ECsWQ50hhtAI4z4UM2
	roYGA5IONpqO4WhyOlo54mU38VEXYbo0SrkmBtR4dah1nsThj2mEY1R2xml8e1UEBj3K
	jUHLUr9P/XZ+WUChHo+EAr0M9Sjw+v00aU4iGtNWbLB9wEtSOEC59wd/BoyKH9xIPhfw
	2CcrQzNzcRPM++IU45XEeoz+4VC5rVJeNqVj226RloYwzpE4dt4B9rssgTz+ow2wr58s
	euNioTyRNjxguA9H5zXMCqAbBafXTL2S0oBRBxTSbHTJx0GjMdt+HhIX3nq84NkIwMWH
	aOAg==
X-Gm-Message-State: APjAAAWYGRu/0cghWZNjCOkoMyY3wJYiMzA0dLXnbsQdCKpnoKIJwuWP
	6o6e2KtmXPd2uNGbJ7UPKi17bw==
X-Google-Smtp-Source: APXvYqxklrCWIpD2Olf5JdGnPGnMli0oiEY/8D0lPN8Y0r45jVT932I2voQrfjjcJPjk2C0cgIObew==
X-Received: by 2002:adf:ec4e:: with SMTP id w14mr23215431wrn.53.1554806172283; 
	Tue, 09 Apr 2019 03:36:12 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	s18sm13917651wmc.41.2019.04.09.03.36.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 03:36:11 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20190409053320.14612-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dcf3ed0d-f850-69bf-fc52-827b1e2a1a9e@redhat.com>
Date: Tue, 9 Apr 2019 12:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409053320.14612-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update configure
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
X-List-Received-Date: Tue, 09 Apr 2019 10:36:39 -0000

On 4/9/19 7:33 AM, Stefan Weil wrote:
> The last *.aml file was removed in commit 13b1881aacc7e5018773bd545bbaf8d5476699ee.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 1c563a7027..9c5d9a8c96 100755
> --- a/configure
> +++ b/configure
> @@ -7886,7 +7886,6 @@ LINKS="$LINKS python"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
>      $source_path/pc-bios/*.lid \
> -    $source_path/pc-bios/*.aml \
>      $source_path/pc-bios/*.rom \
>      $source_path/pc-bios/*.dtb \
>      $source_path/pc-bios/*.img \
> 

