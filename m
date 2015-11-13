Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxBYm-00078c-4w
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 05:26:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZxBYe-0006zT-PG
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 05:26:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZxBYd-000636-TU
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 05:26:16 -0500
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:36466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZxBYU-00062I-Oz; Fri, 13 Nov 2015 05:26:06 -0500
Received: by pacdm15 with SMTP id dm15so96486677pac.3;
	Fri, 13 Nov 2015 02:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RDzBTHqvE9AwGsgwsNUGqtZudJaPbIVhg1Ab1rbmFdc=;
	b=ARXBWi+BGGU2sY0OZqMI3QEVLQFTNONDNJhbQmgdhOiCKX/c3pIfF5qJ1YQqd3L6+v
	7X+pJjtNYbjB6zOuPdtscrKFBz4wJ5zlDU5uSocfZzBRA1ykwDO6JjJTNuA6BT/AQFpZ
	nx8HbdhkZGIpnliL8/ZcH561B+3TGLsghZWHVXkTMtg1XZIO0IDQWAgOA+ozLqq5pxxs
	uBsX7p4/CHi/NXQtWk4YEltvn09ptwOj0IbD+nzKVdtNGvbAzVVQni9atcsx+pGt/uQG
	TMucnhUp8G0K471BsbpgjkS+89OU/Jf8DZYzwQ74eaZOn3sejrPMku9KSk6LqCOq/xBQ
	qYUA==
X-Received: by 10.68.241.194 with SMTP id wk2mr30481060pbc.45.1447410366293;
	Fri, 13 Nov 2015 02:26:06 -0800 (PST)
Received: from localhost (42-2-247-202.static.netvigator.com. [42.2.247.202])
	by smtp.gmail.com with ESMTPSA id
	yz3sm19598331pbb.37.2015.11.13.02.26.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 02:26:05 -0800 (PST)
Date: Fri, 13 Nov 2015 18:26:03 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20151113102603.GH6650@stefanha-x1.localdomain>
References: <1447353228-30550-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline
In-Reply-To: <1447353228-30550-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.23 (2015-06-09)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore
	test-blockjob-txn
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
X-List-Received-Date: Fri, 13 Nov 2015 10:26:21 -0000


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 11:33:48AM -0700, Eric Blake wrote:
> Commit 6c6f312d added a new test, but did not mark it for
> exclusion in .gitignore.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Yeah, I know this affects only non-VPATH builds, which we don't
> recommend, but we might as well be consistent.

I'm a non-VPATH diehard too :)

>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWRbq7AAoJEJykq7OBq3PIQkMIAMLAbhJXxLM+ftqDuk/cNZ0O
xrMP/ioe8AUUDo2sMgpSKxSjSo69OgRUTluIKA+a/nEyn30rYBrKiU3Fu0lIzhZI
ndGGoB5QFDsqruuubXdY5R5ZtEfs3mjf+eMoufcoURmIm7gO2USiLlCkS7Su++YQ
5LTvxGCgd5nNfpps+NELdIQLmH8JAevwpRPtuqcoTMeqMQ54ZWCh4CKmnfOB4JYe
xB3ek4bqMqYUMkFdKraiWuDNyKGgPWQpPfnYIbvkWBu/dUiLW/+YdIwBuN645BK5
Buzinkp6djstdFclst1abA44iim9HCAtdWtbfpgs78hZ4V2coKR+gM4/eBOCKjg=
=Z2pK
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--

