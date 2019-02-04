Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqbM7-0005Jd-2o
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 05:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqbM5-0005I0-0d
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:19:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqbM4-0008BZ-8W
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:19:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gqbM2-0007ym-Ea; Mon, 04 Feb 2019 05:19:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3B562C975F;
	Mon,  4 Feb 2019 10:19:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.175])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B2E68D8F;
	Mon,  4 Feb 2019 10:19:46 +0000 (UTC)
Date: Mon, 4 Feb 2019 10:19:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190204101944.GE1905@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1549268743-18502-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1549268743-18502-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 04 Feb 2019 10:19:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests/docker/test-mingw and docs: Remove
 --with-sdlabi=2.0
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
X-List-Received-Date: Mon, 04 Feb 2019 10:19:58 -0000

On Mon, Feb 04, 2019 at 09:25:43AM +0100, Thomas Huth wrote:
> Patchew currently reports failures with the mingw docker test - this
> is due to --with-sdlabi=3D2.0 configure flag which does not exist anymo=
re.
> Remove this remainder from the docker test and the docs now.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/multiseat.txt      | 2 +-
>  tests/docker/test-mingw | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

