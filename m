Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpDod-00079u-BJ
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 04:04:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpDoW-00073I-BU
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 04:04:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpDoR-0001aI-GW
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 04:04:40 -0500
Received: from mail-pb0-f42.google.com ([209.85.160.42]:49951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VpDoR-0001aA-Aq
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 04:04:35 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so2442601pbc.15
	for <qemu-trivial@nongnu.org>; Sat, 07 Dec 2013 01:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ViBQ5RKBiNw/c3dW3XdM+Hk/YG83qbMg772hVXPaUJc=;
	b=gF0nURM3ahqjAEKKWyQfl6hkLuPf0a7xhJP7Fq4mTIohvTnhTEVqQxobpYfOvkiFKP
	rLECqu2bhXCqVSnkdv3nCSUi8vIxENARbUoecJpww6nx0g4fJqHPvTFCTugOnyF310gY
	YKhEfs8fDXNd1J7pjJswX/PlsBeKYg1q7v0G0aW77Ex2AGX3klWkbChHoOPbpijCn1f8
	IXTIa8OZJGprnu6XDwRoTxo1W/llwkQpPt6uCYoegaKeq0HYh+GOEC/zaMkaMm89lWos
	AZ17XL8/W1fSEw3hVa6whb4W3iftLxoVJeE2mUuw5hxYGg+YAxB41U2w+ftIHB1tVwsP
	4uwA==
X-Gm-Message-State: ALoCoQlffATaaLJUl9Sm7wvvgGrLUFRRrfcKMBK6sGSaUGFCOsmQPxXAK2hVrDGsAPEZktxIEO+C
X-Received: by 10.66.2.66 with SMTP id 2mr9055843pas.72.1386407074473; Sat, 07
	Dec 2013 01:04:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sat, 7 Dec 2013 01:04:13 -0800 (PST)
In-Reply-To: <1386405764-18118-1-git-send-email-sw@weilnetz.de>
References: <1386405764-18118-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Dec 2013 09:04:13 +0000
Message-ID: <CAFEAcA-L6yxzk3muJ7wkOWyM=eiV-TJeNsvoF2DW+mRFWceX9w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Use macro ARRAY_SIZE
	were possible
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
X-List-Received-Date: Sat, 07 Dec 2013 09:04:45 -0000

On 7 December 2013 08:42, Stefan Weil <sw@weilnetz.de> wrote:
> This improves readability and simplifies the code.

Typo in subject: should be "where", not "were" (ditto in the
other patches you've sent).

thanks
-- PMM

