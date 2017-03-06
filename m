Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckmdA-00081r-3R
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 02:00:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ckmd4-0007xi-GU
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 02:00:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ckmd1-0003LW-El
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 02:00:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ckmcq-0003Ah-1E; Mon, 06 Mar 2017 02:00:08 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B247861B9C;
	Mon,  6 Mar 2017 07:00:05 +0000 (UTC)
Received: from [10.36.116.125] (ovpn-116-125.ams2.redhat.com [10.36.116.125])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v26701SL027182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Mar 2017 02:00:03 -0500
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5475df8-290b-07d4-d177-979d78850615@redhat.com>
Date: Mon, 6 Mar 2017 08:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 06 Mar 2017 07:00:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 13/13] ppc: Add SM501
 device in config for ppc and ppcemb targets
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
X-List-Received-Date: Mon, 06 Mar 2017 07:00:26 -0000

On 13.12.2016 22:00, BALATON Zoltan wrote:
> This is not used by default on any emulated machine yet but it is
> still useful to have it compiled so it can be added from the command
> line for clients that can use it (e.g. MorphOS has no driver for any
> other emulated video cards but can output via SM501)
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  default-configs/ppc-softmmu.mak    | 1 +
>  default-configs/ppcemb-softmmu.mak | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-soft=
mmu.mak
> index 09c1d45..1f1cd85 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -45,6 +45,7 @@ CONFIG_OPENPIC_KVM=3D$(and $(CONFIG_E500),$(CONFIG_KV=
M))
>  CONFIG_PLATFORM_BUS=3Dy
>  CONFIG_ETSEC=3Dy
>  CONFIG_LIBDECNUMBER=3Dy
> +CONFIG_SM501=3Dy
>  # For PReP
>  CONFIG_SERIAL_ISA=3Dy
>  CONFIG_MC146818RTC=3Dy
> diff --git a/default-configs/ppcemb-softmmu.mak b/default-configs/ppcem=
b-softmmu.mak
> index 7f56004..94340de 100644
> --- a/default-configs/ppcemb-softmmu.mak
> +++ b/default-configs/ppcemb-softmmu.mak
> @@ -15,3 +15,4 @@ CONFIG_I8259=3Dy
>  CONFIG_XILINX=3Dy
>  CONFIG_XILINX_ETHLITE=3Dy
>  CONFIG_LIBDECNUMBER=3Dy
> +CONFIG_SM501=3Dy

Looks like there are indeed embedded PPC devices that are shipped with
the SM501 controller (e.g. the TQM5200), so I think this makes sense:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Note: In case you respin the series, you might want to add this
CONFIG_SM501 to ppc64-softmmu.mak, too, since it is a superset of the
32-bit config (i.e. it can also emulate the 32-bit embedded chips).

 Thomas


