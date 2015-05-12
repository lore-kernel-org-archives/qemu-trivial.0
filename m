Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys4AO-00011I-3n
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 02:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4AL-00010v-RN
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 02:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4AI-00019X-Kp
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 02:59:45 -0400
Received: from mail-ig0-f170.google.com ([209.85.213.170]:36570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4AI-00019L-GX
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 02:59:42 -0400
Received: by igbpi8 with SMTP id pi8so94149528igb.1
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 23:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JPSiUErwTJzAZ38BUkMq16xRl1VZ4sm7PCfl/S9Ffio=;
	b=ddO4/e9xmu8njR4UoMpIDfgWYnqWwF7ryY8iaKOjWKP1vhh1kxcJ4ibDQ2PEzYzboO
	fB+ky9cM54EuQIQ2h8VxKgA5V8M8nOuhiBqwFJk/wIMkQLyinvQtyY6mrFZF5lKlkf4s
	6mmtEqivR/vg6ZuOuTgKZgvJI2gwkpabV0UyJRABC3MnvZCJLaDB20DpH2iNJhERLOCc
	opdiHnQHe5j1+ebxjr3LoLmjny2gWMU0L6xXmyOBKBgyRoyrGERIou8QFd0YsPeNvIDP
	EwSMx3p8VfDLwGkCA08Hi2s0Np9LQZCEDKsxCONH++ei5/sEIzKXivhF1abyc2J9oX/n
	mhyQ==
X-Gm-Message-State: ALoCoQnt++5X3/KhajeO0b6A42dvslfXGJMn22j3Hy+zaONCj4dfqtVm2e2zJk6q9AMhcbr5wtqR
X-Received: by 10.50.109.138 with SMTP id hs10mr1826190igb.48.1431413981784;
	Mon, 11 May 2015 23:59:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Mon, 11 May 2015 23:59:21 -0700 (PDT)
In-Reply-To: <1431397521-2316-7-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-7-git-send-email-shannon.zhao@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2015 07:59:21 +0100
Message-ID: <CAFEAcA9+Gd+-WOHJjMrA7f7pcW7usccRSuL2i8E3Uc=tp1Eifw@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.170
Cc: hangaohuai@huawei.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 6/6] Add comma after
	DEFINE_PROP_END_OF_LIST()
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
X-List-Received-Date: Tue, 12 May 2015 06:59:46 -0000

On 12 May 2015 at 03:25,  <shannon.zhao@linaro.org> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index 433463e..d2b3f37 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -31,7 +31,7 @@
>
>  static Property hda_props[] = {
>      DEFINE_PROP_UINT32("cad", HDACodecDevice, cad, -1),
> -    DEFINE_PROP_END_OF_LIST()
> +    DEFINE_PROP_END_OF_LIST(),
>  };

Why do we need to do this? The usual reason for having a comma
after the last item in an array is so that if we add another
item after it later we don't have to edit the line that used to
be last. But with these lists the DEFINE_PROP_END_OF_LIST()
line remains last by definition -- new entries will always go
above it, and anything below it would be a bug. So there's no
point in having a comma after it.

-- PMM

