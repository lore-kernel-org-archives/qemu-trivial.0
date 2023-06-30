Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qF7j0-0007Et-Su
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jun 2023 02:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qF7ix-0007EE-Hr; Fri, 30 Jun 2023 02:35:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qF7iv-00070e-J2; Fri, 30 Jun 2023 02:35:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7448A103B9;
 Fri, 30 Jun 2023 09:35:14 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0560510931;
 Fri, 30 Jun 2023 09:35:14 +0300 (MSK)
Message-ID: <d8381a65-bdc2-e49e-722b-823ff42876af@tls.msk.ru>
Date: Fri, 30 Jun 2023 09:35:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] hw: Simplify calls to pci_nic_init_nofail()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20230629125449.234945-1-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230629125449.234945-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 30 Jun 2023 06:35:20 -0000

29.06.2023 15:54, Thomas Huth пишет:
> pci_nic_init_nofail() calls qemu_find_nic_model(), and this function
> sets nd->model = g_strdup(default_model) if it has not been initialized
> yet. So we don't have to set nd->model to the default_nic in the
> calling sites.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/sbsa-ref.c        | 8 +-------
>   hw/arm/virt.c            | 8 +-------
>   hw/loongarch/virt.c      | 8 +-------
>   hw/mips/loongson3_virt.c | 8 +-------
>   hw/xtensa/virt.c         | 8 +-------
>   5 files changed, 5 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index b774d80291..d8e13ddbfe 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -683,13 +683,7 @@ static void create_pcie(SBSAMachineState *sms)
>       pci = PCI_HOST_BRIDGE(dev);
>       if (pci->bus) {
>           for (i = 0; i < nb_nics; i++) {
> -            NICInfo *nd = &nd_table[i];
> -
> -            if (!nd->model) {
> -                nd->model = g_strdup(mc->default_nic);
> -            }
> -
> -            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
> +            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
>           }
>       }

What a wonderful copy-spagetti it was :)

Applied to my trivial-patches branch, thank you!

/mjt

