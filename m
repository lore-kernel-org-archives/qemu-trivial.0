Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y92JM-0000bm-5P
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jan 2015 20:54:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1Y92JF-0000Rs-LO
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 20:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1Y92JE-0000f7-Op
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 20:54:49 -0500
Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231]:44134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>)
	id 1Y92JC-0000eo-GV; Wed, 07 Jan 2015 20:54:46 -0500
Received: by mail-ig0-f177.google.com with SMTP id z20so629473igj.4;
	Wed, 07 Jan 2015 17:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lnZ2MPGy17uK+AUoAj6sR33oWpdELxOmBn2VP/3J3so=;
	b=rlyv+m2Lp8iYlP1bCFx+ryeOwWye90eRrJVaErBxMEdsb4vHvO1nMmcRjnSSXp8eo8
	FMB7qfUsv1oGAkh1lUMynWL/oraO+2E7fqiVn3ANgpH7u1+IicjJBIL0rrm1HpycL2Fe
	EqatItmxhBisLUc4paqep4lWQCfqrsZy8LsxuAQjMGvkg9SWPPfsrhxYvRkPS6dj70/w
	ao0qA/S6npF59MV/M2Ze2+sUblV4/LpX1JxLsDbLfOA+rfq4s0+13C+sd1lNneTUV7Vr
	U518DXMykSiQDIOqSu/vlebDahlnByh4MyDVk2qbmnAE9IRVU87kcbiEiVMMFQONm2uK
	uM3Q==
MIME-Version: 1.0
X-Received: by 10.42.153.132 with SMTP id m4mr6049812icw.49.1420682085372;
	Wed, 07 Jan 2015 17:54:45 -0800 (PST)
Received: by 10.107.16.161 with HTTP; Wed, 7 Jan 2015 17:54:45 -0800 (PST)
In-Reply-To: <1420563978-19101-1-git-send-email-dmorrison@invlim.com>
References: <1420563978-19101-1-git-send-email-dmorrison@invlim.com>
Date: Thu, 8 Jan 2015 09:54:45 +0800
Message-ID: <CAJBMM-s7KXkama0z4Kre3g3Qn5Bd+qCwMz9jDcBD8P3JmyH9og@mail.gmail.com>
From: Jia Liu <proljc@gmail.com>
To: David Morrison <dmorrison@invlim.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c05::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, famz@redhat.com,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] target-openrisc: bugfix for dec_sys
 to decode instructions correctly
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
X-List-Received-Date: Thu, 08 Jan 2015 01:54:55 -0000

Hi David,

On Wed, Jan 7, 2015 at 1:06 AM, David Morrison <dmorrison@invlim.com> wrote:
> Fixed the decoding of "system" instructions (starting with 0x2)
> in dec_sys() in translate.c.  In particular, the l.trap instruction
> is now correctly decoded, which enables for singlestepping and
> breakpoints to be set in GDB.
>
> Signed-off-by: David R. Morrison <dmorrison@invlim.com>
> ---
>  target-openrisc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Changes since previous version:
>   * Added 'signed-off-by' line; sorry to forget this before!
>
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 407bd97..d36278f 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
>  #ifdef OPENRISC_DISAS
>      uint32_t K16;
>  #endif
> -    op0 = extract32(insn, 16, 8);
> +    op0 = extract32(insn, 16, 10);

Thank you for pointing this.

Acked-by: Jia Liu <proljc@gmail.com>

>  #ifdef OPENRISC_DISAS
>      K16 = extract32(insn, 0, 16);
>  #endif
> --
> 2.2.1
>

Regards,
Jia

