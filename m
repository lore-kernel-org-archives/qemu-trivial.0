Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri1xY-0004ZV-SP
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 05:51:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xV-0004PS-Rr
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xU-0004GJ-PO
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:09 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:64835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri1xN-0004Fh-LW; Tue, 03 Jan 2012 05:51:01 -0500
Received: by eekb45 with SMTP id b45so18563593eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 02:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RbH7RCuMyg2k01fsWYEkhQ1HrtIYAywKkUm553bY28M=;
	b=pfLd4B1TffBBD4ebERF1PwusEBACjNuC2pgUZo/v18ERSUZiwPiPCcLmz0GvDuhLQx
	R40KGFoEDLC21lG8BlZ0cGzsDliJgAEj+DP9ju11axTSYHm0qItTqDiBzlccQgQavItE
	SBxACJe+9Waa7/D1LKqYJCdejiVXzehXfjE70=
Received: by 10.213.32.208 with SMTP id e16mr10743063ebd.145.1325587860635;
	Tue, 03 Jan 2012 02:51:00 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	q67sm142333829eea.8.2012.01.03.02.50.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 02:50:59 -0800 (PST)
Date: Tue, 3 Jan 2012 10:50:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120103105058.GA28684@stefanha-thinkpad.localdomain>
References: <1324732045-5516-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324732045-5516-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix test for supported host
 CPU type
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
X-List-Received-Date: Tue, 03 Jan 2012 10:51:11 -0000

On Sat, Dec 24, 2011 at 01:07:25PM +0000, Peter Maydell wrote:
> The test for whether the host CPU is supported had several problems:
>  * the attempt to fall back to TCI was done as a duplicate
>    test, very late (so "--cpu foo" would fail early but "--cpu unicore32"
>    would fail late, differently, and after configure had already
>    printed a lot of output)
>  * a number of CPUs only supported as guests were included in the
>    list of CPUs we would accept as valid hosts, which would result
>    in a late compile failure on those systems rather than a
>    configure failure or fallback to TCI
>  * bailing out for an unsupported CPU happened before the main
>    option parsing, so "configure --help" wouldn't work
> 
> Fix these by folding the setting of ARCH into the first test for
> supported host CPU, removing spurious guest-only CPU names from it,
> and moving the "fall back to TCI" code earlier.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |   44 +++++++++++++++++++++-----------------------
>  1 files changed, 21 insertions(+), 23 deletions(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

