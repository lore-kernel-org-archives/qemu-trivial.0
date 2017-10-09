Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1UWC-0005bZ-AC
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 05:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1e1UWA-0005a0-7d
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1e1UW5-0002SW-IO
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:38:34 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:48218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1e1UW5-0002Rj-BT
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:38:29 -0400
Received: by mail-wm0-x22e.google.com with SMTP id i124so20648025wmf.3
	for <qemu-trivial@nongnu.org>; Mon, 09 Oct 2017 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=pOrhD0B6DRm6QGuv2daiH4Mlpb634bz4yEzR8FzMbd4=;
	b=auN9+8VwiaH7LxYW1Zldh6mxQVaF5aufueApBSCMlmDyoOKdby1+QsIXBgT/E4XfU9
	kj52O6CVNfSBiuMzl5C7wSiD0RIrYT3oJWQTyOb9C3Z1eBDKWaJRKeCxK6O6RFp0bPDY
	h/h1cenH7UmbegplYPRtplVHRMhTd8BPQveV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=pOrhD0B6DRm6QGuv2daiH4Mlpb634bz4yEzR8FzMbd4=;
	b=FXSwhLiPdRy/J8sx+XYtWcwFOeE6uWK2f93hoBfld0MiXlwk5nQ3XaVDQogXoisIJ+
	YMt++7xAWdaNZmYqEszYwI8CfQY82DEhsbfdUwor7ZsfevJQ/JH7+ywZKLoITlxhG2AH
	d/9q929fxxuC3LPkvVzIayb0cJeZOJLEax/yRngziG7Ii/18v+JlQ+LUm0RMl1Jg4fqe
	xtAJQcpLMhnf3qKFOxqPLSqnB2UT8uIza/HEnyaIXW/zDu98pEAUB1AsnDeE8Vubp4Tc
	QlP0OYSjlyqm2SfWHbkQIeEOjv/p9vOKSDwnzMHgCRvClVhQuvbcVdD10hxcuX5EK+V9
	K4Dg==
X-Gm-Message-State: AMCzsaXmAOSUPiEoakWlBkFDvtFrz2130KXPBfElOUd/0aBWa9kJlfWf
	8HsrM0jTwIyumJbnKPQO6sOrZQ==
X-Google-Smtp-Source: AOwi7QACOL0/vqikMaIVwcMvxauvuuMcgDC91e9ieDwjHfaCiEOYLGHE8MiHFtvH15yI1WgZX/Pteg==
X-Received: by 10.223.134.212 with SMTP id 20mr8231633wry.81.1507541907869;
	Mon, 09 Oct 2017 02:38:27 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id m25sm7407736wmi.7.2017.10.09.02.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Oct 2017 02:38:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9570D3E0342;
	Mon,  9 Oct 2017 10:38:26 +0100 (BST)
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-79-f4bug@amsat.org>
User-agent: mu4e 0.9.19; emacs 26.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>, Markus
	Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, Paolo
	Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, qemu-devel@nongnu.org, Kevin Wolf
	<kwolf@redhat.com>, qemu trival <qemu-trivial@nongnu.org>
In-reply-to: <20171006235023.11952-79-f4bug@amsat.org>
Date: Mon, 09 Oct 2017 10:38:26 +0100
Message-ID: <877ew4bqzx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [PATCH 78/88] gdb: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 09:38:35 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 2a94030d3b..5f0d8af1c0 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1786,7 +1786,7 @@ static void gdb_accept(void)
>      /* set short latency */
>      socket_set_nodelay(fd);
>
> -    s =3D g_malloc0(sizeof(GDBState));
> +    s =3D g_new0(GDBState, 1);
>      s->c_cpu =3D first_cpu;
>      s->g_cpu =3D first_cpu;
>      s->fd =3D fd;
> @@ -1980,7 +1980,7 @@ int gdbserver_start(const char *device)
>
>      s =3D gdbserver_state;
>      if (!s) {
> -        s =3D g_malloc0(sizeof(GDBState));
> +        s =3D g_new0(GDBState, 1);
>          gdbserver_state =3D s;
>
>          qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);


--
Alex Benn=C3=A9e

