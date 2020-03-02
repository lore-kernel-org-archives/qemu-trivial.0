Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8peG-0001pk-8f
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 13:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuanzi@google.com>) id 1j8peD-0001pK-6z
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 13:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuanzi@google.com>) id 1j8peB-0000hB-Tb
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 13:18:33 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuanzi@google.com>) id 1j8peB-0000gk-MU
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 13:18:31 -0500
Received: by mail-ot1-x342.google.com with SMTP id v22so159098otq.11
 for <qemu-trivial@nongnu.org>; Mon, 02 Mar 2020 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tNeOCg7H/re/KZyrEQ7ycADlImpt3TJgjVONz4ju3xY=;
 b=A00RwfXoQ9AyhXPGwPRVF8jSb4k5ij61i1v/5DXd5BEkDmwPIkl6dmIanHNXebtdNk
 HZsy2S/hGOZBNp0emrPr1iX6Y79KOEu/btO5ZdVH05Ofqh6l2veQ8fGL6Wq4mgg8ttKd
 anzhKU8aQnNqJseoKuFVKte5F1g5giSNlTsOVYywI+D7ADDWUSllUamPeChU0gdNyibD
 euIsuVDEtgurghKkbQSweTinelUOdKljuVzvYI9/akRm7i4tHAimUyu1H4PvLjDJORVU
 vj8tdcgK5hs4Wldg/BYnQTn0ldJ08hP92Y4ENbNRSPBTy911hZnBh0YA8bSzL+Pu4dGE
 VNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tNeOCg7H/re/KZyrEQ7ycADlImpt3TJgjVONz4ju3xY=;
 b=XNSJKoxVoTBZ8uwyKlxRRB/E31KWURyC9WBmuorVwnHqT69uy6wJNzZHlimDPgj0iD
 Az0EsAG6Zaajk5yaH1vfyowRs9uprUY4cJhwjDlKZnbndq5oKrYaOoM959SR0Q9cQAS5
 gp9Mrk1uEZ1A/E/d+Ipy8PuAxofHKvlgVlxFSi+M0oOmIG4nt1fCtVGDES2LOru6Ycu8
 gm9bXVtszDqCItn9MGSTl3SAb8vO7dvyJwy78RPOuNfroZS1yqjZ6PGfNm8Wo+55QY90
 cW+4ihyHdYKPjLs5dWxNWB8yKAirbbRL0ajF72UFxC6/KpjDzw4h0M3BfO322mnsIgsC
 ioHg==
X-Gm-Message-State: ANhLgQ1+OIfsblzuq4DurAjtEebGIkHg7AXI3C/VbWL5u3ZCbKTNx4bj
 r9+a/f7SwcnWN6KDSI7PoQl85WxaNEI0+2BTbfVX0CFhyxs=
X-Google-Smtp-Source: ADFU+vtFD8/i5YrG0B1XPjN/1j5MmSnqKyS91eUPjqC/19hHm6iUreOeQlv/JwM05CQozxlrFTyy5FsEdfbY12+bNPo=
X-Received: by 2002:a9d:7842:: with SMTP id c2mr348425otm.252.1583173110437;
 Mon, 02 Mar 2020 10:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20200221202857.126170-1-yuanzi@google.com>
 <f9ef0046-9d0f-c53d-bf58-417df31705a6@vivier.eu>
In-Reply-To: <f9ef0046-9d0f-c53d-bf58-417df31705a6@vivier.eu>
From: Lirong Yuan <yuanzi@google.com>
Date: Mon, 2 Mar 2020 10:18:19 -0800
Message-ID: <CADjx4C+YyTL9W0us5-vvGdeXyiHKcSZt2odV_p3+E4NCLTYSSg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add AT_EXECFN and AT_EXECFD auxval
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Riku Voipio <riku.voipio@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Mon, 02 Mar 2020 18:18:34 -0000

On Mon, Mar 2, 2020 at 6:39 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 21/02/2020 =C3=A0 21:28, Lirong Yuan a =C3=A9crit :
> > This change adds the support for AT_EXECFN and AT_EXECFD auxval.
>
> Why do we need AT_EXECFD?
>
> AT_EXECFD is normally only used with binfmt_misc so I don't see any use
> cases for it with QEMU.
>
> For AT_EXECFN, according to kernel commit
>
>   651910874633 execve filename: document and export via auxiliary vector
>
> It sould be like readlink("/proc/self/exe",), and thus I think we should
> use realpath() like we have in syscall.c for TARGET_NR_readlink:
>
>  8843     case TARGET_NR_readlink:
> ...
>  8854                 char real[PATH_MAX], *temp;
>  8855                 temp =3D realpath(exec_path, real);
> ...
>
> Thanks,
> Laurent
>
> >
> > Signed-off-by: Lirong Yuan <yuanzi@google.com>
> > ---
> >  linux-user/elfload.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index f3080a1635..7e0f3042f1 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -1568,7 +1568,7 @@ struct exec
> >                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE=
-1))
> >  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1)=
)
> >
> > -#define DLINFO_ITEMS 15
> > +#define DLINFO_ITEMS 17
> >
> >  static inline void memcpy_fromfs(void * to, const void * from, unsigne=
d long n)
> >  {
> > @@ -1888,11 +1888,14 @@ static abi_ulong loader_build_fdpic_loadmap(str=
uct image_info *info, abi_ulong s
> >      return sp;
> >  }
> >
> > -static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
> > +static abi_ulong create_elf_tables(struct linux_binprm *bprm,
> >                                     struct elfhdr *exec,
> >                                     struct image_info *info,
> >                                     struct image_info *interp_info)
> >  {
> > +    abi_ulong p =3D bprm->p;
> > +    int argc =3D bprm->argc;
> > +    int envc =3D bprm->envc;
> >      abi_ulong sp;
> >      abi_ulong u_argc, u_argv, u_envp, u_auxv;
> >      int size;
> > @@ -2032,6 +2035,8 @@ static abi_ulong create_elf_tables(abi_ulong p, i=
nt argc, int envc,
> >      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
> >      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> >      NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
> > +    NEW_AUX_ENT(AT_EXECFN, info->file_string);
> > +    NEW_AUX_ENT(AT_EXECFD, bprm->fd);
> >
> >  #ifdef ELF_HWCAP2
> >      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> > @@ -2870,8 +2875,8 @@ int load_elf_binary(struct linux_binprm *bprm, st=
ruct image_info *info)
> >  #endif
> >      }
> >
> > -    bprm->p =3D create_elf_tables(bprm->p, bprm->argc, bprm->envc, &el=
f_ex,
> > -                                info, (elf_interpreter ? &interp_info =
: NULL));
> > +    bprm->p =3D create_elf_tables(bprm, &elf_ex, info,
> > +                                (elf_interpreter ? &interp_info : NULL=
));
> >      info->start_stack =3D bprm->p;
> >
> >      /* If we have an interpreter, set that as the program's entry poin=
t.
> >
>

Hi Laurent,

I added support for AT_EXECFD because I thought it might be useful to
implement all types that getauxval could take as an argument.
Would you prefer that it be removed?

For AT_EXECFN, there are two questions that we considered:
1) What should it return?
Since QEMU is emulating running the guest program, the function should
return the file name of the guest program (info->file_string), rather
than the QEMU program itself, which we get from
qemu_getauxval(AT_EXECFN).

2) Should it return the full path or as is?
We tested the behavior of getauxval with a simple test program on
Linux, and it turned out that it returned file path as is. For
example,
$ ./test
getauxval(AT_EXECFN): ./test
$ /usr/local/home/tmp/test
getauxval(AT_EXECFN): /usr/local/home/tmp/test

It would seem that the current solution is working as intended.

Thanks,
Lirong

