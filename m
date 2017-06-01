Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGKN6-0005vA-KL
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 03:18:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dGKN4-0005tK-Iv
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 03:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dGKN3-0000Gu-GK
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 03:18:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dGKMz-0000Cp-3C; Thu, 01 Jun 2017 03:18:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC1CF80C1D;
	Thu,  1 Jun 2017 07:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EC1CF80C1D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EC1CF80C1D
Received: from [10.36.117.7] (ovpn-117-7.ams2.redhat.com [10.36.117.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 500E581419;
	Thu,  1 Jun 2017 07:18:05 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org
Cc: thuth@redhat.com, qemu-devel@nongnu.org
References: <20170531192836.7187-1-jsnow@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <88293908-ce2e-32e3-8094-f9288f9c6c17@redhat.com>
Date: Thu, 1 Jun 2017 09:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170531192836.7187-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 01 Jun 2017 07:18:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ide-test: check return of fwrite
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
X-List-Received-Date: Thu, 01 Jun 2017 07:18:15 -0000

On 31/05/2017 21:28, John Snow wrote:
> To quiet patchew, add an assert for fwrite's return value.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  tests/ide-test.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index 139ebc0..bfd79dd 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -796,11 +796,13 @@ static void cdrom_pio_impl(int nblocks)
>      int i, j;
>      uint8_t data;
>      uint16_t limit;
> +    size_t ret;
>  
>      /* Prepopulate the CDROM with an interesting pattern */
>      generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
>      fh = fopen(tmp_path, "w+");
> -    fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
> +    ret = fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
> +    g_assert_cmpint(ret, ==, patt_blocks);
>      fclose(fh);
>  
>      ide_test_start("-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
> @@ -880,6 +882,7 @@ static void test_cdrom_pio_large(void)
>  static void test_cdrom_dma(void)
>  {
>      static const size_t len = ATAPI_BLOCK_SIZE;
> +    size_t ret;
>      char *pattern = g_malloc(ATAPI_BLOCK_SIZE * 16);
>      char *rx = g_malloc0(len);
>      uintptr_t guest_buf;
> @@ -896,7 +899,8 @@ static void test_cdrom_dma(void)
>  
>      generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
>      fh = fopen(tmp_path, "w+");
> -    fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
> +    ret = fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
> +    g_assert_cmpint(ret, ==, 16);
>      fclose(fh);
>  
>      send_dma_request(CMD_PACKET, 0, 1, prdt, 1, send_scsi_cdb_read10);
> 


