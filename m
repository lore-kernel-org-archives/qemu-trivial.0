Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7zVQ-0000qe-RT
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 03:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7zVO-0000p8-AP
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7zVK-0007Ka-HC
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:24:22 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:34450)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1d7zVK-0007KH-BO
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 03:24:18 -0400
Received: by mail-wm0-x22a.google.com with SMTP id u65so22815798wmu.1
	for <qemu-trivial@nongnu.org>; Tue, 09 May 2017 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=wW3tseA8HYyDh/0r1yz06NWcUOWzl/Cepi8OQNp8EF8=;
	b=GVMobdOsiWpQoGIVD8l5MpK2svKVBZ46VJ4gm9QVP7/QGEdOiibeWFozyicdqePzSF
	L+tz9jj8mctreuYSuvaS08kJopC1qOFZJltWxMoCgekhiJpQe2wEd0UUUjWGHlRL8Nzz
	a3ZJDBBP+YbVuTMCH6f8+Ef1HExpMImh4vIs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=wW3tseA8HYyDh/0r1yz06NWcUOWzl/Cepi8OQNp8EF8=;
	b=ddLxK7mzR2oC7mzEAtncWW1xn4YXP7s7g7GTFClnPayB7NBourOpMcaPYvGnFpmqn7
	MuO77be+AuB9AMF6dEiCOrMDyiApJMOAaXj2z+fHaXgakW20rci6cQpNIpzPweXCr/rv
	NjMKnA1GNFjJeYVQULhlWcYfLPqSh7cz9IFdPX0Vlf+zGh1m73SS6o1HbiLgPNIm+6Ux
	DQGCK1VUiNFEVY+IfNCdSs6IxW4SiYNTCIlIjgCwXGC6DaWx5MFRXpsumie95lbqDeSL
	CEtsrVgarHarvS31gtg2rPMRxvglnZIrrp8KNWK+5Y695Kp/cbz+t86zmuFI9Bz8cDlG
	TpXA==
X-Gm-Message-State: AODbwcCfBPBat3GO2/J+aQt8NI5WzfsMBReyCCUiuPC5JNUIX8rwTpF0
	zL2DJPBni1fJyV5B
X-Received: by 10.28.167.197 with SMTP id q188mr28752wme.79.1494314656985;
	Tue, 09 May 2017 00:24:16 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	z90sm25715977wrc.36.2017.05.09.00.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:24:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F3FEA3E01CB;
	Tue,  9 May 2017 08:25:01 +0100 (BST)
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-9-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
In-reply-to: <20170508233918.9043-9-f4bug@amsat.org>
Date: Tue, 09 May 2017 08:25:01 +0100
Message-ID: <87o9v28pbm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/11] hw/sparc: use
 ARRAY_SIZE() macro
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
X-List-Received-Date: Tue, 09 May 2017 07:24:23 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sparc64/sun4u.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index d347b6616d..525d6f44a0 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -214,7 +214,7 @@ static void isa_irq_handler(void *opaque, int n, int level)
>      qemu_irq *irqs = opaque;
>      int ivec;
>
> -    assert(n < 16);
> +    assert(n < ARRAY_SIZE(isa_irq_to_ivec));
>      ivec = isa_irq_to_ivec[n];
>      EBUS_DPRINTF("Set ISA IRQ %d level %d -> ivec 0x%x\n", n, level, ivec);
>      if (ivec) {

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée

