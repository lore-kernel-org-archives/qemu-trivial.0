Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLDwV-0002HF-3r
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 16:31:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLDwS-0002FJ-90
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 16:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLDwR-0001gq-28
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 16:31:32 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fLDwL-0001e3-1R; Tue, 22 May 2018 16:31:25 -0400
Received: by mail-qt0-x243.google.com with SMTP id c2-v6so25240748qtn.9;
	Tue, 22 May 2018 13:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6lxng7LgyOL8RedvwPfmAokGv/Rt/3ORk5CedMna1FM=;
	b=Dv3DMfXcPMP4EnseED14rUTujyj+nmtvOvBeFNUHVm+TM9VN9paskzzIsmJ5Fr+I3M
	9GXJz2MJOoq13Iwk5R1Lo7yFd6ij8a+NAeS9l+YKFbF/dywXzM2IY3nIsV/KsIASF7UC
	HE7A/OraKYJYyj4dZiyrUJM/WiGCoHO+r9M9ZeRujDLmUMxLfYKm/Fic9sbqbhIaNKdS
	nRet53rc/pJfD1AxPDUcqYTHOZRMZ9J4wfp7Pq6xAESi/OnEzARHFWIX7UbBOLuoNrib
	nvX4K7SBhwDSlPe//wnvFk/ocCXt5piHae8EXkbg+vqreHgEbW9XaqKLRej1U+Wh3vd0
	hppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6lxng7LgyOL8RedvwPfmAokGv/Rt/3ORk5CedMna1FM=;
	b=BCEQjKvNZuPppXVKkT8y567lpLZjAXU23yfEU1yhICo+i6aw/MoP+5p48BJgE/lfdS
	CwaE1QScW8sOXX7WJj8/PwEVEz+hEMfFUCCkIL5S+Q0OQEzfX0rkTqvneIRfh+/pLr44
	YwI5Ghvn8DA+nHICy62rhpHmvwH6/7x+VFEssTJsDRq29logtTKxjQmmIl7nrfZZXmkx
	L1xy9NGuxFImbBe85mMw6qoeD2tMx4Q1KmY4b9a3GWxmA319SoA95tvUBSbOeb4Gw0uu
	cYGoDU8oupKIuFFnBOnkTKhJ3hBEkK8S5MwLI+4cXti9cGB+CTwkIMdVV8nhtJsmZqoR
	AgDw==
X-Gm-Message-State: ALKqPwd3Ax/e3MDSeZ2/W0XTbN3V6ijj3rtcgk+WEjkUYLnZ9Mz9soMn
	6RGD2xeTdP0pBNKJiPEFw3tp5/YQ
X-Google-Smtp-Source: AB8JxZrFoxuKjNpqDn2qUDJAGOLvK2jbTQ2XaVvTRURn+XkpL6rqk+dcObF69qfqWwigbIjjqXPZKQ==
X-Received: by 2002:a0c:9944:: with SMTP id
	i4-v6mr23879512qvd.192.1527021084368; 
	Tue, 22 May 2018 13:31:24 -0700 (PDT)
Received: from [192.168.1.53] ([190.175.4.178])
	by smtp.gmail.com with ESMTPSA id
	r189-v6sm12077837qkd.38.2018.05.22.13.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 13:31:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20180522191743.12872-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ab0d563a-89f7-ffdb-7f43-956d7213b231@amsat.org>
Date: Tue, 22 May 2018 17:31:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180522191743.12872-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH] ppc: move at24c to its own CONFIG_ symbol
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
X-List-Received-Date: Tue, 22 May 2018 20:31:33 -0000

On 05/22/2018 04:17 PM, Paolo Bonzini wrote:
> AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
> being included in all emulators that use I2C, even if they do not
> really need it.  Separate it and, since it was added for the e500
> machines, add it to qemu-system-ppc and qemu-system-ppc64.

With your S-o-b:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  default-configs/ppc-softmmu.mak | 1 +
>  hw/nvram/Makefile.objs          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
> index 4d7be45ac5..c57e568121 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -26,6 +26,7 @@ CONFIG_USB_EHCI_SYSBUS=y
>  CONFIG_SM501=y
>  CONFIG_IDE_SII3112=y
>  CONFIG_I2C=y
> +CONFIG_AT24C=y
>  
>  # For Macs
>  CONFIG_MAC=y
> diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
> index a912d25391..b318e53a43 100644
> --- a/hw/nvram/Makefile.objs
> +++ b/hw/nvram/Makefile.objs
> @@ -1,6 +1,6 @@
>  common-obj-$(CONFIG_DS1225Y) += ds1225y.o
>  common-obj-y += eeprom93xx.o
> -common-obj-$(CONFIG_I2C) += eeprom_at24c.o
> +common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
>  common-obj-y += fw_cfg.o
>  common-obj-y += chrp_nvram.o
>  common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
> 

