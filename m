Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomYH-00007Y-S7
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomYE-000054-Fd
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomYC-00010m-OM
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:52:58 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:44549)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomY9-0000z1-Gh; Wed, 30 Jan 2019 04:52:53 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MmQUL-1hWbbt0D1l-00iUei; Wed, 30 Jan 2019 10:52:48 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <1548255083-8190-1-git-send-email-thuth@redhat.com>
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
Message-ID: <ad237f21-f9f8-85f3-b444-3917fdcc0744@vivier.eu>
Date: Wed, 30 Jan 2019 10:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548255083-8190-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PTg4kdodl15vzK0TjBGwS62f/ShABpZS59RzEpbiDGGohVAKLO/
	loXXUlrIqCY3tpwdkbt73jvZc6YBGyF5TzHFVMY8taxmfKaL0056JQi1khQtkAEHU5FecJl
	V32rX48IpQ0RrehCDJBhDMEKyg6FYpcJRBT8wxQq6uG6LJk4B+T2V0qcwgp+zoUGQiNSjo6
	lNgJGgneynhRwuYoSmHxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FxVoEh+Vry0=:mnT/pFh/O94klTqnA6koAK
	e/rWMJBAc7UHMZhHSRd5jcOcUBnBH+tIQr4946JHtyb+UnYnaIGdTY8KDtIqq1hn9X+Bd1wf7
	c7xBngGZUMKWH5VtqU0WRDK9/HsYKnCddbUZC+RMssvgsU8tT/cXbwX7mSMEz6tgg5Gs+OW3i
	Z4ymSrA3gvX69P/sokZQKgtbnumNpyFHB1TUkudN0lmi9I0xyKfbyzaTbQVaOGsQS15+1/dJ8
	qUWiFYzbZqOcdNFgmN9PoXUYRFDu+mOP/LWBALxdjOq/txWJRXuOWTPfWyOU1sd/tnjP4yFmv
	dBlRHu+MmKUoU17AovKKV0fWtEIMVFa1hHfX0b7sondT244YYp35gbU9tgeZyhNHkdwya6oR9
	LVBGgTvtpCvX7QZgBglJfiyBv4Vbd3JEpjTLeEVnTQoEMgpgEy78negmSMz7MCGe3kSYitTJc
	bqHXRCbc4+xsuyNbgBM6S6ns75sSaq4qeBP3KQUkhZ7BLluDnekcazdZ31YdRifycbwQ/bzfQ
	+2j05FLDWAz5EPbr3LSofpjsBoVAVZ4i9gmKiasRUsitNtqXmKnI63mokE01E3rQG7dXP6JlW
	/UsVlJNWDTpDapHIKPXVAcXGn14vfpIedajgwIT2P4q6uZZA8vXhA3Xm/BHQvwBB2kD/SaPHl
	YtD5STgNvX0FRHj2gygX8yPlcM6j/JAfownJE+k1yjVIKX4OPe1onVRS555OndlARnZblZUoS
	5T0IXPIChUxLQ0CXdw/qh1dCWZfwbP4GfijHwDG2vb6VWAG810rOhIpGP+8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] Don't talk about the LGPL if the file is
 licensed under the GPL
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
X-List-Received-Date: Wed, 30 Jan 2019 09:53:00 -0000

On 23/01/2019 15:51, Thomas Huth wrote:
> Some files claim that the code is licensed under the GPL, but then
> suddenly suggest that the user should have a look at the LGPL.
> That's of course non-sense, replace it with the correct GPL wording
> instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  crypto/afsplit.c           | 11 +++++------
>  include/crypto/afsplit.h   | 11 +++++------
>  include/hw/pci-host/gpex.h |  4 ++--
>  include/hw/pci-host/q35.h  |  4 ++--
>  include/qemu/range.h       | 11 +++++------
>  target/i386/hvf/hvf.c      |  6 +++---
>  util/range.c               | 11 +++++------
>  7 files changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/crypto/afsplit.c b/crypto/afsplit.c
> index 825e2cf..328d68c 100644
> --- a/crypto/afsplit.c
> +++ b/crypto/afsplit.c
> @@ -8,19 +8,18 @@
>   * Copyright (C) 2004, Clemens Fruhwirth <clemens@endorphin.org>
>   * Copyright (C) 2009-2012, Red Hat, Inc. All rights reserved.
>   *
> - * This library is free software; you can redistribute it and/or
> + * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License
>   * as published by the Free Software Foundation; either version 2
>   * of the License, or (at your option) any later version.
>   *
> - * This library is distributed in the hope that it will be useful,
> + * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + * General Public License for more details.
>   *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include "qemu/osdep.h"
> diff --git a/include/crypto/afsplit.h b/include/crypto/afsplit.h
> index 7dd21f0..4894d64 100644
> --- a/include/crypto/afsplit.h
> +++ b/include/crypto/afsplit.h
> @@ -3,19 +3,18 @@
>   *
>   * Copyright (c) 2015-2016 Red Hat, Inc.
>   *
> - * This library is free software; you can redistribute it and/or
> + * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License
>   * as published by the Free Software Foundation; either version 2
>   * of the License, or (at your option) any later version.
>   *
> - * This library is distributed in the hope that it will be useful,
> + * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + * General Public License for more details.
>   *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef QCRYPTO_AFSPLIT_H
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index aef38b8..2af1c4a 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -13,8 +13,8 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>
>   */
>  
>  #ifndef HW_GPEX_H
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index 8f4ddde..5ed77fa 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -15,8 +15,8 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>
>   */
>  
>  #ifndef HW_Q35_H
> diff --git a/include/qemu/range.h b/include/qemu/range.h
> index ba606c6..71b8b21 100644
> --- a/include/qemu/range.h
> +++ b/include/qemu/range.h
> @@ -3,19 +3,18 @@
>   *
>   * Copyright (c) 2015-2016 Red Hat, Inc.
>   *
> - * This library is free software; you can redistribute it and/or
> + * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public
>   * License as published by the Free Software Foundation; either
>   * version 2 of the License, or (at your option) any later version.
>   *
> - * This library is distributed in the hope that it will be useful,
> + * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + * General Public License for more details.
>   *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef QEMU_RANGE_H
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index e193022..689b585 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -13,10 +13,10 @@
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> + * General Public License for more details.
>   *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this program; if not, see <http://www.gnu.org/licenses/>.
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   *
>   * This file contain code under public domain from the hvdos project:
>   * https://github.com/mist64/hvdos
> diff --git a/util/range.c b/util/range.c
> index 416df7c..098d9d2 100644
> --- a/util/range.c
> +++ b/util/range.c
> @@ -3,19 +3,18 @@
>   *
>   * Copyright (c) 2015-2016 Red Hat, Inc.
>   *
> - * This library is free software; you can redistribute it and/or
> + * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public
>   * License as published by the Free Software Foundation; either
>   * version 2 of the License, or (at your option) any later version.
>   *
> - * This library is distributed in the hope that it will be useful,
> + * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + * General Public License for more details.
>   *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include "qemu/osdep.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

