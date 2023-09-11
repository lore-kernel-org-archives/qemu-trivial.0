Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qfcjn-00044r-EJ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2023 04:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qfcjl-0003zH-RP; Mon, 11 Sep 2023 04:57:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qfcja-0004AW-T6; Mon, 11 Sep 2023 04:57:35 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C8A4420B6D;
 Mon, 11 Sep 2023 11:57:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1D226272A2;
 Mon, 11 Sep 2023 11:57:28 +0300 (MSK)
Message-ID: <afed139b-a2fa-dcb5-d6bf-b60e94504bf4@tls.msk.ru>
Date: Mon, 11 Sep 2023 11:57:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/7] ppc: spelling fixes
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-4-mjt@tls.msk.ru>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230909131258.354675-4-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Sep 2023 08:57:42 -0000

Daniel, Cédric, can you take a quick look please?

https://patchew.org/QEMU/20230909131258.354675-1-mjt@tls.msk.ru/20230909131258.354675-4-mjt@tls.msk.ru/

09.09.2023 16:12, Michael Tokarev:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   host/include/ppc/host/cpuinfo.h     |  2 +-
>   hw/ppc/ppc.c                        |  2 +-
>   hw/ppc/prep_systemio.c              |  2 +-
>   hw/ppc/spapr.c                      |  8 ++++----
>   hw/ppc/spapr_hcall.c                |  2 +-
>   hw/ppc/spapr_nvdimm.c               |  4 ++--
>   hw/ppc/spapr_pci_vfio.c             |  2 +-
>   include/hw/ppc/openpic.h            |  2 +-
>   include/hw/ppc/spapr.h              |  2 +-
>   target/ppc/cpu-models.h             |  4 ++--
>   target/ppc/cpu.h                    |  2 +-
>   target/ppc/cpu_init.c               |  4 ++--
>   target/ppc/excp_helper.c            | 14 +++++++-------
>   target/ppc/power8-pmu-regs.c.inc    |  4 ++--
>   target/ppc/translate/vmx-impl.c.inc |  6 +++---
>   15 files changed, 30 insertions(+), 30 deletions(-)

Thanks,

/mjt

