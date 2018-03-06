Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etHmB-0002O7-DA
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 13:57:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHm9-0002MU-5M
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 13:57:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHm4-00055l-Aa
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 13:57:25 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:32955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHm4-000545-3t; Tue, 06 Mar 2018 13:57:20 -0500
Received: by mail-wr0-x243.google.com with SMTP id v18so21387893wrv.0;
	Tue, 06 Mar 2018 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IdH/MJ2n7dbrpZnuDcnTY7asKy+/wlma9w6s/tkzZU4=;
	b=ehaeJMemjkhv73f+2dD5P0EtZZBx5Oao8/GIwmA8msE9OQcFJiUWvehT4oB2BEAgio
	TKcx22+VDy9VX9mjK4wCwHOWvr2N7iI4/Rw72FNUDIRhe2DRg4icQ54fIvNRMaVXm9dR
	QRY8NjpGNZrJcwlHjVA3ZirEZbKO7sR+8US0s1WvESR+YXYCQshTx1AqEv+bPeFEr7Ix
	znOBDoxYwnJXwQgubLe8Dh1Z3L/BtSIiRFipSTX4lJcduJcuBFMPH0t3vdNLv5+rOvhI
	qb5TyFe26NNsK0d87yM/8IzVeAXZE3aMNO0iuaZAJnwBU/G0/TOJVn9+fcSAuc0++Iwo
	XAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IdH/MJ2n7dbrpZnuDcnTY7asKy+/wlma9w6s/tkzZU4=;
	b=jaBqI3OjwBZo2XIVIaSw4Gn8ISwTTOcQlj3CV8s3hYLAt/Q/pVgtYMJMzCNbsMvfBX
	agQQypgFMTsviES0mDmZNl89CTfPsolXiWjeeTGEeo7Dvx9ZvJApqHk/Don9jfUKR8Pg
	r4wbxJTBu1SmFbOHq6YIRlMYcf2/UuDPBpEcprkOczU5e1Z00GzhNzlM32FtreMPfKp5
	L4P6WSFh/Gi0zW6N/0zLq3114pzljDbbILjqDoc6U9kNhptpDwNuA0JmF3sFyps3wZia
	BMwN5ZTx3D+QN1pafXdTwYUqncSJSehOGEju1Vw4IughPHeBuzldgEaPrBJWfQ2vBn2l
	uTfA==
X-Gm-Message-State: APf1xPC1FpvP8rFzn71H+H3waxkl36ECGIlLFJ22gBfP9EthWl56Kbm9
	Hc57GYuxZ8j1ysYQqaUCZh8=
X-Google-Smtp-Source: AG47ELsrJ5bgaS4vY4j7yhEsUuNAxzHv9oLXOnWbfaxqTFuNATTTK6PjoVvv0F/n+V8LLbQEPq0r4Q==
X-Received: by 10.223.201.15 with SMTP id m15mr15674914wrh.54.1520362638980;
	Tue, 06 Mar 2018 10:57:18 -0800 (PST)
Received: from [192.168.182.119]
	(ABordeaux-653-1-285-17.w90-38.abo.wanadoo.fr. [90.38.129.17])
	by smtp.gmail.com with ESMTPSA id
	b28sm16144936wrg.66.2018.03.06.10.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 10:57:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20180306134402.997-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b55b5536-5db9-a396-a35e-12b1218b37aa@amsat.org>
Date: Tue, 6 Mar 2018 15:57:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306134402.997-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [PATCH] misc,
 ide: remove use of HWADDR_PRIx in trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 18:57:26 -0000

On 03/06/2018 10:44 AM, Daniel P. Berrangé wrote:
> The trace events all use a uint64_t data type, so should be using the
> corresponding PRIx64 format, not HWADDR_PRIx which is intended for use
> with the 'hwaddr' type.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ide/trace-events  | 4 ++--
>  hw/misc/trace-events | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
> index 0c39cabe72..5c0e59ec42 100644
> --- a/hw/ide/trace-events
> +++ b/hw/ide/trace-events
> @@ -108,8 +108,8 @@ ahci_dma_prepare_buf_fail(void *s, int port) "ahci(%p)[%d]: sglist population fa
>  ahci_dma_rw_buf(void *s, int port, int l) "ahci(%p)[%d] len=0x%x"
>  ahci_cmd_done(void *s, int port) "ahci(%p)[%d]: cmd done"
>  ahci_reset(void *s) "ahci(%p): HBA reset"
> -allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, unsigned size) "ahci(%p): read a=%p addr=0x%"HWADDR_PRIx" val=0x%"PRIx64", size=%d"
> -allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, unsigned size) "ahci(%p): write a=%p addr=0x%"HWADDR_PRIx" val=0x%"PRIx64", size=%d"
> +allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, unsigned size) "ahci(%p): read a=%p addr=0x%"PRIx64" val=0x%"PRIx64", size=%d"
> +allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, unsigned size) "ahci(%p): write a=%p addr=0x%"PRIx64" val=0x%"PRIx64", size=%d"
>  
>  # Warning: Verbose
>  handle_reg_h2d_fis_dump(void *s, int port, const char *fis) "ahci(%p)[%d]: %s"
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 562d9ed005..ec5a9f0da1 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -69,13 +69,13 @@ mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
>  mps2_fpgaio_leds(char led1, char led0) "MPS2 FPGAIO LEDs: %c%c"
>  
>  # hw/misc/msf2-sysreg.c
> -msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x%" PRIx32
> -msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
> +msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" PRIx64 " data 0x%" PRIx32 " prev 0x%" PRIx32
> +msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr 0x%08" PRIx64 " data 0x%08" PRIx32
>  msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL status register"
>  
>  #hw/misc/imx7_gpr.c
> -imx7_gpr_read(uint64_t offset) "addr 0x%08" HWADDR_PRIx
> -imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" HWADDR_PRIx "value 0x%08" HWADDR_PRIx
> +imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
> +imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx64
>  
>  # hw/misc/mos6522.c
>  mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
> 

