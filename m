Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6HWY-00064e-O3
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 05:28:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W6HWR-00062z-U6
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 05:28:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W6HWN-0002ET-2H
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 05:28:31 -0500
Received: from mail-la0-f51.google.com ([209.85.215.51]:60247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W6HWM-0002EJ-SE
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 05:28:27 -0500
Received: by mail-la0-f51.google.com with SMTP id c6so1305084lan.10
	for <qemu-trivial@nongnu.org>; Thu, 23 Jan 2014 02:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wkcf0QBaM2/RjAE1YFfrSwgAYkr4okZiOlfqDrb2paA=;
	b=JzKETrOlPkIgoOKs5l47fHh8KtR67+BopwAAMBisK0ylmYfWMOJk4+joO/w9zu/cwk
	6mRsN5EP6z45dKgT+qSGzrZ3CINa/t+5IDSOXbI4coXVp1TcSbaCluZFmtAKqTsM1UMb
	pa+5ROryGvmEoxxPtGZKdWR6nkLM8Cbvy5QSjffwHeGJiYFE5eGJL6qjPgBY5pwJFAtM
	DgyeRR+mTXL2QQ7W5ZI+zZXpxn+d+BRyEJJ7pis1S8meR0Ct2u0KeVCDRHUIbgLDsXY3
	OVUHeBEmAjHkgThkwZg5A1ydqjscnZGx7TzmbNRA6XKk/lgYXI/AcoqniidTHawZBU68
	mxng==
X-Gm-Message-State: ALoCoQk1wXW9yFittwUT4UbuhKA4j7TEBp73KB4+FgjnkpYpeyYepaHEys6LqNtahhX6hZpJenmn
X-Received: by 10.112.219.170 with SMTP id pp10mr4317984lbc.29.1390472904198; 
	Thu, 23 Jan 2014 02:28:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.199.162 with HTTP; Thu, 23 Jan 2014 02:28:04 -0800 (PST)
In-Reply-To: <52E0B4EC.4040904@weilnetz.de>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<52E0B4EC.4040904@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2014 10:28:04 +0000
Message-ID: <CAFEAcA_W1woSGCBCu2d8g2vd1jwYHu1d1Kj+mbtz25F7rFmFZQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: helpfully output
 package names for some missing dependencies.
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
X-List-Received-Date: Thu, 23 Jan 2014 10:28:36 -0000

On 23 January 2014 06:21, Stefan Weil <sw@weilnetz.de> wrote:
> My personal impression is that the current hints in configure are
> sufficient (with the one exception DTC) and that the QEMU wiki is a
> better place to document build dependencies for the different platforms.

I tend to agree, with the exception that our "feature_not_found()" errors
are excessively cryptic, because we just pass a single word to that
function, and so we end up saying "User requested feature docs,
configure was not able to find it" when what we actually mean is
"You need to install makeinfo and pod2man to build the documentation".

thanks
-- PMM

