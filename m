Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBlZf-00010u-SJ
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2013 09:02:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlZZ-00010V-0Y
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlZU-0002xT-44
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:02:08 -0400
Received: from mail-la0-f44.google.com ([209.85.215.44]:63970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlZT-0002xI-TX
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:02:04 -0400
Received: by mail-la0-f44.google.com with SMTP id eo20so286328lab.3
	for <qemu-trivial@nongnu.org>; Tue, 20 Aug 2013 06:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H6lhYVCiU2FysIdZA02rb4FHBlv4F0UvsgXERNK76pQ=;
	b=NMKpZ6uk+h4Dc7sDgsz+21s0+NG+NJMbYuLZTqAkCUbSOexrwWX9qas/Svue+Fmhiq
	gJpUSX7VbvIedE/JbPiITnTBw1UyGunhIeTtFRMIBNX2udBsOd0IY/r1ynsH8TDnjKck
	EL3XBoZeuTbH4z4r8Cp43e8O902BthkjG/Z2pWO+jlL2d5wm2/B3NL09VaaQ4IYm9LBi
	nU7A4bFhklloB90vdWgbCLPnm8PRyXK91gviX0GXzYQDe6Rcb20I5wqaBgs2whA+5eHk
	tmCuaM3o4A3siz5IjbgWn1oYNn4fVSDJgU9v7qlt0ixz6ZGlJBtF8Igx6YikBOw90/l8
	1XKg==
X-Gm-Message-State: ALoCoQlQuA27JyvXXVeEbT+cLuKYvd2Y5moBCB8Zmn7IJ0FHSMn1xzTsKgSkR3Gt0fv9Q5b+tFho
X-Received: by 10.112.33.146 with SMTP id r18mr867479lbi.48.1377003722862;
	Tue, 20 Aug 2013 06:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 20 Aug 2013 06:01:42 -0700 (PDT)
In-Reply-To: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
References: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2013 14:01:42 +0100
Message-ID: <CAFEAcA-FMZ+jyp15iH9TVk9-cuiLW1CL__E6ApCu=BZoXrbciQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: disable clang
	-Wstring-plus-int warning
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
X-List-Received-Date: Tue, 20 Aug 2013 13:02:14 -0000

Ping for qemu-trivial now 1.7 is open.

thanks
-- PMM

On 5 August 2013 20:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> Some versions of clang will warn about adding integers to strings:
>
> disas/i386.c:4753:23: error: adding 'char' to a string does not append
>       to the string [-Werror,-Wstring-plus-int]
>       oappend ("%es:" + intel_syntax);
>                ~~~~~~~^~~~~~~~~~~~~~
> disas/i386.c:4753:23: note: use array indexing to silence this warning
>       oappend ("%es:" + intel_syntax);
>                       ^
>                &      [             ]
>
> disas/i386.c uses this idiom to to skip a "%" prefix if using intel
> rather than AT&T syntax. This seems like a reasonable  thing to do,
> and I don't think anybody contributing to QEMU is likely to believe
> that '+' is a string concatenation operator in C, so just disable
> -Wstring-plus-int.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configure b/configure
> index a3bd9be..a1d1701 100755
> --- a/configure
> +++ b/configure
> @@ -1204,6 +1204,7 @@ gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_
>  gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
>  gcc_flags="-Wendif-labels $gcc_flags"
>  gcc_flags="-Wno-initializer-overrides $gcc_flags"
> +gcc_flags="-Wno-string-plus-int $gcc_flags"
>  # Note that we do not add -Werror to gcc_flags here, because that would
>  # enable it for all configure tests. If a configure test failed due
>  # to -Werror this would just silently disable some features,
> --
> 1.7.9.5
>
>

