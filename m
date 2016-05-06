Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayoDH-0003JZ-Ta
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 18:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoDC-000388-Ur
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 18:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoD8-0007XL-N5
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 18:27:05 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoD7-0007Wq-Du
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 18:27:02 -0400
Received: by mail-vk0-x231.google.com with SMTP id s184so6748461vkb.3
	for <qemu-trivial@nongnu.org>; Fri, 06 May 2016 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I4tYXuIWwiHouSDGOxYcqkSkJUondsC1SUgO7K/w4PU=;
	b=hRGgODpQjlXNYhP/kr9w195AkvAJ50+SSQnHqjsgQ4Mbfp8aQzFRCS7VbJbqa5qkrd
	yTW9+lT7HL0W0C+DikjoUFUCxCj42pMPY0g64eHzX46U8XYlhV4b1oTkH+mxYFje29Nh
	yBokAatvhIMCi9wv+01ldRDGwhe+tDUe6ZV50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I4tYXuIWwiHouSDGOxYcqkSkJUondsC1SUgO7K/w4PU=;
	b=QOrdU8Dtk7bSVusI2TtVRfLmgtnfeNJ25k75F6qIWJ0sGVRWDvko7LIDej8UQRsAda
	KSKhBwHsOIREAn5RtuovPn0HYiwnZzjKC0IDXm7HNyzSHuogMSb3DGG9R2MlJ/lftuXt
	SlybMZQWBqfPYl/s1MajS1tuILdlEK3DUsnndVUR2hI4amwaqP1D1eM0AMieSB8/EQqZ
	cZw+nDxYsuJnBRtFXsoMcpiTBdK7TSTKXi8Et9phPI1MbzsjC4TCRoJj464oXDam3b+u
	at9NO3RmTllZPcfL61FBUwUw+F7PuT/w25rx8Bx4ZevkDY9mFasPRk6rgLZNDTz5Ix6c
	8G8w==
X-Gm-Message-State: AOPr4FXbJUZyti4wTCFtYD8EfW+qHEnPolnVufXEaIXjOO06eqCDOWoJf8cuJsT3lH/LvOwDhcymrSbYGp3fHnlh
X-Received: by 10.176.4.20 with SMTP id 20mr14044508uav.125.1462573619872;
	Fri, 06 May 2016 15:26:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 6 May 2016 15:26:40 -0700 (PDT)
In-Reply-To: <572CEB5F.2020605@msgid.tls.msk.ru>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
	<572CEB5F.2020605@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2016 23:26:40 +0100
Message-ID: <CAFEAcA-ifsW1JhGpgYuAzT8AVoTWi03nO6HkMBgYQn5A5nud4Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Christopher Friedt <chrisfriedt@gmail.com>, Fam Zheng <famz@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Use libtool instead of
 ar to create static libraries on Darwin.
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
X-List-Received-Date: Fri, 06 May 2016 22:27:10 -0000

On 6 May 2016 at 20:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hmm.  We removed libtool support just two moths ago... :)

That was GNU libtool, which is a completely different thing
from OSX libtool. They just have an unhelpful name clash.

thanks
-- PMM

