Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1Sm9-0005hH-4s
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sm7-0005fW-1x
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sm6-0006D2-9T
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:23:43 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:54615)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1Sm5-0006C3-VK; Wed, 06 Mar 2019 04:23:42 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1N6Kl7-1h3LNG0wnp-016gST; Wed, 06 Mar 2019 10:23:35 +0100
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: thuth@redhat.com, mst@redhat.com, imammedo@redhat.com, philmd@redhat.com
References: <20190214084939.20640-1-richardw.yang@linux.intel.com>
	<20190214084939.20640-4-richardw.yang@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8a961366-89d2-bdde-9fa2-8ae95bc4275b@vivier.eu>
Date: Wed, 6 Mar 2019 10:23:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190214084939.20640-4-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T/T9GeP0tu5PC5CJJHQPMn6R9WBOXtYY2Wy/jXhqdxHbe/P4eol
	q5TZW1rZidkiJOcfgnk11mRWvi3FyuP+pLbl8EwkCProAw+VvVvrN28RK9ZXhCsAeaFGxrN
	VzXAP/5NYFihamwDokYG3uxnu91unonYFa/0/p0bm0wFLS3+Z50l1QewAT+cQhp5cCZpow5
	bOtbgdgmQf9P4VxhKCLZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M5A3otzG0EQ=:PTj5xmmgve5DSiljE/GpLi
	wyp1kL6+Ca/F51Vg1ZH1j94bTnEi5NpfQgKzT/NlNSWK7esCsfuLKZYzrxohI42ybnLUjhWbb
	t54zw1eHbtrGyar+zc+6rTxZpPOJxmf0FTQ0SQfrKV/PfS3F4fPS1p5gNS6TRsxqsgoXXbObP
	atV8GeNpyOI1EezZPeSIRzY1ZDGezBRzOY9LaBH8EesnchrxtAZeDMf1u/N9MRU8zIOc2yjcQ
	J/LuAjrtgVJbC14OdeSfq71kCOxGNXJ35ONXrE418qwMFV7TxZ0ccCJ/aOJjHQpJVAyCBxBlp
	vsE5qUnlUzDPZ4wqZAb1E6nryc7rvvZ2MM9PzzFnKeEPL4bRMOrRglE/QJ17Xw3qIGSJ4MPJG
	oPoXScnAPMlv/Ft5hLymzPI6KECR5u9cSweIUk7dvv5D5esd73R1Ja4apSW1SAF4kdK8PEr8G
	6HVhwqwPPJa2cwFwJ3lF75S6MRex3cVfXylX1d6TWpXCjOiWAOtuYzyksuboteCmfu3tfF1S6
	hY+TLZyrKPKoouunBRNs9jSzyHCJScxboY7gKQT07kpitooDpspMRaG+OLx8KnSabLDlOuJB1
	r7AU6c08OBs6TmeuCRJ5LK5iPqw5AYAMFp/FzEp2FPTDfCtyDyaRueTlEmIWMg0mV1NOdZsW0
	xmlmS72w2Eu7l5dgiG3YapV/VT0Ou+4kVFUyuBRsbzHHQoar+V+NnNph27X4vqrgzkmBshWOZ
	NylNYUGfoxfFW38lsENy+w6ed/+diTdtaCdCueJz4JFTFnA6nK/40rSbQBM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [Patch v4 3/3] hw/acpi: remove unnecessary
 variable acpi_table_builtin
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
X-List-Received-Date: Wed, 06 Mar 2019 09:23:43 -0000

On 14/02/2019 09:49, Wei Yang wrote:
> acpi_table_builtin is now always false, it is not necessary to check it
> again.
> 
> This patch just removes it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index e9b1a85e54..f9c96535d1 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -303,8 +303,6 @@ out:
>      error_propagate(errp, err);
>  }
>  
> -static bool acpi_table_builtin = false;
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr = current - sizeof(hdr->_length);
> @@ -320,7 +318,7 @@ void *acpi_table_hdr(void *h)
>  
>  uint8_t *acpi_table_first(void)
>  {
> -    if (acpi_table_builtin || !acpi_tables) {
> +    if (!acpi_tables) {
>          return NULL;
>      }
>      return acpi_table_hdr(acpi_tables + ACPI_TABLE_PFX_SIZE);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

