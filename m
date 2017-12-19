Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRChn-0003AB-TI
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 02:52:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRChm-00039K-Ih
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 02:52:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRChl-0003yr-P6
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 02:52:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eRChh-0003vf-1a; Tue, 19 Dec 2017 02:52:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7851C059B63;
	Tue, 19 Dec 2017 07:52:43 +0000 (UTC)
Received: from [10.36.116.178] (ovpn-116-178.ams2.redhat.com [10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA1D5D6A2;
	Tue, 19 Dec 2017 07:52:39 +0000 (UTC)
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, mdroth@linux.vnet.ibm.com,
	Gerd Hoffmann <kraxel@redhat.com>, "Daniel P. Berrange"
	<berrange@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <458bba0e0865443a3d4e0f8e0dbb5bc712e098b9.1513636434.git.crobinso@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <11cf90c7-2d45-50f5-00dd-8173a4c9ae32@redhat.com>
Date: Tue, 19 Dec 2017 08:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <458bba0e0865443a3d4e0f8e0dbb5bc712e098b9.1513636434.git.crobinso@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 19 Dec 2017 07:52:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/make-release: More
 .git removal
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
X-List-Received-Date: Tue, 19 Dec 2017 07:52:51 -0000

On 18.12.2017 23:33, Cole Robinson wrote:
> As was last done in 379e21c25, we want to remove .git files for
> submodules here, which we aren't presently doing for capstone and
> keycodemapdb.
>=20
> Rather than a whitelist use 'find' to future proof this
>=20
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  scripts/make-release | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/make-release b/scripts/make-release
> index 3917df7142..7c7bec577f 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -19,7 +19,7 @@ pushd ${destination}
>  git checkout "v${version}"
>  git submodule update --init
>  (cd roms/seabios && git describe --tags --long --dirty > .version)
> -rm -rf .git roms/*/.git dtc/.git pixman/.git
> +find . -depth -name .git -exec rm -rf '{}' \;

Good idea! That also fixes the dead pixman/.git entry :-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

