Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7rIB-0003yo-2D
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 20:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuanzi@google.com>) id 1j7qCq-00076x-15
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 19:42:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuanzi@google.com>) id 1j7qCo-0008Q3-R2
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 19:42:11 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37265)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuanzi@google.com>) id 1j7qCo-0008Pi-MF
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 19:42:10 -0500
Received: by mail-oi1-x242.google.com with SMTP id q84so4692686oic.4
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 16:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bOTAZ72S4BxiMUVQGedOTo/Ps06UvEykG+uLwd9EUa4=;
 b=EseKrCfAuuZuX5rsUG+BlbcWBcYrhwAcfoXktNYiO3C0Ie+Vyvt4ve+luMJUEFRv7P
 IwcgWFMNrFTYWc+oGNYS8Jv6B2CyikEGze4JcYbrXTwK8UV+7StHMxi+q6u8E42xNV/k
 mdHZZ0mFMkNqRu3i/fPSUnhQfs+AGcjzM2Fs+DgUWofoKKyRSqf02NH4XqMgoVie7SnX
 rRx+DxG4hruS+q7jwS6gKtXpJZ89MMlG/1zGst7+y6f8A5HP+I9b33Mn+F0+bMzEhEIO
 uQlxj+vwiSHZobUvaIrZ8TNooxC6B845melXXZEg7TTAdSL/6eNQbeGI/mbFN2RrT6E8
 axIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bOTAZ72S4BxiMUVQGedOTo/Ps06UvEykG+uLwd9EUa4=;
 b=ruuijW4NJkfOG7rpCQd5TTsQGXZRs5miXq+LNsHObxdMFme8YlpXgEArJED4vLj3dD
 E7hbQUbRGP80BXe5fKPOxnDqrLPWZl3s27VvUlXpy2HkydfMmTRvj+fJH0fiERdzQ8Vs
 4DwjcN+W1g/qdtFLPHm5AV7JDwY4N1KU3YEdWgJjJ879grR5HM96ZPec/74QE56RKgNp
 ohkbkY/hwNRuFA0NI/s6ZP89GAB0frwxOz1cde/Ea2iuB1la5cwA8zfXJFQH86z9PeQX
 Rmp8nBqyW0ZkdjXVdXiv3SkSUcdRZLkLC6dUpqUFS0RgAsAAJcqJyUgONjolyoGMP73u
 8QUA==
X-Gm-Message-State: APjAAAXHK8Ct78bB8hwdUtNcq2bNwW8dPlVoQkapdKr6l7PPwNFGrVp0
 zXvB+TZPaCyXcIUZ0nxADW9dZb4QtPqTvrs5sIk32g==
X-Google-Smtp-Source: APXvYqxQRgLB/F9XVRV9HyUXo6q5moy/43yeD27t2ZqNMOJLykoXA3CiRtdOkcBw8u2r+01P0GDcpDV88WFidMK+CXU=
X-Received: by 2002:aca:4a0b:: with SMTP id x11mr338077oia.37.1582936929036;
 Fri, 28 Feb 2020 16:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20200221202857.126170-1-yuanzi@google.com>
In-Reply-To: <20200221202857.126170-1-yuanzi@google.com>
From: Lirong Yuan <yuanzi@google.com>
Date: Fri, 28 Feb 2020 16:41:58 -0800
Message-ID: <CADjx4CLVufciu=Qtte7x6+JDDWeigzQ3XoepFQFeguJtfcHfYg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add AT_EXECFN and AT_EXECFD auxval
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-Mailman-Approved-At: Fri, 28 Feb 2020 20:51:45 -0500
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
X-List-Received-Date: Sat, 29 Feb 2020 00:42:13 -0000

On Fri, Feb 21, 2020 at 12:29 PM Lirong Yuan <yuanzi@google.com> wrote:
>
> This change adds the support for AT_EXECFN and AT_EXECFD auxval.
>
> Signed-off-by: Lirong Yuan <yuanzi@google.com>
> ---
>  linux-user/elfload.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f3080a1635..7e0f3042f1 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1568,7 +1568,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>
> -#define DLINFO_ITEMS 15
> +#define DLINFO_ITEMS 17
>
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
>  {
> @@ -1888,11 +1888,14 @@ static abi_ulong loader_build_fdpic_loadmap(struct image_info *info, abi_ulong s
>      return sp;
>  }
>
> -static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
> +static abi_ulong create_elf_tables(struct linux_binprm *bprm,
>                                     struct elfhdr *exec,
>                                     struct image_info *info,
>                                     struct image_info *interp_info)
>  {
> +    abi_ulong p = bprm->p;
> +    int argc = bprm->argc;
> +    int envc = bprm->envc;
>      abi_ulong sp;
>      abi_ulong u_argc, u_argv, u_envp, u_auxv;
>      int size;
> @@ -2032,6 +2035,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
>      NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
> +    NEW_AUX_ENT(AT_EXECFN, info->file_string);
> +    NEW_AUX_ENT(AT_EXECFD, bprm->fd);
>
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> @@ -2870,8 +2875,8 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
>  #endif
>      }
>
> -    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
> -                                info, (elf_interpreter ? &interp_info : NULL));
> +    bprm->p = create_elf_tables(bprm, &elf_ex, info,
> +                                (elf_interpreter ? &interp_info : NULL));
>      info->start_stack = bprm->p;
>
>      /* If we have an interpreter, set that as the program's entry point.
> --
> 2.25.0.265.gbab2e86ba0-goog
>

Friendly ping~

Link to the page for the patch on patchwork:
http://patchwork.ozlabs.org/patch/1242331/

