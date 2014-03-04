Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKvcu-0007YZ-5h
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 15:07:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WKvco-0007TC-5V
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 15:07:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WKvcg-0000gj-UC
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 15:07:38 -0500
Received: from mail-la0-f42.google.com ([209.85.215.42]:50462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WKvcg-0000gQ-NL
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 15:07:30 -0500
Received: by mail-la0-f42.google.com with SMTP id ec20so21396lab.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Mar 2014 12:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R73LOcbiHr05hdHToOP8nAa4xkW7Yag4MVlR26D0v2I=;
	b=geFs3iJL9RIE4OMA0ZJ5nboYGq+1sPiKYSz5f18qtI7hbNa5DVjDD6vNnpzYnzrAw5
	EuvR6OXIyqmpP9ZlO7GwuJbcgjnFcf8PDNZJX/axjAxJXpzPi1IkjddaFOYRqedu/wLD
	DAkI+aKkVR73MYC0jdSMuQodyn49Cp+X2jVZizLfM61FktX1mtAKotWXkBQhsvP4i3X4
	AcId4Th+CWOcskxv9wAZgMiaYlsZym34UVqX30IlZfLSxYCDr8vnQRKrEuFsNsBmqeuB
	mROGUcWNhOez6imRh1/3gh9SKjW2yLiUYTRORuVHE4bE95gBox39Wpf97u3uQpOyy32O
	S2Aw==
X-Gm-Message-State: ALoCoQkcUi2b0w2zTzMYBvuwhjoYaAPv8Fh6j5dkYyiF2gWLGdylWNQTEyEcld8a0d32RbDlqLUg
X-Received: by 10.112.169.10 with SMTP id aa10mr54089lbc.72.1393963649599;
	Tue, 04 Mar 2014 12:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Tue, 4 Mar 2014 12:07:09 -0800 (PST)
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Mar 2014 20:07:09 +0000
Message-ID: <CAFEAcA9i8duXoh1C7C5-osxpEjyXs+sraVTcy6+Jampt787FiQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial patches for
	2014-03-04
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
X-List-Received-Date: Tue, 04 Mar 2014 20:07:42 -0000

On 4 March 2014 06:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another pull request for trivial-patches tree.
> There's nothing exciting in there, small things here and there.
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit d844a7b6569fb2b5252773444b18841426e5b906:
>
>   modules: Fix building with --enable-modules (2014-02-28 12:30:13 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-04
>
> for you to fetch changes up to 25254a7191cdaa6cc10edb7bdbbfd0a6d02b9905:
>
>   vl: Remove unneeded include file (2014-03-03 09:46:27 +0400)

Applied, thanks.

-- PMM

