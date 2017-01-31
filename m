Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYblo-00024u-15
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 11:59:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYbll-00022Z-Ia
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 11:59:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYblk-0005uP-RQ
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 11:59:01 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cYblk-0005uI-MU
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 11:59:00 -0500
Received: by mail-vk0-x230.google.com with SMTP id k127so240817781vke.0
	for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2017 08:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NKNmeIMfIRcTOT6gfkKfHPxVek6fzWPB2A6Bj0kwqqo=;
	b=cFXehd36fEGjLs1/9EAXbf+iU365rVGkd3tcNJKaS+DxAzGEV7WiN3JXfCBEZiALa7
	3UIa5+LkPh6YG+az8MNDPG0q///L076M128BXec84j+131FXBENBKY36GoDxUTmlUFnM
	yqxfRFwBUnUVlcBdx1GoaahzU8oT0zWx7W+84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NKNmeIMfIRcTOT6gfkKfHPxVek6fzWPB2A6Bj0kwqqo=;
	b=RGRZFzCUpd0l2KRl7LJgLIItUvCwVavIuJb/Qzqd7VI81cRQ7/2wZXQ4i4oUvvZMXh
	+EFsPpgP68mLDzzYJ+1drwqaphe3N5kDE+aAyO6OkWLdYaAP9AtgBOjwCMGRfP9g8yV3
	emJ33DVj+JZQ5IWShU4uRPf4wIYF6g+y7jrXmnX3FZey73pSEcxUoOpeLhC253LNNEfq
	paPpP0oZujFS/9XYNG77xjmlLeenrw2OtxzfDp0k+jN8WshqOLAUMW4AYSwR26OdC/c9
	yyG5NTggz2xgRQhEow5NVfMbQYjpsrw91uHB2VXUwiwnz+vjGvzey9XeemplPeLyaddf
	C2kA==
X-Gm-Message-State: AIkVDXJK2GvgRk5MCPi+86dwkDuhXnv8xuPiNmhUIZmWaa/hMM5EWUS4o7LTikZGasR051KHIX1VYcJO6DwsBixG
X-Received: by 10.31.102.134 with SMTP id a128mr13157415vkc.165.1485881939987; 
	Tue, 31 Jan 2017 08:58:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Tue, 31 Jan 2017 08:58:39 -0800 (PST)
In-Reply-To: <20170131165557.GE20303@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<20170131165557.GE20303@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jan 2017 16:58:39 +0000
Message-ID: <CAFEAcA9Jbv398L=yjPmq7MfV+bpma4TiBX9LbBBHZ_qo5DvuGg@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 16:59:02 -0000

On 31 January 2017 at 16:55, Daniel P. Berrange <berrange@redhat.com> wrote:
> On Tue, Jan 31, 2017 at 04:14:47PM +0000, Peter Maydell wrote:
>> We already require gcc 4.1 or newer (for the atomic
>> support), so the fallback codepaths for older gcc
>> versions than that are now dead code and we can
>> just delete them.
>
> Do we have any explicit check alreadu for 4.1, or do we
> just let the build fail on the atomic code ?
>
> IOW, is there any use in having..
>
> #if !QEMU_GNUC_PREREQ(4, 1)
> # error "QEMU requires GCC >= 4.1 or CLang"
> #endif

I guess we just barf in the atomics. An explicit check might
not be a bad idea I guess, though it depends a bit on how
many releases we've been implicitly requiring 4.1 for. I
suppose it would act as documentation of our current
minimum req.

thanks
-- PMM

