Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fCh7V-0005Ic-A2
	for mharc-qemu-trivial@gnu.org; Sun, 29 Apr 2018 03:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fCh7T-0005IW-U4
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2018 03:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fCh7Q-0005nB-Rz
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2018 03:51:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:58201)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fCh7Q-0005mb-IX; Sun, 29 Apr 2018 03:51:36 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M8iRY-1f4xMP1WBA-00CBSC; Sun, 29 Apr 2018 09:51:33 +0200
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180429094002.3293c9de@thl530.multi.box>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <0ae49692-3c4f-3324-a551-deeb99beabcd@vivier.eu>
Date: Sun, 29 Apr 2018 09:51:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180429094002.3293c9de@thl530.multi.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PVdiRQUpYVqYh69u7xFGwy0ndkEpRzXJKN3vRryWj5dxVsxeUfu
	biGoDlU1dT1dDlIV9ff0Nb9DFsQmgomX0+XHIHYZaTB3LEPxSdmnktEqHzyzYEWmv7oRAjF
	xZP8Xdd6ryA9oAFy/EaFAoLAM+LiKVz8ttVv2dbyjemd6DMypF4jFnNfuM1KzoKOGGZHkT0
	SJTt0DyLIfV7q/G/83u7g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:XNR+qaw2ZGs=:MTNl/CJw/WwFtlHh50XxxO
	7/Deije+5+/7X002g50zwVYLd01awn0A83uC8fX5jlq2soMnu66kKIeBYtIN4UrY93sKhz8om
	69wugao8nFn+AzBAHNXdIhfubkgOE1cpNGPKqe/F1zGVxk0Hz30CDJ8pglUlkUIsNaJNQRlOu
	Y7yqTjCTZ3TZRB6Pc/Q6ZFtCtdmwlLHPwfW4fUHp6jN4i+OzZjrIti7aJx3kRozlBsRP4YrO+
	MyFfZ9yydGMD75x79Do9PIl3dOiW55B9ZovKWNctc0JLMDQxTW3lqbbXSXvllEXGlOeQbGe3a
	IwAevSe0NR03YuIQEq+J99uVF868aNH9hheX1dUKcSvf4T2cTr3n+M2EFRr6z2CMfm+JRfRj9
	6YLE3Rd0k9v1xzYKmNQ5dpFUGivbvVz7Wqy+zd+HitW+cNgxi9WYMG5fE2IKL25kTd/3nGzJJ
	NX3LR5DJfC/m29vswK5e/qdfUbvKJAfvaz4CHotcc5Qh9D+/IgHwiMcIi8/CXcJDJ5uyZynqE
	nD1KmT9h9Y8Qj8mE3/Vdfu8yNNdBWt/isvXemJn/9I+vTPzVLsiB2e3YoooCcwT2C3Ftdebpf
	QZVCxlgVjD+IZEFHGqMg4Wv5Z7Dvwug7RMTNtlPgrLl594I6h+J3lDGA14Fy48Sl9yAGO5BX8
	38cVj37Rl8vbnO6amqV0fsutl2tX5wJODThtwtkYMLRh/XbDPyhPIuA+1EAw5uDnUNJW7qXIN
	XRoFSU+bEThZ0im9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH] hw/m68k/mcf5208: Fix trivial typo in
 board description
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
X-List-Received-Date: Sun, 29 Apr 2018 07:51:40 -0000

Le 29/04/2018 à 09:40, Thomas Huth a écrit :
> It's the MCF5208 evaluation board, not the MCF5206 eval board.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  hw/m68k/mcf5208.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 7aca58542e..ae3dcc98c3 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -315,7 +315,7 @@ static void mcf5208evb_init(MachineState *machine)
>  
>  static void mcf5208evb_machine_init(MachineClass *mc)
>  {
> -    mc->desc = "MCF5206EVB";
> +    mc->desc = "MCF5208EVB";
>      mc->init = mcf5208evb_init;
>      mc->is_default = 1;
>      mc->default_cpu_type = M68K_CPU_TYPE_NAME("m5208");
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


