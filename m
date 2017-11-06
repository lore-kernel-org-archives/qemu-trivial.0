Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBmfi-0001YD-Ck
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 14:02:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmff-0001Sf-1G
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 14:02:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmfa-0000Lq-SU
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 14:02:55 -0500
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:55653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmfa-0000LI-Nh; Mon, 06 Nov 2017 14:02:50 -0500
Received: by mail-qt0-x235.google.com with SMTP id v41so12250493qtv.12;
	Mon, 06 Nov 2017 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SBstX4BZr5GCUzX04Gvl7pnmoT8+Ab/R3rHDykWoFPc=;
	b=KyWeCWqSCQ4L5mazNfLp4WotqHMX8J+RFxCDhEws4d/syIZgc/gmg/NcPZFhSQZCle
	GNpBKoJi4FIwdiy3XhMDglMO6bXaxI+wysfvGJQCAB7KiAwZfSGE2UtsXfJuJ2Ugv8wQ
	qfCeOnPRe2eqkuHuudVhFRZI49WC7btTnnajVYIFnIsbkJ7Bwnk1ME+aWAocuH3x1lKj
	rxvJqxuKbUozrGjlhTEdSrvESVxM23b5fn2f0FoizdXR+JVG+/AxgqjeoOPf5SxQG8Le
	TgLo7JUdjbk5FWW/hoTbwqKiVpnMJbcjOo74fDiVDIaVCTEEEzeDx7W5Q4Go28jo056z
	2oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=SBstX4BZr5GCUzX04Gvl7pnmoT8+Ab/R3rHDykWoFPc=;
	b=QJYVoc7V46eLynItIqBJALvmgeckrBk3JphAu+mbMCeSsuP00n3cEZlkA+u1y9uJjh
	GCl/auxQdrXC3yqdxPC+6yIPetdLCAezIbLfhhAZIVELrCRsNJOO48Hew+0edMD+f2t/
	GoS5i7SeUFE3KGctELeGpToK5q7Mmbw6LERqZv+BKjT+6ITdjyxxROvrCkqJ/vYogoX/
	omF/RBpuU41inqPMMMgsRIddpQIN27I/K6iDSa9S1aPfgJVyRLvP7utvkTih5DBEt2er
	93u32eqA2ppXi1nj4TbQIlqHNGwdcUUSHOmofnD3OheaLyRdKIgVFsSxL7ftCD1as57H
	hKSA==
X-Gm-Message-State: AMCzsaUXakenXIVSQZLyur+TsbiVTLu7f/HDsAGXDHW3AOBpdWog1szr
	ueBQHdH9qZcMNDHH25HK2g67nHVD
X-Google-Smtp-Source: ABhQp+SRQCbgNOBGXMQrPeQawPM27hmrFD6IIFYV0/A7o1Vwa4O9DoMoe+iAhXKt1U7IZjq3Gjcbtg==
X-Received: by 10.200.63.167 with SMTP id d36mr25443005qtk.7.1509994969612;
	Mon, 06 Nov 2017 11:02:49 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	m65sm8706427qkl.87.2017.11.06.11.02.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 11:02:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <68421658-f4db-a74f-f577-85d6b6e2ccd9@amsat.org>
Date: Mon, 6 Nov 2017 16:02:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-trivial] [PATCH v3 00/42] remove i386/pc dependency from
 non-PC world (part 1)
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
X-List-Received-Date: Mon, 06 Nov 2017 19:02:56 -0000

Hi Michael,

Since we are now in Soft Freeze, I'll respin this series rebased once
the next merge window opens.

On 10/17/2017 01:43 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> quite a bunch of patches and files modified, but the diffstat is not that big.
> 
> patches missing review: 2 3 16 20 21 33-37 39-41

In the meaning time patches 3 16 20 21 39 can still get some R|A-b :)

Regards,

Phil.

> since v3:
> 
> - addressed Thomas & Paolo comments (thanks for your reviews!)
> - split/fixed MAINTAINERS entries
> - dropped port92 patch
> - dropped i8237* patches
> 
> I couldn't test the KVM/XEN/HAX part (thanks Corey Minyard for v1 testing!).
> 
> since v2:
> - added R-b, A-b
> - added missing MAINTAINERS entries (as separate patches)
> - dma/i82374: avoid multiple creations on the same ISA bus
> - i386/pc: extract port92 from pc.c
> - i386/pc: move vmport.c/pvpanic.c from hw/misc/ to hw/i386/
> 
> v1:
> 
> - clean includes (mostly from script)
> - code movement (about no logical changes)
> 
> Regards,
> 
> Phil.
> 
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/42:[----] [--] 'MAINTAINERS: add entries for i2c/ppc4xx'
> 002/42:[down] 'MAINTAINERS: add an entry for the i82374 (southbridge)'
> 003/42:[down] 'MAINTAINERS: add an entry for the i8257 (DMA controller)'
> 004/42:[----] [--] 'MAINTAINERS: add an entry for the i82378 (superio)'
> 005/42:[----] [-C] 'MAINTAINERS: add an entry for watchdog/wdt_ib700'
> 006/42:[----] [--] 'MAINTAINERS: add an entry for input/pckbd.c'
> 007/42:[----] [--] 'MAINTAINERS: add entries for timer/m48t59'
> 008/42:[----] [--] 'MAINTAINERS: add missing entry for include/hw/net/'
> 009/42:[----] [--] 'hw: use "qemu/osdep.h" as first #include in source files'
> 010/42:[----] [--] 'hw: remove "qemu/osdep.h" from header files'
> 011/42:[----] [--] 'block: remove "qemu/osdep.h" from header file'
> 012/42:[----] [--] 'misc: remove headers implicitly included'
> 013/42:[----] [--] 'misc: remove duplicated includes'
> 014/42:[----] [--] 'ppc: remove duplicated includes'
> 015/42:[----] [--] 'i386/hax: remove duplicated includes'
> 016/42:[0013] [FC] 'i386/hax: remove duplicated include'
> 017/42:[----] [--] 'nios2: remove duplicated includes (in code commented out)'
> 018/42:[----] [--] 'misc: avoid "include/" in include path'
> 019/42:[----] [--] 'numa: remove unused #include'
> 020/42:[down] 'hw/input/vmmouse: remove unused #include'
> 021/42:[down] 'hw/misc/pvpanic: remove unused #include'
> 022/42:[----] [--] 'hw/ssi/aspeed_smc: remove unused #include'
> 023/42:[----] [--] 'amd_iommu: avoid needless includes in header file'
> 024/42:[0001] [FC] 'misc: remove old i386 dependency'
> 025/42:[----] [--] 'hw/ide: remove old i386 dependency'
> 026/42:[----] [--] 'hw/ipmi: remove old i386 dependency'
> 027/42:[----] [--] 'hw/i2c: remove old i386 dependency'
> 028/42:[----] [--] 'hw/tpm: remove old i386 dependency'
> 029/42:[----] [--] 'hw/virtio-balloon: remove old i386 dependency'
> 030/42:[0001] [FC] 'hw/unicore32: restrict hw addr defines to source file'
> 031/42:[----] [--] 'hw/timer/i8254: rename pit_init() -> i8254_pit_init()'
> 032/42:[----] [-C] 'hw/timer/mc146818: rename rtc_init() -> mc146818_rtc_init()'
> 033/42:[0003] [FC] 'hw/acpi: ACPI_PM_* defines are not restricted to i386 arch'
> 034/42:[down] 'hw/acpi/ich9: extract ACPI_PM_PROP_TCO_ENABLED from i386/pc'
> 035/42:[down] 'hw/display/vga: "vga.h" only contains registers defs, rename it "vga_regs.h"'
> 036/42:[down] 'hw/display/vga: "vga_int.h" requires "ui/console.h"'
> 037/42:[down] 'hw/display/vga: extract public API from i386/pc to "hw/display/vga.h"'
> 038/42:[----] [-C] 'hw/net/ne2000: extract ne2k-isa code from i386/pc to ne2000-isa.c'
> 039/42:[down] 'hw/misc/pvpanic: extract public API from i386/pc to "hw/misc/pvpanic.h"'
> 040/42:[down] 'i386/pc: move vmport.c to hw/i386/'
> 041/42:[down] 'i386/pc: move vmmouse.c to hw/i386/'
> 042/42:[----] [--] 'misc: drop old i386 dependency'
[...]

