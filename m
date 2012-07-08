Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SnyY0-0000gb-5u
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jul 2012 16:57:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SnyXx-0000ek-Ca
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2012 16:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SnyXt-00074J-Pv
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2012 16:57:36 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:63104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SnyXt-000741-J5
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2012 16:57:33 -0400
Received: by bkcji1 with SMTP id ji1so1834094bkc.4
	for <qemu-trivial@nongnu.org>; Sun, 08 Jul 2012 13:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=zNyaveTLLJob21n1maV9eQ9TqQupLq+hAsW66+flics=;
	b=G5Sfn91KmwvhOxTwJWXW7+b8Ijffab3VaEl2hPo/OZF1YT8/ABBkfCrH+DA+cSwsAw
	YFsq0NHty4IKOIWDPL1ic2US/doTMFS6OEqqD0MMQiLTuOEBSeIxC6WcHd9hYQG2N8RA
	q3JtPKI9ZR4Y6poX4ohTveGUqswraVT7frYZongUMMdz2wEmjQegX1y/ld+Rzl5g/mSg
	7KgR5c58jQSkP1wQPAZ7F/e9Mc/Yg/16lPIqZQgFNKUp+PuW1t9CUXvyxv8K6hn7jwqH
	rz3AKU3Lp6Qm67HFyBExE1IFIhll3TY/5NSKKKJpxNCtQtKN49gdJtsmTC/GgwXraUj+
	vPRQ==
MIME-Version: 1.0
Received: by 10.204.157.143 with SMTP id b15mr5779302bkx.75.1341781050747;
	Sun, 08 Jul 2012 13:57:30 -0700 (PDT)
Received: by 10.205.83.10 with HTTP; Sun, 8 Jul 2012 13:57:30 -0700 (PDT)
In-Reply-To: <1341779481-24690-1-git-send-email-sw@weilnetz.de>
References: <1341779481-24690-1-git-send-email-sw@weilnetz.de>
Date: Sun, 8 Jul 2012 21:57:30 +0100
Message-ID: <CAFEAcA_V2_6w4hdbpsav0g2vDgSrd6kybCsVdBzgjCPnTo21=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmwseOHMbdwvIyt5f4KPDaYrv6vaNdNERoNu56ZMBvVdHpO2KBOC2UsfN/I84YplpStwD27
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] bitops: Fix documentation
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
X-List-Received-Date: Sun, 08 Jul 2012 20:57:38 -0000

On 8 July 2012 21:31, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Doh.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

