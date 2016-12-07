Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEcKf-00078d-Ab
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 08:32:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cEcKc-00076r-Ki
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 08:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cEcKY-0004WB-OY
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 08:32:22 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:35924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cEcKT-0004RN-NF; Wed, 07 Dec 2016 08:32:13 -0500
Received: by mail-wj0-f195.google.com with SMTP id j10so22518600wjb.3;
	Wed, 07 Dec 2016 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DVA66IjzIOT2TihklG3tEKznfgEYi3OD3xWM5Bx5xvc=;
	b=LVkV8AIkh5yQGPGTkoB2U3wJfCV6mrMWQLCFLX5TPG2B2Oi/Gd2/+P7GQIpnIJZvX3
	B8ebxodI9JZg8uLypReydlFn2J5W4pfwkyroVo2YAkBBJcEY1eJ/xBq6s/rfWeHALvFM
	Veeq2K44WRU4vCIFYpYUzmUfgLWuM7oCPte8Ba/olWo8wLfa1XFYHHC2udHRgD37Vn4x
	tm6cgDI5d/t7fhhHvPMc2D1X1U+QrVgzTptSUJxxqIT5Km65Qhj4kAV3+4Pm30c5zh0K
	3OJmis698LlmpDuI1zWGMCHZp/lMAawN4Q5OhzxPfzlQp7vJ/uiSOpSh//ZB+mKG/Bgd
	zEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DVA66IjzIOT2TihklG3tEKznfgEYi3OD3xWM5Bx5xvc=;
	b=TlfXCUE67hkazE7ZCahFtCl9bUeV8XflaLZ9dJDNshIKsIkpsDg0nozn5oSse20L7I
	2T/08hXWkRS19WolNRPoTU8zK7g0vVBeyCMjK4IKf4apykR67z3rvkJBOm3Ru/oRlRr+
	zv8QaOfRa9LfEWE0YReO5E9Qy6eDXROdGEqo+kKiT0TmOiT+/k1kVU6d7AhEchTw+Mi+
	8H0LVcQ4CaEhnAhNFKPXfVzZMPR1KBvuXlfSzvm3Q5Zth1e272SvUzbkFkLMy8j6GOC4
	lfBsTZIaVvIC/bhItsdKtakgRpZr09xOo7G/e0IwRR6dfg23TzzJ3eW+gGebarSEcEPe
	iuvg==
X-Gm-Message-State: AKaTC01ELOE+w/jEJKs//kAZykQxEVFWn17sObc+nTRcpIaf6EkyQLo7Uu2DhpN/xY8yIw==
X-Received: by 10.194.94.166 with SMTP id dd6mr67135125wjb.88.1481117451372;
	Wed, 07 Dec 2016 05:30:51 -0800 (PST)
Received: from localhost (host86-185-39-193.range86-185.btcentralplus.com.
	[86.185.39.193]) by smtp.gmail.com with ESMTPSA id
	j1sm31441859wjm.26.2016.12.07.05.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Dec 2016 05:30:50 -0800 (PST)
Date: Wed, 7 Dec 2016 13:30:49 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>
Message-ID: <20161207133049.GA32099@stefanha-x1.localdomain>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
	<063dfa33-2015-e566-c623-d59578c20fcd@redhat.com>
	<13aed710-c5d1-b1de-5922-52e3e53029f9@cn.fujitsu.com>
	<956d6c43-0904-e094-1adb-bb7c584967d0@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <956d6c43-0904-e094-1adb-bb7c584967d0@vivier.eu>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] docs: Fix
 description of the sentence
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
X-List-Received-Date: Wed, 07 Dec 2016 13:32:23 -0000


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2016 at 10:01:49AM +0100, Laurent Vivier wrote:
> Le 07/12/2016 =E0 09:58, Zhang Chen a =E9crit :
> >=20
> >=20
> > On 12/02/2016 03:57 PM, Laurent Vivier wrote:
> >>
> >> On 02/12/2016 03:59, Zhang Chen wrote:
> >>>
> >>> On 12/01/2016 10:57 PM, Eric Blake wrote:
> >>>> On 12/01/2016 12:55 AM, Zhang Chen wrote:
> >>>>> Say it in another way to make it easier to understand.
> >>>>>
> >>>>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> >>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
> >>>> I guess that's because I suggested the replacement text to use, even
> >>>> though I didn't write the patch.
> >>> Yes, In that case, should I change the signed-off-by to acked-by or
> >>> remove it?
> >> You can use "Suggested-by:"
> >>
> >> https://www.kernel.org/doc/Documentation/SubmittingPatches
> >>
> >> Laurent
> >>
> >=20
> > Should I fix it? or can you pick up this directly for 2.8?
>=20
> I don't think it is needed.
> Perhaps Stefan H can take it directly in his staging tree?

Too late for that now.  This should be merged through Jason Wang (net
maintainer) like any other colo-proxy patch.

Stefan

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYSA8JAAoJEJykq7OBq3PIy5sH/3wXENzI0kcJ0ZiUZeNVtMB3
IExdr5PLpiW1sygrAoUVrYKBPaDHm6iP6WQuMZUCBB3dP+A5PYHpi6+ZMuoHkKbU
D8+vaEXi2OV3pvpgVXHq5n0TCQkkm2oUb/O1AmabB2QadvfdPUM5sMj+71VUXsie
6vWoy8m/gwayMlNhtjY1e3RGowe8PsMrZrjJ1eaGotkdJdpnp0CcEPi1WrUR7lXk
6sKru9BAzP3zAI9nXl4kDsNMdS9UF1ZtouY6ZLoSWAmpmguai3a2ECUaZPwStZYw
VIduslTg0r0maSytYuMzGeWmaQzfdoN3ATAJW/pzYLuSSSx1SR2kLdDJ7Zl88gc=
=Q5qe
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--

