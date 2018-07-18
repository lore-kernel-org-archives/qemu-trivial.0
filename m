Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffowW-0004OD-9s
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 12:04:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ffowU-0004Kj-71
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ffowT-0003X6-DI
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:04:42 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:55102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1ffowO-0003Ve-A3; Wed, 18 Jul 2018 12:04:36 -0400
Received: by mail-wm0-x243.google.com with SMTP id c14-v6so3329437wmb.4;
	Wed, 18 Jul 2018 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BNkPBvBO14C2NCfid1aA87H+QvDKDCyQHwxN/LVNKOg=;
	b=niSDikucffr57VylG/sx7d+dvcB0uOSK2EljEnyzqDZoSelIBQAESq5hyaTsKVmGKQ
	toMtuP0PLrLOE12S68b9p4geD0byt4pvsjgniiySXh48IoklMekbwrEWYuaDPgBG0zwh
	NupgrYYUFMqI6FhK8KPEwIMnZIqvr8JwEVqNt7Xsh07GmVpSw7lGX+0be7VGP1btwJDj
	pu3Ft5UM3VmCCuP7rERHo4vl+OW1s9rD37Yrr/q7mltu8wtDw2Al/6r+ik0FlCdSOyjq
	pPUOhvx2gSZpgdBDVhcPTFz6n2DDqeM1qctdsVO0e8v4dda3p0L7klugd1EGL04hVvZk
	xuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BNkPBvBO14C2NCfid1aA87H+QvDKDCyQHwxN/LVNKOg=;
	b=EEeFDwgV/U8Q5lExRekB0nyU18oaSv42C5so6Jdc08FL1x+41vzBY8vmbzccZ3P33B
	AhhqMP1iwsJr4S3+DQLNqz/YZRhwB/mAJBprSNEDx54VEXczZ4Xue+BcQSCUlRxnsieD
	qrnL749tYz0kn6ZDtkh4IUF0DPptJn7wtpFopzfAjWIOHuDwdMOvl1VLU2uAESUn/ypq
	5sfSWn40aCmlnj/E+Qihe4P/hzLeG6PAVaPugHrKe+UKu9r/4G4yQuetQEHyC3pNaUN+
	bp/wQULOQU+C+TOJxcv+MszBsePaQgw52BBo8V1mkdj6kyknIx+s/3v3llBIrRo7hA4F
	mPlQ==
X-Gm-Message-State: AOUpUlFWwXnZXkHAJmEjwQiAn8kRWYC7+BGgoW/BZ4T5G0erJsYEs8tr
	JVqSaqPFlfPcloKVs7Is821g482M
X-Google-Smtp-Source: AAOMgpfK4RzpkvlHABio8FyE4ZSx5kitTRee/v8kg2ctkZCMQglpR66tLoZu5Dfc9BCKhRaltQ3kYg==
X-Received: by 2002:a1c:1748:: with SMTP id 69-v6mr1936662wmx.75.1531929875420;
	Wed, 18 Jul 2018 09:04:35 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	y102-v6sm4811560wmh.9.2018.07.18.09.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Jul 2018 09:04:34 -0700 (PDT)
Date: Wed, 18 Jul 2018 17:04:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20180718160433.GQ21825@stefanha-x1.localdomain>
References: <20180712192603.11599-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y9o+fgG4MNl0mnzl"
Content-Disposition: inline
In-Reply-To: <20180712192603.11599-1-sw@weilnetz.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support
 pkg-config for zlib
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
X-List-Received-Date: Wed, 18 Jul 2018 16:04:43 -0000


--Y9o+fgG4MNl0mnzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2018 at 09:26:03PM +0200, Stefan Weil wrote:
> This is needed for builds with the mingw64-* packages from Cygwin,
> but also works for Linux.
>=20
> Move the zlib test also more to the end because users should
> get information on the really important missing packages
> (which also require zlib) first.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure | 40 +++++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Y9o+fgG4MNl0mnzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbT2URAAoJEJykq7OBq3PIkCMIAJiDUGsZBBrvQL2fVs0W2HyD
TpIAAWPMXpbn5a6q03d3Mtx+12iJWIbVjks2mKTw/fzipC7kA/4qbzTGuG9osOz1
Oc/aYVh3O29UfWrOZD4DvneSOR87PmRGiJ9yCZq5hQwtUPCHerXIeAJwE7raCnYD
IC91mhltSaCScw9fc4SpiyhQo01Vw2XTc1HlI2zvK2l8FTer0jLXJd9OLddJ9/J4
hXGrAriM1x9oSAptvNxBExlsjDSkPG7O2yjzX2hETi66b5fafDRzQaHm3VixtfYA
o1WiddzaQWsCfdB7k5kJSEV/0oAiQDMpRxcAmGA3oGOYXsKh4jH2kboOXaeshrg=
=0xRw
-----END PGP SIGNATURE-----

--Y9o+fgG4MNl0mnzl--

