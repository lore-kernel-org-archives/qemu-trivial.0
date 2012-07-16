Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sqtiw-0002wK-Jz
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2012 18:25:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sqtiu-0002vw-Iv
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 18:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sqtit-00051z-AK
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 18:25:00 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sqtit-00051o-4h
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 18:24:59 -0400
Received: by bkcji1 with SMTP id ji1so4235487bkc.4
	for <qemu-trivial@nongnu.org>; Mon, 16 Jul 2012 15:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=NigWuiO2oLxe1fLOLDcqHcXDk5LNfdqT1EQTecB8H78=;
	b=WISc2Dav+3d3dMiYmrvu81UQ7NYXgoyGolVPcvgFGvguvWkvKB4Wa9WdJIF4qm/A2r
	hY4YrhCQgP6LxfeMgoe8Rxdvx2oG6Lpw5UzjUCfkYaKt73y3hmvzxfhI0OlIOiZeV+C7
	CTJ2HhQpQdCpQsC+sr30K03jqiW7DkwB/Wgr0L8dKrp4L6+jwLOqYxUcLhuLPiWg+IUl
	VJ1o6YTuuVRrBySiCNwZluRhuruUKXYXlEHtbNUdqRlstn7LZyewuOgYLlY4JVwngxd4
	iOoX85dx3LDrgeBVMw/ueq4iQx4zpSS57em8gkjmjjUHhoRR9uM6eyZxkxL+qXNNsfvX
	nxYg==
MIME-Version: 1.0
Received: by 10.205.135.6 with SMTP id ie6mr5537927bkc.139.1342477497823; Mon,
	16 Jul 2012 15:24:57 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Mon, 16 Jul 2012 15:24:57 -0700 (PDT)
In-Reply-To: <1342474627-27738-1-git-send-email-sw@weilnetz.de>
References: <1342474627-27738-1-git-send-email-sw@weilnetz.de>
Date: Mon, 16 Jul 2012 23:24:57 +0100
Message-ID: <CAFEAcA91f9Nd7M94FN9gOaGn69YB39VdWbfriZAfHa5nhQ+x4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQm9e2d51WxhjSbjinMSNpMm6uiQWS+yABsOt0xp8HSIKbXPOi90Y1+bUrQe9okW+/DFlntk
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc: Fix indefinite article
 an -> a before nouns that begin with 'h'
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
X-List-Received-Date: Mon, 16 Jul 2012 22:25:01 -0000

On 16 July 2012 22:37, Stefan Weil <sw@weilnetz.de> wrote:
> Although the rule also allows 'an' for historical reasons,
> 'a' is more common because 'h' is pronounced.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

