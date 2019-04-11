Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEg1r-0002XF-2v
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 16:10:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEg1p-0002W4-GM
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEg1o-0005tX-E8
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:10:33 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46849)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEg1j-0005pd-9f; Thu, 11 Apr 2019 16:10:27 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MdNTs-1gfLH43frU-00ZSKJ; Thu, 11 Apr 2019 22:10:23 +0200
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20190409053320.14612-1-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <38f6dcce-2122-0516-01f6-a549f11da87f@vivier.eu>
Date: Thu, 11 Apr 2019 22:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190409053320.14612-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:U3Ah2rNNRGktON+pkiuaivfx21iz6MSsTZgH2YrHBYoGcLte6tT
	AvkNIKv6FoFfZTTg0uFtIeeqRHDJX1BNGRlmCaiCUijSIZbsPOimxusKupQ7bhbQdkI63wU
	eI0Qn+gBOgihp0Kv/oy2OQNsy074mPUE5VhioM11xo4BT9YZ3ALw0VMuRKFgkcawjsCnFhO
	C13LJHqqLdhzal2gwE+Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0OZISRCBkAM=:9wTzupUPhDvHg6lscAJzj6
	XZtNrUn1bWTsAHxX+1nZXxEmxHD0BQ5b5MrmxYEDn+0r5m3/6WjVjBZ3JOZa1sXyWcwmif3sL
	6gY+u1dJ0rCoG4KhpZnUNSah1NpTxeH5TSoyMyspY+R3w1Upu0qBMn7uI2yhRZ+4o9ymZ8EJe
	35ZMdy7joa7IFivfLj10jsTZ3c8aURAV/ovjKkYykSDgJVrvSdXhfU4+L/nlyBSf95qp0eD57
	WEJb70Q8ygEJiNmZ0BaaMZYYz7gF4RvkgYeNEja/HS64Fnp4u9UbZz05eQlCbn1EOX2utnflm
	1iQdHL9JG6PbGydA9VLofEtP4dwMTtqHZozeY+UQNUpmI8mGYZjxXZ+xTX9utW0bPRYqGUOoY
	gBsl5cF3fzeuZgGZZFmKRARDmy4JTGAOMqpWkToCgjd1F5P1W7qM3vkIhf7n/syfhU5eiC3uI
	8nQzq0vhYcElZpFAKuu1b9JvDnIMTHf/6jhv1DoUO9aGqY6td4b/27wXi6EKf03FHHnWrA39l
	Gs5qwQuK3If7ExYKwQvlHfnLPiYiyrsSyiO8c6thK0VrHFdQ0g1RbsFezyAoESNYVF2nBTjFK
	PAjt2QbvGEpqe4c/FRS01mF3kWJ0fAxTYxV36Rd6fP7+m9a60JPb6YZpja6Uji9L30o3ycmcg
	sFEtmu0E8MvyVJZaVrfIOsUEaXAqGXMacMW5twvuSRexwqCSg6CYojQxk3QO1fprzA9Li2iS6
	WPZ3wxA0GC71srjuJfl24xKZ2WLcJpsmQZW1TDc46vPQ8ui8TUJHogBu2Lc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] Update configure
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
X-List-Received-Date: Thu, 11 Apr 2019 20:10:34 -0000

On 09/04/2019 07:33, Stefan Weil wrote:
> The last *.aml file was removed in commit 13b1881aacc7e5018773bd545bbaf8d5476699ee.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 1c563a7027..9c5d9a8c96 100755
> --- a/configure
> +++ b/configure
> @@ -7886,7 +7886,6 @@ LINKS="$LINKS python"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
>      $source_path/pc-bios/*.lid \
> -    $source_path/pc-bios/*.aml \
>      $source_path/pc-bios/*.rom \
>      $source_path/pc-bios/*.dtb \
>      $source_path/pc-bios/*.img \
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

