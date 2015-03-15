Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YX6Ww-0002wA-39
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 07:16:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YX6Wr-0002r0-4e
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 07:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YX6Wk-0006wl-P8
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 07:16:21 -0400
Received: from mail-ie0-f181.google.com ([209.85.223.181]:34979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YX6Wk-0006w4-Le
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 07:16:14 -0400
Received: by ieclw3 with SMTP id lw3so150977421iec.2
	for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2015 04:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=thE0mozhc2pKLVruy5imfSykVDK2qTPJBBOBxNdX6KE=;
	b=R3rG/x9v4vszuYy4vQS/cy3lpfrPQNf8U43QN2mroKjX1JAPYVZBstTIo8aQJGEcWD
	PTGiy2EsgdJzz2GyIeUrONlHzGMTY5vHnQxrruHRR96itekyFAjFHq4PDLWW2XEJhofo
	+n9YH/3hcxU/FL/h4QIPBE0sqQP6gPPmQ8e+Ie+16KgoiaoJsZrrrfSaXbuEUH9PiXYH
	jVgp8Owv8aD4UCm7ixMxW4PK0vA5f4J/kE9hgQTa4gZ3h3By4mI3DB2HpLZxF5uUbOa3
	YEkkiDIpiunGWhM+Fba8oufsMyP76Uwaza1NNsLZDF5OW62RtI996BRrWsyshis/TUZH
	Yv5A==
X-Gm-Message-State: ALoCoQlD/O5s7pSyVKEJ51KS5rYTVd1Dz2lGXWyRIpTVj/OJvDwkjd4W/x4uC1pHWBM8sOqjLay6
X-Received: by 10.107.9.88 with SMTP id j85mr87185668ioi.60.1426418174125;
	Sun, 15 Mar 2015 04:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.170 with HTTP; Sun, 15 Mar 2015 04:15:53 -0700 (PDT)
In-Reply-To: <1426345935-7721-1-git-send-email-sw@weilnetz.de>
References: <1426345935-7721-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Mar 2015 11:15:53 +0000
Message-ID: <CAFEAcA8GaCcB0ga4EhLL9ePYV3xrixjgjr7CiRBQuR5NEJjgRA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Add missing
 check for return value of lock_user
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
X-List-Received-Date: Sun, 15 Mar 2015 11:16:22 -0000

On 14 March 2015 at 15:12, Stefan Weil <sw@weilnetz.de> wrote:
> This fixes a warning from Coverity:
> "Dereference null return value (NULL_RETURNS)"
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  linux-user/flatload.c |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index 566a7a8..56ac790 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -97,11 +97,13 @@ static int target_pread(int fd, abi_ulong ptr, abi_ulong len,
>                          abi_ulong offset)
>  {
>      void *buf;
> -    int ret;
> +    int ret = -TARGET_EFAULT;

The return value for this function should be a host errno,
not a target errno, I think. (If you track back upwards
then eventually main.c calls loader_exec() and treats the
return value as a host errno.) This seems like the right
thing given that these loader functions are all pre-run
setup, and are not involved in emulation of guest syscalls.

>
>      buf = lock_user(VERIFY_WRITE, ptr, len, 0);
> -    ret = pread(fd, buf, len, offset);
> -    unlock_user(buf, ptr, len);
> +    if (buf) {
> +        ret = pread(fd, buf, len, offset);

A different bug, but if ret here indicates that pread()
failed we should be returning -errno.

> +        unlock_user(buf, ptr, len);
> +    }
>      return ret;
>  }

-- PMM

