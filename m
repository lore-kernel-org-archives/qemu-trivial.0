Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yno3p-0007fS-1Z
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 08:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yno3j-0007fG-1h
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 08:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yno3e-0001GJ-Bv
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 08:59:18 -0400
Received: from mail-ie0-f175.google.com ([209.85.223.175]:36130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yno3e-0001G8-7n
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 08:59:14 -0400
Received: by iebrs15 with SMTP id rs15so66059664ieb.3
	for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2015 05:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hsPxTkVk6BQmJUGk2ZpLEvztHfX4W0qGi+gS4kyexq8=;
	b=Ua4V3oxcFJvn7tSdu7OegygqINGIEKlZkiKZP6GXyT5m3s8jaqngQqGhDfzDMdOaJ2
	Z3xjK3VzvpWUHmQ4UhImvDHrrybOiVUsJdx/dlDLqyYW/uHjarXeUt7ZkPDAJuTjz4fV
	T5oShjQIgJuP3cVi7BG8WS27Wh5p1hTWBgEGcJ1sn4vMIVn8my3ywvhjx4WeHmoJW+pp
	qTaED4b4D5nw6jB6kdFyZvgmlyHxcKcpAqG7R8cWMFy56xu7cypW3CqGbUE2xziKEzaD
	VkYrRiLFqM4XbqCtnGA/+huU5Zjea2Iz8UndWXQA5o8m4UWqGjS86C9lITgHjoxNCNg6
	cXgQ==
X-Gm-Message-State: ALoCoQku32Ll4Kkryig1gps/k5CqOyjPdTDPZ2o14kA/H15LpYudUiKP/Y9NuqGZ1R/Dm7JUcWmd
X-Received: by 10.50.109.138 with SMTP id hs10mr3366566igb.48.1430398753495;
	Thu, 30 Apr 2015 05:59:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Thu, 30 Apr 2015 05:58:53 -0700 (PDT)
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2015 13:58:53 +0100
Message-ID: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/42] Trivial patches for
	2015-04-30
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
X-List-Received-Date: Thu, 30 Apr 2015 12:59:24 -0000

On 30 April 2015 at 06:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hello.
>
> This is the first pull request for trivial-patches tree since 2.3 has
> been released.  During the freeze many patches has been accumulated,
> and even more has been received after 2.4 developmnent has been opened.
>
> So here we have 42 trivial patches, which is kinda too much, but that's
> what we have :)
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit a9392bc93c8615ad1983047e9f91ee3fa8aae75f:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2015-04-28 16:55:03 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-04-30
>
> for you to fetch changes up to fe31d3e6e6945b509e5b4ab03d38aae1266fe64e:
>
>   microblaze: fix memory leak (2015-04-30 08:06:20 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-04-30

Hi. I'm afraid this fails to build the tests on OSX:
  CC    tests/i440fx-test.o
/Users/pm215/src/qemu/tests/i440fx-test.c:229:21: warning: implicit declaration
      of function 'ARRAY_SIZE' is invalid in C99
      [-Wimplicit-function-declaration]
    for (i = 0; i < ARRAY_SIZE(pam_area); i++) {
                    ^
1 warning generated.
  LINK  tests/i440fx-test
Undefined symbols for architecture x86_64:
  "_ARRAY_SIZE", referenced from:
      _test_i440fx_pam in i440fx-test.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [tests/i440fx-test] Error 1

'i440fx-test: remove ARRAY_SIZE redefinition' has removed
this macro, but this test file doesn't include osdep.h so
it presumably works on Linux only because we're picking
something up from a system header file somewhere...

-- PMM

