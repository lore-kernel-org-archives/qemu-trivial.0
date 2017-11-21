Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHFif-0004VE-Ln
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 16:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eHFid-0004Tj-C1
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 16:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eHFic-0004FV-Im
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 16:04:35 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50738
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1eHFiX-0004CV-Cc; Tue, 21 Nov 2017 16:04:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id BD476DA90BF;
	Tue, 21 Nov 2017 22:04:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AWpAHkVmmQEn; Tue, 21 Nov 2017 22:04:27 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (pD9E0104E.dip0.t-ipconnect.de
	[217.224.16.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 26089DA90BE; 
	Tue, 21 Nov 2017 22:04:27 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20171116163732.31584-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <e52d9ae1-50df-8484-4476-e7b9d6ea0d76@weilnetz.de>
Date: Tue, 21 Nov 2017 22:04:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171116163732.31584-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH for-2.11] Fix build of console and GUI
 executables for Windows
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
X-List-Received-Date: Tue, 21 Nov 2017 21:04:36 -0000

Am 16.11.2017 um 17:37 schrieb Stefan Weil:
> It was broken by commit 8ecc89f6e792152496eccb684d6c8c48aba8027d which
> moved the SDL linker flags from macro libs_softmmu to macro SDL_LIBS.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Peter, can you apply this fix directly, or do you need a pull request?
> 
> Regards
> Stefan
> 
>  Makefile.target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile.target b/Makefile.target
> index e4244c188a..f9a9da7e7c 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -22,7 +22,7 @@ QEMU_PROG_BUILD = $(QEMU_PROG)
>  else
>  # system emulator name
>  QEMU_PROG=qemu-system-$(TARGET_NAME)$(EXESUF)
> -ifneq (,$(findstring -mwindows,$(libs_softmmu)))
> +ifneq (,$(findstring -mwindows,$(SDL_LIBS)))
>  # Terminate program name with a 'w' because the linker builds a windows executable.
>  QEMU_PROGW=qemu-system-$(TARGET_NAME)w$(EXESUF)
>  $(QEMU_PROG): $(QEMU_PROGW)


The fix missed v2.11.0-rc2. Can it be applied before v2.11.0-rc3?

Thanks, Stefan

