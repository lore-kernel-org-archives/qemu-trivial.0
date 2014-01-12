Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W2QDr-0002vj-OZ
	for mharc-qemu-trivial@gnu.org; Sun, 12 Jan 2014 13:57:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QDl-0002uj-Rx
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 13:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QDh-0003ee-Hy
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 13:57:17 -0500
Received: from mail-lb0-f176.google.com ([209.85.217.176]:51837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QDh-0003eG-B1
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 13:57:13 -0500
Received: by mail-lb0-f176.google.com with SMTP id l4so4651457lbv.7
	for <qemu-trivial@nongnu.org>; Sun, 12 Jan 2014 10:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1EaH4lK8Un34AOhflCXaw0P65QrxdBSIURFBPJUmiII=;
	b=H8ZXaoKmw4s2ys/mS55saO2851kHWGutVtc9nUwrGoaWgxfPPuxhxCzelSyS+6FxhR
	5NF1AmoWPBet0TCBAS6WYGEgyboLAfHktqL+Y+89mFzaJVKww7Qt83PR3ql1qhIJV9H+
	4m/4q8psraVjfQErlcQFMh0OL/mxbdKFBssKWHgKfRPrmbW/roznIkP0Sju6jO5AkN20
	5pQ/Qd8sChZxv1gMnabFQiLV7AdoEfFjm4XxkUXo9AAbLq0hJP2hXqYlkcVzxhsGCkVM
	sEWJyriUyAyArJ82hYYcKhUao95C/kCQyj3mJr4c4zz+c3RSsL0VumAkMZuzGJwgvj9F
	dCDw==
X-Gm-Message-State: ALoCoQm7en6IJtIKLkniYrKWHj5/jl2406qySas3e9Y2HWL5lTMRDN8Mcx1/rG+xWVzuS15SC4Ou
X-Received: by 10.112.188.135 with SMTP id ga7mr8444415lbc.5.1389553031062;
	Sun, 12 Jan 2014 10:57:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Sun, 12 Jan 2014 10:56:50 -0800 (PST)
In-Reply-To: <1389432851-11420-2-git-send-email-pavel.zbitskiy@gmail.com>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
	<1389432851-11420-2-git-send-email-pavel.zbitskiy@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Jan 2014 18:56:50 +0000
Message-ID: <CAFEAcA9GkEf8gKXrzAepyqO6YLLLpD+eavGH1_EF602aDhAoZg@mail.gmail.com>
To: pavel.zbitskiy@gmail.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] linux-user: fixed s390x
	clone() argument order
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
X-List-Received-Date: Sun, 12 Jan 2014 18:57:22 -0000

On 11 January 2014 09:34,  <pavel.zbitskiy@gmail.com> wrote:
> From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
>
> It was broken by 4ce6243dc6216e35b5b691078ffa856463bfa8db,
> where TARGET_CLONE_BACKWARDS was specified instead of
> TARGET_CLONE_BACKWARDS2.
>
> Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
> ---
>  linux-user/s390x/syscall.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/s390x/syscall.h b/linux-user/s390x/syscall.h
> index ea8c304..e5ce30b 100644
> --- a/linux-user/s390x/syscall.h
> +++ b/linux-user/s390x/syscall.h
> @@ -22,4 +22,4 @@ struct target_pt_regs {
>
>  #define UNAME_MACHINE "s390x"
>
> -#define TARGET_CLONE_BACKWARDS
> +#define TARGET_CLONE_BACKWARDS2

Yep, kernel config agrees:
http://lxr.free-electrons.com/source/arch/s390/Kconfig#L99

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

