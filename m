Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c7Jbu-0006j3-CE
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2016 05:08:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c7Jbr-0006hk-QG
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 05:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c7Jbn-0002b2-Rj
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 05:07:59 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1c7Jbc-0002Qc-Cr; Thu, 17 Nov 2016 05:07:44 -0500
Received: by mail-wm0-x243.google.com with SMTP id u144so19595856wmu.0;
	Thu, 17 Nov 2016 02:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GmJ8O5XHzGotGys37YAyxyHchAiykOvhbS+okCZ5evs=;
	b=0kZXlu8sRTHCRd4/o/Pzn7NVTfTXZaz+dztXztyxZPR1d9FTRPsl4aF6Kke/Rfsmr0
	ArnIneQ3S1eqLf0tIVT5069xHrgxTtCqDVgKRXqmn55Z29CXU0tGUfnFWLmBLISqmGlk
	juAAy5V23Ob3vXjcYwfaHEW1iPHDDTI3+EweQvNIrAaJ4pNVJ96w5Ee5KLAsBhgMQeyH
	dO/PysuWdnfgBX8eY5zXimkxHzs9cmcUnwmJ5zwB/0mFN1vhgmnYUzMM9dXskDiFj2et
	Gv/41Vo1+xZnq+DopIz1q4TFkd1vIyvdDz+C3otv3a/vtIQNe11HuQhd+UzbXrFJSblx
	T3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GmJ8O5XHzGotGys37YAyxyHchAiykOvhbS+okCZ5evs=;
	b=fBH0+HpTePr7hXy39xI95Ozn8+fWCyEzhYzOkckMYCCgcGPjZLJYlFHGjh/4ExEVAu
	KhowYa9PkDwai8t5xQSegolusQ50JU6iELFax035FIdd/9hRhuzksu9yscZKV8Q8D8MP
	4+OFc1WMuiZIlchzDXsGavT1hVc4iNiK9LWksvg/FbEaSlJjBW6F3Hl5FZflpX0vLDfB
	ax6/1MdEpVJqtmKjMp8kjlgOH5z/WAMXFr2RbZLcbN/msnXTrZH4qGvhOQDpKjQVp8Ik
	Tgb7Je3C45mNLKlxa5xMYZ58kv/hANX8kfPcDbaZOQosshQD7y+iQ6Vj0riw8W1w+cXU
	pUtg==
X-Gm-Message-State: AKaTC00W4eQ0050yxy1gjxvhSuUacn9YJU0sqf5LEWEqVlnjC2megHvnVT+nhwYx/buKRw==
X-Received: by 10.194.37.6 with SMTP id u6mr1725929wjj.20.1479377263282;
	Thu, 17 Nov 2016 02:07:43 -0800 (PST)
Received: from localhost (host86-163-92-203.range86-163.btcentralplus.com.
	[86.163.92.203]) by smtp.gmail.com with ESMTPSA id
	t82sm2873092wmd.17.2016.11.17.02.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 02:07:42 -0800 (PST)
Date: Thu, 17 Nov 2016 10:07:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, armbru@redhat.com, dgilbert@redhat.com,
	Amit Shah <amit.shah@redhat.com>, Eric Blake <eblake@redhat.com>
Message-ID: <20161117100741.GB24138@stefanha-x1.localdomain>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
	<582D576B.7000804@huawei.com>
	<000ec561-21b1-46b8-3951-6de680fda41b@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <000ec561-21b1-46b8-3951-6de680fda41b@vivier.eu>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
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
X-List-Received-Date: Thu, 17 Nov 2016 10:08:00 -0000


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 08:52:12AM +0100, Laurent Vivier wrote:
> Le 17/11/2016 =E0 08:08, Hailiang Zhang a =E9crit :
> > Hi Laurent,
> >=20
> > On 2016/11/15 16:44, Laurent Vivier wrote:
> >> Le 14/11/2016 =E0 14:54, Stefan Hajnoczi a =E9crit :
> >>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
> >>>> ping ?
> >>>>
> >>>> Anyone pick this up?
> >>>
> >>> The original patch that added these lines went through Amit Shah and
> >>> David Gilbert.  I have CCed them.
> >>
> >> If it is needed, I can also send a pull request through my
> >> trivial-patches branch.
> >>
> >=20
> > I think this patch can go through your trivial branch if Amit or Dave
> > didn't pick it up.
>=20
> Stefan,
>=20
> can I send a pull request for this while we are in hard freeze phase or
> should we wait the end of the release?

Yes, it's a fix for incomplete documentation.

Stefan

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYLYFtAAoJEJykq7OBq3PIVwIH/0DDt4eEtDaqCbpWOZtQH/o7
amgMLBhTzqpyRLlAP0QVxxMrQnzW2b8f61Wu+ejBH2NyJO3eMMXlW49o4xSZ03Xw
zP4922EGuv0icFz03iOTL1JRGpNQluazhyZLD8A4/LSBby7hMzEu8rtHFLw+IPan
NVpnTM1UC5EXTBbVV+61HDDqjMRvUQxCdeJJCfSBgUAu1PKnnfqI6L/IF8E6CDUo
/sVLvlDJRr53sMbU0C9x7O7cwQFMlqBLoSNI7pRivKlKQ1f5QpFcLuNqIHQQc2HQ
IYJHjdoU7Rcl9aAXicRespmD6kJQOSNkxWxpRN+xKuZENhabLbwusimdl2cRcF0=
=5RxX
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--

