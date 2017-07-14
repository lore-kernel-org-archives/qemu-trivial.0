Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs96-0008Io-W7
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:24:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs94-0008HY-Nr
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:24:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs91-0002bn-4R
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:24:02 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs91-0002bj-0N; Fri, 14 Jul 2017 00:23:59 -0400
Received: by mail-qk0-x241.google.com with SMTP id c18so646617qkb.2;
	Thu, 13 Jul 2017 21:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Ji30ont4RHhkkr+IeCQxOaCk6XG1u5rrBVxyDHuO5gg=;
	b=Zhy5Gv+o1/dkCwrI+jxj1GeSZFQY4B0bIGQGZeJrgnv0OKAr3cfhsYTwf75W9lSYJO
	Kimy/rseIZNMMYrL8k0GVMma4/3Hn4dnA6CUqWtWzTZKKnTTveB8PBvy1sg0Or/zZvXR
	EPdEdIja23vRATPFaLotdWi7VTsJ7cg7p70wvyqSgQ1iaHkuD84Yo/7UH9eHt64hnnLB
	ZSpMhkDeCBmQn6vrp7FExjUPXiWzsU/1AXOY/8kUWq76u1p3iNFsVXUW0JgeWyD3mJrR
	h7MARiXCvEwhncUpX+wWSuPiXoFx5On0Dj/sBCZHVhXYU3q45jKEgd4e8o1N34u+SgMi
	/hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ji30ont4RHhkkr+IeCQxOaCk6XG1u5rrBVxyDHuO5gg=;
	b=l+GIXBfPumnkCsMfB/DWCbtssNbExWkEFX0T9VUnKoPIbDs6MtqKLg2lJZxvhFSi2L
	sHJuQbh9Is9qBV0BduE+lEiCEBbRlzNQXElUF70hR9eP6t0zVAUzMdu8gRh3Q3BGR7U+
	uKiFUcyCoHsG1xtEhz1wZaI/XTRUVCMn0POYpZYcwI2XYPIrpiNkfh06+qtqnn3iX/Zf
	CiczOtfRNYiG3acLNBjWwvkqYrR1dNDFefmkCXdUmLeqwe3rSldtwaGtoJ0lPejTUQsz
	ykcyfnB02bewbGU/3QvPmGMg83ZwW5M4KTTmG1DrxkYOapzJ8nM2SQMb0+Phz9zgG84H
	gsxg==
X-Gm-Message-State: AIVw110S/zMtc3cGW7Uw3MOyrPcJicAnUs6IiviWvF3mfuF26bmLSf59
	McqzzrABys5m9w==
X-Received: by 10.55.150.134 with SMTP id y128mr9244907qkd.29.1500006238542;
	Thu, 13 Jul 2017 21:23:58 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id s5sm5890576qkl.9.2017.07.13.21.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:23:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-19-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d525140c-f99d-f7c3-916a-8b6c9f1453df@amsat.org>
Date: Fri, 14 Jul 2017 01:23:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-19-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH v2 18/29] piix: use DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 04:24:03 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/pci-host/piix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index a2c1033dbe..3745b56c8e 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -140,7 +140,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
>       memory_region_transaction_begin();
>       for (i = 0; i < 13; i++) {
>           pam_update(&d->pam_regions[i], i,
> -                   pd->config[I440FX_PAM + ((i + 1) / 2)]);
> +                   pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
>       }
>       memory_region_set_enabled(&d->smram_region,
>                                 !(pd->config[I440FX_SMRAM] & SMRAM_D_OPEN));
> 

