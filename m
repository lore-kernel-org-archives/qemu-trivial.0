Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j01Wk-0005IM-DR
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 06:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j01Wi-0005GT-9M
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j01Wg-0001fh-WC
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:10:24 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38157)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1j01We-0001Y9-Rn; Fri, 07 Feb 2020 06:10:20 -0500
Received: by mail-wm1-x341.google.com with SMTP id a9so2269591wmj.3;
 Fri, 07 Feb 2020 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LtTKVDBAcXrSGl722zd27bUxbu7LlcqzJmrYzrNj7DQ=;
 b=t9ZqxGqoQES+Twc9EYczihV9q7No2RH88XmXi7LKEGZBlSlRt8bPZR8/kyz7Fjb99r
 bH3c7b37GkV1jXQQtrovFV6LOtB/AIbTt1U5mOA8rAo5A0GWQHPpj1y8iYQj6jesMj8E
 XWUpwi5Sj/LOjlnW6tvPL5cbiwWOUjfAQefGI7azPAYWem7dBi2LUj5b1GysFBOctMlx
 oyJIS4wfptPVt1QC6qMKClXEPoxK0LJiIf4L2AfpLw2FzCl7XR1khcRMIXLBNZfnm33g
 3JJQC5bCvKQuEdh9R6zsuC41ksMK1xunpp+TP397A/JF8W6EJ3deO7WmdkgtayuEmhhH
 wQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LtTKVDBAcXrSGl722zd27bUxbu7LlcqzJmrYzrNj7DQ=;
 b=ej373WYJgWvJxFzDb1XyzQ0bBQYHcOIyKx1g3JM0Gl/PHFlrQ+pQu9WmKcZvBvkCoo
 FlCpz62j3Vc84Vt+DDiM6HWT5Cavg8Dj7FfgV97T41UmSgFjhuhFXKc7KxZ8qEMYUGle
 JI3vG9G8caA+j7dqYj9NbpUfzj2qy9CUiM2kWc+igbu1aj3uZCNJymhGLVq1TxtaRgSk
 noe8ZnhgQBONa6gUAqjyC3JEG7cBZwxyIISaTunjMlNWM/nlPjpadDg7+P8TRgBBJR34
 0hg1rLzm+6nt/OxysdNBiyQ2A20g06yJIoEVm8tLnIz5CLYhVgckVnxRa1Uk+EemwFv8
 9U+A==
X-Gm-Message-State: APjAAAUuT3/jcXxVI6N5TcD6EmYOdg4XE+uWRsnmZ2yYn9sLm7RsJ6yE
 Vz/tcttBX0iLevSFWHqd2NKDiX0w2tb4tXf4fgI=
X-Google-Smtp-Source: APXvYqx9z4QDjcZtvsWBfs8GpWz8BTcKWmXzd3z1VcmgQKfeCDuQJr5L6A0stnL6lpmo4q1uDQKxtMqkMQ/a61ulASc=
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr4037228wme.26.1581073819450; 
 Fri, 07 Feb 2020 03:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20200207110259.12544-1-philmd@redhat.com>
In-Reply-To: <20200207110259.12544-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 Feb 2020 12:10:07 +0100
Message-ID: <CAJ+F1CJfE6w=3Egf1HwFJyBQvand4-B5vMVsPDaC0eK1n_KWJQ@mail.gmail.com>
Subject: Re: [PATCH] vl: Abort if multiple machines are registered as default
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 11:10:25 -0000

Hi

On Fri, Feb 7, 2020 at 12:03 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> It would be confusing to have multiple default machines.
> Abort if this ever occurs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  vl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/vl.c b/vl.c
> index 7dcb0879c4..da828188eb 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *name=
, GSList *machines)
>      GSList *el;
>
>      if (is_help_option(name)) {
> +        int default_count =3D 0;
> +
>          printf("Supported machines are:\n");
>          machines =3D g_slist_sort(machines, machine_class_cmp);
>          for (el =3D machines; el; el =3D el->next) {
> @@ -2364,6 +2366,11 @@ static MachineClass *machine_parse(const char *nam=
e, GSList *machines)
>              printf("%-20s %s%s%s\n", mc->name, mc->desc,
>                     mc->is_default ? " (default)" : "",
>                     mc->deprecation_reason ? " (deprecated)" : "");
> +            default_count +=3D !!mc->is_default;
> +        }
> +        if (default_count > 1) {
> +            error_printf("Multiple default machines available\n");
> +            abort();

looks ok

It's a build-time issue? If the user can't do anything about it, you
may simply have an assert(default_count <=3D 1) rather than a
human-friendly string, I think.

--=20
Marc-Andr=C3=A9 Lureau

