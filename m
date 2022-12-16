Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6C01-00040x-Vs
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2022 09:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6C00-0003yE-Kw; Fri, 16 Dec 2022 09:47:44 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6Bzz-0007bT-2A; Fri, 16 Dec 2022 09:47:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B6C4174813A;
 Fri, 16 Dec 2022 15:45:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8627B748135; Fri, 16 Dec 2022 15:45:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 84CFD74812D;
 Fri, 16 Dec 2022 15:45:57 +0100 (CET)
Date: Fri, 16 Dec 2022 15:45:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 5/7] hw/isa/Kconfig: Add missing dependency to VT82C686
In-Reply-To: <20221216130355.41667-6-shentey@gmail.com>
Message-ID: <bd431760-7e55-9df1-eca2-c3d50c35f220@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2022 14:47:45 -0000

On Fri, 16 Dec 2022, Bernhard Beschow wrote:
> The ACPIREGS are provided by TYPE_VIA_PM, so needs to select ACPI.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 0a6a04947c..0156a66889 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -52,6 +52,7 @@ config PIIX4
> config VT82C686
>     bool
>     select ISA_SUPERIO
> +    select ACPI
>     select ACPI_SMBUS
>     select SERIAL_ISA
>     select FDC_ISA
>

