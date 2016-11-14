Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6Hiu-0002Uh-Pd
	for mharc-qemu-trivial@gnu.org; Mon, 14 Nov 2016 08:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c6Hir-0002S8-MN
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2016 08:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c6Hio-0003od-Hb
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2016 08:54:57 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1c6Hio-0003oQ-AU; Mon, 14 Nov 2016 08:54:54 -0500
Received: by mail-wm0-x244.google.com with SMTP id g23so15589848wme.1;
	Mon, 14 Nov 2016 05:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5NERC4mRgtvfdDVRQ5jKv/Ee/tLiEyWskphSjjI4N08=;
	b=s+lgN1IZXHsSrX/+mXH0gXLhl02XdUGmPb2us1mR0BZ9RzOrJnu8JOr/MCLszcTGl+
	S4LRueqIKnSdIjiZF3ZoaL3+UuUr3/1ffbWOlXY1SAMSMYlXc48JIJwyCoBd4Q+7g9ll
	S2GwtQMzz87AzG6iSw/pvEmp3pzwyUFG1er/cywg4/f42f3VDWcij3nLz6GO2fK3ZGDK
	6xSK6QObBkdlMd3yRiProJBDChNUOvD36g0INkyemnEBkQo3Aatpsmp/1EpDOr/2QdxR
	KWrFxUilZ6p3YMANVKo6NLYOsU/z4fmu60y/DR1FXt879BHIKk7N8U9oeXgjegkP6dfP
	9MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5NERC4mRgtvfdDVRQ5jKv/Ee/tLiEyWskphSjjI4N08=;
	b=dafmaMbtttTuY4GYJtHAf3+hUT2pjSc7CMFDVRWmKK+XkaDFI+oXjvxyaHd3mZ9DRF
	7jhTfNFa+0cjtj23herb09rAgeZSgSdHaA3i+PpIAPZ9FQGrRFAN0oxeivYKE6b+mFCf
	t6RdinmnWY5a/Bxg8gRo1SVlAY+wEy/5fyg2fBrVqlsSWQ1zL+t7z/Uw3TeW/dBaN6mb
	blxGixXdfxGqkL0junseqZfUGjKDC46tpXSEcOztdQlUOn9vuu5L1dE3OFYPSrSYli+t
	WUIzArBfGmuxf/uDE2mB4Wve5VsE5Uyqc9JRWJZnEHXQcZ4vcdE2AsdWTB5I/LFBz4mN
	+l1w==
X-Gm-Message-State: ABUngvc9nr3TtFzEqi0EJQI3LNbGEIDQd9G1N0Z/y8RW4txQQ9nJ2urd53NnftoCBBMsig==
X-Received: by 10.28.48.145 with SMTP id w139mr11204368wmw.113.1479131692941; 
	Mon, 14 Nov 2016 05:54:52 -0800 (PST)
Received: from localhost (host86-163-92-203.range86-163.btcentralplus.com.
	[86.163.92.203]) by smtp.gmail.com with ESMTPSA id
	g184sm36435830wme.23.2016.11.14.05.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 05:54:52 -0800 (PST)
Date: Mon, 14 Nov 2016 13:54:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Cc: Eric Blake <eblake@redhat.com>, armbru@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Amit Shah <amit.shah@redhat.com>, dgilbert@redhat.com
Message-ID: <20161114135451.GB26198@stefanha-x1.localdomain>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <5829233D.8080709@huawei.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
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
X-List-Received-Date: Mon, 14 Nov 2016 13:54:58 -0000


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
> ping ?
>=20
> Anyone pick this up?

The original patch that added these lines went through Amit Shah and
David Gilbert.  I have CCed them.

Stefan

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYKcIrAAoJEJykq7OBq3PIG6UH/irwFszNpAQhQZFutJur+qrc
oeB7foGt53XFu0srX4pdREGci5TkoH0R6ri8thJsysW27KIBwiici8fc4hn8Wct6
n/lIjsTcfMpU8p66ot8X50I9GOdGWYNF0kPKBsvXwzTdmwundnMSBeIywfzziG2W
KbKwiC7q3pE0N5+jBtJN0xefOHoKPzmN1MSIxvqpMIDHFQtkCBSyvoAi5RKq1kP/
qVKa8t3H6nYh2rOweQcEFxLD60Csydh4gBNYdQPbnFrc8zORz0QJvadvJHkeVIiv
th3ND3bh7UGBd/OPtAJ3WRcv5scwVY41eKGaUtyf4l0YEvhiqjbEcSn6ixSMN1w=
=JxhG
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

