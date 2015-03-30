Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcZlL-00033W-RJ
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2015 09:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YcZlJ-00031C-EM
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 09:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YcZlI-0002C6-CF
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 09:29:53 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:37310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YcZlC-0001qk-W2; Mon, 30 Mar 2015 09:29:47 -0400
Received: by wiaa2 with SMTP id a2so129889379wia.0;
	Mon, 30 Mar 2015 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N2g3pbgvbJIpg5y9fz0ePKF0QBHbiWdyFFN1pchmPgM=;
	b=gHoHfFr0QyWEhW6KePXLy4gw7RErWbiD+rEc4m3FcjChrpR1xZVigKCICJw9XRRVKr
	H7YecDNWWqpD8NgSBZqrQpOA6ysw4wKzHj8rJA/VwC8gpuvnKCAQN98o4SKTgfRUw9z3
	7YEOnbW2EVoLFyw/YZGCP/wxrW20m4t3PYal57GKAiMhIqBoJdcmqRqrvreCYI8GLuk+
	osLgzYycDCo56Xy9E+5/yERt2W7b4Ka41Sfo+jTVfg4WouIlcT4rrruPMfhy1ZWOQ3d6
	JT0WbCqGPAnbm3KQdofUvZ/TDl2x8kZfO3slkfnTybNx5WThxRBOgT3IGEhFJiZOMGw6
	Wt+A==
X-Received: by 10.180.75.243 with SMTP id f19mr22494369wiw.94.1427722185574;
	Mon, 30 Mar 2015 06:29:45 -0700 (PDT)
Received: from localhost (host109-158-220-195.range109-158.btcentralplus.com.
	[109.158.220.195])
	by mx.google.com with ESMTPSA id a10sm11481523wjy.0.2015.03.30.06.29.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 06:29:43 -0700 (PDT)
Date: Mon, 30 Mar 2015 14:29:41 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20150330132941.GK25181@stefanha-thinkpad.redhat.com>
References: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opg8F0UgoHELSI+9"
Content-Disposition: inline
In-Reply-To: <1426298416-884-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, aneesh.kumar@linux.vnet.ibm.com,
	pbonzini@redhat.com, shannon.zhao@linaro.org
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
X-List-Received-Date: Mon, 30 Mar 2015 13:29:54 -0000


--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2015 at 10:00:16AM +0800, Shannon Zhao wrote:
> It's detected by coverity. As max of sockaddr_un.sun_path is
> sizeof(helper.sun_path), should check the length of source
> and use strncpy instead of strcpy.
>=20
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>     v1->v2: Still use strcpy [Paolo]
> ---
>  fsdev/virtfs-proxy-helper.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index bf2e5f3..13fe032 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -738,6 +738,7 @@ static int proxy_socket(const char *path, uid_t uid, =
gid_t gid)
>          return -1;
>      }
> =20
> +    g_assert(strlen(path) < sizeof(proxy.sun_path));
>      sock =3D socket(AF_UNIX, SOCK_STREAM, 0);

path is user input.  While the assertion check silences Coverity, it is
not suitable for input validation.  Users expect a graceful exit with an
error message, not an assertion failure if the given path is too long.

I will send a patch.

Stefan

--opg8F0UgoHELSI+9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVGU/FAAoJEJykq7OBq3PIPU0IAKKAskU2JS35Y+dxYw5Mx7es
U8hfsBVi6lDae2s/0RRW/NmeUAu5HbFWSCt6Z3IqGoz3uHYJ8dnm4TqKtmf1Ciza
p5G3Gs9WFq6zvn3RrXDgVcIw80F34RJcoQUKahUqdfhRCymVOqKUmlrDyS0pkThK
T5Nt6beISzRd7pG8wx58nxYHjz3URHtUPWPRXmS7E+IHQstofKYSdQOpwpJr86bz
KFNqA6w6YzFf4ug/qc+iBfAjA8AK50WOI02tFbg+afyIKaUEzfgnHXhGECNwvy19
KYNGlczQksaHIzvRPsFJqakHVp0oX+Y4k86PPA6OFjmBJ1FgQiIytFV2G6CUI0Q=
=aos+
-----END PGP SIGNATURE-----

--opg8F0UgoHELSI+9--

