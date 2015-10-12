Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmqXV-0004JN-D6
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 17:58:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZldC0-0000Ab-NX
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 09:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZldBv-0006GF-6o
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 09:31:08 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:34121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZldBt-0006Fg-Io; Mon, 12 Oct 2015 09:31:01 -0400
Received: by oiak8 with SMTP id k8so61094115oia.1;
	Mon, 12 Oct 2015 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=XzaZVsQBCndzIT22+H/7Osx/LFk43A3ew1pPUn2gDRY=;
	b=wryv9k7rw4lQ7He6qJKYLnRtKpA8CLo5glKwmQK7GI34m+niKvXjZpM5gUsbbENxKw
	9O/8TgcoA5+HJEhzeoRMcLuVcbi5LJqeNIEAjvZlswzj1gv8WrWtCLgu0x+6Tdh/WOAx
	4NTHIsDQTtzmhWRpvpPX4GuE8DzPQmwPd9sUuXv4oqp62YwmZwBLdglOsfYegoushv91
	t7oBwQCCksOKcTkQ6LkbmwRHxk219u+q+03I1uoz5pLwTzTEmV9d5GZLfxEjuJe8e5RT
	SFW1LgW4RuyR827E4ghVA38Cha04FfpCzyiEGYAvIR3kjurrWcV6mD4zhw/TAgQNy0Et
	N62Q==
MIME-Version: 1.0
X-Received: by 10.202.97.196 with SMTP id v187mr15356411oib.91.1444656661013; 
	Mon, 12 Oct 2015 06:31:01 -0700 (PDT)
Received: by 10.76.74.40 with HTTP; Mon, 12 Oct 2015 06:31:00 -0700 (PDT)
In-Reply-To: <1444647299-28642-2-git-send-email-marcandre.lureau@redhat.com>
References: <1444647299-28642-1-git-send-email-marcandre.lureau@redhat.com>
	<1444647299-28642-2-git-send-email-marcandre.lureau@redhat.com>
Date: Mon, 12 Oct 2015 15:31:00 +0200
Message-ID: <CAJ+F1CKT2jgey_8xXjh+dEEmHrdhtUcDvr-NTDGzHAO3BY0cHw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: QEMU <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::235
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/3] hw/acpi/aml-build: remove useless
	glib version check
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
X-List-Received-Date: Mon, 12 Oct 2015 13:31:14 -0000

to qemu-trivial

On Mon, Oct 12, 2015 at 12:54 PM,  <marcandre.lureau@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> 2.22 is the minimum version required
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/acpi/aml-build.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 0d4b324..a00a0ab 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1163,9 +1163,7 @@ void *acpi_data_push(GArray *table_data, unsigned s=
ize)
>
>  unsigned acpi_data_len(GArray *table)
>  {
> -#if GLIB_CHECK_VERSION(2, 22, 0)
>      assert(g_array_get_element_size(table) =3D=3D 1);
> -#endif
>      return table->len;
>  }
>
> --
> 2.4.3
>



--=20
Marc-Andr=C3=A9 Lureau

