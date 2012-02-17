Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RyLVd-0002VN-Lw
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2012 05:57:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RyLVW-00026a-6Y
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RyLVQ-0000fp-Hr
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:57:42 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:34203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RyLVD-0000d3-7x; Fri, 17 Feb 2012 05:57:23 -0500
Received: by iahk25 with SMTP id k25so4890904iah.4
	for <multiple recipients>; Fri, 17 Feb 2012 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4mOrlrgAL/3n7JG7QheuI+mUE7VISXFj+RsFdENMm7o=;
	b=aVrLNo2lwze2TlcT0VWZRqA9WyexQkaya8Eay6ZVodu1IpA4cIhImyz5ciBLE94DO4
	fL5iAy4bbv1ugIhIfs2GMtH3de0l1L8SEaMF4NR7zV6dic0mjUPnnbRRZlS5RhSPUg4j
	lxrW6+l7OHD25RrU1DAxImH2Rdyh13jnwkDOk=
MIME-Version: 1.0
Received: by 10.50.89.137 with SMTP id bo9mr7934780igb.7.1329476242428; Fri,
	17 Feb 2012 02:57:22 -0800 (PST)
Received: by 10.231.187.84 with HTTP; Fri, 17 Feb 2012 02:57:22 -0800 (PST)
In-Reply-To: <CAFEAcA-B=nrJYwx9yYiAVOWSsKyD+UtvcXn-K3Q7mMj-9tCVTA@mail.gmail.com>
References: <4F3D3F26.8010402@mentor.com>
	<CAFEAcA-B=nrJYwx9yYiAVOWSsKyD+UtvcXn-K3Q7mMj-9tCVTA@mail.gmail.com>
Date: Fri, 17 Feb 2012 10:57:22 +0000
Message-ID: <CAJSP0QWemvm=c+CLSNQVCCvsvTj5grFCeUeZBBP7ZBpfU3wy4w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [TRIVIAL] Replace
	object_delete() with object_unref().
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
X-List-Received-Date: Fri, 17 Feb 2012 10:57:47 -0000

On Thu, Feb 16, 2012 at 6:12 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Object model lifecycle changes aren't trivial IMHO.
> [no comment on actual patch contents implied]

Agreed.

Stefan

