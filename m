Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bq2Ck-0008Mz-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 14:06:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>) id 1bq2Ci-0008Mf-Ul
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 14:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>) id 1bq2Ce-0006ss-PG
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 14:06:36 -0400
Received: from mout.gmx.net ([212.227.15.19]:62172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>)
	id 1bq2Ce-0006sA-Fe; Fri, 30 Sep 2016 14:06:32 -0400
Received: from latitude ([88.153.7.52]) by mail.gmx.com (mrgmx002) with
	ESMTPSA (Nemesis) id 0MFMIO-1bkWQ93IOq-00ELeq; Fri, 30 Sep 2016 20:06:25
	+0200
Date: Fri, 30 Sep 2016 20:06:24 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Akanksha Srivastava <akanksha.dlf@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kraxel@redhat.com
Message-ID: <20160930180624.fpmybtpkldpeehiu@latitude>
References: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nva7qj46au5qh3qu"
Content-Disposition: inline
In-Reply-To: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
User-Agent: NeoMutt/20160910 (1.7.0)
X-Provags-ID: V03:K0:DdMLPoBfaB5+GOl63BcOqq0L4tgutYmeP2CwrOX2uNFj848mnoc
	BuOEqHz4YLAirkSoFtyPbLjq0zSPFrkEDu2+D0QV8V2O4WJuMHdruuuYLX9OPDt6b1d4XKB
	BxQhGqOLkTUF8wv8DIkGWVfI8/pVzihJKzEZh75nI/KsCPkZiC2fPUWeAYIU/M79ix2ZQ+/
	ulJI2zj+GspAh5LLVgWvg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:jgWDLL6P7yg=:tU1o9C+KkWkag0v2XJowMY
	ZJWHEjMb2qJ/INGxSGh2dFPlH6J8p7E9A4HuxvJ5fruE5beZJRR4fPo2ibfunrTpv3MTa7N65
	IhgAbQSJZ6ytYNuI9s0vEskFZQCjDhFNbkOQW5Ilh3sykhj4lOulG584oEJUCfcOJ9RTwKffy
	Ayt90fE9/amb+cHjHozvQeBNlDXVwrXGWtgA9DmKmD1o4fWPXXKyPVqw6hKqQskfosPCXdtTt
	nw1m3TZoC4t4kVqlEYaDQZ+p1DIxg8nQYzDmB67/PFXQGIwbladOVZ0wSz252vVW0bygVMOBu
	MvLzxmb+M/t26BZaWfSkbzb0tNqvDlUWn6ceTYUnnbAHncNvsJWeXtXi5MvEGGUlXMQe59sTe
	xLZ7oV6qRdp3dtii573RB9uXrRRlqyMBHx9GCU1DNKm3tiBPc1pXTShrRKHKHIY5uq+Id5dKo
	oNeL3+K6TKD5K1CiCRjyDFtKb/3uZUWUWtTj7a/HKWgzfZHeKY08VOiZJvyz6rXrwgUWr1Zqb
	B+leQha7zui0qxfHwNtOHE/o03OQHMNKsskoOXt6BHlLfIPf0t91qwjbaUJyFiXv+a+pedZDS
	kC9NpVh8cWxAQkIWOBeRp0kS5BmMeQe3hArzEnBGSjpGecTUaLOuObxBx3Gkkm4QClIlzUejT
	ztiKmqNPIcxNfc77LuSNAlDtpwIj3LqdpBUdFoFpr0m0ejARc9fKngP8w78Ct6n+rG9wJaaAi
	+V5f3AYKEqXOjyD51nXPEVbOrihxH9D0K1rUbh/nYgimdDBXXEbe72eyQkc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.19
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Change *_exitfn return
 type from void to int
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
X-List-Received-Date: Fri, 30 Sep 2016 18:06:38 -0000


--nva7qj46au5qh3qu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 11:21:35PM +0530, Akanksha Srivastava wrote:
> Subject: [Qemu-devel] [PATCH] usb: Change *_exitfn return type from void =
to int

This should read "from int to void", I guess.

> The *_exitfn functions cannot fail and should not be
> returning int.
> Suggested as a Bite-sized task
> Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
> ---
>  hw/usb/ccid-card-emulated.c | 4 ++--
>  hw/usb/ccid-card-passthru.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
[...]
> -static int passthru_exitfn(CCIDCardState *base)
> +static void passthru_exitfn(CCIDCardState *base)
>  {
> -    return 0;
> +    return;
>  }

Have you compile-tested this change? I think you'll have to adjust the
definition of exitfn in CCIDCardClass, and ccid_card_exitfn (in
hw/usb/dev-smartcard-reader.c) as well.


Regards,
Jonathan Neusch=C3=A4fer

--nva7qj46au5qh3qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJX7qmYAAoJEAgwRJqO81/blMoQAMd2y3XQ992vlnrnkgfjXbkD
4IkfSfCMrokwp5P5CtzIX6hrhHiGXIhanNsRC8MKxiHYFikXOvBKWofdOj4pxIz3
VltVuWMH+K1p4kHx2H62yuqmyw6UvmezNJBm/W/z/lS57qX00WSE5TAKLhDSgy5c
MaX5rzQ0Ng0RlAKeBdBGBkcJG8CbEjsMqcnbTV33u2Fz/F1BErDmIlrSmH+PI7kC
ULEXs+97yXLfx/Cyj+i+V1+3yRZk9L5vXRpzqzXGf+rauzcGQvMRKPeMSx/yPx/L
DAfJlgRck5VTMVmy9M2xeDXoLxix4erFA7aCTmpqM+VjlG4D+u6uBtTGwftMn/M6
Yfj5CmZPCV66s/s3IWZsDu4I4ivh63VHFxdJDuNUL1NnSR56GYsAg9N2isOhYcse
yGUIBCUpyJu0xOet3H7ZeyrOzeJAgA40udfnR++Eyb5AVE/+T0RF7IP2OQPqs16y
8hEakY0u5kOnFYG4MpeUrZqJwZK8O1C3s2n8GDu9cj+zZdzJyX91zj+mDgGce4JT
yRGuDJpuoSPUnb4sG77YgUcNM4JEihCKkPToCGQ2Fui+Ob5jjcFiI+5WF4tmqULa
+THMGXTIfVOQnzrW9aZsKVVb8DzZySoJZ35tQatmMJisihoqlTMFUB8rWNFW4l4g
iBqLhKV5+iBwniQEzpJN
=J8/h
-----END PGP SIGNATURE-----

--nva7qj46au5qh3qu--

