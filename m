Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xcd6n-0002Pl-VC
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 12:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xcd6i-0002Hj-Cr
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 12:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xcd6b-0000XR-QR
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 12:31:56 -0400
Received: from mail-lb0-f179.google.com ([209.85.217.179]:43964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xcd6b-0000XB-KK
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 12:31:49 -0400
Received: by mail-lb0-f179.google.com with SMTP id l4so3426812lbv.10
	for <qemu-trivial@nongnu.org>; Fri, 10 Oct 2014 09:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ascAMSWTOziSsJ2agjlOQkqWv9/4ap/Bh1lxmxmsU/Y=;
	b=FfKHgrGSI2UBS1gOC549P9MRqEhlya9tHQuin9xUxFhVu20by2IL8LZMHufN+MIFBU
	RgJ94CzT4DsWEnkGTV48Q25/ZYUwgf/nLTealANZI/4f1qHKLvpiDqeeglTqI30zr5cj
	2h0ka7YW3GlbJjXV+yjWYuRGaheoeZ33Qd/yQcomedr2zgOzmQN4zorve7W+p2pjKB3s
	zOAxgQJ30N1+riHyVDBpXdwLD9798bT1qEv94a7RgERfeMHoZFHRPchItul7glmczS5Q
	a5n422agOnh0asavclfb+PZ3Z0BLp33Hvv9Z99/owRlgOYreAT1rs2OML4PC2SUQ4QjP
	afUw==
X-Gm-Message-State: ALoCoQnp564Duar2aZdcaW9RQZS3EXzTskOWncgb2nGUjp4eDfTswv5YP8hhtjckcTDNyCQTW+BS
X-Received: by 10.152.28.74 with SMTP id z10mr6293052lag.10.1412958300229;
	Fri, 10 Oct 2014 09:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 10 Oct 2014 09:24:40 -0700 (PDT)
In-Reply-To: <CAMo8Bf+80_-=GVZbhy4URKLYThmc+h_ooVbTfvSjTL+dGwDvgg@mail.gmail.com>
References: <1410723393-17812-1-git-send-email-peter.maydell@linaro.org>
	<CAMo8Bf+80_-=GVZbhy4URKLYThmc+h_ooVbTfvSjTL+dGwDvgg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2014 17:24:40 +0100
Message-ID: <CAFEAcA8=Ku5NwK8jqeHpB1ygHEh4JW_RgVpBnLUBSe30KFFRRA@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] target-xtensa: mark XtensaConfig structs
	as unused
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
X-List-Received-Date: Fri, 10 Oct 2014 16:32:00 -0000

On 14 September 2014 21:29, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sun, Sep 14, 2014 at 12:36 PM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> The XtensaConfig structs will be defined but not used if they are
>> for the opposite endianness from that of the binary being built;
>> keep the compiler from complaining about this by marking them
>> with the 'unused' attribute.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This works, although it's a tad ugly. If anybody wants to suggest
>> something better...
>
> Fine for me.
>
>>  target-xtensa/core-dc232b.c | 2 +-
>>  target-xtensa/core-dc233c.c | 2 +-
>>  target-xtensa/core-fsf.c    | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks. I guess we could put this one in through
-trivial ?

Patchwork url:
http://patchwork.ozlabs.org/patch/389115/

-- PMM

