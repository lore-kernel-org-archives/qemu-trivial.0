Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4ECj-0001Rs-1D
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 18:49:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ECg-0001Q3-GU
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 18:49:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ECf-0008Oe-9V
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 18:49:46 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:44928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ECa-0008Mq-RR; Mon, 16 Oct 2017 18:49:40 -0400
Received: by mail-qt0-x22a.google.com with SMTP id 8so35133809qtv.1;
	Mon, 16 Oct 2017 15:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ddwvvN6p6f4ZRkYM9rbpjEXw5oGLYbnYDuHwA/7gtcM=;
	b=K5lFWU6uaAv8b5Ir06DAoIxuutMyl+2C2NEk2bzYFREGsP9REB6ATjKlnPAr+3+bxy
	XI19uwG+AwKFqsLY9jO3ypCZlUu5LZlZYXAHYuLG9juEPhqTYBsJTtenxVcEL6rfjN4w
	pXXMzh5zCFGJVyOgyD//rNm5LL7K3FI93UevKgKcdCnaSMvSQMUop38E0e9g40VS9wgc
	gJd4KoFyTnRGsSc/JV+14yD4GH6SBq2ECyOLYZzTp+vgO8w6wjzA5BpwFHcxTWMV2osb
	Cf+9HLq6XCrCaYNTksW+VyLMWST3J1logMNL8kNIbVYtLGeGRl8JDi0gMUJPKeYXv0DU
	bkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ddwvvN6p6f4ZRkYM9rbpjEXw5oGLYbnYDuHwA/7gtcM=;
	b=fHFWwEjMITpvfN6fM2f4Emtslv8QCAc/vRtFDjQsto55jo4WoFlzYysEbaqURQJpkU
	7wc6ETExsoKgmMVRUajXXlxNTt/b+6d90H99lS/b8/1grxsqE/LozttaFivg7NN6PMeM
	gk5q5CqdozSlT3WK+ah/CK8j3/bZEEEDMc1oex2O0DEfsRKXXAkMZCEwMg7XhR++2106
	8txS+rmnYLr8TSTVAcrbDDqQ0ntBUdyUy7qWQa89hfjPWJNQfS6bsKmbyEOyVtO5AILx
	Cwvy/vRAxqGagkfvnamReycEFdD85jzHvon7uTAk/kqL7igaMrQbqO/ZYTtWJIFbRlDr
	07GA==
X-Gm-Message-State: AMCzsaVfye5LJGNGUbZNoCd4+wxO27Sjpb0C/Yf2mcotC5C7n3CPCtyA
	Opdbub87ci5QdZTySb10Nag1uIXL
X-Google-Smtp-Source: AOwi7QBvIqWtBQYAkT0m2nyI4WlaqBBXquwD52H78kUDb2CWoyLB4//3PwTGD7n09RY0PCejB/0/bQ==
X-Received: by 10.200.46.58 with SMTP id r55mr17029078qta.244.1508194178705;
	Mon, 16 Oct 2017 15:49:38 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id j7sm5386910qth.68.2017.10.16.15.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 15:49:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Eduardo Habkost <ehabkost@redhat.com>,
	Eduardo Otubo <otubo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, 
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<f49c0fb8-5232-ff31-e18b-217c79afb7ee@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <28251758-632c-97ba-9815-8d9d53a95c23@amsat.org>
Date: Mon, 16 Oct 2017 19:49:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <f49c0fb8-5232-ff31-e18b-217c79afb7ee@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: Re: [Qemu-trivial] [PATCH 00/34] remove i386/pc dependency from
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
X-List-Received-Date: Mon, 16 Oct 2017 22:49:47 -0000

Hi Michael,

Thanks for your comments!

>>   hw: remove "qemu/osdep.h" from header files
> not applied, doing two things, suggested split-up
> (I'm fine with it as it is)

split out MAINTAINERS entry

>>   i386/hax: remove duplicated includes
> applied (note it can be trimmed more)

done in another patch.

>>   misc: avoid "include/" in include path
> not applied, probably should be split, but I'm fine with it as it is

split out numa.c

>>   hw/timer/i8254: rename pit_init() -> i8254_pit_init()
> not applied, split?

split out MAINTAINERS entry

>>   hw/display/vga: remove the old i386/pc dependency
> somehow I can't find this patch, neither in my inbox nor in patchwork

weird...

>>   hw/input/i8042: extract API from hw/i386/pc.h
> CHECK

split out MAINTAINERS entry

>>   hw/dma/i8257: rename DMA_init() to i8257_dma_init()
> not applied, pending **errp addition

attempt to fix it...

>>   hw/timer/m48t59: use TYPE_M48T59_ISA, add entries to MAINTAINERS
> not applied, it went out of context without i8257_dma_init rename
> btw, why do we prefer these TYPE_XXX things instead of simple "xxx" stuff?

split out MAINTAINERS entry, dropped out TYPE_M48T59_ISA use.

>>   hw/pci: declare pci_nic_init_nofail() in "hw/net/pci.h"
> not applied, it does more than mentioned

dropped from this series.

>>   hw/net/e1000: use TYPE_PCI_E1000
>>   hw/net/e1000e: use TYPE_PCI_E1000E
>>   hw/net/pcnet: use TYPE_PCI_PCNET
>>   hw/net/rtl8139: use TYPE_PCI_RTL8139
>>   hw/net/ne2000: use TYPE_PCI_NE2000
> 
> Not applied, at least not yet, why do we use these TYPE_XX stuff to
> start with?

TYPE_XX is the interface, having the devices using TYPE_XX instead of
hardcoded name guarantee safe rename/refactor.

anyway, dropped.

> Applying these series is quite a bit boring task I'd say :)

separating them from the whole branch too! but they are required for the
final objective which I'll send in 3 or 4 parts.

Regards,

Phil.

