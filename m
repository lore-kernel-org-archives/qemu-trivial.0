Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGDg6-00038W-4u
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 21:13:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1fGDg0-000379-TZ
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 21:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1fGDg0-00037C-0c
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 21:13:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38198 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1fGDfu-00035X-Qh; Tue, 08 May 2018 21:13:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D417406C773;
	Wed,  9 May 2018 01:13:40 +0000 (UTC)
Received: from localhost (ovpn-12-88.pek2.redhat.com [10.72.12.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B8A62023227;
	Wed,  9 May 2018 01:13:34 +0000 (UTC)
Date: Wed, 9 May 2018 09:13:32 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	"open list:Trivial patches" <qemu-trivial@nongnu.org>
Message-ID: <20180509011332.GH22503@lemon.usersys.redhat.com>
References: <20180508144358.13530-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180508144358.13530-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 01:13:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 01:13:40 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] docker: Fix trivial typo
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
X-List-Received-Date: Wed, 09 May 2018 01:13:53 -0000

On Tue, 05/08 11:43, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.incl=
ude
> index de87341528..ef1a3e62eb 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -46,7 +46,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
> =20
>  docker-image-debian-powerpc-cross: EXTRA_FILES:=3D$(SRC_PATH)/tests/do=
cker/dockerfiles/debian-apt-fake.sh
> =20
> -# Enforce dependancies for composite images
> +# Enforce dependencies for composite images
>  docker-image-debian: docker-image-debian9
>  docker-image-debian8-mxe: docker-image-debian8
>  docker-image-debian-amd64: docker-image-debian9
> --=20
> 2.17.0
>=20

Queued, thanks!

Fam

