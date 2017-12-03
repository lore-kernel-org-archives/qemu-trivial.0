Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLV8I-0007Zd-Gi
	for mharc-qemu-trivial@gnu.org; Sun, 03 Dec 2017 09:20:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eLV8F-0007Xk-Uk
	for qemu-trivial@nongnu.org; Sun, 03 Dec 2017 09:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eLV8E-0003nr-Ul
	for qemu-trivial@nongnu.org; Sun, 03 Dec 2017 09:20:35 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eLV8C-0003mM-AE; Sun, 03 Dec 2017 09:20:32 -0500
Received: by mail-wm0-x244.google.com with SMTP id 64so10113308wme.3;
	Sun, 03 Dec 2017 06:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LAdBCng42JKBp82x9z1eMjaCfoxmweE/NurCQBOnWI0=;
	b=pc/3RitJx2H5CeKcHRu5sXqg7W3OzO3bAhmiwKbME58tjVzQenIEi3DPuE8DeulowU
	6EHpULljLg58dIqlTtTDMUl6GwvMSTSwEDR/ZZPWS50n/65pZ5g+em5J9lbpyTxZ6WhD
	o+n45ZkEtRPVUmcGJS6viL0aUsjNc8smII+UcWBWyl/sQhMKvTCTgLVZN9AIS9i6PN98
	ilj7vZsnGUygGBGDX7EL5ZLYF3RSU4jfMRI+ANIdz1udD7z4yytGaU9oijjyoLhDjSWv
	4BNf3KwRW9Ki/uT+pX9x2Fn5qtPghn0ZDWfTIMR9hZNIT8PAOtPzV6irY9nW1Z7RfWBG
	PT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LAdBCng42JKBp82x9z1eMjaCfoxmweE/NurCQBOnWI0=;
	b=XTCsqKuslpvmLsCY2Hjt0KMb0ZLCfTJkjFdcIP8b+nCxFq0/ucgSdQXhCnnbBaK7+6
	l6rjgkBbP5fr/wJrH/dvRChwwPFLYcspeK21hJkzABPkqZP+ZBMu/iJ5lDqhUxj5uDsa
	6kzDEZZi6KnEHuFByncMiTmBKN5s0CDZfCeCuFMgmSPexNrrojlnuU7GH5WAmT1j55SM
	gCRZRKeYVCrKZ8CyQz0URo52ZAWuOpMf9axGdsll11zMSevmRwBbu+CCTJrft8xFKSKz
	iztf6+1EFt4ZMVJgkzxPJpAB2qwDuNu8l0rLYJquQoukwi3ShduW9vE/C6uRHnq1c7Uz
	wdnw==
X-Gm-Message-State: AKGB3mJPURfeVF7vEPvTLH60TXTUicxqq04RA/yolaDIYRbVDjqR02Wa
	9lD6m5b43b5JhXno0DAWCxHKdiNSipJfh7T7Pwc=
X-Google-Smtp-Source: AGs4zMZYfzKKWhd1yiy0hV1hJTUti1HeZKIgs21VHx20LgGwibNUI3pD4SlnNzW4PSVXNpOJxmDgaRb7cd0j1gNMm/k=
X-Received: by 10.28.92.4 with SMTP id q4mr2393232wmb.42.1512310831253; Sun,
	03 Dec 2017 06:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.165.153 with HTTP; Sun, 3 Dec 2017 06:20:30 -0800 (PST)
In-Reply-To: <20171201232433.25193-5-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
	<20171201232433.25193-5-eblake@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 3 Dec 2017 15:20:30 +0100
Message-ID: <CAJ+F1C+F-pHW2RAMZHAEizSG6-E3mf+6sUe7r3GAoGsq5fUUMA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 4/7] chardev: Clean up
 previous patch indentation
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
X-List-Received-Date: Sun, 03 Dec 2017 14:20:36 -0000

On Sat, Dec 2, 2017 at 12:24 AM, Eric Blake <eblake@redhat.com> wrote:
> The previous patch left in an extra scope layer for ease of
> review; time to remove it.  No semantic change.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


 ---
>  chardev/char-serial.c | 66 +++++++++++++++++++++++++--------------------=
------
>  1 file changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/chardev/char-serial.c b/chardev/char-serial.c
> index 10162f9fa3..93392c528c 100644
> --- a/chardev/char-serial.c
> +++ b/chardev/char-serial.c
> @@ -71,66 +71,64 @@ static void tty_serial_init(int fd, int speed,
>      }
>
>      speed =3D speed * 10 / 11;
> -    {
> -        check_speed(50);
> -        check_speed(75);
> -        check_speed(110);
> -        check_speed(134);
> -        check_speed(150);
> -        check_speed(200);
> -        check_speed(300);
> -        check_speed(600);
> -        check_speed(1200);
> -        check_speed(1800);
> -        check_speed(2400);
> -        check_speed(4800);
> -        check_speed(9600);
> -        check_speed(19200);
> -        check_speed(38400);
> -        /* Non-Posix values follow. They may be unsupported on some syst=
ems. */
> -        check_speed(57600);
> -        check_speed(115200);
> +    check_speed(50);
> +    check_speed(75);
> +    check_speed(110);
> +    check_speed(134);
> +    check_speed(150);
> +    check_speed(200);
> +    check_speed(300);
> +    check_speed(600);
> +    check_speed(1200);
> +    check_speed(1800);
> +    check_speed(2400);
> +    check_speed(4800);
> +    check_speed(9600);
> +    check_speed(19200);
> +    check_speed(38400);
> +    /* Non-Posix values follow. They may be unsupported on some systems.=
 */
> +    check_speed(57600);
> +    check_speed(115200);
>  #ifdef B230400
> -        check_speed(230400);
> +    check_speed(230400);
>  #endif
>  #ifdef B460800
> -        check_speed(460800);
> +    check_speed(460800);
>  #endif
>  #ifdef B500000
> -        check_speed(500000);
> +    check_speed(500000);
>  #endif
>  #ifdef B576000
> -        check_speed(576000);
> +    check_speed(576000);
>  #endif
>  #ifdef B921600
> -        check_speed(921600);
> +    check_speed(921600);
>  #endif
>  #ifdef B1000000
> -        check_speed(1000000);
> +    check_speed(1000000);
>  #endif
>  #ifdef B1152000
> -        check_speed(1152000);
> +    check_speed(1152000);
>  #endif
>  #ifdef B1500000
> -        check_speed(1500000);
> +    check_speed(1500000);
>  #endif
>  #ifdef B2000000
> -        check_speed(2000000);
> +    check_speed(2000000);
>  #endif
>  #ifdef B2500000
> -        check_speed(2500000);
> +    check_speed(2500000);
>  #endif
>  #ifdef B3000000
> -        check_speed(3000000);
> +    check_speed(3000000);
>  #endif
>  #ifdef B3500000
> -        check_speed(3500000);
> +    check_speed(3500000);
>  #endif
>  #ifdef B4000000
> -        check_speed(4000000);
> +    check_speed(4000000);
>  #endif
> -        spd =3D B115200;
> -    }
> +    spd =3D B115200;
>
>  #undef check_speed
>   done:
> --
> 2.14.3
>
>



--=20
Marc-Andr=C3=A9 Lureau

