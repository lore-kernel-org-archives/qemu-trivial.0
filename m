Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cow39-0003t2-HU
	for mharc-qemu-trivial@gnu.org; Fri, 17 Mar 2017 13:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cow37-0003sQ-Kc
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 13:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cow36-0004Dp-Rn
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 13:52:25 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:33558
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1cow31-00044d-Ff; Fri, 17 Mar 2017 13:52:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 26486DA14FA;
	Fri, 17 Mar 2017 18:52:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hkvtvMFM8b_k; Fri, 17 Mar 2017 18:52:15 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC8E18.dip0.t-ipconnect.de
	[84.172.142.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 68605DA1342; 
	Fri, 17 Mar 2017 18:52:15 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170317160811.28370-1-pbonzini@redhat.com>
Cc: peter.maydell@linaro.org, thuth@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <86a22787-b3d0-dd32-9925-61f94de4ad33@weilnetz.de>
Date: Fri, 17 Mar 2017 18:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170317160811.28370-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.9 v2] configure:
 remove Cygwin
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
X-List-Received-Date: Fri, 17 Mar 2017 17:52:26 -0000

Am 17.03.2017 um 17:08 schrieb Paolo Bonzini:
> The Cygwin target is really compiling for native Win32 with -mno-cygwin.
> Except, GCC 4.7.0 has finally removed the long deprecated -mno-cygwin
> option, and that happened about five years ago.
>
> Let it rest in peace.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Stefan Weil <sw@weilnetz.de>

CC'ing qemu-trivial for the pull request.

I only wonder whether we should raise an error if people
try building QEMU with native Cygwin (not Cygwin / Mingw-w64).

Stefan


>  bsd-user/mmap.c | 5 -----
>  configure       | 6 ------
>  2 files changed, 11 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index ee59073..1ad018a 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -199,12 +199,7 @@ static int mmap_frag(abi_ulong real_start,
>      return 0;
>  }
>
> -#if defined(__CYGWIN__)
> -/* Cygwin doesn't have a whole lot of address space.  */
> -static abi_ulong mmap_next_start = 0x18000000;
> -#else
>  static abi_ulong mmap_next_start = 0x40000000;
> -#endif
>
>  unsigned long last_brk;
>
> diff --git a/configure b/configure
> index 99d8bec..b9a30cf 100755
> --- a/configure
> +++ b/configure
> @@ -553,12 +553,6 @@ fi
>  HOST_VARIANT_DIR=""
>
>  case $targetos in
> -CYGWIN*)
> -  mingw32="yes"
> -  QEMU_CFLAGS="-mno-cygwin $QEMU_CFLAGS"
> -  audio_possible_drivers="sdl"
> -  audio_drv_list="sdl"
> -;;
>  MINGW32*)
>    mingw32="yes"
>    hax="yes"
>


