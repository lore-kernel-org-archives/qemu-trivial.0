Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWiJq-0003eY-Cz
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 04:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWiJk-0003Yl-8Y
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 04:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWiJd-0005Q1-Bi
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 04:20:40 -0400
Received: from mail-la0-f54.google.com ([209.85.215.54]:57529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWiJd-0005Ph-1n
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 04:20:33 -0400
Received: by mail-la0-f54.google.com with SMTP id mc6so3735945lab.41
	for <qemu-trivial@nongnu.org>; Sun, 06 Apr 2014 01:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zvj2mTt+ugmX3M0v1n752zd8axNRCidKxAHsnxDbBV0=;
	b=Zy/LaFQ6V8AuAhbxQj6I+BX7KrfCoxV/AhP5UE9Sut5IReGzADIlMxDjMPsKUHER5G
	JAhMo1uwyvECFYqUY7UNzvAubCKqUfXxPbS3ToCOqzGglFCDrRc7uPVs9Dov2sYkJZGb
	a2icIlCt3eTmo7EsSsYOirrmJbrFc7Eijiq6JCn+Di3s7fIOEeYHlvJ/4VXtoyi3Yvml
	E2TM/DSlIw5s624mc8GDltisg8fs1KeMtyfFIwsY8StdMPM6nOTV7XaNHFkOyMJSQdaJ
	yH6D00zqfw/y00Wavz5MBPX3TrVayUrboahQ+IRChay+JvJvSoCCbG2SAJXaX1iWH/S2
	bvUw==
X-Gm-Message-State: ALoCoQnadVSfashk6WWKaQ5Dq47Xdq75Cot626iH38iG35S41gvcW5DIwzheuDZplzhEYil8HcZX
X-Received: by 10.152.88.70 with SMTP id be6mr16541604lab.13.1396772431830;
	Sun, 06 Apr 2014 01:20:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sun, 6 Apr 2014 01:20:10 -0700 (PDT)
In-Reply-To: <5340F620.2000607@msgid.tls.msk.ru>
References: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>
	<5340F620.2000607@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Apr 2014 09:20:10 +0100
Message-ID: <CAFEAcA8gSmOM1g+iLAEi5iays4hTG_rVGWB_J5gtrrZ4M9ftpA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] scripts: add sample
 model file for Coverity Scan
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
X-List-Received-Date: Sun, 06 Apr 2014 08:20:45 -0000

On 6 April 2014 07:37, Michael Tokarev <mjt@tls.msk.ru> wrote:
> While we don't have issues with the model itself, but really wonder if we
> should keep this file inside qemu sources.  It isn't used in there, as
> explicitly stated above, and maybe it is easier to maintain it "closer"
> to the website?

Where would that be? There's no version control there. The
other alternative would be somebody's personal git repo,
which seems a recipe for it being impossible to find.

thanks
-- PMM

