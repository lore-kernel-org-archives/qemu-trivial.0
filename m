Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLV7r-0007Fy-Kd
	for mharc-qemu-trivial@gnu.org; Sun, 03 Dec 2017 09:20:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eLV7o-0007ED-Mx
	for qemu-trivial@nongnu.org; Sun, 03 Dec 2017 09:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eLV7n-0003Ld-TW
	for qemu-trivial@nongnu.org; Sun, 03 Dec 2017 09:20:08 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:42944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eLV7m-0003HZ-14; Sun, 03 Dec 2017 09:20:06 -0500
Received: by mail-wr0-x242.google.com with SMTP id s66so14538289wrc.9;
	Sun, 03 Dec 2017 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vPLfarRGTP9/enGEE862i6w6EpRM5WW+FtYLjN6KCyA=;
	b=PJi17Ogj1W8LtWnlSV6aBNpLKS+/C/VEsk99IjvNYsSHQLoMN3Zr9ALd12PQJvAoTf
	mQ5puFnZbLH5DJQ0H1CwAniLXOyFGYV61EwHoaTmkxvuLZr2EJAdNvGI3SOyTkOpGjxT
	JmhcdHqREUAqk+wJ+bJOPeYpi1jZvaZ92HVMJysAKbLdMXdwnbccrr5LFFCsmylOS3gk
	C6Ao+36s5FBtj/uEBC4WeXpUuQvm357w3gEuXlUpz06eZNBpXcIwnlHZOj7068SStbDC
	hE80+rC9tazXzzqxga2ZD4BWyGNor8dVRdpCsqGf1at3W/Woq8AE7slwG60Vubw1Rmfq
	PAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vPLfarRGTP9/enGEE862i6w6EpRM5WW+FtYLjN6KCyA=;
	b=lA0bplHezuwii1XL5CvXHukboZeRXxbxIS1XCO0gLpmaTUNYd81FMCRRwzbRzoCDu5
	DDXxJEDCOIUAjZegNKKTjC87KSu1DYS/WTZvkzw9vK2oORU7i4K+hco+CB4EggfemriC
	zvek/51V3JX+6nHWf9Fxriu9CtsjWEyAjM+u8ep4K2Be9ttHOq1MRBp/v1j1E3VgoPkK
	XVbAt3Vk7IEkjyQn0EsRO63hA9y1fFxFSkPpFF4OnAj2PVhyIOCYdcsLFejzhdeou5G5
	Q7DeeOjwUce7Vh6wIq3zz4wZaNyYaKgnLjzFR5d1NG/Binyds+y9SOPoDNgaTynQmgPD
	JYKg==
X-Gm-Message-State: AJaThX5cpUMNcicckIMOzvJXozE7uC8wiKO7YvdTKG6AoTaCQsqmwkfy
	8kEgHGHm98iE1CpA3kyyXWjifZD7vohnOdezhns=
X-Google-Smtp-Source: AGs4zMbYZJwMy3BBXTaGBSnfhbGkULO7jMaRD9HwWnXj2LnDn7QTe8Gp6ZDkyB7a53sajxo0Yb8ggv5mfq3qqPf31kY=
X-Received: by 10.223.161.158 with SMTP id u30mr10921188wru.96.1512310804795; 
	Sun, 03 Dec 2017 06:20:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.165.153 with HTTP; Sun, 3 Dec 2017 06:20:04 -0800 (PST)
In-Reply-To: <20171201232433.25193-4-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
	<20171201232433.25193-4-eblake@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 3 Dec 2017 15:20:04 +0100
Message-ID: <CAJ+F1CJCuH5r12mpuzHgUjA0MqhE38CtiVwYoiimo667zwXg5A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/7] chardev: Use
 goto/label instead of do/break/while(0)
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
X-List-Received-Date: Sun, 03 Dec 2017 14:20:09 -0000

On Sat, Dec 2, 2017 at 12:24 AM, Eric Blake <eblake@redhat.com> wrote:
> Use of a do/while(0) control flow in order to permit an early break
> is an unusual paradigm, and triggers a false positive with a planned
> future syntax check against 'while (0);'.  Rewrite the code to use a
> goto instead.  This patch temporarily keeps an extra level of
> indentation to highlight the change; the next patch cleans it up.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>  chardev/char-serial.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/chardev/char-serial.c b/chardev/char-serial.c
> index 2f8f83821d..10162f9fa3 100644
> --- a/chardev/char-serial.c
> +++ b/chardev/char-serial.c
> @@ -64,9 +64,14 @@ static void tty_serial_init(int fd, int speed,
>  #endif
>      tcgetattr(fd, &tty);
>
> -#define check_speed(val) if (speed <=3D val) { spd =3D B##val; break; }
> +#define check_speed(val) \
> +    if (speed <=3D val) {  \
> +        spd =3D B##val;    \
> +        goto done;       \
> +    }
> +
>      speed =3D speed * 10 / 11;
> -    do {
> +    {
>          check_speed(50);
>          check_speed(75);
>          check_speed(110);
> @@ -125,8 +130,10 @@ static void tty_serial_init(int fd, int speed,
>          check_speed(4000000);
>  #endif
>          spd =3D B115200;
> -    } while (0);
> +    }
>
> +#undef check_speed
> + done:
>      cfsetispeed(&tty, spd);
>      cfsetospeed(&tty, spd);
>
> --
> 2.14.3
>
>



--=20
Marc-Andr=C3=A9 Lureau

