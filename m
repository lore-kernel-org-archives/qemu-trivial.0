Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0itV-0001dy-8D
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 02:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1e0itT-0001dL-FJ
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 02:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1e0itS-0007Mx-Kk
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 02:47:27 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:55418
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1e0itO-0007KR-0o; Sat, 07 Oct 2017 02:47:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id AB9C4DA813F;
	Sat,  7 Oct 2017 08:47:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DLD29xIW4tAh; Sat,  7 Oct 2017 08:47:17 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (pD9E01A83.dip0.t-ipconnect.de
	[217.224.26.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 7EADCDA39E8; 
	Sat,  7 Oct 2017 08:47:17 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-67-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <172f427e-ef26-8934-29f8-cc6cbbbea6ca@weilnetz.de>
Date: Sat, 7 Oct 2017 08:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-67-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 66/88]
 util/qemu-thread-win32: use g_new() family of functions
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
X-List-Received-Date: Sat, 07 Oct 2017 06:47:28 -0000

Am 07.10.2017 um 01:50 schrieb Philippe Mathieu-Daud=C3=A9:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  util/qemu-thread-win32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index 94f3491a87..098fddb2af 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -394,7 +394,7 @@ void qemu_thread_create(QemuThread *thread, const c=
har *name,
>      HANDLE hThread;
>      struct QemuThreadData *data;
> =20
> -    data =3D g_malloc(sizeof *data);
> +    data =3D g_new(struct QemuThreadData, 1);
>      data->start_routine =3D start_routine;
>      data->arg =3D arg;
>      data->mode =3D mode;
>=20

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Maybe you can use this simplified variant:

    QemuThreadData *data =3D g_new(QemuThreadData, 1);

Stefan

