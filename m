Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH9GI-0002H0-7G
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 07:01:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9GG-0002Gl-9n
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:01:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9GF-0007Ld-Ek
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:01:48 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9GF-0007LX-9q
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:01:47 -0500
Received: by mail-vk0-x22a.google.com with SMTP id n1so18191845vkb.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Jan 2016 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kO4yfFwSdcN364TzLxsyKpwqcQDI0G5dmt3eukmBZcM=;
	b=gXJJmFvU2WyLzWSSI38gwWCXXRJ9PeIkERAd8qN9fMD9Cge5LmrTDk3mO+w04uAeOw
	9NnFtgMblUU4vFec0Y3E3uU1VT4tZjKeKmWt5zzz14/r9bkaPju4uQi6r7LkJyNZtf0Z
	y9Mj8c94YD65M3bGiYNh6Cz7gWG1oPFSU+j1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kO4yfFwSdcN364TzLxsyKpwqcQDI0G5dmt3eukmBZcM=;
	b=e+lc08CQx5oyt4euz0iqX+9TDv3SPGkGbTtsu/FASqcKBGVS6SBZVeinXh7QJ13A3w
	KeFjzR0cKRdO5xRMkv93AoMPY2BA7KTwh20FY8lkUeZpNd1iKCVf0ApvwIzvSKEykxim
	50+YQAptqwMB3bncouQ41kInFIzMaOBH9TtDr12F2QxHOd1lBgga3NKnE5DMdH7ewmqi
	iD8ieXO7up1t3EAWon1qnQf1tbP+33RqyuDbMW8bs50cfnRawmD/wfJRLIiVM/Nv/1Tv
	keKtQG9x7cYIAUv2k5T38wXqh4UIwPzAaJq+hMV5J7rwQKth5++KijpTd7xxYd6KVZ19
	khDQ==
X-Gm-Message-State: ALoCoQncEc1re8Sv1DcG7I1+eo1cIZgXyKGdsUJWZvjIgIFz1vlU/ATuFyFryOJTiy3oCP7aicKsg4mhqZ4dbVhCYGNdMCqBPCOtoNWDHDGc+eKazXq++v0=
X-Received: by 10.31.52.147 with SMTP id b141mr66415286vka.82.1452168106827;
	Thu, 07 Jan 2016 04:01:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 04:01:27 -0800 (PST)
In-Reply-To: <1450996286-23127-1-git-send-email-jm.ouwerkerk@gmail.com>
References: <1450996286-23127-1-git-send-email-jm.ouwerkerk@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 12:01:27 +0000
Message-ID: <CAFEAcA9MmgVMBPFb70onV3cJytdzP_XukSdK0_wfzcfAJUNWjQ@mail.gmail.com>
To: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add missing syscall nrs.
 This updates the QEMU syscall tables to more recent Linux kernels.
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
X-List-Received-Date: Thu, 07 Jan 2016 12:01:49 -0000

On 24 December 2015 at 22:31, Johan Ouwerkerk <jm.ouwerkerk@gmail.com> wrote:
> This change covers arm, aarch64, mips. Others to follow?
>
> The change was prompted by QEMU warning about a syscall 384 (get_random()) with Debian armhf binaries (ARMv7).

It would be nice if whoever applies this patch could fix
the overlong lines in the commit message.

> Signed-off-by: Johan Ouwerkerk <jm.ouwerkerk@gmail.com>
> ---
>  linux-user/aarch64/syscall_nr.h | 13 +++++++++++++
>  linux-user/arm/syscall_nr.h     | 12 ++++++++++++
>  linux-user/mips/syscall_nr.h    | 12 ++++++++++++
>  3 files changed, 37 insertions(+)

No 64-bit mips to go with the 32-bit change?

Anyway, for the changes in this patch:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

