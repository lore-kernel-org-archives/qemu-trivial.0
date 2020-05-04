Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVWmE-0006NC-LI
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 04:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jVWmA-0006Gp-EC; Mon, 04 May 2020 04:48:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jVWm7-0000UO-F2; Mon, 04 May 2020 04:48:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 163E5746354;
 Mon,  4 May 2020 10:48:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EC17C746353; Mon,  4 May 2020 10:48:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EA421746351;
 Mon,  4 May 2020 10:48:23 +0200 (CEST)
Date: Mon, 4 May 2020 10:48:23 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] hw/usb: Make "hcd-ehci.h" header public
In-Reply-To: <20200504082238.16655-1-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2005041044550.59496@zero.eik.bme.hu>
References: <20200504082238.16655-1-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1386598525-1588582103=:59496"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:48:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 May 2020 08:48:36 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1386598525-1588582103=:59496
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 4 May 2020, Philippe Mathieu-Daudé wrote:
> As target-specific code use this header, move it to the publicly
> accessible include/ folder.
>
>  $ git grep hw/usb/hcd-ehci.h
>  hw/arm/allwinner-h3.c:31:#include "hw/usb/hcd-ehci.h"
>  hw/arm/exynos4210.c:38:#include "hw/usb/hcd-ehci.h"
>  hw/ppc/sam460ex.c:38:#include "hw/usb/hcd-ehci.h"
>  include/hw/arm/allwinner-a10.h:13:#include "hw/usb/hcd-ehci.h"
>  include/hw/arm/aspeed_soc.h:29:#include "hw/usb/hcd-ehci.h"

All of these only need either the type #define or EHCISysBusState so 
splitting only those off to a public header should be enough and better 
than making public all of ehci's internal header.

Regards,
BALATON Zoltan
--3866299591-1386598525-1588582103=:59496--

