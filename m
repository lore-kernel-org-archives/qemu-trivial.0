Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cyt2N-0006HQ-8g
	for mharc-qemu-trivial@gnu.org; Fri, 14 Apr 2017 00:40:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cyt2L-0006HI-5K
	for qemu-trivial@nongnu.org; Fri, 14 Apr 2017 00:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cyt2I-0004RZ-3f
	for qemu-trivial@nongnu.org; Fri, 14 Apr 2017 00:40:45 -0400
Received: from ozlabs.org ([103.22.144.67]:45995)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1cyt2H-0004QC-5o
	for qemu-trivial@nongnu.org; Fri, 14 Apr 2017 00:40:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3w44hm61GBz9sNb; Fri, 14 Apr 2017 14:40:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1492144824;
	bh=eKaIHzI5g7YTICGJ/gV+emVSYJ147WF8kO0MIGY2BNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7QfnMyCX3IolDLlrbgcpdK5n9BfkNz26VdZdT8wZkkz49z7kah4IMSyWuJAqLRtd
	10odUTohg893bzHRgtv67v9q5FJpoGr8vwZ+WLlFvoDi3pu9xUTTDsDUkh1VdoS5fq
	I1v00mq7DM36X05/8ELCaiBN8x1sWm1mm8amDgh4=
Date: Fri, 14 Apr 2017 11:16:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
Cc: qemu-trivial@nongnu.org, rth@twiddle.net, ehabkost@redhat.com,
	agraf@suse.de, marex@denx.de, crwulff@gmail.com,
	kbastian@mail.uni-paderborn.de, edgar.iglesias@gmail.com
Message-ID: <20170414011648.GD14531@umbus.fritz.box>
References: <1492100079-4110-1-git-send-email-chugh.ishani@research.iiit.ac.in>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline
In-Reply-To: <1492100079-4110-1-git-send-email-chugh.ishani@research.iiit.ac.in>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] Remove reduntant qemu: from error
 functions
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
X-List-Received-Date: Fri, 14 Apr 2017 04:40:46 -0000


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 09:44:39PM +0530, Ishani Chugh wrote:
> This patch removes redundant "qemu:" from error functions. The link to th=
e bitesized task is:
> http://wiki.qemu-project.org/Contribute/BiteSizedTasks#Error_checking
>=20
> Signed-off-by: Ishani Chugh <chugh.ishani@research.iiit.ac.in>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY8CL7AAoJEGw4ysog2bOSo8sP/jvOlZaQHXO8CHxpMRN80OHk
35E8GyPjuZ4zvxagJNurNGKz0OsDdpIwS76oS/0DOC5DvqITG4PP+if9P+AOnJGD
Fb+H+RSX9n0bqZDTmFbVvqBpc4Ypre+rRAqK4CspHjMryfzSzz8JyZwOOxoCChkc
ccu1YZEHFWNg5/lz+RRu+7qdCCMLU0NuIqbt9qWSan1ORFhJ6rQvCGUfZyPMic0e
4T6BKfZw257hO7d6hLtdabvlPVxnNfEDu4J0yXe9MeH9rr/BFC5LxR82O8ROU6XT
Nvl/czkM/Ga6RyxSGINONQaWxXjQCrdGitMOBnDF1Vukh8zKFmmiIdDiuMoWC3Vp
Bir7+mqABE8v8ouVAE7sR5SnxtGxaDeperwVEdIL2FRQs32sJoD6L3roBmGBHQhj
G26zKlZ12jd91CUuvBuk2TMSa61sRuBW5OJRey0hF67GyX8y7uravUrjYsuIm8hG
Qm6Q4caSIhBjBGdh0IwiQXZCPBMmx/651Sk9RHxfWdc342R54bLaGK8o3I/zt1Or
iXa5EnJ6TRt3YRwVoZGUb78kJdCiEh7RNn9Z0Ynq97bTCncy/uDnmtO87dCs7fme
80SZmZXYKZnbwRewjg5fHpqY6XxX2mNHF8ej/LPcT5MvHmhaETmmMulZ2hVVRPQt
kOT+smWd37Ts23UOrCF2
=4jqG
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--

