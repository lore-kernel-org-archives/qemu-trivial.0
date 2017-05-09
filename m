Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7zY6-0002pE-FM
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 03:27:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7zY4-0002nA-1c
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7zY0-0008Ek-2u
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:27:08 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:38605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1d7zXz-0008ES-SP
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:27:04 -0400
Received: by mail-wm0-x22b.google.com with SMTP id 142so90214578wma.1
	for <qemu-trivial@nongnu.org>; Tue, 09 May 2017 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=X21E/13gBhsJp9PVM92jaM141+gOzYA4Dd4LseHYVhk=;
	b=arMY7pLlLxoEeG8W72MyFXpYaO+DYeWx9MMsD3NWRe9aLMHCrcPTaBY3BdlIUV1+wG
	aX7rtpJmzo03D48vdj1lPTsTJTQfiuBZ5hKBNf28fMZNn0SKo383foFSGSWqhsHww303
	1H+WpLrkEajEoL8TsCfHPrqBs5ZXXvAc/sbbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=X21E/13gBhsJp9PVM92jaM141+gOzYA4Dd4LseHYVhk=;
	b=egOTPxSXtkYCt92xFOsm/bC4E+acynjNb7l9E/tiNVeEvKP8bBkcz4nDuj0WCtX5Bz
	Zrv8mazXUbRh5vC6/BqP+ROVcxUYFp+XU1Eblv1QLzfWd/6Sqi/JDIVdPFlz6nOldkEO
	RJBB8l4zQYR2+Ecr2t6eyUB9Nbk1yxxhb2CzmOh51T0wji2UY7vO7zJrgQ77FxHnZ2hf
	VnAT6xDFEnxdJ7ZBVKew/ZSEoVBKq1WGqeK/ncjElRakgv/7G1PSUJGT53e6EKu5XQJD
	eSXM8br/xlnm4ErNT9E2+X9Id9CDQzkFwGeRQKsn+wHDbowgtbnx3xaFviWvM22P2Z+g
	kUUA==
X-Gm-Message-State: AODbwcDF14s6wLAiyTzZ1CnCjorfOYrowkS5Wyod51LZEIjIVeL3F+pj
	aVZEtIXbwbfPYMg5
X-Received: by 10.28.41.5 with SMTP id p5mr36646wmp.89.1494314822619;
	Tue, 09 May 2017 00:27:02 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id v7sm11483102wme.5.2017.05.09.00.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:27:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BEE7D3E01CB;
	Tue,  9 May 2017 08:27:47 +0100 (BST)
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-2-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
In-reply-to: <20170508233918.9043-2-f4bug@amsat.org>
Date: Tue, 09 May 2017 08:27:47 +0100
Message-ID: <87mvam8p70.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/11] hw/net: removed
 obsolete comments
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
X-List-Received-Date: Tue, 09 May 2017 07:27:09 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/net/pcnet-pci.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
> index 0acf8a4879..bdb533436e 100644
> --- a/hw/net/pcnet-pci.c
> +++ b/hw/net/pcnet-pci.c
> @@ -38,14 +38,6 @@
>
>  #include "pcnet.h"
>
> -//#define PCNET_DEBUG
> -//#define PCNET_DEBUG_IO
> -//#define PCNET_DEBUG_BCR
> -//#define PCNET_DEBUG_CSR
> -//#define PCNET_DEBUG_RMD
> -//#define PCNET_DEBUG_TMD
> -//#define PCNET_DEBUG_MATCH
> -

I guess - although I notice there are some #if 0's in the file that
could be converted to proper non-bitrotting debug prints or removed as well.

>  #define TYPE_PCI_PCNET "pcnet"
>
>  #define PCI_PCNET(obj) \
> @@ -239,8 +231,6 @@ static const VMStateDescription vmstate_pci_pcnet = {
>      }
>  };
>
> -/* PCI interface */
> -

Was this intentional?

>  static const MemoryRegionOps pcnet_mmio_ops = {
>      .old_mmio = {
>          .read = { pcnet_mmio_readb, pcnet_mmio_readw, pcnet_mmio_readl },


--
Alex Bennée

