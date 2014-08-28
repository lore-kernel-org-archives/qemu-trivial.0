Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMyfn-0001Ts-1E
	for mharc-qemu-trivial@gnu.org; Thu, 28 Aug 2014 08:19:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMyfc-0001Hg-R3
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 08:19:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMyfT-0000SJ-QQ
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 08:19:16 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:39552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XMyfB-0000QU-Fu; Thu, 28 Aug 2014 08:18:49 -0400
Received: by mail-wg0-f42.google.com with SMTP id b13so658471wgh.1
	for <multiple recipients>; Thu, 28 Aug 2014 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p0G/Bzx0OoddXZ04TTDFBIe/SNbZ33T+K5dyY7PH8FQ=;
	b=oAq7HKiUln0so4ruv5Wv6kAafnoPUyoiEbhWY5gCW1weLswkzIh3RPhicjAk2ofdvs
	HnE2IbtwhIPY9j2jik8xMtz4hR1Qva6etA7gr2NC47iOFL2+oVLvjPwfWsiCW3Wj0ISN
	P6sO2S37vPw+tXLKny7ktBUkpeFW+wzRQP7wLm3WHOBKc6TV5aMY/fgoo8SOyZsLBo3k
	Fq7mJUa7ahPNQ2TJiMMDcjD2v8K51aMkibAI/hfp3rjmcCaC9+q012Knc1J100mUTLT9
	QeiMAz1wr/1nBf8ITn2pKTNXWIZzwAvCsOyrPMqKZpANJW7/ljrEOuw2YHg8ZYwKKxGh
	XhGg==
X-Received: by 10.180.78.234 with SMTP id e10mr30890504wix.7.1409228328587;
	Thu, 28 Aug 2014 05:18:48 -0700 (PDT)
Received: from localhost (44.175.90.146.dyn.plus.net. [146.90.175.44])
	by mx.google.com with ESMTPSA id k5sm14183099wiv.21.2014.08.28.05.18.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 05:18:47 -0700 (PDT)
Date: Thu, 28 Aug 2014 13:18:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20140828121845.GL26741@stefanha-thinkpad.redhat.com>
References: <1409109115-8348-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hTKW8p8tUZ/8vLMe"
Content-Disposition: inline
In-Reply-To: <1409109115-8348-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts: Remove
	scripts/qtest
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
X-List-Received-Date: Thu, 28 Aug 2014 12:19:26 -0000


--hTKW8p8tUZ/8vLMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2014 at 11:11:55AM +0800, Fam Zheng wrote:
> This is a dummy file with no user, drop it.
>=20
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  scripts/qtest | 5 -----
>  1 file changed, 5 deletions(-)
>  delete mode 100755 scripts/qtest

Fine by me.  I'm not aware of any users.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--hTKW8p8tUZ/8vLMe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT/x4lAAoJEJykq7OBq3PIxIgIAIfLMRFfG5GDg7WXTeE8LJbx
GlbwKTW1TSluwSrBy1OgYmk2BKveQmkgwwGHdvaXfufzfg7rV0mzwtE5VbaGhTy5
TTHyfpbZ0QRSlYu2eNKcZVoKPgH6wkVOIp7x5giOH2m+TAPu7SwcETmWGOvhXVnI
WZHKIYMDnUlkJMm6sgbGYIvi0Y7y7Rr36Hy2EZEoMXzwEzoLy6f9yUiDwXoBSRJB
Tnix9r5tXQeplhRs4GOg379BlOG8N/0VdnUg4niE+skOYoRwVkxXSwPbbSg1K24W
1smUBbny7R+iCEB8FGdOnypE/0CBKGgUDGTtV3V2rNgRxB8HuJi6+SthuRlU90M=
=vi6E
-----END PGP SIGNATURE-----

--hTKW8p8tUZ/8vLMe--

