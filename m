Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvGLH-0002YK-Ke
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 01:17:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dvGLE-0002Wc-Ru
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 01:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dvGLE-0006Im-0l
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 01:17:32 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:38886
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dvGL9-0006Dw-DM; Fri, 22 Sep 2017 01:17:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id C82F9DA5CC9;
	Fri, 22 Sep 2017 07:17:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DG9Elrv9OqhO; Fri, 22 Sep 2017 07:17:25 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (pD9E01F8D.dip0.t-ipconnect.de
	[217.224.31.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 1D810DA5B82; 
	Fri, 22 Sep 2017 07:17:25 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Victor Kaplansky <victork@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1506049617-25716-1-git-send-email-thuth@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <260e3fea-6fc3-4d6c-a6b7-5fd2fd73eb42@weilnetz.de>
Date: Fri, 22 Sep 2017 07:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506049617-25716-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/boot-sector: Increase
 timeout to 600 seconds
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
X-List-Received-Date: Fri, 22 Sep 2017 05:17:34 -0000

Am 22.09.2017 um 05:06 schrieb Thomas Huth:
> If QEMU has been compiled with the flags --enable-tcg-interpreter and
> --enable-debug, the guest is running incredibly slow. The pxe boot test
> can take up to 400 seconds when testing the pseries ppc64 machine. While
> we should still look for ways to speed up the test on the pseries machine,
> it's better to increase the timeout in this test to 600 seconds anyway to
> allow the test to pass successfully now with this unusal configuration
> already.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/boot-sector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/boot-sector.c b/tests/boot-sector.c
> index 9ee8537..be29d5b 100644
> --- a/tests/boot-sector.c
> +++ b/tests/boot-sector.c
> @@ -137,9 +137,9 @@ void boot_sector_test(void)
>      uint16_t signature;
>      int i;
>  
> -    /* Wait at most 90 seconds */
> +    /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
>  #define TEST_DELAY (1 * G_USEC_PER_SEC / 10)
> -#define TEST_CYCLES MAX((90 * G_USEC_PER_SEC / TEST_DELAY), 1)
> +#define TEST_CYCLES MAX((600 * G_USEC_PER_SEC / TEST_DELAY), 1)
>  
>      /* Poll until code has run and modified memory.  Once it has we know BIOS
>       * initialization is done.  TODO: check that IP reached the halt
> 

Reviewed-by: Stefan Weil <sw@weilnetz.de>

cc'ing qemu-trivial

Thanks,
Stefan

