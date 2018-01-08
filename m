Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYaDm-00052b-F6
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 11:24:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gson@gson.org>) id 1eYZs1-0000xL-D1
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gson@gson.org>) id 1eYZs0-0003Tz-LG
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:01:53 -0500
Received: from gusty.araneus.fi ([185.55.84.130]:65182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gson@gson.org>)
	id 1eYZrt-0003Ip-ET; Mon, 08 Jan 2018 11:01:46 -0500
Received: from guava.gson.org (unknown [10.0.1.240])
	by gusty.araneus.fi (Postfix) with ESMTP id 836ACDB7781;
	Mon,  8 Jan 2018 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gson.org; s=mail;
	t=1515427302; bh=WWZZ1xeWkcjit459LX5e0GlsZIHirrTJRqPut7uLBOs=;
	h=Date:To:Cc:Subject:In-Reply-To:References:From;
	b=DIo4cl/2gWfiWXTnAqgdhnoCz4d/Xvy8p5rnh4xEmGaam3GqZjd0V3tF0Ls11sgyv
	LoCtotgvJCN0CTd4+JAC0gs6kmfwVlsVBTdfOloShOxQkJRsslQg4eJqcPOD2J7tz6
	ciMEB/CRdZG5E6///x1y1N3vBMNvJI3FgKbgf4cE=
Received: by guava.gson.org (Postfix, from userid 101)
	id 8E50E98B4A1; Mon,  8 Jan 2018 18:01:41 +0200 (EET)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <23123.38373.555937.75671@guava.gson.org>
Date: Mon, 8 Jan 2018 18:01:41 +0200
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>
In-Reply-To: Re: <CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
References: <23118.26328.811644.330716@guava.gson.org>
	<CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
X-Mailer: VM 8.2.0b under 25.3.1 (x86_64--netbsd)
From: Andreas Gustafsson <gson@gson.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 185.55.84.130
X-Mailman-Approved-At: Mon, 08 Jan 2018 11:24:20 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: check for
 posix_memalign in configure script
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
X-List-Received-Date: Mon, 08 Jan 2018 16:01:54 -0000

Peter Maydell wrote:
> Can we put this through the -trivial tree? (cc'd)

I'm not sufficiently familiar with the intenal workflows of the qemu
project to give a meaningful answer to that question.
-- 
Andreas Gustafsson, gson@gson.org

