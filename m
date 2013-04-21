Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UTtfw-0006xT-81
	for mharc-qemu-trivial@gnu.org; Sun, 21 Apr 2013 08:47:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UTtft-0006uj-68
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UTtfq-0004ao-12
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 08:47:21 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:43563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UTtfp-0004Yi-Pn
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 08:47:17 -0400
Received: by mail-lb0-f176.google.com with SMTP id y8so4859904lbh.21
	for <qemu-trivial@nongnu.org>; Sun, 21 Apr 2013 05:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Rje3aIgALsuMx0uqpteIs2bZmgTHzlACcHLHqFS2Kbc=;
	b=iPzeK7TT1tVKwIWdwz4piHcHOy/IRu+MfjCTrvW6yDxMY64g3CE8Z7rF9eY+zYerrd
	OfmPzvmZeQRYKM+ZcAsY8fJKZMBvbTbV6plvrT/khGpz8oXntlg098iMTAv2xWb934+T
	PJO83HCxQzVBo+qD+MMLEf1xnvuFqjuR0W+56iVaCR6OUETVaqM5oQfWojZlva4OBvuF
	cyuFyFnr6x5Kd4OiIBYF4fVVBFR8hkx01MNkOVHHeLRLvyPPurrK7usSb4PYJs2GLJwC
	pp0IjQYnBwcPrbtS9X/UnxLrK+XxwDPMATxzl6g53spP6GJOSR2BR0xRnWo3JkOXDBYu
	qE5w==
X-Received: by 10.152.88.2 with SMTP id bc2mr6436688lab.1.1366548436358; Sun,
	21 Apr 2013 05:47:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Sun, 21 Apr 2013 05:46:56 -0700 (PDT)
In-Reply-To: <1366547403-16480-1-git-send-email-peter.maydell@linaro.org>
References: <1366547403-16480-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Apr 2013 13:46:56 +0100
Message-ID: <CAFEAcA_41o-LUSAeSDAn0-s0dn-Svn2cZ511BVyTme_A-46-_A@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQlBP64hkOcy7PrKzmqdirls8SawLgtgy7O+p4BWJjoZzTalrenkSIMNL9dSNJLtV7E+xztS
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.176
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Riku Voipio <riku.voipio@iki.fi>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix compile
 error due to stray colon at end of #ifdef line
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
X-List-Received-Date: Sun, 21 Apr 2013 12:47:22 -0000

oops, typo'd qemu-trivial address...

-- PMM

On 21 April 2013 13:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> Remove a stray colon from the end of a #ifdef line. Some versions
> of gcc complain about this:
>  linux-user/syscall.c: In function =E2=80=98do_syscall=E2=80=99:
>  linux-user/syscall.c:7606:28: error: extra tokens at end of #ifdef direc=
tive [-Werror]
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Obviously this is 1.5 material; don't care whether it goes through
> linux-user or qemu-trivial or direct commit.
>
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c705960..30e93bc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7603,7 +7603,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_lon=
g arg1,
>  #endif
>  #else
>      case TARGET_NR_sendfile:
> -#ifdef TARGET_NR_sendfile64:
> +#ifdef TARGET_NR_sendfile64
>      case TARGET_NR_sendfile64:
>  #endif
>          goto unimplemented;
> --
> 1.7.11.4
>
>

