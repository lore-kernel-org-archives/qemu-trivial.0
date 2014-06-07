Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJ1V-0005c9-JY
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 11:59:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtJ1Q-0005b3-TC
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 11:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtJ1L-00015K-V9
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 11:59:08 -0400
Received: from mail-la0-f44.google.com ([209.85.215.44]:61856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtJ1L-00013J-OY
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 11:59:03 -0400
Received: by mail-la0-f44.google.com with SMTP id hr17so2233660lab.3
	for <qemu-trivial@nongnu.org>; Sat, 07 Jun 2014 08:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RdYheKoxNRV/XXs4eqVwXxbCVjgPFNhaFAG/z4znjnk=;
	b=UFgpPc9/0LBG67dX+60PHKueLpmCJsfb1zEkR0vF+j0B98eX8ilEppMi9XDphQXq7E
	9jLucD4qzEjfTE1lLAm8mNjUqdJZKF4KcUE8Vy/HrAVLGKF7nWuwOhub2Qw9rP6KEhsp
	E8sMkce2sGqyk4nmG5fputwF8GhIHkl5/nPuqxjafOHDz4iFCVIdGEnU3a2oGaFxl1ZO
	3OMhNJwTZPhG+AksXh9d+lfmWrXRlgWee50heSLH8Nc/x38QUeK3zbLSP/vifcGTazo1
	o9AKVKg7eCilYDn3S7EVBlyBC8AwRjdqgdQcO4jNdpb7fjvSTf5q7tXp33VWOjKpLxS1
	jSbQ==
X-Gm-Message-State: ALoCoQkBLieexSO3x8as3gFakPDmaP6gSwrH76k7uv8epqUCzSLc3SOJEFl5wDAO5uSVShyGdAjP
X-Received: by 10.112.161.103 with SMTP id xr7mr2183894lbb.55.1402156742389;
	Sat, 07 Jun 2014 08:59:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sat, 7 Jun 2014 08:58:42 -0700 (PDT)
In-Reply-To: <1402155757-24977-1-git-send-email-sw@weilnetz.de>
References: <1402155757-24977-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Jun 2014 16:58:42 +0100
Message-ID: <CAFEAcA9-80+p74U8-u_NTeDA5tzLYZFaXWMJZn8VcSBHWfc-GA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] checkpatch: Check *.cc files and allow
 C99 comments for C++ code
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
X-List-Received-Date: Sat, 07 Jun 2014 15:59:12 -0000

On 7 June 2014 16:42, Stefan Weil <sw@weilnetz.de> wrote:
> QEMU uses both *.cc and *.cpp for some files with C++ code:
>
> disas/libvixl/utils.cc
> disas/libvixl/a64/disasm-a64.cc
> disas/libvixl/a64/instructions-a64.cc
> disas/libvixl/a64/decoder-a64.cc
> disas/arm-a64.cc
> qga/vss-win32/provider.cpp
> qga/vss-win32/install.cpp
> qga/vss-win32/requester.cpp
>
> *.cpp files were already checked. Add the cc pattern, so *.cc are checked
> now, too.

Note that there's not much point in checking libvixl's .cc files,
because we're only going to change these for (a) updates
to new upstream versions and (b) fixes for serious issues
that can't wait for a new upstream version; they're never
going to match our coding style.

thanks
-- PMM

