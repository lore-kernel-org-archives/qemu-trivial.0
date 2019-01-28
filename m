Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1go7Kg-0007HE-SQ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 08:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go7Ke-0007GR-T1
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go7Kd-0000eF-O2
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:52:12 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1go7Kd-0000bz-Gw
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:52:11 -0500
Received: by mail-ot1-x341.google.com with SMTP id k98so14656220otk.3
	for <qemu-trivial@nongnu.org>; Mon, 28 Jan 2019 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=z6p53zyu1LL0Ngvj9FlXqaBzzHNHryGLrOMB5NJbzC8=;
	b=U91ftXja24w7Cc0b9IfxmvmdJSF39oUSj0FDqM1uwnHc6C9v8uErzcCtJPI6UpivcG
	SftzNKWcsx0pkM98GOIxnvBg8dhtLu2I4gP+//flEXempX41ZCcfGcrn5vTNOnO0KHwv
	We5EgVaw3AtrlNeJyymSV+0AxjLeY0pTEnQSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=z6p53zyu1LL0Ngvj9FlXqaBzzHNHryGLrOMB5NJbzC8=;
	b=VGBDZkhmykZUxRlj6yzF4h6pMz036zMHrZajfdCgRDDTgexFCq0FImDhYs6G8obOrZ
	cwpFVMZFEzM2ZhixNqRzeqloxcV1sOtH9i/25y/L1w04wclJ1WCuYuppffCOy9k55tLm
	U+hdXkJtgtM1rCRhV1hZ7UeJHFD7Q6ClO6+G6aswue8ayUxS2i4xMVx4x3KIvWTWxErR
	9KmWaij43isZS8jz96HCSovPIWc06eOB4G/hKvThKXqjVCOHv97JvaabPEvOkaEZBjkN
	WeY7rdEt5ZBMssz1GpBsb8sTSyQbqatjDSUNItqXsgE1Qt0Ep2EFjnb+pKffZDHrCUaA
	ygKw==
X-Gm-Message-State: AJcUuke96Mf3M0v7X19Okfhh0CQZNDU1rLxA1GMio4bXDkYEWKS40/1l
	1vtYQsI1DumgXK3+RARVh6AqYc2Ktu/SmotshsmWfA==
X-Google-Smtp-Source: ALg8bN6ZwSPLf+gJEKVE3sLbjLpK29CpclT1JNBktVJ7HCRfYiOCKna6WqUtQtbsvbynG/P9wmpYX3GJyVeSmNMnPAo=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr15245582oti.151.1548683530327;
	Mon, 28 Jan 2019 05:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20190122145132.12571-1-paul.durrant@citrix.com>
	<57cd3429-41a3-48c5-4d06-5d203cf70f97@redhat.com>
In-Reply-To: <57cd3429-41a3-48c5-4d06-5d203cf70f97@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 13:51:57 +0000
Message-ID: <CAFEAcA9Ne8=buW5FGr8AbuTdovrdAdFcZJG01N_zkQGrXJ85FA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Paul Durrant <paul.durrant@citrix.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/block: clean up stake
 xen_disk trace entries
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
X-List-Received-Date: Mon, 28 Jan 2019 13:52:13 -0000

On Mon, 28 Jan 2019 at 13:41, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Cc'ing QEMU Trivial.
>
> On 1/22/19 3:51 PM, Paul Durrant wrote:
> > This should have been removed then xen_disk.c was removed but I missed =
them.
>
> ... when xen_disk.c was removed (19f87870baa) ...

also s/stake/stale/ in the subject line I guess ?

thanks
-- PMM

