Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcwpG-0007Ii-A2
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 10:07:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ycwp9-00079z-VL
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ycwp8-0005Nr-UR
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:07:23 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:35452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ycwoz-0005JR-GF; Tue, 31 Mar 2015 10:07:13 -0400
Received: by widdi4 with SMTP id di4so10574327wid.0;
	Tue, 31 Mar 2015 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hZxleZNFXJFmtG/sv71+ANXViCuNiFtg+qXsMsrX8IE=;
	b=fBzZbNFSB4h1I/laxAqKUU06M2uzWxSXK2y39cdWUsmyTs7JiugehzJliX/klEVOHF
	M57vwPYgbYHmoBqNYEzBG9t8UxcSEWT3sbm+avpV5toq+eXTWCkfojMWx/Yh19szs6yx
	zIq5CqDl9jC9OBqXp2TKfY73EA+t+LdvVxHgnJLAscxYVeVRHm8zvK2jNFzBvAKrmQd+
	wq2Dgf6PqMwhzvrUmjnWM8KNjaRaHOnYPzKbhcFsG3M/H7QVJylEHwRUXSQgW+T7qmPx
	YtttvJ/gwjLd6R03RYKFXntjhZd8Ltb+Ms491Ui/kVv5Z2ZubcoETUcH7bB733bPVyQ5
	it/Q==
X-Received: by 10.180.212.37 with SMTP id nh5mr5719492wic.76.1427810832918;
	Tue, 31 Mar 2015 07:07:12 -0700 (PDT)
Received: from localhost (host109-158-220-195.range109-158.btcentralplus.com.
	[109.158.220.195]) by mx.google.com with ESMTPSA id
	hl15sm21120288wib.3.2015.03.31.07.07.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 07:07:12 -0700 (PDT)
Date: Tue, 31 Mar 2015 15:07:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Message-ID: <20150331140710.GB27156@stefanha-thinkpad.redhat.com>
References: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
	<20150330132941.GK25181@stefanha-thinkpad.redhat.com>
	<87pp7qlgzu.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <87pp7qlgzu.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org,
	Shannon Zhao <zhaoshenglong@huawei.com>, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2]
 fsdev/virtfs-proxy-helper: Fix possible overflow
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
X-List-Received-Date: Tue, 31 Mar 2015 14:07:28 -0000


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 07:33:33PM +0530, Aneesh Kumar K.V wrote:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>=20
> > On Sat, Mar 14, 2015 at 10:00:16AM +0800, Shannon Zhao wrote:
> >> It's detected by coverity. As max of sockaddr_un.sun_path is
> >> sizeof(helper.sun_path), should check the length of source
> >> and use strncpy instead of strcpy.
> >>=20
> >> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> ---
> >>     v1->v2: Still use strcpy [Paolo]
> >> ---
> >>  fsdev/virtfs-proxy-helper.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>=20
> >> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> >> index bf2e5f3..13fe032 100644
> >> --- a/fsdev/virtfs-proxy-helper.c
> >> +++ b/fsdev/virtfs-proxy-helper.c
> >> @@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t ui=
d, gid_t gid)
> >>          return -1;
> >>      }
> >> =20
> >> +    g_assert(strlen(path) < sizeof(proxy.sun_path));
> >>      sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
> >
> > path is user input.  While the assertion check silences Coverity, it is
> > not suitable for input validation.  Users expect a graceful exit with an
> > error message, not an assertion failure if the given path is too long.
> >
> > I will send a patch.
>=20
> That is the proxy helper. The assert will cause an exit() which is good,
> isn't it ? I did update the qemu side of the patch to do a graceful exit

assert(3) calls abort(3), which sends SIGABRT.  The signal causes a core
dump by default.  That's not a proper way to exit on invalid input.

Plus, if the code is ever compiled with the NDEBUG macro set, the assert
would be removed and the check bypassed.

This is why assert() isn't suitable for input validation.

Stefan

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVGqoOAAoJEJykq7OBq3PIjc8H/2oaIyZFCm6blOp6ovnixjtx
gH//HTrjlQPxzT74HopFrVnmdqVqN2eKLFCyvCVQkipeW85jzTf057KIEapHY6Rf
j8xFXG7owNMENOlbx/dgq/k+82AmEhPO1lPkVC8cXKQBTgSoDMEoqRtRsPLEbqiI
3nXcko/jUGxHDlR+BXk4BjsoHll3SXh+Tz4aqtdb/rUmWQ64q9GBapU3QuFSNnoy
2IVfI+advRNmGfKICx8GJAJQJ6b+4Js5+S5R4nOiDu8YqSNj57zJCB6WZiHgIk2y
3Q/A2powl8RZL6kgB82fAQyb3AoE7nqgBFfK0H3Y00tJQvjtzJudZ9N5eO98yrs=
=S2DB
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

