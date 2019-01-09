Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghB2i-0001Sd-J5
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghB2g-0001RI-ET
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghB2f-0005hB-PY
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:24:58 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:33311)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghB2d-0005WU-VE; Wed, 09 Jan 2019 05:24:56 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mc02T-1hHbWW0KcB-00daWg; Wed, 09 Jan 2019 11:24:51 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1546615943-16274-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <4b9b4d5a-d124-19df-46c9-f3b2a68f46d8@vivier.eu>
Date: Wed, 9 Jan 2019 11:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1546615943-16274-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:r7n6T00cXQpde2+uN4pAbpHR4USkeMtNtqA54GIe+zEUDBgXvn3
	cdKhgE2yWEsLucvpY1FIhxkPaEUyyQDhqsbM2lmex81UbWO5zMNTgsuDPcuatgY2Gx3CGZO
	rTbIlzblCKda/s6qWt8BB3OiIZCKnRGFb0pz1Rni9kuaMJxPLW8Hk4auB+QJSf0vDSKBv+F
	OnLHrGxmOmjhgwBPDSOdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:esN7soQzbbU=:oZGnS/bIccKvJD7vvtGGVR
	uNTJGREKB/h+ldcSjG0LTzxwp9LQDnKqGkr4YMWEwKJA7iuilejCyVko0wnftdtNTC0ZCfV2s
	n6rCcNgsyy199YbcNLBLZzqkAOR59ZYyHpSGGbNoWwpLgPWXq5GatDN1ti7wSMQMPeUEr+MRW
	fmBjDsrENWSzNISBPLKG3H+slO9m6SJ/aXojOETpwR1R7WliBInymCKGxsMesxp4CkiqPj0CJ
	/YKMQoOLW5YMdXawiL53jrXxH6rWkZe5nT4/PC+CN3JZ7DMxssD7sO0quBy4GQbitfCeOVhDR
	h883BGInZjRT5sjSrffvRkf6InFMdha2mBg2+CJGY0pqxAPGjNuwh1ygd3YqLvG7gDCpV4BqX
	ZN+1J0ktx6mDIcouy0sJMg0gJnX+AAQ+CYFFhJEAP28yNblMZ7A2j0TujPZKGR9xphKxIF3L0
	RLHoKP67TU3QecD6/WQKFOAy1ON7X10j717+vxoWoxUJsiHse/6GBwrn8w+GhiJy0yYhaA0x+
	hAww642sOVvcfxB2tIxrTNew04nLq04cZr6tB1KDgKPR1dy33YPP1OR221iHPlK24mJ7rSkqi
	pQ1qV/vRlFblj8QaJBPEe6y/bLhSioGV80E3LWFvqiK1OYyeiMO7bnXRIp5ratOWas0kon/+3
	Z9kBR6vRtud/fIQgmdIvOkFhiYi6YqnqvHPCaA+DAkPApfTOuq6eVtK7Jxo6SSrd7xSQ+WVNm
	B1DSV5tC1FmWD2buNxsqOCdkVeV0PYPdvw+d95huQth+OTV/4G9hJgOsevE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] trivial: Don't include isa.h if it is
 not really necessary
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
X-List-Received-Date: Wed, 09 Jan 2019 10:24:59 -0000

On 04/01/2019 16:32, Thomas Huth wrote:
> These files don't seem to do anything related to ISA directly, so
> there is no need to include isa.h here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/ramfb-standalone.c | 1 -
>  hw/ide/pci.c                  | 1 -
>  hw/ide/piix.c                 | 1 -
>  hw/ide/via.c                  | 1 -
>  hw/misc/macio/mac_dbdma.c     | 1 -
>  hw/moxie/moxiesim.c           | 1 -
>  hw/nvram/fw_cfg.c             | 1 -
>  hw/sparc/sun4m.c              | 1 -
>  hw/timer/i8254.c              | 1 -
>  9 files changed, 9 deletions(-)
> 


Applied to my trivial-patches branch.

Thanks,
Laurent


