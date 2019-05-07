Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hO71J-0001Cc-As
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2019 16:49:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO71F-0001Bw-3b
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 16:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO71D-0004rO-8T
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 16:48:57 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hO71C-0004oN-35
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 16:48:55 -0400
Received: by mail-ot1-x330.google.com with SMTP id b1so16336470otp.5
	for <qemu-trivial@nongnu.org>; Tue, 07 May 2019 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X2bzEXwhoqBgBx5Fz8GIgVWU1fWEI1ArFuUV+AksY94=;
	b=pFgmd8nrqhVgstEBX4aTOTbV3L0WS7I+vZ475poMJ8nZwqTen7HCqlW6r17uELMgjm
	SmjelXPidvSX//HNMHVUJC1QrWt9IT2illPo5ktCi9qW6iBAYZQdhVfNgaKnnvjstcls
	oDr6g4l13cgbe+xsS4Od8hSfAcfx4Eyy/TlKPbYcE3vc5nVXmN3BzC/g14R5os6CAcuA
	ZC5py7t8DzQDb5xp0am2+tzdr3KpM6mIHAJlC2Z3u/eqDGf1Ipddo+7AqIXKJxcqUsEK
	7ZWcvEEM8/D3PZF7LBzToaf0I/OwGazLXHCN1CAlb9YdPhxYiD5LumvIua/RfCREhwhY
	KVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X2bzEXwhoqBgBx5Fz8GIgVWU1fWEI1ArFuUV+AksY94=;
	b=Q+7e3hGNZJNQvnFh3AHScwm0lVcRkcqY+NqDK3LhJiaUVR73x3iospRQvrn6dzxGTj
	u3yQ3ddBbbmPaNcXrhl959o/LmvBxYFsOKhsQ2mxPsyL28yx8hj5h9yb0CroGpWJoK9v
	8VVl0DqzKbWcR/vQCp6suQDwcuuNHOCwvq2Wo0rSJZOxlHU20ZCaxs3/P8IAAwZMzaV2
	hSYWy5EzmaAC4OU/edJvu+gp9DOSjJbD1/A4mNPJANOnb/SYwGembkPTNTHqtDPotJjX
	4938jPpr1H3EO/0jfusdyZPUn1c5DW+Lv0MooUA1jSmjx8YjLVbL1ewms8dkrYpdf/Ez
	9mew==
X-Gm-Message-State: APjAAAWup1F1/oY2Y8vh3W1E6EdzC2s/zyr+Do/RHL+Lc0JPzGJr7ajh
	vqEYdPPPCKdWNn+QHrp4qDHYXLfeBX8Myb4nc7efMQ==
X-Google-Smtp-Source: APXvYqySAYC8o+uZUDrnfIPpwl+RwiB7QsosKVTkB2x0vLOUaWFDnF0/pfL1y6jkvfIsh+gm3OJlqzTh9hJKoCuSrBs=
X-Received: by 2002:a9d:404:: with SMTP id 4mr13624743otc.352.1557262132825;
	Tue, 07 May 2019 13:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190503112654.4393-1-laurent@vivier.eu>
	<80fb3313-239a-5828-94fa-d27137bfcb05@vivier.eu>
In-Reply-To: <80fb3313-239a-5828-94fa-d27137bfcb05@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2019 21:48:40 +0100
Message-ID: <CAFEAcA_y24gpugttDTR-QrJ0fA7JCQeC0XXsR6pjm2rQ19rfCA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Fabien Chouteau <chouteau@adacore.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/12] Trivial branch
 patches
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
X-List-Received-Date: Tue, 07 May 2019 20:48:58 -0000

On Tue, 7 May 2019 at 20:10, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Ping ?

This is in my queue to process, but there are still a bunch of
other pullreqs in the queue too; I am working through them.

thanks
-- PMM

