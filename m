Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLjLp-0008ME-66
	for mharc-qemu-trivial@gnu.org; Thu, 24 May 2018 02:03:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLjLn-0008Lx-36
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 02:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLjLi-0007Jh-5N
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 02:03:47 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fLjLh-0007J9-Vo
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 02:03:42 -0400
Received: by mail-pf0-f194.google.com with SMTP id c10-v6so294232pfi.12
	for <qemu-trivial@nongnu.org>; Wed, 23 May 2018 23:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hUjglS05PEeswwy8/B2s9HodLL6kIeGFFiaWU1KjvlQ=;
	b=i6ne0A/gJ6jFAZ8QCdF36OnBRABMhRfiICfvfHZJReK4d45wdCPumoPGWxRgi5JOUE
	IbXIHrap09ay29xEkezY1KnS+pSTvIGvEPUFAW38F/OIivubj9fAFEUvDxBDRbJT5gep
	KAlf2rvyuxWvXDMVbIIZGcIZLbC8/rFvcwURZ6ki6/UsevpkWo8iIuo5xPzgPThJ08Ua
	yNO1LTHtMs7mJ4qQTdtenPr7j2MgfBGNiOl6rJUWDd5VFP2lO5jy+ZBVroQJX1F8mc0H
	KBTzVyva5w/Ov/yJK3MAXmAMSEjrTgenKg/ckCOlfMeE6i8m8jFgNAFK//kX57lXVrF0
	XFHw==
X-Gm-Message-State: ALKqPwd0ItuBxAZPf9XCkklNFn41rX9IxeKwz3cdViG+VtULBDBh0WLP
	zZ3La0bO2oTWXotrjg3MXWC5QcQa4gw=
X-Google-Smtp-Source: AB8JxZqn29jAA0TiIQ0fSq/4ARXeAdFkfmfoeU8hAM2EKyLVCWnymza3b1xOIqF7V8WWcbXe4g6jaA==
X-Received: by 2002:a63:7e52:: with SMTP id
	o18-v6mr4574915pgn.399.1527141820181; 
	Wed, 23 May 2018 23:03:40 -0700 (PDT)
Received: from [172.20.7.250] ([208.181.63.202])
	by smtp.gmail.com with ESMTPSA id
	h8-v6sm27096137pgq.56.2018.05.23.23.03.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 23:03:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20180522191743.12872-1-pbonzini@redhat.com>
Message-ID: <af5b29f1-b37f-e891-ceb3-9f5bb0762dd1@redhat.com>
Date: Thu, 24 May 2018 08:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180522191743.12872-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.194
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ppc: move at24c to its own
 CONFIG_ symbol
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
X-List-Received-Date: Thu, 24 May 2018 06:03:48 -0000

On 22/05/2018 21:17, Paolo Bonzini wrote:
> AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
> being included in all emulators that use I2C, even if they do not
> really need it.  Separate it and, since it was added for the e500
> machines, add it to qemu-system-ppc and qemu-system-ppc64.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

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


