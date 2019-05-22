Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTMB-0007fS-9q
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 11:40:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTM7-0006Ra-J9
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTT9R-0008Vl-C0
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:27:34 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56771)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTT9Q-0008N1-3Q; Wed, 22 May 2019 11:27:32 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N6svJ-1gZh6f354B-018Gru; Wed, 22 May 2019 17:27:10 +0200
To: Li Qiang <liq3ea@163.com>, alex.williamson@redhat.com, lvivier@redhat.com
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, liq3ea@gmail.com,
	qemu-devel@nongnu.org
References: <20190521151543.92274-1-liq3ea@163.com>
	<20190521151543.92274-4-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <29b405ff-b73c-af05-11ca-086338713e64@vivier.eu>
Date: Wed, 22 May 2019 17:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190521151543.92274-4-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+IjbU3nAF4sELYJG69JIK/gqVQN6oceL9m1+VL3MCoENd2LNtYy
	FP1kbtUjPFOe8ak8uciYjRBUy6QqqhNVB1fxHCuWKfVF+U0MeZxOvHmRRWvNNVZJXeSEp4l
	nDpoXgBLJHtfJXF1+VCbSXRpIi1SQkmq63Vz5Not3ukZGwAywX9yZ3m8DE8u2JmnrmDop8d
	KFgzdXOM1osjAk2qhUm1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0iA2R0aZ4Jg=:ilpz9MEWUfquIERcu7FVyf
	z0rcbQmRkRhMicfvLQ9WlCBCZI6a5EusANLEyZSYjgF6AhY6ITsQ/Z/hdb5SllxvU8eYEn0MP
	hjLa6GtYo9+kcAggBgpdZ/Fwf+/8/pQ2UHhWQX3fihJi11hHEnG7h+MmvO/f1agWg963lx7e0
	6HCNf7cS4kVs+QNATzdZAve6L6G+EjQNh+7uE+Z2woD6sQseGkVsXcoDvTtWL1xstM/uDSnZC
	rryPonrI1faYnLyInzcbiUoApUPM9Pxeft+HqLOq9dGNAwYPDWQ3yvosjdPXmquyCZN1kDc76
	l4ztGracijpQLlH/FoYtGMef6A5kTF1eEIF47Qa+IsTlESsBBR7ydpD003EVKc63Iq3PILWiR
	WATkGogba5s1QuIkIhYUnxT9hbYZCK7kFsMFoYvob18TNGJoXcLaMND2FIpFmNYdEWGiF8Dug
	+Wl4K+6NGF9QkfKAwwL1deZQXTpqETmiFis8WoyZAuR9A33z4zbhuLL0aZC3zV6lhTkuGN+TV
	2hp7cB2nuGVq+ms3q695Lcpoz+5cKGBQbSTZhuUKvz+DNaAzVXR62Ek+awVxqfE6Q++Y8tUYX
	emwSyIdu0OT8LVxOh+GkongKZCS8SIPk4HFvRKV0THriGPWIUzBad4sASxADK1iXh97vxXO2n
	3+SwfnADVihVkOjysQEEEjZ/CurlE37fXNkARNPl3GvK0LafOw8vUVKfZWSqXRyYunPw5ubQ1
	gpu71VpnKcA/cA9ZpuCw7UPPYj8X5D2gdlkaV46xdsENqmC+7qs3/+Kcf5Y=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH v2 3/4] vfio: platform: fix a typo
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
X-List-Received-Date: Wed, 22 May 2019 15:40:40 -0000

On 21/05/2019 17:15, Li Qiang wrote:
> 'eventd' should be 'eventfd'.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>   hw/vfio/platform.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index e59a0234dd..d52d6552e0 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>           g_free(intp->interrupt);
>           g_free(intp);
>           error_setg_errno(errp, -ret,
> -                         "failed to initialize trigger eventd notifier");
> +                         "failed to initialize trigger eventfd notifier");
>           return NULL;
>       }
>       if (vfio_irq_is_automasked(intp)) {
> @@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>               g_free(intp->unmask);
>               g_free(intp);
>               error_setg_errno(errp, -ret,
> -                             "failed to initialize resample eventd notifier");
> +                             "failed to initialize resample eventfd notifier");
>               return NULL;
>           }
>       }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

