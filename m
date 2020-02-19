Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4LfZ-0008Qo-Kh
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 04:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4LfX-0008QF-5x
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 04:29:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4LfW-0004S1-3N
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 04:29:23 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:54603)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j4LfV-0004QA-Qc
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 04:29:22 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3Eqr-1j1JGf0EJx-003dek for <qemu-trivial@nongnu.org>; Wed, 19 Feb 2020
 10:29:20 +0100
Subject: Re: [PATCH 1/3] hw/nios2:fix leak of fdevice tree blob
To: qemu-trivial@nongnu.org
References: <20200218091154.21696-1-kuhn.chenqun@huawei.com>
 <20200218091154.21696-2-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <17828312-a87d-77a5-738f-a8fb6a7cef4d@vivier.eu>
Date: Wed, 19 Feb 2020 10:29:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218091154.21696-2-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7QGstJXg+87B31+AbRCYTEVdidWmD9mwUVTZZwdqcAOiUiHFl+G
 DOgfhHwvikjzHbueeqvN1l2vKssxJhMLb2ScC3ivV11jJ1l1jyq9AMAoTiN9I7dCTgGaqI6
 C+DG/Ux/S2XIOVxyD2et5NdgZvLMu0PW+7zX6LVQ8sYKChLtSl0iDoe4kiAyTnejX8x66yS
 /eLgRfpX+Dchb8XCcbdFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JphDepAdO70=:vIaH0dSMGWSaBmnPNOzewS
 uupMqgrIjoREJJOaSypK0ZZh4UrefVA8c00rn8Mxit1mQwzvRY+zXh4cob7S7IC9ikadA51ed
 gKQ7OhFROCL6CUPpng6+EoP6vWB07ECK/8wQiSbh/ad28IbYSUfBe8pbzo3incv+nGB5MT4cE
 INbTwL4a/Q0QJlvTQlq3d80aA7IvhQKVoPwBXzwyuxjDOCCgmc+UoSLt8gXkqdGJwv/oa5F3h
 0Q+yTYjTezt6zaMkaOSiMh9ek9ZvAw+pV9Y8PbWremcztz4OC/cljpKyk7abvC8Ogm6hWvoLR
 6AJkkgkpBbK9aQgOIKDhdut5tZ6fEahdL0afNLGITki1ED/hC8CU2B/Xry0P8zGKS6lUCOtj5
 0va18qwt0HDl6OEWSUWRjne4UTDl1zo30s6ld9P21hB+MGOl4munTNlZsn23iNCUd1LnIfS5p
 +yy62/QHNptXGykdwyrFVAOnyL4FHg0lzo7/j9bheAUDd3xii0Efvgyvx7FOUo0rmK9G9mUUv
 Rb0QtMfqzQIChcTfvbxZFbOJVBg2vC4UUZ2LtEiE1iQxENhbjVx2B4oU+0vQqqB9nm5CjEobK
 ZbW0vVKwcGE50iQpaO26Omtf4b+6kqdtNlm962sWXAaIMOTczc3ZIEFMF6iW8wAZLtJD3oY0Y
 onqw/TZAUKtKIYRfDCbQSvRz5qTRf8hK9rrKs1SwUbyLA2Ac5SBShguUmV+tS02N+/1x8Ggt7
 R7eO1gc27v41K5qgqXd4XSiqgTdObS6mRWow2w/Mu4TrVZTz9R8///vvraR/eoxMSg12OT88k
 fHBmul41oOlHPCuAjmKMON4ibWGuim2UrRqNgfEPRuYwKorLD6P8SM18YY1vYk/Tt9xMOH0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
X-List-Received-Date: Wed, 19 Feb 2020 09:29:24 -0000

Le 18/02/2020 à 10:11, kuhn.chenqun@huawei.com a écrit :
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> The device tree blob returned by load_device_tree is malloced.
> We should free it after cpu_physical_memory_write().
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  hw/nios2/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 46b8349876..88224aa84c 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -109,6 +109,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
>      }
>  
>      cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
> +    g_free(fdt);
>      return fdt_size;
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

