Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aW4z0-0000sr-Qi
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2016 11:29:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aW4yy-0000ri-E7
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 11:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aW4yx-0007tu-Kp
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 11:29:40 -0500
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:34474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1aW4yx-0007tm-F0; Wed, 17 Feb 2016 11:29:39 -0500
Received: by mail-ob0-x22a.google.com with SMTP id wb13so22210851obb.1;
	Wed, 17 Feb 2016 08:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=en/gyt3Xg8Ar61ZHLNxVxRjnPOa2WyXFllheFV5qbQI=;
	b=Ogaa55S7aDEchUeNhdrsPgDdbTIDTyWS/TkXOF1KwrubTFJeC2BGN/xRNEHyWNJjmv
	ORJdcelPXafWuHO24eTxqGE5rijV29xW0Qsfya0lyQpoWpfJIwC/hBgr3SfDnWOMwkrc
	xw8OEvkLKe3VL9BS5gwkpkmK+kUEQwVap+4IPeG/8paewMLS+eKAFqasc8lqSwUyoj29
	1Bl3EhCwVP8FCwM0uSxD1218TgC4HfelzFYbl8ftajdoiDCgmLwrAyXHrUnbo3gfRuNK
	w6GvMy6gvUF/DFhkOAGmyKnFkYDYPNsBMtJdhsxWv521NLFeaXovjpTHqkP3pjD8ek0t
	4B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=en/gyt3Xg8Ar61ZHLNxVxRjnPOa2WyXFllheFV5qbQI=;
	b=CGMYbFWJ+28PLEcQyG5TqGX9hfLhryFifAuO0sAkCmPjxNfWQl8fivWNunWB90gHd6
	oIQQPEtfSY6wLNeI30Ug/kYa3zHAuh/4LWNUlmR497BKwYQI+o0POyytJ/SOel9MGFDH
	EcbVqU0BPYUWhBa9xyG4lporYOPimexsdHo3GpdCwjNwYBeMn+GGrAhk0pKwno2LU6pY
	s5niDpSr6h/qWA83r4tkkI9SpWQFabFyEpEOU0ebIXP8MmzqqN3LgUhu0L7WYgWQGYTz
	p116kiJE1pqDvV9uPnQeUA+SQnRkOoz7WwT4PDrv7U8SufHKtMt6uiOD4yZWZdjIlNId
	WF7A==
X-Gm-Message-State: AG10YORKz+sEEDObLmw5bWLOBuLAxWoeL8mwlc4EttiBhpI5gkTJYJxj3UaUMEqkwtm3TzO570a2bUR0813hEQ==
MIME-Version: 1.0
X-Received: by 10.182.86.33 with SMTP id m1mr1963176obz.48.1455726578797; Wed,
	17 Feb 2016 08:29:38 -0800 (PST)
Received: by 10.76.79.73 with HTTP; Wed, 17 Feb 2016 08:29:38 -0800 (PST)
In-Reply-To: <1453123549-30800-1-git-send-email-marcandre.lureau@redhat.com>
References: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
	<1453123549-30800-1-git-send-email-marcandre.lureau@redhat.com>
Date: Wed, 17 Feb 2016 17:29:38 +0100
Message-ID: <CAJ+F1CJvAMHvQmEPDtV26YJg_y_g4KzDH9Mra8ypoiighTgAMw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: QEMU <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22a
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] monitor: spelling fix
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
X-List-Received-Date: Wed, 17 Feb 2016 16:29:41 -0000

adding trivial to cc

On Mon, Jan 18, 2016 at 2:25 PM,  <marcandre.lureau@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/monitor.c b/monitor.c
> index c53a453..baa89cb 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -311,7 +311,7 @@ static void monitor_flush_locked(Monitor *mon)
>              return;
>          }
>          if (rc > 0) {
> -            /* partinal write */
> +            /* partial write */
>              QString *tmp =3D qstring_from_str(buf + rc);
>              QDECREF(mon->outbuf);
>              mon->outbuf =3D tmp;
> --
> 2.5.0
>
>



--=20
Marc-Andr=C3=A9 Lureau

