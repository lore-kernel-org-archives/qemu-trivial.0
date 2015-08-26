Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUjBM-0002Yb-9h
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 18:28:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1ZUjBK-0002Xk-BR
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 18:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1ZUjBH-0006Cb-54
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 18:28:34 -0400
Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b]:36827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1ZUjBH-0006CO-0c
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 18:28:31 -0400
Received: by obkg7 with SMTP id g7so1396738obk.3
	for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2015 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:content-type:mime-version:content-transfer-encoding:from
	:user-agent:to:references:in-reply-to:message-id:subject:date;
	bh=Ivei2AE7CSv5MOMcqrZp/YPLZOMtaxA2+5O32zgadjc=;
	b=MXWCN2w+UEj78oxzJpqEBKqq/GgC9GfOlOgxVLVj+dp85oJ1qlqIy76N4PeWiFg1sF
	6p3M+MPfPckRskOIcXFWu4SGLgM6/7jkUe0MvcKQuXqxOI4Wcqb6lBduZ+gZ3gSus5bm
	nay9ZPk8PLQPtAHbyOBl+abiE9Xtr6np/LUc4Is3IJUhY6WiH+XnhiX6zm9vGYjWeJuU
	Ch6SsWMhFAovTrBcL+ekuUymPt6WxBAb0fmB0eQS0r4uOYl2Sp7bFDvs3MzdgvuoVbuQ
	ZEqpzV+sVABBKPb329oITufUDpG9lPtRbVdUtmufxISsb77TIPM68IDTg68n5r5psiQ5
	Ds9w==
X-Received: by 10.60.39.136 with SMTP id p8mr619523oek.45.1440628110602;
	Wed, 26 Aug 2015 15:28:30 -0700 (PDT)
Received: from localhost (104-184-96-177.lightspeed.austtx.sbcglobal.net.
	[104.184.96.177])
	by smtp.gmail.com with ESMTPSA id fw2sm69570obb.24.2015.08.26.15.28.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 26 Aug 2015 15:28:29 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: alot/0.3.6
To: Leonid Bloch <leonid@daynix.com>,  qemu-trivial@nongnu.org
References: <1438189851-688-1-git-send-email-leonid@daynix.com>
	<1438189851-688-2-git-send-email-leonid@daynix.com>
In-Reply-To: <1438189851-688-2-git-send-email-leonid@daynix.com>
Message-ID: <20150826222813.4090.77346@loki>
Date: Wed, 26 Aug 2015 17:28:13 -0500
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22b
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-ga: Two MSI related cosmetic
	changes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 22:28:35 -0000

Quoting Leonid Bloch (2015-07-29 12:10:51)
> Signed-off-by: Leonid Bloch <leonid@daynix.com>

Thanks, both applied to qga tree:
  https://github.com/mdroth/qemu/commits/qga

> ---
>  Makefile                  | 2 +-
>  qga/installer/qemu-ga.wxs | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/Makefile b/Makefile
> index c9be643..fc22da5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -295,7 +295,7 @@ qemu-ga$(EXESUF): $(qga-obj-y) libqemuutil.a libqemus=
tub.a
>  ifdef QEMU_GA_MSI_ENABLED
>  QEMU_GA_MSI=3Dqemu-ga-$(ARCH).msi
> =

> -msi: ${QEMU_GA_MSI}
> +msi: $(QEMU_GA_MSI)
> =

>  $(QEMU_GA_MSI): qemu-ga.exe
> =

> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 2c43f1b..4e917a9 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -126,7 +126,8 @@
>                Property=3D"cmd"
>                Impersonate=3D"no"
>                Return=3D"check"
> -              ></CustomAction>
> +              >
> +    </CustomAction>
>      <?endif?>
> =

>      <Feature Id=3D"QEMUFeature" Title=3D"QEMU Guest Agent" Level=3D"1">
> -- =

> 2.4.3
> =

>=20

