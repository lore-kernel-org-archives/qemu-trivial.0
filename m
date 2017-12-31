Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eVgmc-0008Mi-9O
	for mharc-qemu-trivial@gnu.org; Sun, 31 Dec 2017 11:48:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1eVgma-0008Ma-5k
	for qemu-trivial@nongnu.org; Sun, 31 Dec 2017 11:48:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1eVgmV-0007R2-6d
	for qemu-trivial@nongnu.org; Sun, 31 Dec 2017 11:48:20 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:40608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry.fleytman@gmail.com>)
	id 1eVgmU-0007Q9-Vi
	for qemu-trivial@nongnu.org; Sun, 31 Dec 2017 11:48:15 -0500
Received: by mail-wr0-x243.google.com with SMTP id p17so21533526wre.7
	for <qemu-trivial@nongnu.org>; Sun, 31 Dec 2017 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=unsEfAtw3D40LzPqRG6itPAWzrKf0M4bWF7IJHrSz2M=;
	b=o9nbJzFkiGeS6P3zFBook4w3+qaqlI2TmRQwd5/vWR6K0ABCkZik+93a2u+mgpUngX
	nlSzNYAzdWC1XDfQhhfSZ8UClkDcCacEKQHkXB4oaKMCJBHX73Q3crXaBGPsRI15lsma
	saiMe0w93vG/3y42UHTpPe9cLNe5jaaw7+TyVuJiEfZprFPRj524tcAIJxC4YhP1PJoV
	PFiTD8qCjEAP5POZ30KxS5K9JlM7BwrvGMTrPEiOKKiQV+GXAkKbSeBZtdhJtlBRpAj/
	bUZmAMIhGwDt87H2s/ICSZVruN0zBGXln2mniJ5MDk4qJ33nKHCbWbiG5elJmxIvcOgv
	e0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=unsEfAtw3D40LzPqRG6itPAWzrKf0M4bWF7IJHrSz2M=;
	b=DgI820qwNaS3ycQuv/dGrJxk5NmplMIDuGv2iraoLZbaQtcLz5ZWdjIndR+8Z5sq9y
	BkVRWe93Zut6XygLQSeTAmC512DVHhx111Niwugb6kCjjCb2qcYQ/zCFyq6GzdoFqn9/
	Enqq7z1XPZhBnW5xScW10KSazzMgRmfwOZgQpIyktGHQ4MNnebkHjEyle1imHjgNG747
	vt8TT/5B/qTEX43XYMl38GDmu4E2RwO8TAS2wD+7BfhAYuZpMy1q+3XeqPZxkbVRSO58
	RK8o0rXT56iTX11OHKEgupBd8Mv8muuOqGddFLsefNdwgOxEHMLPHTTsPy47jmiuGZCO
	X2pQ==
X-Gm-Message-State: AKGB3mKEHCwG46aTNKmafezHYQrbEJxDoLdZPQtu07UYGD427mPN/yUU
	GzugnqSrsgMrI5CEXMNW/Z4/l/L3
X-Google-Smtp-Source: ACJfBov8MPltqbxY3Hp457BVaf5pOl53qYVwk5p/kQgDYjQF9QIpuq6+xxl0EZOe3MFgBLljEVYlGw==
X-Received: by 10.223.169.8 with SMTP id u8mr42409186wrc.232.1514738893381;
	Sun, 31 Dec 2017 08:48:13 -0800 (PST)
Received: from [10.0.1.36] ([141.226.29.227]) by smtp.gmail.com with ESMTPSA id
	q196sm41060316wmb.22.2017.12.31.08.48.12
	for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Dec 2017 08:48:12 -0800 (PST)
From: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Date: Sun, 31 Dec 2017 18:48:10 +0200
References: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
To: qemu trival <qemu-trivial@nongnu.org>
In-Reply-To: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
Message-Id: <2940E43C-4EF3-4D5E-8559-2CA4C343B01D@gmail.com>
X-Mailer: Apple Mail (2.3445.5.20)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Update e-mail address
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
X-List-Received-Date: Sun, 31 Dec 2017 16:48:21 -0000

Ping.

> On 18 Dec 2017, at 17:15, Dmitry Fleytman <dmitry.fleytman@gmail.com> =
wrote:
>=20
> Updating MAINTAINERS with my current e-mail address.
>=20
> Signed-off-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> ---
> MAINTAINERS | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45e2e2009b..d51273e656 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1145,7 +1145,7 @@ F: hw/scsi/mfi.h
> F: tests/megasas-test.c
>=20
> Network packet abstractions
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: include/net/eth.h
> F: net/eth.c
> @@ -1153,7 +1153,7 @@ F: hw/net/net_rx_pkt*
> F: hw/net/net_tx_pkt*
>=20
> Vmware
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/vmxnet*
> F: hw/scsi/vmw_pvscsi*
> @@ -1174,12 +1174,12 @@ F: hw/mem/nvdimm.c
> F: include/hw/mem/nvdimm.h
>=20
> e1000x
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/e1000x*
>=20
> e1000e
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/e1000e*
>=20
> --=20
> 2.14.1
>=20


