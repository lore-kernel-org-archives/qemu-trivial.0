Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPpIy-0003ER-KE
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 08:46:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPpIu-0003Bc-D8
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPpIt-00063d-Kh
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:46:00 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:51761)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gPpIl-0005vq-4V; Thu, 22 Nov 2018 08:45:51 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N0nOF-1fTiu82x41-00wq0m; Thu, 22 Nov 2018 14:45:41 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paul Burton <pburton@wavecomp.com>,
	Stefan Markovic <smarkovic@wavecomp.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org, 
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <1542891760-13937-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <114155bf-fe75-4523-bce3-c1b763df6a43@vivier.eu>
Date: Thu, 22 Nov 2018 14:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1542891760-13937-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4F1O903+7j/Cu7WtPxgnFT2v+mYPakcVhxw4K3WLbfMu9K/ymdv
	sM5SUF9oD8aVnOQo3+9WtjGoJWeAyg4aQfANq4Wr1wnfujjCrrG68bLnZMV+H//pIx9PAQK
	5vQsQs+qCDAss5wCpW0TAFGVIxN4AZIxk6SNh07E6GWxMYDydELX1b28f3Xkg3Yj7xlhSXT
	ABStByTHG2CMA05b3sWWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o1L2YzOFkrw=:YEntlERSvG5MlAp4FjgMlg
	pXOZrC/1lQEjv4xthjfvi1bV3N5U3tP8eLnj/qCFHP+exb38wCmRZ3yt84a1n2lN6HGb/FbPd
	3PAQJl7/8P1iuWlrZH9MbBX9y4YYk6Z++pSKrA9FAvqXPZrAdLCcrT4rZqARm64i+CT/PgiTs
	8qX5RoZdsY8zrSvXtj6OXecQcsDr6/qB7UxgwrehbvjEqmYBNDfZ4kEzHM1TYUoj7iO0FqPD+
	G4eA2egHtPcLB1kxeICQ8T1fvvliGvBh0T+t1MMgajtgDHx+cbcPsYKIHzZTCnwN9L47rzYYc
	M11gdr8jkB/fgWAUknPofhu0pocaBnQZlfv/an49jYd08OcLYIknk9bPoLtGodPxoyG6oZ9Sp
	G0BVXyK6a0TT/KwIBTWHqwbaYRT/79gy8c/Rqvy8rEz/CY+QKBnlmh3yZQOg+9NMCd4LwF4gw
	y4FQUX9UTpx+R0+wyv4M2wDXkvaWy7jVOuS1e7/Dl9CPrXlzXxM3gr3xwa3tv4P9xI+hVMjHF
	A1Y983J0R/WRQYfN6EeuoitWVfYediJ9/OagBOhQDMCnGJkSvc9nA6x3ZPg+QUdBw2kXEHxff
	Of7vhDOutcEcsIPLNnW9Dsi/LDwZDjbatfoq6L67ez7nBBcnRG6M+Y04smWfgHg4ifJtfT+Z0
	woAJ3MRIkz2ZNawFC4OPg2X4o4gtKATgKsOXqQMMBD+sFAvMwEFYmAjBZiK+2rM8Sae2Rc39+
	KzleULfyms4gr0ABWEpgmzw7Ti4PmhdZdn794KlC3FNawdgTttbMprkznR9fri9xA//ww1ndy
	jNvjjOkUEevyV9V45xDiiF395unWg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add missing hw/pci-host
 entries
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
X-List-Received-Date: Thu, 22 Nov 2018 13:46:03 -0000

On 22/11/2018 14:02, Thomas Huth wrote:
> Bonito belongs to Fulong-2E, Sabre belongs to Sun4u, and Mac-Newworld
> and Mips-Boston were missing the header files.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6522621..46a5581 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -876,7 +876,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
>  S: Odd Fixes
>  F: hw/mips/mips_fulong2e.c
>  F: hw/isa/vt82c686.c
> -
> +F: hw/pci-host/bonito.c
>  F: include/hw/isa/vt82c686.h
>  
>  Boston
> @@ -886,6 +886,7 @@ S: Maintained
>  F: hw/core/loader-fit.c
>  F: hw/mips/boston.c
>  F: hw/pci-host/xilinx-pcie.c
> +F: include/hw/pci-host/xilinx-pcie.h
>  
>  OpenRISC Machines
>  -----------------
> @@ -938,6 +939,7 @@ F: hw/nvram/mac_nvram.c
>  F: include/hw/misc/macio/
>  F: include/hw/misc/mos6522.h
>  F: include/hw/ppc/mac_dbdma.h
> +F: include/hw/pci-host/uninorth.h
>  
>  Old World
>  M: David Gibson <david@gibson.dropbear.id.au>
> @@ -1029,6 +1031,8 @@ M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>  S: Maintained
>  F: hw/sparc64/sun4u.c
>  F: pc-bios/openbios-sparc64
> +F: hw/pci-host/sabre.c
> +F: include/hw/pci-host/sabre.h
>  
>  Sun4v
>  M: Artyom Tarasenko <atar4qemu@gmail.com>
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


