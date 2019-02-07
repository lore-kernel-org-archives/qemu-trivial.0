Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grq1f-0006jZ-Ez
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 15:11:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grq1e-0006j8-8z
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 15:11:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grq1d-000165-Mi
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 15:11:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:59387)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grq1b-00014B-UN; Thu, 07 Feb 2019 15:11:56 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mk178-1hXXdl2Usi-00kQMx; Thu, 07 Feb 2019 21:11:49 +0100
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-3-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <eb52ed3a-e2fb-d5d2-5d7e-ceb41e8a7987@vivier.eu>
Date: Thu, 7 Feb 2019 21:11:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-3-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NFqbcv4JGVCdmAnbdtaZzkDL+PY4ZyVgqenr2hzKHespDJC6Qjm
	/hYDIqjkvvgM7V8Ys/kKMCe26tWhujC9sHt1G77MGlKe80nfey+wWf4Rsk0QFWczj3sa3g0
	v/SsdC41Vh1Uc6xmVKq0Vr6X8f3zI85EucA0LrQKWXmBEFSyIdiEzp+4SImQLlWGfOP34yo
	gl9TUMmO0YYVIyAhm1xdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mizlD7wvpbA=:sQNtRKsonoU/Kczr7oPSGw
	iVZNdQuG9wJkGNn13HFH5Bmbz5IiACOIJW06CwrUvmSwML0/JMqZwo4apaG7UynSAWRGqoZdJ
	Gdn7KvmYN2Pm7F3ygl/gsbBbuZC9ehQst5IiYGRIckBlna6xh6Uky4eG09x8jrg1wHFl/OVlC
	oSvQpL5XhuCkabaH+K27XAwNh5dOTsdVgROB2l+pEJSq/Zq2GacN/hasg8Mi03lVUd8iXv56L
	mRu0LaT7ADBX8+1zCNA8PzUOjz4l9Pb4iS0XwqMRaMDPPTq3PB4lvboTuI4EIsYKv7cmpIuu/
	TkXA0ILx0ZqsPY2/ss5KUBbOmrGfJIj/KYvjq371sZEsakEATOhDPm6E4wYZ+9MNOHjsdK4dZ
	kM5WxrdbiYNgAjMJ7HMwPCNmwk8dSAinB7ozmgZ89NhJOEV/n6gl6q80dkxj5GNKXL4krrcdc
	zZD8die4V8Sk1KIfmAVxO3Er8VqCFmvFdsRDhiQ8xSsRGzClgzQ1aQ0GOB46B1cR+kZ9Hwhk9
	ZDhS5K3jQ6H4ZYZDzso1hesQPuWJVE+g4nOwWN3zgFf4tmEXwUuohGXv9mKcqK/33zn8/CCyN
	HzHBrtWZwbulOdenWXrkuVqifXEmyJTT/zLWPOOVkEXxXfGKNNxezjbWF6mYFO5CBI5ieZOvz
	dY6Dzzj1KimGwyr79FF8rQr/p8gWA21i/PxnoAArh3SD67ojTZKqGbXIgJIJesgakkzoIe92Z
	j8FpshrZHIu7wpzW2pFMYB3CXEvnqqM9ccdsgwWPdV9MjY+8j2B9flQzSvo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH 2/4] configure: fix qemu-img name
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
X-List-Received-Date: Thu, 07 Feb 2019 20:11:59 -0000

On 07/02/2019 20:36, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index ff55e2273e..c8fc1647fe 100755
> --- a/configure
> +++ b/configure
> @@ -1768,7 +1768,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>    virglrenderer   virgl rendering support
>    xfsctl          xfsctl support
>    qom-cast-debug  cast debugging support
> -  tools           build qemu-io, qemu-nbd and qemu-image tools
> +  tools           build qemu-io, qemu-nbd and qemu-img tools
>    vxhs            Veritas HyperScale vDisk backend support
>    bochs           bochs image format support
>    cloop           cloop image format support
> 

Fixes: c12d66aac1aa ("configure: add the missing help output for
optional features")

Perhaps the list can be updated with qemu-edid, ivshmem-client and elf2dmp?

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


