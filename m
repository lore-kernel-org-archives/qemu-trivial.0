Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8duU-0000w2-Sn
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 17:10:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8duS-0000rB-J3
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 17:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8duQ-0005au-Tg
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 17:10:16 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:62242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8duQ-0005aO-P6
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 17:10:14 -0400
Received: by iebc10 with SMTP id c10so3733213ieb.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Sep 2012 14:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=eW1eAnDsCM3IeAASHZM6/4GjS1UN8pE/f/YKcdtKVbM=;
	b=oxJ/U06kaeJKT6/7diyCeZ9G3xfsyyirw3mCDI5wRXrjczh08RDFhG1lWHCvM/gzO/
	PbtMhaGHwpGPj6UZu5fm3uaJmljHpSSx5UgAnN5OKrdtNL0cmepbskbf1CoC6TKnq1sc
	AtcG7umlQ26gT5ipeSFZKfNOHNDUEh7MDM3xK+sjvGHEWw0mSUdugwzvE4Vhm81Mxuy/
	WS0deFPCw624TQSTf5d9vVcTJ4tp5NeJC7ctoBZHfFiH9nWLLMIrss5KxHaRceO226jA
	lt8Y61kfdJ68Y+ew9ZqINScDVL84M11LKMmwBYVK9SJ2zav2aeIfz3jfmZ5IHk8Uhj45
	sVtA==
MIME-Version: 1.0
Received: by 10.50.188.134 with SMTP id ga6mr11987324igc.51.1346706614242;
	Mon, 03 Sep 2012 14:10:14 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Mon, 3 Sep 2012 14:10:14 -0700 (PDT)
In-Reply-To: <1346704840-9522-1-git-send-email-sw@weilnetz.de>
References: <1346704840-9522-1-git-send-email-sw@weilnetz.de>
Date: Mon, 3 Sep 2012 22:10:14 +0100
Message-ID: <CAFEAcA_kV5vGp0K1O9=JjDwAw7dvxxdV+9359Mce=0201NQ6Bg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl1J4H+ZBQmKStL/MTrydJp2rkoPL0RduLzOG/u8gjM6BQOQck4RxVfMYJcJKTCiNBOlwyP
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] kvm: Fix warning from
	static code analysis
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
X-List-Received-Date: Mon, 03 Sep 2012 21:10:17 -0000

On 3 September 2012 21:40, Stefan Weil <sw@weilnetz.de> wrote:
> Report from smatch:
>
> kvm-all.c:1373 kvm_init(135) warn:
>  variable dereferenced before check 's' (see line 1360)
>
> 's' cannot by NULL (it was alloced using g_malloc0), so there is no need
> to check it here.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

