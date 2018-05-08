Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4ZZ-0004MZ-A6
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:30:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fG4ZW-0004K4-G1
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fG4ZV-0002mq-Jh
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:30:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52000 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fG4ZT-0002ls-6B; Tue, 08 May 2018 11:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E08CEB71E;
	Tue,  8 May 2018 15:30:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE202166BAD;
	Tue,  8 May 2018 15:30:19 +0000 (UTC)
Date: Tue, 8 May 2018 16:30:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20180508153015.GE5967@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1525793375-15367-1-git-send-email-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1525793375-15367-1-git-send-email-stefanb@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 08 May 2018 15:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 08 May 2018 15:30:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] tests: fix tpm-crb tpm-tis tests race
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
X-List-Received-Date: Tue, 08 May 2018 15:30:35 -0000

On Tue, May 08, 2018 at 11:29:35AM -0400, Stefan Berger wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> No need to close the TPM data socket on the emulator end, qemu will
> close it after a SHUTDOWN. This avoids a race between close() and
> read() in the TPM data thread.
>=20
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  tests/tpm-emu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


>=20
> diff --git a/tests/tpm-emu.c b/tests/tpm-emu.c
> index 4dada76..8c2bd53 100644
> --- a/tests/tpm-emu.c
> +++ b/tests/tpm-emu.c
> @@ -125,7 +125,7 @@ void *tpm_emu_ctrl_thread(void *data)
>          case CMD_SHUTDOWN: {
>              ptm_res res =3D 0;
>              qio_channel_write(ioc, (char *)&res, sizeof(res), &error_a=
bort);
> -            qio_channel_close(s->tpm_ioc, &error_abort);
> +            /* the tpm data thread is expected to finish now */
>              g_thread_join(s->emu_tpm_thread);
>              break;
>          }
> --=20
> 2.5.5
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

