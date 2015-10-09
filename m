Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZUu-00058r-Rf
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:22:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZkWkF-0000NB-N5
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 08:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZkWkE-00013t-RU
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 08:25:55 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:33185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZkWk9-00012C-Hn; Fri, 09 Oct 2015 08:25:49 -0400
Received: by oiar126 with SMTP id r126so3542910oia.0;
	Fri, 09 Oct 2015 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ada2nzdPZlSpdPkYFcswxtf+U3ClSTgJUhiiAiYAcLY=;
	b=WK7Sjs0nTvvVpZk1YNbISy1L0o/wE+IShHkxW+PWr6cyOjcWXxsbb/JIEeGakJXhB+
	BJOmRA0D+axWY+jOXnV8Fug0kSClyC1c1dZF8uLrb2K27oxWkdUvW1GA0BEO/Xs6WlF+
	bAYBcMrGX3EvWQGNCG+rX8ppmxPP4l31MQaQFwBrzIfWPZzrptWbMODULI1rb5Usf7LL
	oQoGyVYK979J9c4ImHrylMxWfppYMqKpzyVCiukmKXVC0+KaahjtoZUO8pJfo1t75c+z
	7+GGRPXLQ2yXYmjXuNUezWbIQqlArBW8wYv+V2MiAZhOylMI90sZQxO6UyUigtYghM6D
	tmQA==
MIME-Version: 1.0
X-Received: by 10.202.88.215 with SMTP id m206mr7592326oib.47.1444393549007;
	Fri, 09 Oct 2015 05:25:49 -0700 (PDT)
Received: by 10.76.74.40 with HTTP; Fri, 9 Oct 2015 05:25:48 -0700 (PDT)
In-Reply-To: <91288a58a550be4dc80628456d5e1d2e91424827.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
	<91288a58a550be4dc80628456d5e1d2e91424827.1444323071.git.mjt@msgid.tls.msk.ru>
Date: Fri, 9 Oct 2015 14:25:48 +0200
Message-ID: <CAJ+F1CLBjf1Soe4EZP3udhzeRMncw2CQ4qVOV0OSpfeUANs-4Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::235
Cc: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 01/19] Add .dir-locals.el
 file to configure emacs coding style
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
X-List-Received-Date: Fri, 09 Oct 2015 12:25:56 -0000

Hi

Similar to this file, I proposed a clang-format file. I also use
emacs, but clang-format is way better at dealing with reformating,
especially on a given region without touching the rest:

https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg01278.html

On Thu, Oct 8, 2015 at 6:52 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: "Daniel P. Berrange" <berrange@redhat.com>
>
> Some default emacs setups indent by 2 spaces and uses tabs
> which is counter to the QEMU coding style rules. Adding a
> .dir-locals.el file in the top level of the GIT repo will
> inform emacs about the QEMU coding style, and so assist
> contributors in avoiding common style mistakes before
> they submit patches.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  .dir-locals.el | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .dir-locals.el
>
> diff --git a/.dir-locals.el b/.dir-locals.el
> new file mode 100644
> index 0000000..3ac0cfc
> --- /dev/null
> +++ b/.dir-locals.el
> @@ -0,0 +1,2 @@
> +((c-mode . ((c-file-style . "stroustrup")
> +           (indent-tabs-mode . nil))))
> --
> 2.1.4
>
>



--=20
Marc-Andr=C3=A9 Lureau

