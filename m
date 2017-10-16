Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C7H-0002ku-Ot
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:36:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1e4C7E-0002iX-Ps
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1e4C7D-0003Ly-QV
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:36:00 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:40510
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1e4C78-0003IV-Vg; Mon, 16 Oct 2017 16:35:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 16D9ADA8497;
	Mon, 16 Oct 2017 22:35:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dYaaCTWu2Cn8; Mon, 16 Oct 2017 22:35:52 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (pD9E01183.dip0.t-ipconnect.de
	[217.224.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 51717DA8490; 
	Mon, 16 Oct 2017 22:35:52 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20171016202912.1117-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <6f30365c-ed10-d062-5179-06ad70dafae3@weilnetz.de>
Date: Mon, 16 Oct 2017 22:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171016202912.1117-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: Fix compiler warning and
 some data types
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
X-List-Received-Date: Mon, 16 Oct 2017 20:36:02 -0000

Sorry, Philippe, I did not notice that "git send-email"
did not add you to the addressee list.

And I forgot to add "v3" to the subject line.

I=E2=80=8C should not send e-mails late in the night ...

Stefan


Am 16.10.2017 um 22:29 schrieb Stefan Weil:
> gcc warning:
>=20
> /qemu/util/oslib-posix.c:304:11: error:
>  variable =E2=80=98addr=E2=80=99 might be clobbered by =E2=80=98longjmp=
=E2=80=99 or =E2=80=98vfork=E2=80=99
>  [-Werror=3Dclobbered]
>=20
> Fix also some related data types:
>=20
> numpages, hpagesize are used as pointer offset.
> Always use size_t for them and also for the derived
> numpages_per_thread and size_per_thread.
>=20
> Avoid a type cast by declaring addr volatile.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> v2: Fix more data types (partially as discussed with Richard)
>=20
> v3: Keep volatile type cast (suggested by Philippe and Paolo)
>=20
> Regards
> Stefan
>=20
>  util/oslib-posix.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 80086c549f..382bd4a231 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -59,8 +59,8 @@
> =20
>  struct MemsetThread {
>      char *addr;
> -    uint64_t numpages;
> -    uint64_t hpagesize;
> +    size_t numpages;
> +    size_t hpagesize;
>      QemuThread pgthread;
>      sigjmp_buf env;
>  };
> @@ -301,11 +301,7 @@ static void sigbus_handler(int signal)
>  static void *do_touch_pages(void *arg)
>  {
>      MemsetThread *memset_args =3D (MemsetThread *)arg;
> -    char *addr =3D memset_args->addr;
> -    uint64_t numpages =3D memset_args->numpages;
> -    uint64_t hpagesize =3D memset_args->hpagesize;
>      sigset_t set, oldset;
> -    int i =3D 0;
> =20
>      /* unblock SIGBUS */
>      sigemptyset(&set);
> @@ -315,6 +311,10 @@ static void *do_touch_pages(void *arg)
>      if (sigsetjmp(memset_args->env, 1)) {
>          memset_thread_failed =3D true;
>      } else {
> +        char *addr =3D memset_args->addr;
> +        size_t numpages =3D memset_args->numpages;
> +        size_t hpagesize =3D memset_args->hpagesize;
> +        size_t i;
>          for (i =3D 0; i < numpages; i++) {
>              /*
>               * Read & write back the same value, so we don't
> @@ -351,7 +351,8 @@ static inline int get_memset_num_threads(int smp_cp=
us)
>  static bool touch_all_pages(char *area, size_t hpagesize, size_t numpa=
ges,
>                              int smp_cpus)
>  {
> -    uint64_t numpages_per_thread, size_per_thread;
> +    size_t numpages_per_thread;
> +    size_t size_per_thread;
>      char *addr =3D area;
>      int i =3D 0;
> =20
>=20


