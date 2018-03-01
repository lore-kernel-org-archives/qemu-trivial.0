Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1erLm8-0004TD-DU
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2018 05:49:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erLm5-0004QY-Fd
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 05:49:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erLm0-00088E-Lu
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 05:49:21 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:39191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erLm0-00086P-Ep; Thu, 01 Mar 2018 05:49:16 -0500
Received: by mail-wr0-x244.google.com with SMTP id w77so5586468wrc.6;
	Thu, 01 Mar 2018 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A6qgqCovjj40DMxfFYjlar7qdvaoxuU///3aGahr7kg=;
	b=gH5hm+WRJendbRden8Y8SfRnIwXQLR9LtLQk2+TvfpNUYieKN7VJRUXNvuheTaJNYP
	EpiofIuPPXT593iXcz0VYHYLbhb9azuPKBj9yBQO/9rLzPQfQ+wLA5nUsB8VNY5sJlkv
	dzb2raIQvLHTtX6w99EmqGIxRfx7S/pvHpsMhJRwN/KUxPHIbgFI8a11HhT9Ho9ZUOcP
	ihowu3x37GYwKb6HHkBv4i3Ehyq159bv1LQhWdcv/AL8T4ccn8Wqc7t5tTuhYnjFBAzj
	gzWpJePVF56JlVGb7u32siFfZjmfsV6LpecLoKv7HKuFHtFL98X4deCmLZamRKIZoSbz
	ZxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A6qgqCovjj40DMxfFYjlar7qdvaoxuU///3aGahr7kg=;
	b=WE30gudTOKymqk9UeW44Ki0V2Ow2hNoStR8D3vVNSxd9/cUDweD71GyCRzFMnFU5Fd
	XO+q80CLxugcEZrw+gr4RQtUg/S8ytDixGpIz2iw7GuoQKkYyKsrDqg0gHEvLgYuJ+wt
	ec5jNIVBerRJJ1wzfIS1JSEly83uFMog5I+WK5EMWavKit9z4n3cWvK3oS5G+dfNidXz
	bw4xD32ngotA+ubx231DtZqx6wGl3j4J1BXJXRtSVmF1LJ0HmmRFGV39XXkomZGZzm6D
	RMo6r9cNHWYBRlgsLXd78OcX1JgvegmwmdCRX9XIXyoAbFRF0whEbv2yMfweW3Vc2NMG
	c+Nw==
X-Gm-Message-State: APf1xPDh6++UDaaiCaDQjVXSHJlj56JlBqaNOH+zGLxVEmHd93mS2VzO
	49LYF4RtBrCtcEkW67PC3JqGoRhZ
X-Google-Smtp-Source: AG47ELsvB9AvtXmtYSlZo6Yq/3MhF8U6sJWqTOJD5x7HuIKJMZZrXLwwLXj+YBgzL2ub9ek/hMXUng==
X-Received: by 10.223.133.70 with SMTP id 64mr1379565wrh.164.1519901354992;
	Thu, 01 Mar 2018 02:49:14 -0800 (PST)
Received: from [192.168.1.19] (LFbn-MON-1-648-178.w2-4.abo.wanadoo.fr.
	[2.4.22.178]) by smtp.gmail.com with ESMTPSA id
	q186sm4285381wmb.33.2018.03.01.02.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 02:49:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mark.cave-ayland@ilande.co.uk, jcd@tribudubois.net
References: <1519898536-19027-1-git-send-email-frederic.konrad@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1625eda8-021b-b7bc-2c41-f87724b95efa@amsat.org>
Date: Thu, 1 Mar 2018 07:49:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519898536-19027-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [PATCH] grlib_apbuart: always enable tx and rx
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
X-List-Received-Date: Thu, 01 Mar 2018 10:49:22 -0000

Hi Frederic,

On 03/01/2018 07:02 AM, KONRAD Frederic wrote:
> We often use a bootloader for this board. So lets set the uart in a state
> which it can emit characters as if we were using a bootloader.
> 
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  hw/char/grlib_apbuart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
> index bac11be..a8020ea 100644
> --- a/hw/char/grlib_apbuart.c
> +++ b/hw/char/grlib_apbuart.c
> @@ -265,8 +265,8 @@ static void grlib_apbuart_reset(DeviceState *d)
>  
>      /* Transmitter FIFO and shift registers are always empty in QEMU */
>      uart->status =  UART_TRANSMIT_FIFO_EMPTY | UART_TRANSMIT_SHIFT_EMPTY;
> -    /* Everything is off */
> -    uart->control = 0;
> +    /* Enable Tx and Rx as the bootloader would do */
> +    uart->control = UART_RECEIVE_ENABLE | UART_TRANSMIT_ENABLE;

I don't think this is the correct approach, as we want to reflect the
real hardware behavior here.

I think the correct QEMU-way is add a tiny asm bootloader in ram in
leon3_generic_hw_init(), which enables the UART.
See write_bootloader() in hw/mips/mips_fulong2e.c for example.

Regards,

Phil.

>      /* Flush receive FIFO */
>      uart->len = 0;
>      uart->current = 0;
> 

