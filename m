Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1caRAJ-0004Do-Ln
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2017 13:03:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caRAF-0004CS-NC
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:03:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caRAE-0001XQ-VE
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:03:51 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:58289)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1caRAA-0001Wo-HS; Sun, 05 Feb 2017 13:03:46 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue002 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MBvyp-1chHb50bhf-00Aqrb; Sun, 05 Feb 2017 19:03:44 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <88a3c26a-31e3-9a7f-c676-3e279ab2cdc6@vivier.eu>
Date: Sun, 5 Feb 2017 19:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:NSsys3t70f67e9AyF/5Ox/gHRaUoXcK0Ca9Tz5wGXTDka2OM2fs
	7ipGDi8nJvv6jOU+iV/cRp5mwNpqQ6NTOlciX0qCtdKFiyMe61b2VHr0ZgS2eb9MActQne5
	8kTN9xx07KEvKpRqa1MkuKv5wrHfNERgyTbBGxkwfQLG8xVyFewQnXR5cKUEfxnq6bMtu5a
	N+dDHUMtduy5ZEEyE8dGw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:kMSVox3snok=:i54lLJ48KHPAFavmbJAqv8
	sOqB2yG6YpWtgEt4z1wPDKShXzyYp161cdulgBOfutVUu0GKJcn/bXonj0O3pp381Cijm4ZT+
	Wd3v2bwx1hVuHKjOsxcp6090in60iuC/yTyK9fVGjUau7LlNETFylUltr+Z8bF/87oBkRiISl
	mg+5l1MX+yp5bKb20ZBUs+7212Q+CUT4G5ZMrBL5a3OchL3lJZOa424h1YCjgWTxZb5qg4pUq
	WlvaMhW/hNeldKaMsq3Yhc4AzPdVJh9SPCz4jeODfgabyDY2AvVTsE+Fi19KDbe51moNUYptA
	k7Y9m5rZBIZ//7WmTsoDOvBDF4rla7KUMe4aezo30sAg2PaDi8h7ju2YLhLQlCq48NGy9Cal/
	XhfLHoSGxVrSgqlgz8gt5XPPOhpg6dxsp50jj5UZYzkSlFH+rVOLkkgX/7vT1XngzmsKey3aq
	bVM+XH8IsPcIia4Yn2S5el4pC1OaHuHoLznilMQaWKJPCDB2DYw7ILSPUPq5AM660Kp54ugqT
	MOWA3cLdbmz3CrL3AdY2KAdprjw82t0Z5Yq2OZxnB70Dy31Q2Aaxb2Cg2ckjHEcvVc0l4c1Jv
	a2WjZ1e7xnvkRdr2fLw6zqnpdeuT6fI2eYubQEXUn+1PvjeEymhrqFWN2z1T1C0woAZOseCcL
	WG7qcoASa0NI0ibeKxhFFVuh7JmAhN3RPuKXaUlCO+qTddSoWLWDvLLYObB6OeH9l4tvKRB6L
	5B1H+DOAupnQulxv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] softfloat: Use correct type in
 float64_to_uint64_round_to_zero()
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
X-List-Received-Date: Sun, 05 Feb 2017 18:03:54 -0000

Le 03/02/2017 à 19:59, Peter Maydell a écrit :
> In float64_to_uint64_round_to_zero() a typo meant that we were
> taking the uint64_t return value from float64_to_uint64() and
> putting it into an int64_t variable before returning it as
> uint64_t again. Use uint64_t instead of pointlessly casting it
> back and forth to int64_t.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
> Spotted while reading the code...
> 
>  fpu/softfloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index c295f31..218b375 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -7386,7 +7386,7 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *status)
>  {
>      signed char current_rounding_mode = status->float_rounding_mode;
>      set_float_rounding_mode(float_round_to_zero, status);
> -    int64_t v = float64_to_uint64(a, status);
> +    uint64_t v = float64_to_uint64(a, status);
>      set_float_rounding_mode(current_rounding_mode, status);
>      return v;
>  }
> 


