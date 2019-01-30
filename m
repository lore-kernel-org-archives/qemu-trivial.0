Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1golz6-00023Y-II
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1golz4-000232-CQ
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1golz2-0004ad-Eg
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:16:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:56299)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1golyy-0004Vq-JS; Wed, 30 Jan 2019 04:16:34 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M4roN-1gq9I52qgR-0023Pv; Wed, 30 Jan 2019 10:16:18 +0100
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
Cc: thuth@redhat.com, jslaby@suse.cz, qemu-devel@nongnu.org
References: <20190124144606.4352-1-sourav.jb1988@gmail.com>
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
Message-ID: <7363e637-7a98-31d9-c08a-3a829b7303bd@vivier.eu>
Date: Wed, 30 Jan 2019 10:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190124144606.4352-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:j5oQodGIvXCqgdv1Y1LOEm/X1Da3NIoqGrSHPfbvFu5bIp+ZTHn
	YYXHxT2norfWi7Yv1v8GpZeQd9lnVdPUbwzXQVsDmCj6VtAiRjI3xmZa+68LGnNk5r3YSCa
	1xiLzComkiwdt6eNBsXrJGdoBBqDNi3RCDOBYHBFi4zI9aWhu8DEeyQN4i2RqofYlZhh7WC
	QchjVDSRIkSAQEY3DkXJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bh8aazadK6c=:S8nKgan5K28A8lyP1k38LF
	WkVjmmKx0PQbf7zp9VF7gNX5C1x4+1qp/qjwmC8fWYPrk0KavuWFccS1gNMCNHAO5ueJmPIrR
	QS3OZqc3x5b6gYi9w1E5adPMxt1BjIeQJapjM/bOeDekn7xL2SCUD/9IBoF3u/VgpdOm9ouu/
	WSEPPQgvzMq/KG1tdh3D8MfWefrlBEIcAEiSilUOOR4YbGciGoWKMWNBJ8aRLj12a8ZlYRjfG
	OQRCtK8X11geaZetQn3rMBDTSpF7y03BqrPywypnWbTPHZC4Xmxz34fg6bToUM+ApeEbBEcMl
	BhRjqVwRziilm4jSb4tkQStH/g6NYuSsZQlyv6gXoPVE5sQMxXoBqIkJjl0yDVLeVW6CFlbkk
	kyWupjUmlmz0KJkaOev0URvXL84Y4zXy/Vil3uR4tc8mK8PMyO7H1DoQ+7aMbsEX3fQbHuxnn
	ijnsVlwLFN6o9SN0XMy8zAThjNxCXOSzQnaQiB+3EarhfxlzDiVD1IyC2nWmoFWxw/G0Na375
	9+1SFkQ6NRACHVqeMxnvIxMFu8jG24kugwWoax2aNs4+lj6gHFeynM0Tu+sfKBI5kF6C5oA/u
	QrKCSenfLax2wB8Z2die32b8BPI4aWAcwP1w/T47AcoS0W1Ew/tGsCtRfjVnoKMdZD+wKMhrU
	PJjV8vfQfiJFPEseqo0ECCaj4APtB/Kr/6veNvK7QtWihIY1F7kHxAfCgNmvn4yYJ38/CglEB
	IfNSpCjSfHjlxNU1sPUZXUQzSCp2TTKGDarcEGRGwh5YEba8prNA658XklI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] hw: edu: set category of the edu device
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
X-List-Received-Date: Wed, 30 Jan 2019 09:16:39 -0000

On 24/01/2019 15:46, kumar sourav wrote:
> Sets the category of edu device as DEVICE_CATEGORY_MISC.
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/misc/edu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index ceaf688bfb..91af452c9e 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -399,6 +399,7 @@ static void edu_instance_init(Object *obj)
>  
>  static void edu_class_init(ObjectClass *class, void *data)
>  {
> +    DeviceClass *dc = DEVICE_CLASS(class);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
>  
>      k->realize = pci_edu_realize;
> @@ -407,6 +408,7 @@ static void edu_class_init(ObjectClass *class, void *data)
>      k->device_id = 0x11e8;
>      k->revision = 0x10;
>      k->class_id = PCI_CLASS_OTHERS;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static void pci_edu_register_types(void)
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

