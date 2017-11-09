Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCdCR-0001ZZ-Pd
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 22:08:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCdCP-0001ZT-OG
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 22:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCdCM-0004yU-HT
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 22:08:13 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:50611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCdCM-0004yO-CG; Wed, 08 Nov 2017 22:08:10 -0500
Received: by mail-qt0-x230.google.com with SMTP id d9so6025246qtd.7;
	Wed, 08 Nov 2017 19:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FqSwUMHwQ/C7ASDyGT05uYEtQeEZ6BXISi6OaR6TLXw=;
	b=LJGXWdjR79hJjQzIdRa/Hi4wv3DyMxGIGEI+FzniZ4UcN464dfbkojZEmcXBK2jBzu
	w4iOreHnHvM2dPrjE5OgnrPDzGM/UzdWZWXmcAQI1Y5uCKgLWH6z7lBOt+UHTvOxZ+U/
	crEH+ayuoFskUccZZbEzAhsHuk7i+DnzDZcOxH12XmylFqXrUN8g89JTaGYxeFwGLEIv
	YsB2zXkf1i9EdBt8WFawNP/VaN2CNNmFEkMv1gu600EM8Lz2tVYE2ihXmHXxh+/HGUpc
	X3dgdaR5qsgtv+Nl6AA1wgZ4ayH69X7YVXcc9BSm8/HOkCtyky7j92x7DBDp93KGgk1a
	5piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FqSwUMHwQ/C7ASDyGT05uYEtQeEZ6BXISi6OaR6TLXw=;
	b=XkI4s77A8NZVSrKG1UFArmyci2RVAEzs93ofCEpBoFccicxQDtJNLqb4xwDUxUQcGc
	jhBOQb3ed8ggz/t+nznGAU1KX0CiNZwUhIT6thczupPEFk3/ZLnG8G1XmLDTOOFD0a4e
	G3u2EcR4Pt4Jtu0FpPUAq34qV4LF91m3BSTpM8d60TyMhhIUa9hCfU0FX8jcijG6fka6
	lSYZVvx5W5BIYNgGgWmAQ+t3NS2rzeRolPCoRSxCm+NPu2/sUHuzVl4lYhjZ/ymSuQud
	zVqqlyc3aGiOXqEC3YRl4mKAc4nJxoyyUrCEk/K1lyzQksErB7uTkOHqZjAJBCDVHdoq
	8tcw==
X-Gm-Message-State: AJaThX5aU5vzB6bA+y5Yg8vW/i+kHkMhiZ+7l2w+U2xAYf+Q21aANUf5
	BXcXIKa5NOsugXkngB1j4BysdcU9Mu0=
X-Google-Smtp-Source: AGs4zMZ1F9ydSk/v0ScUPCHAaOQsTl7KSiXdmL+EpjR4pHafTFPkwQXoDsSo0fFFXIErHtt3xzH1Xw==
X-Received: by 10.200.27.163 with SMTP id z32mr4505671qtj.8.1510196889718;
	Wed, 08 Nov 2017 19:08:09 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 76sm1341092qky.56.2017.11.08.19.08.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 19:08:08 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, armbru@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1510181732.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <63b860be-0bbd-78b7-d722-81d1c94da5f4@amsat.org>
Date: Thu, 9 Nov 2017 00:08:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1510181732.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 00/45] Remove some of the
 fprintf(stderr, "*
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
X-List-Received-Date: Thu, 09 Nov 2017 03:08:15 -0000

Hi Alistair,

On 11/08/2017 07:56 PM, Alistair Francis wrote:
> Continue on improving QEMUs logging/error messages by removing more
> fprintf()'s.
> 
> Unfortunatley my Coccinelle skills aren't that great so it's all done in
> some nasty regex and a little bit of manual work.
> 
> V4:
>  - Reorder patch 3 (the audio func patch)
>  - Add all tags
>  - Small fixes
> V3:
>  - Rebase
>  - All sorts of style fixes
>  - Remove "qemu: " prefixes from print messages
> V2:
>  - Fix build issues
>  - Drop block patches
>  - Split the hw patches into subdirectories
>  - Remove AUDIO_FUNC macro as well
>  - Add some __FUNCTION__ rename fixes in a seperate patch
>  - Create a qemu_log() conversion patch for target/
> 
> Alistair Francis (45):
>   audio: Replace AUDIO_FUNC with __func__
>   Replace all occurances of __FUNCTION__ with __func__
>   Fixes after renaming __FUNCTION__ to __func__
>   tests: Replace fprintf(stderr, "*\n" with error_report()
>   hw/arm: Replace fprintf(stderr, "*\n" with error_report()
>   hw/block: Replace fprintf(stderr, "*\n" with error_report()
>   hw/bt: Replace fprintf(stderr, "*\n" with error_report()
>   hw/char: Replace fprintf(stderr, "*\n" with error_report()
>   hw/core: Replace fprintf(stderr, "*\n" with error_report()
>   hw/cris: Replace fprintf(stderr, "*\n" with error_report()
>   hw/display: Replace fprintf(stderr, "*\n" with error_report()
>   hw/dma: Replace fprintf(stderr, "*\n" with error_report()
>   hw/gpio: Replace fprintf(stderr, "*\n" with error_report()
>   hw/i2c: Replace fprintf(stderr, "*\n" with error_report()
>   hw/i386: Replace fprintf(stderr, "*\n" with error_report()
>   hw/ide: Replace fprintf(stderr, "*\n" with error_report()
>   hw/input: Replace fprintf(stderr, "*\n" with error_report()
>   hw/intc: Replace fprintf(stderr, "*\n" with error_report()
>   hw/ipmi: Replace fprintf(stderr, "*\n" with error_report()
>   hw/isa: Replace fprintf(stderr, "*\n" with error_report()
>   hw/lm32: Replace fprintf(stderr, "*\n" with error_report()
>   hw/microblaze: Replace fprintf(stderr, "*\n" with error_report()
>   hw/mips: Replace fprintf(stderr, "*\n" with error_report()
>   hw/misc: Replace fprintf(stderr, "*\n" with error_report()
>   hw/moxie: Replace fprintf(stderr, "*\n" with error_report()
>   hw/net: Replace fprintf(stderr, "*\n" with error_report()
>   hw/nios2: Replace fprintf(stderr, "*\n" with error_report()
>   hw/nvram: Replace fprintf(stderr, "*\n" with error_report()
>   hw/openrisc: Replace fprintf(stderr, "*\n" with error_report()
>   hw/pci*: Replace fprintf(stderr, "*\n" with error_report()
>   hw/ppc: Replace fprintf(stderr, "*\n" with error_report()
>   hw/s390x: Replace fprintf(stderr, "*\n" with error_report()
>   hw/scsi: Replace fprintf(stderr, "*\n" with error_report()
>   hw/sd: Replace fprintf(stderr, "*\n" with error_report()
>   hw/sh4: Replace fprintf(stderr, "*\n" with error_report()
>   hw/sparc*: Replace fprintf(stderr, "*\n" with error_report()
>   hw/ssi: Replace fprintf(stderr, "*\n" with error_report()
>   hw/timer: Replace fprintf(stderr, "*\n" with error_report()
>   hw/usb: Replace fprintf(stderr, "*\n" with error_report()
>   hw/watchdog: Replace fprintf(stderr, "*\n" with error_report()
>   hw/xen*: Replace fprintf(stderr, "*\n" with error_report()
>   util: Replace fprintf(stderr, "*\n" with error_report()
>   ui: Replace fprintf(stderr, "*\n" with error_report()
>   tcg: Replace fprintf(stderr, "*\n" with error_report()
>   target: Use qemu_log() instead of fprintf(stderr, ...)

You should split this series :)
- all the reviewed patches Cc'ing qemu-trivial@,
- respin the rest, it will be much less scary.

Regards,

Phil.

