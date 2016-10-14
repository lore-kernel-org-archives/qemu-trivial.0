Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bv5dv-00050f-NU
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 12:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bv5ds-0004yJ-Ui
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 12:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bv5dr-0008GK-R3
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 12:47:32 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bv5dl-0008Dr-Kc; Fri, 14 Oct 2016 12:47:25 -0400
Received: by mail-wm0-x243.google.com with SMTP id 79so560151wmy.3;
	Fri, 14 Oct 2016 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FSA+YXhiIIcBSPcK/Pq/tlCTo7tBYMy+XsOFWjKfPZI=;
	b=hheYSYAu0VxcDGIeGWy3QiwaFD3C+p0dTyvGSwoaiLIld8Oj/Q31Uje91+D0wPUzTX
	jRAXCGtXT8XIMJCkXoKN/1OEoh5uBpNXZ3ijHO8e3ezrGRN2CJQ0WKTmDjAOMmvZBgIb
	DTZPYbH60Mhb4d4nDppDSr4BFQk0V5derK5U3OFPUd1VaIyp/CHM6c+dBrBDg3DII5os
	p0NBbO8wiWRgx+/OEggAjj3eeQLzJiuHgZjiDzf083qMHyJLAvHK93EOMeoJpAXL+9bW
	WAakUJXif1iXOzc5DHQ1raiWTM3xRO1n+lWzQMf9ctD9zjdmuPVs2EYN+KNNtnU/gBvp
	PImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FSA+YXhiIIcBSPcK/Pq/tlCTo7tBYMy+XsOFWjKfPZI=;
	b=K3hS+Z1Y/5Uf0E6BvL4GVefumyRRdktySHkVWYSo+W6Anb205hQgik7SZ2je3HsaeV
	KVi/TQT46z5zstrHoOMKk3zcDSgn3bU1vF8dju0B6BfbjrIhzGmiFhzvScYStLDWINk1
	pYnBUNf9U84n5WYvwxAfMNK8p3KOLMZkQ/UxKgkB2rV7tVUOXS2icclBFQ6D5DfbJgKi
	NihdQKABy8F98ykVJASksg9aVsbnrV/Vix+49l+NplWw5vsurhUfb0+x5lEcngMI36aQ
	WoVgaHCH6dr/rpgm/y2W6J4E4Dk8RIm9/dmNdcd+q0/5wg0oJNDruUwmRl7hMG4l8CO1
	hbzg==
X-Gm-Message-State: AA6/9RnPM+FoaeIEEE6il2XsqBn1uz6Zp4YYDEglAoCLg2+EbizN2dhx7PVTZxPBG46z4w==
X-Received: by 10.194.95.105 with SMTP id dj9mr2797253wjb.20.1476463644867;
	Fri, 14 Oct 2016 09:47:24 -0700 (PDT)
Received: from localhost (host109-156-67-175.range109-156.btcentralplus.com.
	[109.156.67.175])
	by smtp.gmail.com with ESMTPSA id r204sm663992wma.1.2016.10.14.09.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Oct 2016 09:47:23 -0700 (PDT)
Date: Fri, 14 Oct 2016 17:47:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Keith Busch <keith.busch@intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20161014164722.GM3482@stefanha-x1.localdomain>
References: <1476285520-1985-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vTfKKTivj/mQoluA"
Content-Disposition: inline
In-Reply-To: <1476285520-1985-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] hw/block/nvme: Simplify
 if-statements a little bit
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
X-List-Received-Date: Fri, 14 Oct 2016 16:47:34 -0000


--vTfKKTivj/mQoluA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 05:18:40PM +0200, Thomas Huth wrote:
> The condition  '!A || (A && B)' is equivalent to '!A || B'.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/nvme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vTfKKTivj/mQoluA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYAQwaAAoJEJykq7OBq3PI6xUH/0gtPWUnyZDABsYPZkNFWZqO
uF3z2WlQ1M7XxcsfsAsuMzg9cscdMeeB2VxjKpEeZ06IO/kGedxs3ZzZQk8OPr7I
T1dfmJmzzcI/PWy98LL16gXsxZ+tuhg1XcY0CF1m4VMD/fJQ3Tlmwnx0l0UXpiBZ
BpgnB+jPI9oxDvnAqlk4XLmpoTs7dEo7Wu3EC/LeT333tqu/096ds4qZbL/wTT59
MIG5vdm43Lm9wl48o19sZahjDi/wpuNs3QyvcNrKRf4IH6flDQINjL1TD7Y8AuMb
QbTWmVKNPUbbZksJ0O7ahVG31tDX2mpIQIr0M5ifTZjlibX8LXzEyYkSgVCbcCI=
=xiYa
-----END PGP SIGNATURE-----

--vTfKKTivj/mQoluA--

