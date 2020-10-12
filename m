Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRyIc-00079T-RM
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kRyIW-000749-1Z; Mon, 12 Oct 2020 09:55:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:39018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kRyIQ-0001YS-3J; Mon, 12 Oct 2020 09:55:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E74074594E;
 Mon, 12 Oct 2020 15:55:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0E53745712; Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF31F745702;
 Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Date: Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Paul Durrant <paul@xen.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhc@lemote.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org, 
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <rth@twiddle.net>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more
 readable
In-Reply-To: <20201012124506.3406909-2-philmd@redhat.com>
Message-ID: <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-694601815-1602510918=:97629"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Oct 2020 13:55:32 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-694601815-1602510918=:97629
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 12 Oct 2020, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
> Rewrite it extracting the shift operation one layer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/pci-host/bonito.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..abb3ee86769 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
> #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
>
> #define PCI_ADDR(busno , devno , funno , regno)  \
> -    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
> -    (((funno) << 8) & 0x700) + (regno))
> +    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
> +    (((funno) & 0x7) << 8) + (regno))

Are you missing a << 8 somewhere before + (regno) or both of these are 
equally unreadable and I've missed something? This seems to be completely 
replaced by next patch so what's the point of this change?

Regards,
BALATON Zoltan

>
> typedef struct BonitoState BonitoState;
>
>
--3866299591-694601815-1602510918=:97629--

