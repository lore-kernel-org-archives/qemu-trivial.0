Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZElDS-0004bc-8A
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 17:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZEkyt-0001QD-In
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 17:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZEkys-0005cu-Si
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 17:09:43 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:33561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZEkyn-0005ac-JT; Mon, 13 Jul 2015 17:09:37 -0400
Received: by oige126 with SMTP id e126so4606571oig.0;
	Mon, 13 Jul 2015 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ecduOYqOU1wo35S4eictf7FMVTn1qpixf62P5/+ROLE=;
	b=T72Kylal0+81DCcusewwMTffGxUn25DsWpaMWY5agRaknp13PNPQsxkDjntTjayb+Z
	8etZrBwkQjnklDvJn84cwU8e3GhXoVGqD3bhjSKcJRGvDkbONJKI7In1CYcgZA+xgmYJ
	7j8iHDyGlurk1I/hzXHGbEv6SrNlah4ZDH+5TGurwFwxN5RiekjO/ggkTNxkLUrZaPa0
	Osn2ehmwqyq9alD65W906sfhSNLwgGkyP6Yn6QfIBSBOmyS4NLikfUEOtFf0lWk3eaib
	LLVH8XH3TVJ/mp1kdb+SG3kdYypo/CCpr88ifi1847Zb0vTs1mVWhXufyPqH6bwuMizv
	r0iA==
MIME-Version: 1.0
X-Received: by 10.202.87.79 with SMTP id l76mr658056oib.91.1436821776256; Mon,
	13 Jul 2015 14:09:36 -0700 (PDT)
Received: by 10.76.76.164 with HTTP; Mon, 13 Jul 2015 14:09:36 -0700 (PDT)
In-Reply-To: <1435077687-24506-1-git-send-email-marcandre.lureau@gmail.com>
References: <1435077687-24506-1-git-send-email-marcandre.lureau@gmail.com>
Date: Mon, 13 Jul 2015 23:09:36 +0200
Message-ID: <CAJ+F1CJawMwX+LqyYJOG88qM017mnQbB9dONvjke-tgUvx1vOg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: QEMU <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22b
X-Mailman-Approved-At: Mon, 13 Jul 2015 17:24:45 -0400
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] vmstate: remove unused declaration
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
X-List-Received-Date: Mon, 13 Jul 2015 21:09:47 -0000

cc-ing qemu trivial

On Tue, Jun 23, 2015 at 6:41 PM, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> Since 38e0735e, register_device_unmigratable() has been removed
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
> ---
>  include/migration/vmstate.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 7153b1e..29820b4 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -75,9 +75,6 @@ int register_savevm_live(DeviceState *dev,
>                           void *opaque);
>
>  void unregister_savevm(DeviceState *dev, const char *idstr, void *opaque=
);
> -void register_device_unmigratable(DeviceState *dev, const char *idstr,
> -                                                                void *op=
aque);
> -
>
>  typedef struct VMStateInfo VMStateInfo;
>  typedef struct VMStateDescription VMStateDescription;
> --
> 2.4.2
>



--=20
Marc-Andr=C3=A9 Lureau

