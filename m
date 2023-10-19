Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtVUM-0002T1-7L
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 12:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtVUJ-0002OH-Vk; Thu, 19 Oct 2023 12:03:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtVUH-0002vh-RA; Thu, 19 Oct 2023 12:03:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SBCDN3nX1z4xc0;
 Fri, 20 Oct 2023 03:03:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBCDL07Zlz4xbr;
 Fri, 20 Oct 2023 03:02:57 +1100 (AEDT)
Message-ID: <60462d22-4f56-4096-9c90-4e86fc686995@kaod.org>
Date: Thu, 19 Oct 2023 18:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Fix typo in openpic_kvm.c entry
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20231019155822.499027-1-thuth@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231019155822.499027-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=PA0m=GB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 19 Oct 2023 16:03:08 -0000

On 10/19/23 17:58, Thomas Huth wrote:
> It's a .c file, not a header!
> 
> Fixes: ff8cdbbd7e ("MAINTAINERS: Add information for OpenPIC")
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c12511c73b..a110a0c7a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1418,7 +1418,7 @@ F: hw/pci-host/ppce500.c
>   F: include/hw/ppc/ppc_e500.h
>   F: include/hw/pci-host/ppce500.h
>   F: pc-bios/u-boot.e500
> -F: hw/intc/openpic_kvm.h
> +F: hw/intc/openpic_kvm.c
>   F: include/hw/ppc/openpic_kvm.h
>   F: docs/system/ppc/ppce500.rst
>   


