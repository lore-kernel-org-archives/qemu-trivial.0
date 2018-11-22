Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPqKt-0003PO-32
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 09:52:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPqKq-0003P0-N5
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 09:52:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPqKn-0000fr-KK
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 09:52:04 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gPqKn-0000dh-9A; Thu, 22 Nov 2018 09:52:01 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MS4ab-1g1LL40Dc3-00TRzA; Thu, 22 Nov 2018 15:51:57 +0100
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
References: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2d93a332-33ad-3d3a-ab70-300d33b14e53@vivier.eu>
Date: Thu, 22 Nov 2018 15:51:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:AmRvPUJfp9c3V1h7MmDB+ha6TjNAfScR0mB2/gEH0Oj14+rnlnJ
	syghGuVB9W7HLh8XMvBSkmRB8A82FrABnqUkJMTe/nqgeaxty96KRzblMzTUdJRm0F6HFVp
	5DFrwEsEcoVZpJr4PNNU/9vYDgGS579cFofngsHdAPDScvj11fSKMeuQ3URJpuqIbgOstZq
	KWViRLSB28GG+tY7Lb5Pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:biRgEL1JPss=:Qn0T4Au3kKrl+BSVuf3gcf
	BrqEbnzBCuPE77NDMO1UWGMLAdRxchwIrlsQ7DEOtyVg0TxwUahcjjM25lxbiCLHU1z89fUqO
	+4j9Wx2NDwPcZZ1RdBVZT3OfOmV7EJ3hSykwU8Q02lWr7GsKELj14PhOGelQAY3o/eg1kl8Wc
	7Fypz+m+1bxKs38tYMkR11xMcbGfw7hG970UmagPHPK8BfhLKumvtbP0zsTuGeJhWtr4Gm8Hk
	SDoNlztXe9HEuogxrrNejJGX5MvdQ0hmS3oe28izyVeT7erRNzlF+RuaUDBHXTV/Pl42fl+00
	asVohLWjGKX+oASjSePH444wH7S1DOrrtkqVLn3Z7f11qMZp/+p0i5DKyM0RUL8gOfVJ/XBeo
	xevhCjK9aWZPh9qw/zOw2XFM9gzlxajy9jMbi6fdlxJto9n8VhdkAFVBF8kZ/7Uz1QdF4y0wY
	ef7aJ2PDJUeWv6EJFWlWnblXU+doZVdImQIvthN6WF80oTjJBIbx2Vg+HhQ/IyGToYuZBYG+l
	qok7PrfaLRlu3lm+YcZH26W9CXodXQTiirmov2MuVZxwlhYN1NOwYBbbZ2BallIQkF/i0CbsQ
	7q9YuYcLtgBf8Ebowt97zi93UN+CoCOyvbV2UtPA+fEfa7MnJJSp4VXIV8IJ1Gw4qNB0X8785
	zvLaayXrOppGKiLhmmKt+CttCDBJ+LkB//LU01kwagv07lYz7moVwOR1Rd/B2ksjtiCzcAZHa
	Zi88kDb8ihlVKbXzulIjqU29na1AIB8SYGVBq+qSgf8N8FlVvxmPypLf1KiQlco/6U3Eytogw
	WMKVy6gMKiI+CBL52CABqQeE4+K2A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] spapr: drop redundant statement in
 spapr_populate_drconf_memory()
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
X-List-Received-Date: Thu, 22 Nov 2018 14:52:06 -0000

On 22/11/2018 15:31, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/ppc/spapr.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9c41098b5781..7771a628f879 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -893,8 +893,6 @@ static int spapr_populate_drconf_memory(sPAPRMachineState *spapr, void *fdt)
>      /* ibm,associativity-lookup-arrays */
>      buf_len = (nr_nodes * 4 + 2) * sizeof(uint32_t);
>      cur_index = int_buf = g_malloc0(buf_len);
> -
> -    cur_index = int_buf;
>      int_buf[0] = cpu_to_be32(nr_nodes);
>      int_buf[1] = cpu_to_be32(4); /* Number of entries per associativity list */
>      cur_index += 2;
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


