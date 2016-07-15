Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bO0Xe-0005tL-NK
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jul 2016 06:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bO0Xb-0005rX-Nt
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bO0Xa-0008Kg-OK
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:40:19 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bO0XV-0008Hn-84; Fri, 15 Jul 2016 06:40:13 -0400
Received: by mail-wm0-x243.google.com with SMTP id x83so1729459wma.3;
	Fri, 15 Jul 2016 03:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VfMFUl39pONOCW7kw3FnQL1MwvfGkWDvX48KvzvVU4M=;
	b=RFsWwbdH2zyWNL19Zp0vTILMSc7UGnlxCfm1mRi5y5OmxAtzB8qffPqtC7H5QgsLUK
	GD/tZj4f/BMhL/8/w417VfIfaBPyST4p0cNrLEUALLY32C1ftmMCUNwtTiPQjEhfLN/b
	K2hNXqcJcUOFAg24JnbPW77AYjYlllx6OzPYFmacNu1zDj+5qPdtHlQKlT2np1436xA3
	/N2rUyhMdGduPEbzGgotrN9caY1o93rduDJhx9Ex0kIAy7DzQQN8oOzT2OMhAJFvslqK
	nKL+YJN3Aml/Qy0gnhkuM7m4zl4G+oxThNlFu3sHuFYRFv+MxyEdSLeFzRJmHQc3yzUM
	ztQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VfMFUl39pONOCW7kw3FnQL1MwvfGkWDvX48KvzvVU4M=;
	b=i5+8vVZKBb2ERSkLTVytj76aA/q7TBEpcPTE3DRtsX3KemFgA5xjqu/rj9FTY9v4g3
	l3wWKJ4eggF0iu2/+myG1tFzSrJENByp/jlLVyJX9IDrGoOAvNq6VP1RllwTFkwHKHl/
	/YZLaYJNU4RiaH8nc9pzn4pwllNOA8M4aB0GrFCMS43BoMz25tXpsp8AaSlQ/BbDnvpo
	tGwIsYGIh0+z2fZ6DqOyD+0a3Lc/opJ2+FZ9EBI2JXR8y130/J/9n7iBeM3v9F5iwLi6
	PB1T/Z9pzOstgN1m8ou3wlisUILRSN65ArO4FautTFPHkaCrhEvoZH3LBMBAlV2bIiUJ
	ccuQ==
X-Gm-Message-State: ALyK8tKmm9HaJnthz/mdX8GULB+/cos6zN+B/H92ic/Dz+vqt3uTdhvisB4+QJJNMdLnuA==
X-Received: by 10.194.53.228 with SMTP id e4mr80605wjp.179.1468579211400;
	Fri, 15 Jul 2016 03:40:11 -0700 (PDT)
Received: from localhost (host109-156-64-22.range109-156.btcentralplus.com.
	[109.156.64.22])
	by smtp.gmail.com with ESMTPSA id ai4sm74973wjc.17.2016.07.15.03.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 03:40:10 -0700 (PDT)
Date: Fri, 15 Jul 2016 11:40:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, famz@redhat.com, stefanha@redhat.com,
	qemu-block@nongnu.org
Message-ID: <20160715104009.GE25692@stefanha-x1.localdomain>
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<57879CFA.9040700@redhat.com> <57884102.3050905@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline
In-Reply-To: <57884102.3050905@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-block] [Qemu-devel] [PATCH] aio_ctx_check:
 follow CODING_STYLE
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
X-List-Received-Date: Fri, 15 Jul 2016 10:40:20 -0000


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 09:48:50AM +0800, Cao jin wrote:
> On 07/14/2016 10:08 PM, Eric Blake wrote:
> > On 07/14/2016 07:10 AM, Cao jin wrote:
> > > replace tab with spaces
> > >=20
> > > Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> > > ---
> > >   async.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Whitespace-only changes are best done as part of a series that is
> > already touching nearby code for other reasons (depending on the size of
> > the whitespace changes and on the rest of your patch, it may be okay to
> > squash the whitespace change in place, or better to split into separate
> > patches to make review of both patches easier).  Otherwise, it just
> > makes 'git blame' output dirtier.
>=20
> I see.
> Since async.c & aio-posix.c are belong to the same maintaiers, so, Fam &
> Stefan, is it ok to squash this into that "remove useless parameter" patc=
h?
> If not, we can just forget this one.

The "remove useless parameter" patch doesn't touch the function you are
modifying here.  Please don't squash the patches.

Since you have already posted this patch I will merge it.  In the future
please don't submit whitespace changes, tiny coding style cleanups, etc
in by themselves.

Thanks for all your contributions.  I do not want to discourage you but
my view is that code changes should only be made if they fix a bug,
improve performance measurably, add a feature, or significantly improve
the code.

Every patch has a cost in terms of code review, merging/testing, backportin=
g,
bisecting, documentation, etc.  We could discuss each of these in detail
but basically a code change creates work or takes time from one or more
people in these areas.

In a perfect world with unlimited resources all patches would be equally
welcome.  Due to limited resources it's best to submit the types of
patches I mentioned above where the cost/benefit ratio is favorable.

Thanks,
Stefan

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXiL2JAAoJEJykq7OBq3PIP90H/ihTjOTnQXEwoWDS/Insngvg
VUWpS56CLlbWpz0p8BqBSOQFHCyfY38Pwpr5o9JG8gGCBzatFG41OkNsnsRtmw5A
IQsRc4HnRH8zQKpS2DVbv3ST/EB4x7uLwbOO1RIOG+Gg//WVAVyNcFTxpGcEXhyp
4tRetV0lx+oY+KFXv0aFmaGwS8NcupfIp7RV7A4ZZ+NoF901BfEnSY5+oGgeHq+7
Pwl3RmDpPH9KU5Kads8XOxHAdkV3N2J1XAoHf1KodXRBaH5zF0l8n0PbeNEts6xF
83bKrVY+rrDNJMT5wzObAKY5oVE07xZyl9OApRsRPd2x2ycd4RQgJG0qejKsUcQ=
=OFGA
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--

