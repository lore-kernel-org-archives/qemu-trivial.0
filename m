Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynufx-0006L8-Bz
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 16:03:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynufu-0006JZ-2B
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 16:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynufp-0001Q3-9T
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 16:03:09 -0400
Received: from mail-ig0-f173.google.com ([209.85.213.173]:36857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynufp-0001PG-2f
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 16:03:05 -0400
Received: by igblo3 with SMTP id lo3so23684601igb.1
	for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2015 13:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p+2uPF2w7JaYf3OlTBXAvX41gozpPrwAI/xZqtPrEZ0=;
	b=M7sTgsqHDQR4bluYW6DdKEaCJrK0jjncik1Cof4eHw17qot5Zl7AMxCFBqyoX19kec
	SnjccKs4ogdXe4/wdJlffTNBOz//+ZtKY+y+J27MCHYCqB4vKBOF+iZVpA8wm6Uys+Zb
	gwOdAGA1AhRoQVX1gXp1hbpdhJQjpSAP2wFpLhq0L/JZFfpIDagpeIH3oYIoT4Xxzd8V
	tZS8ctLho1mZhJH0iwBKoCZq87Ckfojm6n8iyTxmhkM/uWk0VW7OflgC23ShxVlmGJqX
	l4f5Jvil+1QgIEEeFxIaqikAzHrrF5C3cS8I7XTKSkGb3tJcz1mq8WY8WolL/G59fTaJ
	BZyw==
X-Gm-Message-State: ALoCoQn9HUXA7+UeDdEYuYQ+qcJyJ3Vm/aWKgXGGgwl4SH4zURoqqK4dD1vtKftkxI6X5G7wC5fO
X-Received: by 10.50.138.232 with SMTP id qt8mr5943477igb.28.1430424184530;
	Thu, 30 Apr 2015 13:03:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Thu, 30 Apr 2015 13:02:44 -0700 (PDT)
In-Reply-To: <55428253.5020300@weilnetz.de>
References: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
	<1430421390-2787-1-git-send-email-cota@braap.org>
	<55428253.5020300@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2015 21:02:44 +0100
Message-ID: <CAFEAcA-49fPQBmWLec2iSkVvt2QPkskq9-_JVVWuyjsyRh9wCA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.173
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i440fx-test: guard
 ARRAY_SIZE definition with #ifndef
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
X-List-Received-Date: Thu, 30 Apr 2015 20:03:11 -0000

On 30 April 2015 at 20:28, Stefan Weil <sw@weilnetz.de> wrote:
> Am 30.04.2015 um 21:16 schrieb Emilio G. Cota:
>>
>> ARRAY_SIZE is defined in osdep.h so having an unconditional
>> definition here is fragile.

FWIW, the original patch of this failed to build on x86 too,
so I don't think we currently include osdep.h from this file in
any circumstances... Where do you get the ARRAY_SIZE definition
from that presumably lets you build without this one?

> Why not include osdep.h via qemu-common.h and remove all other include
> statements which then are no longer needed? I'd prefer that variant.

Can we include qemu-common.h in these libqos standalone test
executables? I forget... The rtl8139 test seems to though, so
I guess it's OK.

-- PMM

