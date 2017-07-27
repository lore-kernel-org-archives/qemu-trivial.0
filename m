Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dacSe-0004Yo-Sh
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 02:39:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dacSc-0004XE-Tr
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 02:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dacSb-0000rX-Uw
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 02:39:50 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dacSX-0000kg-93; Thu, 27 Jul 2017 02:39:45 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MBG3l-1dSgVV0tPx-00ABY8; Thu, 27 Jul 2017 08:39:24 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-15-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5cd7f2d6-04e7-52a5-c045-973b9ef0d365@vivier.eu>
Date: Thu, 27 Jul 2017 08:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:5WKiMxoT7Jf8LYQrqz/tsAOqGFpSNMtCbi84oGkfX1lge/zffnO
	OA1kwcf/lUl+WwF9TILRscl+Ycawvow3ZBoot5EtCJyJKJnlqDVbHPKCXforKXm18vnDQqy
	lvWdvKexhoIxqDj+527HaX729ET8JF6RqFVJG5dMHT8QtUZwArt7+PP1Abrk3+ueks0sn5f
	x89JaAHSMJCA5+jaUF9Tw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:R4aURpxlmGk=:+aPW4NhNZYdqTmc6K9uzmc
	AvXmLQV/OMO21wg3BTluNV3hli6N5IZBnh6/5E6ZpglG+CF0AEXWAcFIzUeCrAEMkBPv/6RvO
	Bjfpc0qODsxSf6DECaq4A4PSAgl0seM4KAeCNwQ4SVq55VxC5O0vZWokELXbB2gXBvymaGRXX
	OxHvbOcgn7BeOtegv8G/BKde7RhG+wKC3y+d6O7fp8HEPyrIiiA8y+r2LHpxh6jsslFi/zx5G
	N38+bYaNDR/ZLuFO+yRDq7D55z2qEc/zUuM4Q+zamxwmqTMnLtxuyT1BshtZVk2+M0EZrhnZh
	POfxy0kAA/9kfh+eN/81S0aSESyCkL8ytEu9JGBCVInHU/BpB0PP917pCPMkDefpL4SOAsw6G
	jGcKYnIOg4cgi5NDH4PSKoi0TqFO3PRDMQLtH1CvJ8C6BrV6ggU2JzllQ4oYsqUTAw4eObg6y
	+y7dtE7ynu8AiI/DKzUxJZN1CC272wHy26Gh6L7SjTxwM5q0fhhGHUs5GTnrtoWeUmWTujMwr
	77IyJm+W/Ed7wzsc7ifglfh5BA6Gcvxb5Nwen8xEyzzc/c9YJ/Uh/BzvJ1PcSfv0W2i0i2Xrt
	0OBZ5psTY2RPloHqPvSDHQtc49x2TZDdMrrDAbNIsXq2Kdi1BjXeA18MmdTtMnqqKuB5hCR8F
	dt3o/xE7smK/EhiD/DgI45Zqc7x8W/FSVwpsufT7hNgzgrMwFbCTdT3k4pvGKpUmY2mDat8Bd
	yUCynaJen/s3T6NXnvfgOINe0TqriUUd3LzdSChAzmJ4qq6YT7WrMqWb70E=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 14/20] syscall: check
 inotify() and eventfd() return value
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
X-List-Received-Date: Thu, 27 Jul 2017 06:39:52 -0000

Le 27/07/2017 à 04:42, Philippe Mathieu-Daudé a écrit :
> linux-user/syscall.c:555:25: warning: Out of bound memory access (accessed memory precedes memory block)
>     target_fd_trans[fd] = trans;
>     ~~~~~~~~~~~~~~~~~~~~^~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Suggested-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>  linux-user/syscall.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 81f52f7483..dfc1301e63 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11742,7 +11742,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>  #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
>      case TARGET_NR_inotify_init:
>          ret = get_errno(sys_inotify_init());
> -        fd_trans_register(ret, &target_inotify_trans);
> +        if (ret >= 0) {
> +            fd_trans_register(ret, &target_inotify_trans);
> +        }
>          break;
>  #endif
>  #ifdef CONFIG_INOTIFY1
> @@ -11750,7 +11752,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>      case TARGET_NR_inotify_init1:
>          ret = get_errno(sys_inotify_init1(target_to_host_bitmask(arg1,
>                                            fcntl_flags_tbl)));
> -        fd_trans_register(ret, &target_inotify_trans);
> +        if (ret >= 0) {
> +            fd_trans_register(ret, &target_inotify_trans);
> +        }
>          break;
>  #endif
>  #endif
> @@ -11916,7 +11920,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>  #if defined(TARGET_NR_eventfd)
>      case TARGET_NR_eventfd:
>          ret = get_errno(eventfd(arg1, 0));
> -        fd_trans_register(ret, &target_eventfd_trans);
> +        if (ret >= 0) {
> +            fd_trans_register(ret, &target_eventfd_trans);
> +        }
>          break;
>  #endif
>  #if defined(TARGET_NR_eventfd2)
> @@ -11930,7 +11936,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>              host_flags |= O_CLOEXEC;
>          }
>          ret = get_errno(eventfd(arg1, host_flags));
> -        fd_trans_register(ret, &target_eventfd_trans);
> +        if (ret >= 0) {
> +            fd_trans_register(ret, &target_eventfd_trans);
> +        }
>          break;
>      }
>  #endif
> 


