Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9qeh-0004ZC-JG
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2016 05:17:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9qef-0004Wk-Gi
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 05:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9qeY-0001SO-Jz
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 05:17:04 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9qeY-0001S1-Fh
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 05:16:58 -0400
Received: by mail-vk0-x230.google.com with SMTP id d64so67405300vkb.0
	for <qemu-trivial@nongnu.org>; Mon, 06 Jun 2016 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dNy8UH9Mif2VRR1YKdTVRvedfE3mDo2sqNpan3lU01E=;
	b=IqciNsfUWiXkTJ0ZOi9MIPA6u55a/xAs6bF4tY++Lx1+hO9fBGYSlHaKEjEs38SMJR
	DY7uEoofX3uBP39VKh43jsj80aUUfIg2Z6FaryxSk8EqEqeYi2EyX/+uVESzFO+N50xG
	QU8Gort70b3+/Ru6CWSO8cjVLbuvRw9dDfnRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dNy8UH9Mif2VRR1YKdTVRvedfE3mDo2sqNpan3lU01E=;
	b=d+iwq6s2DOuJlMlRT4Tr/hvKAFR1TgoFbjy8iUR7hXo6ciPC+yQ/QHQza4Bzoey1aq
	HEz7D/DtPG0wh3oX8Sc/gy/PAPOAVEc6d2jumDJvqU4UGaXL5zr113zCcdAJRsewwbkf
	AT0x5AGPk+spl8hGxsRPibehh8ObwdnVpD1Muw7NwWyBJpDyn2v6efNslrmSywIvqqC7
	5ccfC4EUEpZjNkgLNrxrzz52aY9BsY5n7aoImKadLFqSlIMv2D/esLqJOX1MUV5yP0Vp
	zMV6+Q4OF4MxDSH0dgL7VG8jeivbnWJsrvjQk4Cd0IgBa/hHLrHns8YyeRMDD/OBoK9Y
	iWCg==
X-Gm-Message-State: ALyK8tKC+Ztx/0oOjLKSakTKvlsEguX4FCEjC7sNAhFKvpkkLXQpZLsyyAsLi+I7/QbEJXPaxXcfgdydLVdTsMQb
X-Received: by 10.31.81.199 with SMTP id f190mr6139076vkb.139.1465204616918;
	Mon, 06 Jun 2016 02:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 02:16:37 -0700 (PDT)
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 10:16:37 +0100
Message-ID: <CAFEAcA8kPTVPjVYHyismDb4vvZVBmK8kGdCEVrvoVontSW91+A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, James Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/52] Trivial patches for
 2016-06-05
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
X-List-Received-Date: Mon, 06 Jun 2016 09:17:06 -0000

On 5 June 2016 at 08:42, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a big pile of patches collected in -trivial queue
> for quite a while.  I was busy with other stuff in recent
> months, now am trying to catch up.  This is the result,
> with everything all over.  Please consider pulling.
>
> /mjt
>
> The following changes since commit 6b3532b20b787cbd697a68b383232f5c3b39bd1e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-ui-20160603-1' into staging (2016-06-03 12:03:36 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-06-05
>
> for you to fetch changes up to 275757ac23428a641983200805bedee8f7b96793:
>
>   hbitmap: Use DIV_ROUND_UP (2016-06-05 10:10:48 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-06-05
>
> ----------------------------------------------------------------

Hi. I'm afraid this fails to configure on at least some platforms:

  GEN   qemu-options.def

ERROR: configure test passed without -Werror but failed with -Werror.
       This is probably a bug in the configure script. The failing command
       will be at the bottom of config.log.
       You can run configure with --disable-werror to bypass this check.

Tail end of config.log is:

cc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -Wendif-labels
-Wmissing-include-dirs -Wempty-body -Wnested-externs -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration
-Wold-style-definition -Wtype-limits -fstack-protector-all
-I/usr/include/p11-kit-1 -I/usr/include/libpng12
-I/usr/include/libusb-1.0 -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -g -nostdlib -Wl,-r -Wl,--no-relax
config-temp/qemu-conf.c:1:5: warning: no previous prototype for 'foo'
[-Wmissing-prototypes]
 int foo(void) { return 0; }
     ^
cc -Werror -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -Wendif-labels
-Wmissing-include-dirs -Wempty-body -Wnested-externs -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration
-Wold-style-definition -Wtype-limits -fstack-protector-all
-I/usr/include/p11-kit-1 -I/usr/include/libpng12
-I/usr/include/libusb-1.0 -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -g -nostdlib -Wl,-r -Wl,--no-relax
config-temp/qemu-conf.c:1:5: error: no previous prototype for 'foo'
[-Werror=missing-prototypes]
 int foo(void) { return 0; }
     ^

I think the problem commit is 'Fix linking relocatable objects on Sparc',
which adds a configure test that attempts to build an executable using
something that's not a valid C program (it has no 'main' function, for
instance, though that's not why the error here.)

thanks
-- PMM

