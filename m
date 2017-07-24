Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZac6-0001uH-GI
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 06:29:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZac4-0001tz-8J
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 06:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZac3-00016n-B4
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 06:29:20 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZac3-00016C-1Z
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 06:29:19 -0400
Received: by mail-wm0-x22b.google.com with SMTP id t201so14653089wmt.1
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vyp9NMpKb785HIrWPxZVL2EeDFClo4I4j6yMl+56V3s=;
	b=ZGnpvKY9twRJJgU0UM9nR672unzK4tMA89Z2mMp0kdmuarOoU1g0IwCVsCa623Dkv9
	SJqofJ/DN7bClkezZblVtJRFK6AsPUqOv0QHV7bpgiDCRy79eab7ZeeJitcKuHl72QaH
	rmHPbIb4mLqJBshlW9m7v67lx9+Jr8okOIfEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vyp9NMpKb785HIrWPxZVL2EeDFClo4I4j6yMl+56V3s=;
	b=L0qJAa13wnIrZ5GcmgnSGJ2sJAQu/cZLWp9Ng4f+/p30O3jpM7/H7r0LDx0LLWzwrN
	lXxzLlRZGzZd5TBJKF+TXkboxDKtViD7VsaGEkSg/1mMjUDyPL3h5IJZDzUW3sVjKuDg
	MBO4FqZZK3hL6ztdh/a9yV5jicg22GUUHVp96SPLTaO/MwzWkmgSHC3lnh54bVR+wA6x
	0Q4kdN2Ki2J+q3BySUbkwLCr3hsNSdHBKDtUEvwym1sSVdW2Q+ulwFdX2PQbdrIRyOtA
	HCNd37aaJXcnaGxGKltRzQ11/gROGg1ezPv6ZZTUxtG+HesV439hwRvHuyB+BmGk0r5P
	2o0Q==
X-Gm-Message-State: AIVw113W+qHwLcv8oWlZyExFPKYqVB5tZYRET6qvwiO01iGxznz6nhK/
	Y0hOdULEHRnmIxdzwv9/qNXPdkGaFYU10Vs=
X-Received: by 10.28.40.215 with SMTP id o206mr4654545wmo.74.1500892158007;
	Mon, 24 Jul 2017 03:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 03:28:57 -0700 (PDT)
In-Reply-To: <1500309462-12792-1-git-send-email-peter.maydell@linaro.org>
References: <1500309462-12792-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 11:28:57 +0100
Message-ID: <CAFEAcA9yup9CQzst6m14oO+7JHZ2F0mkrsnUN5LLx++=9ctqMw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] hw/display/sm501:
 Don't use vmstate_register_ram_global()
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
X-List-Received-Date: Mon, 24 Jul 2017 10:29:21 -0000

Ping for review, please? Would be nice to get this into rc0.

thanks
-- PMM

On 17 July 2017 at 17:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> The sm501 device uses vmstate_register_ram_global() to register its
> memory region for migration.  This means it gets a name that is
> assumed to be global to the whole system, which in turn means that if
> you create two of the device we assert because of the duplication:
>
> qemu-system-ppc -device sm501 -device sm501
> RAMBlock "sm501.local" already registered, abort!
> Aborted (core dumped)
>
> Changing this to just use memory_region_init_ram()'s automatic
> registration of the memory region with a device-local name fixes
> this.  The downside is that it breaks migration compatibility, but
> luckily we only added migration support to this device in the 2.10
> release cycle so we haven't released a QEMU version with the broken
> implementation.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Recent refactoring that renamed the old "memory_region_init_ram"
> to memory_region_init_ram_nomigrate" made this bug a bit easier
> to find via grep...
>
>  hw/display/sm501.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index af792c5..9aa515b 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1578,9 +1578,8 @@ static void sm501_init(SM501State *s, DeviceState *dev,
>                    s->local_mem_size_index);
>
>      /* local memory */
> -    memory_region_init_ram_nomigrate(&s->local_mem_region, OBJECT(dev), "sm501.local",
> +    memory_region_init_ram(&s->local_mem_region, OBJECT(dev), "sm501.local",
>                             get_local_mem_size(s), &error_fatal);
> -    vmstate_register_ram_global(&s->local_mem_region);
>      memory_region_set_log(&s->local_mem_region, true, DIRTY_MEMORY_VGA);
>      s->local_mem = memory_region_get_ram_ptr(&s->local_mem_region);
>
> --P

