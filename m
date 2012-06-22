Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShznP-0001By-Fw
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:04:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShznI-0000s4-MG
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShznC-0007F3-9u
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:04:44 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:43181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Shzn0-0007Cy-0G; Fri, 22 Jun 2012 05:04:26 -0400
Received: by werf3 with SMTP id f3so1237754wer.4
	for <multiple recipients>; Fri, 22 Jun 2012 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rWxhOIEkiWme3kcSzfU6Ss8uDNvPXgveRUjzc/zdZYQ=;
	b=Q6k2+Qpk6IRpbEqKXOmNigwFBag4OQzFuOb0kmKMTsGyIxUTI58kFO7HoB9bOFGHwQ
	VfUKrWynZc1UXtRjjygFjwChnoMvlAtMDYdbZgr8bUJDftQ1FK56x2GAYkfl7WzYd+Mr
	6UTeAn7AsvhBJMZh/EiCYdTNdbHfBWVUVtwZygodFt1tpmWeDQn2V3pzQGKmFf1Ls4/a
	h5ORS2VG/wih/yX/FahKmgZE2Z2vVWNAZGqTKaz6HTIC79PcgTcboTV4MicNxco6aSTv
	bh8tDW2Viu9laOC8klyYKHSE6ozel8svBQlCfxhG9chsyl2n1kqHS1d/watIAah6wnoc
	J4sQ==
Received: by 10.180.102.36 with SMTP id fl4mr3108483wib.2.1340355863053;
	Fri, 22 Jun 2012 02:04:23 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id bc2sm4197027wib.0.2012.06.22.02.04.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:04:22 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:04:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120622090420.GC27038@stefanha-thinkpad.localdomain>
References: <1340117738-15225-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340117738-15225-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile.hw: avoid overly
 large 'make clean' rm command
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
X-List-Received-Date: Fri, 22 Jun 2012 09:04:50 -0000

On Tue, Jun 19, 2012 at 03:55:38PM +0100, Peter Maydell wrote:
> Avoid 'make clean' producing an 'rm' command which has a lot
> of duplicate 'hw//*.o' arguments, by using $(sort $(dir ..))
> rather than $(dir $(sort ..)) so Make's sort function will
> remove the duplicates for us. We can also remove the double
> '//' safely because $(dir ..) is guaranteed to return a string
> ending in '/'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Mostly cosmetic, although I guess there's a faint chance that expanding
> all those hw/*.o would hit the command line argument buffer limit...
> 
>  Makefile.hw |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

