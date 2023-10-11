Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqZKU-0006jH-2a
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 09:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqZJy-0006cU-Jc; Wed, 11 Oct 2023 09:32:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqZJi-0006oQ-Bz; Wed, 11 Oct 2023 09:32:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DFB99748FF4;
 Wed, 11 Oct 2023 15:30:57 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 78A257456AA; Wed, 11 Oct 2023 15:30:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 76E50745681;
 Wed, 11 Oct 2023 15:30:57 +0200 (CEST)
Date: Wed, 11 Oct 2023 15:30:57 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Cover hw/ppc/ppc440_uc.c with Sam460ex
 board
In-Reply-To: <20231011124312.60476-2-philmd@linaro.org>
Message-ID: <ca56f6b3-4b2f-6c23-408e-38fa024b304f@eik.bme.hu>
References: <20231011124312.60476-1-philmd@linaro.org>
 <20231011124312.60476-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-907594027-1697031057=:10652"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Oct 2023 13:32:42 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-907594027-1697031057=:10652
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 11 Oct 2023, Philippe Mathieu-Daudé wrote:
> hw/ppc/ppc440_uc.c implements the TYPE_PPC460EX_PCIE_HOST
> device, which is used by the aCube Sam460ex board.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I guess there's nobody else to take these so

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e7dec4a58..8c07d07927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1482,6 +1482,7 @@ M: BALATON Zoltan <balaton@eik.bme.hu>
> L: qemu-ppc@nongnu.org
> S: Maintained
> F: hw/ppc/sam460ex.c
> +F: hw/ppc/ppc440_uc.c
> F: hw/ppc/ppc440_pcix.c
> F: hw/display/sm501*
> F: hw/ide/sii3112.c
>
--3866299591-907594027-1697031057=:10652--

