Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fyowS-0004C3-6F
	for mharc-qemu-trivial@gnu.org; Sat, 08 Sep 2018 21:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyowQ-0004B7-7I
	for qemu-trivial@nongnu.org; Sat, 08 Sep 2018 21:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyok2-0002CQ-R1
	for qemu-trivial@nongnu.org; Sat, 08 Sep 2018 21:42:23 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:34566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyojz-00029x-EE; Sat, 08 Sep 2018 21:42:19 -0400
Received: by mail-yw1-f66.google.com with SMTP id y134-v6so6705499ywg.1;
	Sat, 08 Sep 2018 18:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o0yUI9Cw7LS3CCiK+ogPJQ5gMw6qz+ozGGRNltJVzHc=;
	b=Bg7qkIWEZgb/OsgZLGPW2UOalygSR9OA8aLn6O83+zcU/SFE4bkG9yPcBEbAEVsT7N
	kzuQRb8OVq4/2PuDyRjA7HQ0Boe8r8jh9Yd/0B7pG0ZHVdVlBeG6vtSZCmCdUkUkDl1c
	agjt78IJj13RTHQLZvnW9iLonDHrlNxb9i+NnexVf4Ahy3BHS59md644ZC8BW7c4uELH
	CF+imNqPgVSIyqvUfoyacbt5jEavNuc8o/El6J56Goy/xYPW/yH6PTu3tCf83AsPzX1/
	YqfmcN/NvCi4BBeZ99WURFfYoFxb8wgxBsdTfWosaOFdnJd10LGOUDm5hdln1+jDU0tg
	js9A==
X-Gm-Message-State: APzg51BIDJnNjDX1STJWvlY/LYUhRQ5zsd6vQG/7LcV2HABAwKMF+q2q
	PKF1iapwmdyCBavGe0IfWmTcy5dUXCUBE3I9LEs=
X-Google-Smtp-Source: ANB0VdYLLAGquiaLYqD32wqIsE0YsdP7q1CQ6DJjEzX0Dt4n0U7cAm++fm6E/PlIweu7WftaAXtOGXUj5yyUB1pdWqI=
X-Received: by 2002:a81:5bc6:: with SMTP id
	p189-v6mr7206602ywb.370.1536457338566; 
	Sat, 08 Sep 2018 18:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
In-Reply-To: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 8 Sep 2018 22:42:07 -0300
Message-ID: <CAAdtpL5h3tciBS_uyDzWXdZ1vynt4TxfwpjT_=dq62Hs=XCZ8A@mail.gmail.com>
To: tony.garnock-jones@glasgow.ac.uk, Laurent Vivier <laurent@vivier.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: write(fd, NULL,
 0) parity with linux's treatment of same
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
X-List-Received-Date: Sun, 09 Sep 2018 01:55:11 -0000

On Sat, Sep 8, 2018 at 6:04 PM Tony Garnock-Jones
<tony.garnock-jones@glasgow.ac.uk> wrote:
>
> Bring linux-user write(2) handling into line with linux for the case
> of a 0-byte write with a NULL buffer. Based on a patch originally
> written by Zhuowei Zhang.
>
> Addresses https://bugs.launchpad.net/qemu/+bug/1716292.
>
> From Zhuowei Zhang's patch (https://lists.gnu.org/archive/html/qemu-devel=
/2017-09/msg08073.html):
>
>     Linux returns success for the special case of calling write with a
>     zero-length NULL buffer: compiling and running
>
>     int main() {
>        ssize_t ret =3D write(STDOUT_FILENO, NULL, 0);
>        fprintf(stderr, "write returned %ld\n", ret);
>        return 0;
>     }
>
>     gives "write returned 0" when run directly, but "write returned
>     -1" in QEMU.
>
>     This commit checks for this situation and returns success if
>     found.
>
> Subsequent discussion raised the following questions (and my answers):
>
>  - Q. Should TARGET_NR_read pass through to safe_read in this
>       situation too?
>    A. I'm wary of changing unrelated code to the specific problem I'm
>       addressing. TARGET_NR_read is already consistent with Linux for
>       this case.
>
>  - Q. Do pread64/pwrite64 need to be changed similarly?
>    A. Experiment suggests not: both linux and linux-user yield -1 for
>       NULL 0-length reads/writes.
>
> Signed-off-by: Tony Garnock-Jones <tonygarnockjones@gmail.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 850b72a0c7..8f46540534 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8168,6 +8168,9 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>          }
>          return ret;
>      case TARGET_NR_write:
> +        if (arg2 =3D=3D 0 && arg3 =3D=3D 0) {
> +            return get_errno(safe_write(arg1, 0, 0));
> +        }
>          if (!(p =3D lock_user(VERIFY_READ, arg2, arg3, 1)))
>              return -TARGET_EFAULT;
>          if (fd_trans_target_to_host_data(arg1)) {
> --
> 2.18.0
>
>
> [University of Glasgow: The Times Scottish University of the Year 2018]
>

