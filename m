Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKjpj-0003Cr-C7
	for mharc-qemu-trivial@gnu.org; Mon, 21 May 2018 08:22:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKjpg-0003AQ-QQ
	for qemu-trivial@nongnu.org; Mon, 21 May 2018 08:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKjpf-0008MV-TF
	for qemu-trivial@nongnu.org; Mon, 21 May 2018 08:22:32 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fKjpf-0008M3-OW
	for qemu-trivial@nongnu.org; Mon, 21 May 2018 08:22:31 -0400
Received: by mail-oi0-x244.google.com with SMTP id a6-v6so12792191oia.2
	for <qemu-trivial@nongnu.org>; Mon, 21 May 2018 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vUpEriaJ7JtQ3up/FYL3NU84RIZvaSWVgdIBwgr4OBM=;
	b=EDvS1oHL6DqAVrsa2EqTJniMDluba5asUZAvozYx7sjjlyAFueI32hp5NLxtDO5y/h
	q3NsPS5QZ/4ouJyloZrrX7zfOQkRZVLiAewDIqlBB4ctByvG4V+0nozu2DmpE6bR1FQJ
	o8r7dxyIhZs4yWVPXj9QJBRMI++hCutdJIpu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vUpEriaJ7JtQ3up/FYL3NU84RIZvaSWVgdIBwgr4OBM=;
	b=bCYxzWUbTzw6jF+gy+/DvB04saGxE5OuVxws1yqy43fZ3zvDRznn7wdmqz7XgGrDeD
	2wVbnGNDJT0BrmKxSG9EXaQizzbyUKgd1k1p/E0i/k2rqCd/yaV0tM6D/ldiUjaRay4Y
	jDvxIOptAAO4y1yHo/30JKCNnYTDYjijmhTnf1xCtgpocVwuFdHYG6LE34SaHSNJrzdW
	P5okRDPG0ZnfWzqQkt5ZIQ1b5LicREgM2XArkGuS9Vo3ODx1OfH/iy5CexHvMT5l36OZ
	LRt/RCpzmHulisqhgB6ICA+TEtevagAWHyFp5K9MRlU79mO2xkOoRQzVJHk2+5urQIh9
	7gkA==
X-Gm-Message-State: ALKqPwfM5WD8t6hK9d4mR4ktcavTcL0qAIZDFvQ7pq77NU3CHvrl1TZA
	OtCCTLy6VzF4C///toXG5Kt1vP+c/fXvPaObkDedEaLO
X-Google-Smtp-Source: AB8JxZoFClOOjdHpvghaJbhEO/Eq5WRIM4JcQEw/z9qM0Jl75aJ/5ZANgpAgcNMLfBcnKEqpA/VCtxJ9ppC/vEM0t3s=
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr11944835oig.102.1526905351064; 
	Mon, 21 May 2018 05:22:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 21 May 2018 05:22:10
	-0700 (PDT)
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 May 2018 13:22:10 +0100
Message-ID: <CAFEAcA_1gA6ucQPtmqtvnEhWU_670M8ALH1ASwa=za0vS_V0PQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/22] Trivial patches for
 2018-05-20
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
X-List-Received-Date: Mon, 21 May 2018 12:22:33 -0000

On 20 May 2018 at 07:14, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hello!
>
> This is a next trivial-patches pull request. It's been a while
> since the last pull, and quite some changes has been accumulated.
>
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 5bcf917ee37a5efbef99f091a96db54a5276becb:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20180518' into staging (2018-05-18 18:25:29 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 9a232487aab8a7640ff8853d7d8d7c27106b44f8:
>
>   acpi: fix a comment about aml_call0() (2018-05-20 08:58:58 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2018-05-20
>

Applied, thanks.

-- PMM

