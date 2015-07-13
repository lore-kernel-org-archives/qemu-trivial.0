Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEjaV-0007Nn-2D
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 15:40:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEjaS-0007M0-QR
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEjaP-0006J5-KI
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:40:24 -0400
Received: from mail-vn0-f44.google.com ([209.85.216.44]:44088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZEjaP-0006Ip-Fi
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:40:21 -0400
Received: by vnbg129 with SMTP id g129so39242331vnb.11
	for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2015 12:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/e6hxkPtmGGoFdY3/YAhf46g3rKuILFBviL+J0xSva4=;
	b=EcdxU7AAWLpjCa70c7pK0UXqHE/YONH0e2Wd2OiH3BjOre2Ri3xGXbzp6cTuIxQWm0
	Dfao4+vKoEs3x/PlrGabtVepXgLoUsPUqZP90ems29PookqK/zMc1wfuPyzsVmkQKuMJ
	PjN3SX/rWMc1Dyf/cuqD2s3FqoYUtbVbIwbS7zU7I8ejUqMj8AK+sMTLW/IEnCiN5Zj/
	ONTnEiyc2GXhmuBsQB/h9X7kLjMHhiakZD7c8qdLc0TJc3kWQW0ImG0LXJmpJhz3yahF
	4CFdmNm/xBUUiznMrQmyaqYIBbtCp/wJwqEICHAYz7iNBv16V5A0PmrJHjgrIDVr3Bci
	vaRw==
X-Gm-Message-State: ALoCoQnqsKEpg2xRMedMtDcDeqTVjLO4UKI+9mT3X0rzPwc6gaL2UbS6p8ccs6qS7VJLlzDghO0G
X-Received: by 10.52.167.105 with SMTP id zn9mr32477618vdb.83.1436816420306;
	Mon, 13 Jul 2015 12:40:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 13 Jul 2015 12:40:00 -0700 (PDT)
In-Reply-To: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
References: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2015 20:40:00 +0100
Message-ID: <CAFEAcA_hE0eepawDhF2DBidhd6iXvOx2f6w11+gFk-nh3Ju1XQ@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Qemu-block <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: coverity touchups
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
X-List-Received-Date: Mon, 13 Jul 2015 19:40:25 -0000

On 13 July 2015 at 20:26, John Snow <jsnow@redhat.com> wrote:
> Just a handful of casts to quiet coverity up.
>
> s->ports should never exceed 32, but coverity doesn't know that.
> ncq_tfs->sector_count should also never exceed 64K.

Personally I tend to mark that kind of thing as a false
positive in the coverity UI and move on...

-- PMM

