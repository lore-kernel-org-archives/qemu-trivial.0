Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzU2H-00086T-FB
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WzU2B-0007t2-Bi
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WzU1z-0000is-2B
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:57:25 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:52226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WzU1y-0000iV-S0
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:57:15 -0400
Received: by mail-lb0-f174.google.com with SMTP id u10so852279lbd.5
	for <qemu-trivial@nongnu.org>; Tue, 24 Jun 2014 09:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H14Qm6ALM8kpGDcbzjQqYS8j7FoHCNom+nH+qtLW18Y=;
	b=Zdh/JketAQKusDweGpit1OusUIZi+McRHF839A8Bl4O8hNQe2C3AuSWc6tQ7x61twK
	ZayLsbIEGiL9xRWUfV6sEnCunuh+O6qE5i0k0CII5sTYF7ZIWVAGi8176aY5n/xmajz6
	owH5JGChNduDbh/5nxo7HkRj8QsfBehApweWiKGAOyR/hVrruU/eJyQi54xB2Fj4Oz/d
	bCuvvfMxmJ6Ben8bR9lzdm/gQFydezvDFI7U5i8/m8npgfTQZ+l53603aKJKIdx8Zdhc
	df9/QRJ4W4g63PtzFrXeDDxEXH4Ub1mh2I3VRIkaON61cgNkFzsNZU9n6iJxQbSpa+65
	/EIg==
X-Gm-Message-State: ALoCoQl9LgGepZAugXb9oj8R8OM8cUXb09+Ra2TDhnCV10oKEmThD1xBwmibKOLhenvrYUuKKIl9
X-Received: by 10.112.129.202 with SMTP id ny10mr1534488lbb.14.1403629033498; 
	Tue, 24 Jun 2014 09:57:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 24 Jun 2014 09:56:52 -0700 (PDT)
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jun 2014 17:56:52 +0100
Message-ID: <CAFEAcA-tvshqbBE6jAYM_h9J5nvbNN7g=4807t=Y7eo5BU9Mzg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/14] Trivial patches for
	2014-06-24
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
X-List-Received-Date: Tue, 24 Jun 2014 16:57:33 -0000

On 24 June 2014 17:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another pull request for the trivial patches queue.
>
> Nothing exciting, but it contains some bugfixes.  For example,
> a build fix for FreeBSD by Ed Maste.
>
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 513d80edc15d77b6d85df7dfad750ce95d091b78:
>
>   Merge remote-tracking branch 'remotes/juanquintela/tags/migration/20140623' into staging (2014-06-24 15:33:42 +0100)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-06-24
>
> for you to fetch changes up to d535508793a8e9389379543ef8d506e50c10cf67:
>
>   Add support for the arm breakpoint syscall (2014-06-24 20:01:24 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-06-24
>

Applied, thanks.

-- PMM

