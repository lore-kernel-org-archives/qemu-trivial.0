Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8pGJ-00040p-JK
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 12:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuanzi@google.com>) id 1j8pGG-00040C-Tk
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 12:53:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuanzi@google.com>) id 1j8pGF-0005Wn-8g
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 12:53:48 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuanzi@google.com>) id 1j8pGF-0005WP-0i
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 12:53:47 -0500
Received: by mail-oi1-x242.google.com with SMTP id t24so108110oij.3
 for <qemu-trivial@nongnu.org>; Mon, 02 Mar 2020 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z0pWHW7knIsOeetOs1COzzneu5jxNQFT0A2QJ//4cdg=;
 b=gltPvu8XgI+dTQkP0RyTnze81xXtVEchX8ESuiO6fMgh2VbwoirW1dq9gjnrY2IO1k
 pkGTalxkI5vB52pdG2ifrOG1a2+Ha5bVlRmdtJt2rxohc0VhAQ/+7k9R0SsRdvoTYAPj
 JW+VWh+QhERnqmmIGW0xgqHwNdnMrqHXfkbARXiHsHAa/FxbU2Wwq1ZZcyIXacAgcG/c
 p9GkKFtqr3EALEiFdkb8q/MYk7wnY3Bf9DCYMBsEAbCsE7NCdkKLqS+4D5D/2X/dy848
 X8wcTAnBEhQPc+iCDD0HC9Ge4SalVG87V8DW9N9IrtrKPXwMUREpkMWC/UQrsUfPVl8J
 dxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z0pWHW7knIsOeetOs1COzzneu5jxNQFT0A2QJ//4cdg=;
 b=jfp3ANeRn4xVa1JIAO4znapa50SD6OF6ri5uINOpLyzHm1sH1HEaxpD+HQtLw8T50J
 d9vNJdmTMywutgP94scCrhEJeMEK5+rafTmhVLSWBbR1rRgt+GUetODhNK10kbrdEN76
 kRse2Zp1Xv8iE93Eatm5OmOoZ531MH4S3XM0NIbNYREEQUHmiGKLH76wex9OsOmlnoBf
 dM8KoEv8YXxl2YyVYpOgW5Jtdwf+tdjiTmTEb01wUZWYgcZmy+NenQ9oW9Bpj9/V1qK3
 /ngQ8d9zPd/9kq7bpi8Eh6nFuLq9movAt2gemWVhEYl/Q+AJmMgQ6U8brlgVxc9xh+ud
 2IZg==
X-Gm-Message-State: ANhLgQ2PqhyHdxNZCS13PwDvsk9Zl3wfNxrftDB8RrluWa2IDe+c8Q9u
 9vaX9Yb2mUMlVqx2TnuKmJueNzGFwz71O90dgxd7hA==
X-Google-Smtp-Source: ADFU+vtagp1nY8cL+pZIFjRPwt+kbNyGl3QFtvZ9UqAI+Uv0+5PtlOELwKqk1UnXKhYIEhMP9FPcRxm7YMaP4NqOuSk=
X-Received: by 2002:aca:100e:: with SMTP id 14mr215310oiq.88.1583171625330;
 Mon, 02 Mar 2020 09:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20200222010925.32858-1-yuanzi@google.com>
 <CADjx4CKoSuu2zWn7BRhpxLL3TaimR7fX99u_r41egctwA1LVTQ@mail.gmail.com>
 <553af2a0-2092-fe7f-ad7a-3b7ecebbe0a5@vivier.eu>
In-Reply-To: <553af2a0-2092-fe7f-ad7a-3b7ecebbe0a5@vivier.eu>
From: Lirong Yuan <yuanzi@google.com>
Date: Mon, 2 Mar 2020 09:53:34 -0800
Message-ID: <CADjx4CJSDkA3aDxhp2yZJBnKtUe4YntfpdEKp91VS0JiUhE+2Q@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add an argument QEMU_MMAP_BASE to set custom
 mmap base address in qemu user mode
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Mon, 02 Mar 2020 17:53:50 -0000

On Mon, Mar 2, 2020 at 6:56 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 29/02/2020 =C3=A0 01:43, Lirong Yuan a =C3=A9crit :
> > On Fri, Feb 21, 2020 at 5:09 PM Lirong Yuan <yuanzi@google.com> wrote:
> >>
> >> This change allows us to set custom base address for guest programs. I=
t is needed to allow qemu to work with Thread Sanitizer (TSan), which has s=
pecific boundary definitions for memory mappings on different platforms:
> >> https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/=
rtl/tsan_platform.h
>
> Could you give more details and some examples?
>
> Thanks,
> Laurent
>
> >> Signed-off-by: Lirong Yuan <yuanzi@google.com>
> >> ---
> >>  linux-user/main.c | 12 ++++++++++++
> >>  linux-user/mmap.c |  3 ++-
> >>  linux-user/qemu.h |  5 +++++
> >>  3 files changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/linux-user/main.c b/linux-user/main.c
> >> index fba833aac9..c01af6bfee 100644
> >> --- a/linux-user/main.c
> >> +++ b/linux-user/main.c
> >> @@ -336,6 +336,16 @@ static void handle_arg_guest_base(const char *arg=
)
> >>      have_guest_base =3D 1;
> >>  }
> >>
> >> +static void handle_arg_mmap_base(const char *arg)
> >> +{
> >> +    int err =3D qemu_strtoul(arg, NULL, 0, &mmap_base);
> >> +    if (err) {
> >> +        fprintf(stderr, "Invalid mmap_base: %s, err: %d\n", arg, err)=
;
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +    mmap_next_start =3D mmap_base;
> >> +}
> >> +
> >>  static void handle_arg_reserved_va(const char *arg)
> >>  {
> >>      char *p;
> >> @@ -440,6 +450,8 @@ static const struct qemu_argument arg_table[] =3D =
{
> >>       "uname",      "set qemu uname release string to 'uname'"},
> >>      {"B",          "QEMU_GUEST_BASE",  true,  handle_arg_guest_base,
> >>       "address",    "set guest_base address to 'address'"},
> >> +    {"mmap_base",  "QEMU_MMAP_BASE",   true,  handle_arg_mmap_base,
> >> +     "",           "begin allocating guest pages at this host address=
"},
> >>      {"R",          "QEMU_RESERVED_VA", true,  handle_arg_reserved_va,
> >>       "size",       "reserve 'size' bytes for guest virtual address sp=
ace"},
> >>      {"d",          "QEMU_LOG",         true,  handle_arg_log,
> >> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> >> index 8685f02e7e..3f35543acf 100644
> >> --- a/linux-user/mmap.c
> >> +++ b/linux-user/mmap.c
> >> @@ -189,6 +189,7 @@ static int mmap_frag(abi_ulong real_start,
> >>  # define TASK_UNMAPPED_BASE  0x40000000
> >>  #endif
> >>  abi_ulong mmap_next_start =3D TASK_UNMAPPED_BASE;
> >> +abi_ulong mmap_base =3D TASK_UNMAPPED_BASE;
> >>
> >>  unsigned long last_brk;
> >>
> >> @@ -299,7 +300,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong=
 size, abi_ulong align)
> >>
> >>              if ((addr & (align - 1)) =3D=3D 0) {
> >>                  /* Success.  */
> >> -                if (start =3D=3D mmap_next_start && addr >=3D TASK_UN=
MAPPED_BASE) {
> >> +                if (start =3D=3D mmap_next_start && addr >=3D mmap_ba=
se) {
> >>                      mmap_next_start =3D addr + size;
> >>                  }
> >>                  return addr;
> >> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> >> index 560a68090e..83c00cfea2 100644
> >> --- a/linux-user/qemu.h
> >> +++ b/linux-user/qemu.h
> >> @@ -161,6 +161,11 @@ void task_settid(TaskState *);
> >>  void stop_all_tasks(void);
> >>  extern const char *qemu_uname_release;
> >>  extern unsigned long mmap_min_addr;
> >> +/*
> >> + * mmap_base is minimum address to use when allocating guest pages. A=
ll guest
> >> + * pages will be allocated at this (guest) address or higher addresse=
s.
> >> + */
> >> +extern abi_ulong mmap_base;
> >>
> >>  /* ??? See if we can avoid exposing so much of the loader internals. =
 */
> >>
> >> --
> >> 2.25.0.265.gbab2e86ba0-goog
> >>
> >
> > Friendly ping~
> >
> > Link to the page for the patch on patchwork:
> > http://patchwork.ozlabs.org/patch/1242370/
> >
>

Hi Laurent,

Sure! We tried to run a program with TSAN enabled
(https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual)
in qemu, and got this error message:
"FATAL: ThreadSanitizer: unexpected memory mapping
0x004000000000-0x004000253000"

The root cause is that the default guest base address that qemu uses
is 0x4000000000 (1ul<<38), and does not align with TSAN's expectation:
https://github.com/qemu/qemu/blob/c81acb643a61db199b9198add7972d8a8496b27c/=
linux-user/mmap.c#L187
https://github.com/llvm/llvm-project/blob/e7de00cf974a4e30d4900518ae8473a11=
7efbd6c/compiler-rt/lib/tsan/rtl/tsan_platform.h#L150

By setting QEMU_GUEST_BASE, we can place the guest program at a
different base address in the host program. However, the h2g function
(in |open_self_maps| in syscall.c) translates the address back to be
based at 0x4000000000. E.g. the base address
0x4000000000+QEMU_GUEST_BASE will be converted to 0x4000000000 with
function h2g:
https://github.com/qemu/qemu/blob/c81acb643a61db199b9198add7972d8a8496b27c/=
linux-user/syscall.c#L7076

One solution then, is to update |open_self_maps| in syscall.c to not
use h2g. However this changes the meaning of QEMU_GUEST_BASE and could
break existing programs that set non-zero QEMU_GUEST_BASE.

So, how did qemu pick the base address 0x4000000000 then? Looking at
the blame output in github, one recent change for the base address was
committed 10 years ago:
https://github.com/qemu/qemu/c|open_self_maps| in
syscall.commit/14f24e1465edc44b9b4d89fbbea66e06088154e1

Another one was committed 12 years ago:
https://github.com/qemu/qemu/commit/a03e2d421e7f33316750d6b7396d1a7e14b18d5=
3

The description of the first change is "place the default mapping base
for 64-bit guests (on 64-bit hosts) outside the low 4G". It would seem
that minimum requirements for the base address are:
1) addr >=3D 4G (for 64-bit)
2) addr < lowest address used by the host qemu program by some margin

Given that
1) only TSAN explicitly check for the validity of addresses
2) 0x4000000000 is not a valid address for programs on aarch64
(according to TSAN)
3) different architectures have different valid addresses,
it would seem that adding an argument for changing the hard-coded base
address is a viable solution.

Thanks!

