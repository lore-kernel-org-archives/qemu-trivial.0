Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blwJI-0008R2-Q8
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 07:00:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1blwJF-0008OP-Rn
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 07:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1blwJD-0001aH-WE
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 07:00:24 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1blwJ8-0001XM-If; Mon, 19 Sep 2016 07:00:18 -0400
Received: by mail-lf0-f68.google.com with SMTP id s64so8155366lfs.2;
	Mon, 19 Sep 2016 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GSDkyALACXj4whGVcYYhZRtETe3q/VLf+1Y/Ubqb4l0=;
	b=UxyQ57WvGMSjTnNJae98G6g67SYoezX0n8gV0/2UhhF0PLbFSoHYD+Waj0erXtfexF
	1WnrivWNSj+PL4U9K8jcp7yHg068QpPVEb2L0FP+xrBMx15if33kxeY9jTB+/BmI9a6L
	VirGthPySqPysOBktVHh1+6T8dJYK0skglXZOY3dgC6AqFrluqW2MbbfAt3CkFZA1lQO
	g3YwHUFH/ePy8Z7EQyp+DkfdASRCpP4bsbkvLHuCyz8PZUSovIBppBUVbd3lCyVZn6VO
	sbg0Aoa45900PNgktbWdvm8uHJL4J63hWRrubvoByd85GztZgxewbPiPKpQsugUSUnCM
	QfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GSDkyALACXj4whGVcYYhZRtETe3q/VLf+1Y/Ubqb4l0=;
	b=AsXiAYMte7FpbNzUHOK6ze6SN5WGw/ahQha7NdRMlkx2NZe2oIHX0QOeYKvEo7pZ3x
	o1G274uIiHcnuKTJiBSgRCplMQ5MWxpI0lvBE0H7jxXEiikFfO3sp8fw93crXKrp3WGn
	PYsLq8rTAnlXBe4OIXvtEjPBCYCngBoxjevp35yG9tbhDD2TazZdV1eESDVJqNi8OsFB
	G1l2J7RII0PO+/IMya2ZAJR9zAezj9JPeUokFcuZTaqQyPQexBXhyHOwzey3+KEIvrFx
	PsBlPtaLaIsHd9aT8gybElxse7XeoI0G0IZL0FihRzay7QyJ9fyBZjzwKeCBGl8A7yCQ
	bOew==
X-Gm-Message-State: AE9vXwMl+sPyhVeiJLbSwxA4KseypR51unfXJB3vxpZpwoQynwJiVMVWAMOWDm5CDOZEwZ5FRQqFVfotOTz6vw==
X-Received: by 10.25.160.6 with SMTP id j6mr10948325lfe.159.1474282757359;
	Mon, 19 Sep 2016 03:59:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.174.111 with HTTP; Mon, 19 Sep 2016 03:59:16 -0700 (PDT)
In-Reply-To: <1474282586-12211-1-git-send-email-stefanha@redhat.com>
References: <1474282586-12211-1-git-send-email-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 19 Sep 2016 14:59:16 +0400
Message-ID: <CAJ+F1C++OCuzmU7zUZK22m+E6XP0BqVjCacaTuatw+kaEBwqFQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: fix
 -chardev ringbuf typos
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
X-List-Received-Date: Mon, 19 Sep 2016 11:00:26 -0000

On Mon, Sep 19, 2016 at 2:56 PM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> Clean up the documentation for -chardev ringbuf.  There is a stray
> closing parenthesis and the comma is unnecessary.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0b621bb..094733d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2372,7 +2372,7 @@ console with the given dimensions.
>  @item -chardev ringbuf ,id=3D@var{id} [,size=3D@var{size}]
>
>  Create a ring buffer with fixed size @option{size}.
> -@var{size} must be a power of two, and defaults to @code{64K}).
> +@var{size} must be a power of two and defaults to @code{64K}.
>
>  @item -chardev file ,id=3D@var{id} ,path=3D@var{path}
>
> --
> 2.7.4
>
>



--=20
Marc-Andr=C3=A9 Lureau

