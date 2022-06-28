Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o682f-0006s6-LH
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2022 06:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o682d-0006lY-90; Tue, 28 Jun 2022 06:01:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o682Z-0004nC-Vp; Tue, 28 Jun 2022 06:01:54 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGyl3-1nsfmn2gEt-00E2Qv; Tue, 28 Jun 2022 12:01:42 +0200
Message-ID: <322be953-a8a5-179c-438f-4ec240a6aa7f@vivier.eu>
Date: Tue, 28 Jun 2022 12:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Content-Language: fr
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trivial@nongnu.org
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
 <20220528210250.175832-4-lkujaw@member.fsf.org>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220528210250.175832-4-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HpVKv2jlB0AG9K8AuNSxfjQa7cmTO7tqStMdkfM3+yR9Ole/Rna
 lXVoMstANwN7RJ7kCYQ2PuO9CfZa+s8fmIakYiNn6/Dpe2p3V3vsdTDFkrRsF3ZoWacUWCr
 YmRILcjpeysOKysnNLcd4SER5apyxmQpEGPyXhjEVIn6C7KSEW3+GQRHqlOWT8SEMowmNN8
 3YoL+nQLJjFyfc1lySdAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6JEkxZd6+H8=:plPwBxvJpia/wZpEYMAsnT
 CF62Vl3BHpgtNu1InIpSXpmNE974olRG6sFHO4H9vUnLknVSWfmWee46P+FRlLwfmXSxWlfXw
 E8HDvTlFzJuzZtSHmxwpreS3YDlub5hhfafihYlg2FxqMbs/zosmmPS3Xl8KP6We7rsAmm1RC
 cFPsIOOx1dH4g3dF+Cfn6r7Ps4kt/igriyIDm7XtX4W4boFBvWmhCTH2QNHud2VnDRhlAU23A
 qsj56lP5HFcH9wYgyTjUU0yCDozVGBEBMXNRRvDAdYlBPn0lc2V69XhAk8S9z2Kd3VQv2BjK+
 eczynCjKlk1udO6K0nJx+sTrS3nFAwO2W+DZxTiQsR+Fj4Qt09sGnhwJK5em+FkEf491cEqZX
 rZvpG1ieJNRQYRSawSe5CPq9oiaCcrHWOiMnA6bEtI+uRHcWFkRup9aGDQOWHSvSoK0aZrv1G
 WPOtcIHtuTbmF5v0Ty815j1EBVWeoRQ+k0MqN8ImuHdve/ABR/1hSpZBWRv0UMO+KtjM7Nz53
 1G8ZgmMkzYIPEx3PXezafSsEE4rXZvbPICks8SrbI6Sg5sCy/vd7k7Im0ZvoztIE/KbQV8nOh
 MStnF6FCeS6M4YOI4K62QIThfYnvondrWdi0U1KbDTb3s6XVXHpY9lEqm4IsqjIXsxAKS97cH
 RPAVyCE7zVoIt7AU0GLSvwcHSWwbAOEKFtGJ5PMXFAlv9hoCxozaRNSWDC1MFR5jywvc8265m
 Bs1xfv9GgEkZBQQ4n77xo267hCE8yvJPXI5gHA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jun 2022 10:01:55 -0000

CC:

John Snow <jsnow@redhat.com> (supporter:IDE)
qemu-block@nongnu.org (open list:IDE)

Le 28/05/2022 à 23:02, Lev Kujawski a écrit :
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> the command register would be left in an unspecified state without
> this patch.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/piix.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 76ea8fd9f6..f1d1168ecd 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -25,6 +25,8 @@
>    * References:
>    *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>    *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>    */
>   
>   #include "qemu/osdep.h"
> @@ -32,6 +34,7 @@
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/range.h"
>   #include "sysemu/block-backend.h"
>   #include "sysemu/blockdev.h"
>   #include "sysemu/dma.h"
> @@ -220,6 +223,26 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>       }
>   }
>   
> +static void piix_pci_config_write(PCIDevice *d, uint32_t addr,
> +                                  uint32_t val, int l)
> +{
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    if (range_covers_byte(addr, l, PCI_COMMAND)) {
> +        val &= ~(0xfffa << ((PCI_COMMAND - addr) << 3));
> +    }
> +
> +    pci_default_write_config(d, addr, val, l);
> +}
> +
>   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>   static void piix3_ide_class_init(ObjectClass *klass, void *data)
>   {
> @@ -232,6 +255,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
>       k->class_id = PCI_CLASS_STORAGE_IDE;
> +    k->config_write = piix_pci_config_write;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }
> @@ -260,6 +284,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
>       k->class_id = PCI_CLASS_STORAGE_IDE;
> +    k->config_write = piix_pci_config_write;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }


