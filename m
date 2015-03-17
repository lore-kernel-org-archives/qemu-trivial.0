Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXryF-0002SA-6z
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YXryC-0002QR-Df
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YXry8-0003NS-4c
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:55:44 -0400
Received: from mail-ig0-f178.google.com ([209.85.213.178]:33194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YXry7-0003NE-Vj
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:55:40 -0400
Received: by ignm3 with SMTP id m3so53341611ign.0
	for <qemu-trivial@nongnu.org>; Tue, 17 Mar 2015 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Mf4squEhEeVoiJo0cn96blZ2ngtYIWL8evtfoiKpXe0=;
	b=XFPAHKM3Ttcnv0lPG/iNO2+oKU9YNUBzXCuPw2yaD1gsIj8iGkbHTdFhNZX9YL7rTN
	nF3wWB3bam4d17MjXHMUSu1kMmWhBxqNOK9ifN8hajgC2qhNN06f2HtX013RcDwH4L9Y
	tYga0Z1B2BhVyHCYVj8+uQg2JUIoTxMXx1EzR2NTYxeRAxMDM9tffj+uCcgk9ggzX9rf
	5bHA2htLA2f6IvUrqQjP3FkL7Kz6ruvA/+79vRXE6IMITfaPmK26CR8FIGOMzbwfdcGY
	94uLsh4TvVP4zQt0WOpPmQ27VLp4RafwgLzT/OD1Prqs5XgLaATu9DSh6hBEYWHQt3n3
	enwg==
X-Gm-Message-State: ALoCoQneWFXKFkuccO8d07tUq6pl1LMW3Z+YxWMpeunOPqNZR4Rm2KtB8hRyvsWdBVpGI80hqFmF
X-Received: by 10.107.9.88 with SMTP id j85mr106939934ioi.60.1426600539384;
	Tue, 17 Mar 2015 06:55:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.170 with HTTP; Tue, 17 Mar 2015 06:55:19 -0700 (PDT)
In-Reply-To: <1426591636-30212-1-git-send-email-visweshn92@gmail.com>
References: <1426591636-30212-1-git-send-email-visweshn92@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2015 13:55:19 +0000
Message-ID: <CAFEAcA8ue+t=XfYxHLx9JoA8P9YNuw28cHa0qCyjupYKOTnKQQ@mail.gmail.com>
To: Viswesh <visweshn92@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Cleaning up the
	documentation
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
X-List-Received-Date: Tue, 17 Mar 2015 13:55:45 -0000

On 17 March 2015 at 11:27, Viswesh <visweshn92@gmail.com> wrote:
> This commit corrects typo in the documentation.
> Please consider this as trivial commit patch.
>
> Signed-off-by: Viswesh <visweshn92@gmail.com>
> ---
>  fsdev/virtfs-proxy-helper.c |  2 +-
>  target-tricore/translate.c  | 22 +++++++++++-----------

...these files aren't documentation, they're code.
What you mean is "Fix typos in comments."

If you (or the -trivial maintainer) fix the commit message,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

