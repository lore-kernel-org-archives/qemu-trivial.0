Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL94J-0000hf-Gc
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:24:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL94G-0000ev-OC
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL94C-00024t-3j
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:24:20 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:59470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL945-000245-Eu; Thu, 28 Mar 2013 05:24:09 -0400
Received: by mail-wi0-f177.google.com with SMTP id hm14so3037909wib.4
	for <multiple recipients>; Thu, 28 Mar 2013 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rq6cv/zppBIzQQuaZFfuVlZCRmrjCCS/JRBvqgaMp6w=;
	b=glmomJFyCjTNDR9FeDkaNCSeh5HiEM3U5nJdWAfOeJ19FCstHbLHAoAAVbLrcJJ2Sk
	pFoRbeGDp6RSAcJhtXyhFiKYhHr5DhSuu04V0zVIURgRs9WYfBxh3lYs73hR4yDZFaH8
	zaQ5nlkgQm/fGUhdglLNy863UJ8MDODc0JD4o3vsaFJrXaS9gql8RktPe63W7HiAN4dz
	EXkXMbYjIjWrdWz9KS1epJ0YPmjklYWSbXY6EmkSur7a4dx8IUvojq3Aq1sPwyh2uqMR
	r08yqymWa5uHMwB2qZqErjAvYQB1LI3n74zQouiBz0/R17PU69tdRPfVmT2QEkg7btXj
	t4tQ==
X-Received: by 10.180.97.132 with SMTP id ea4mr14783027wib.23.1364462648606;
	Thu, 28 Mar 2013 02:24:08 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id du2sm13087292wib.0.2013.03.28.02.24.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:24:07 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:24:06 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: riegamaths@gmail.com
Message-ID: <20130328092406.GA24910@stefanha-thinkpad.redhat.com>
References: <1364108727-14445-1-git-send-email-riegamaths@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364108727-14445-1-git-send-email-riegamaths@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Dunrong Huang <huangdr@cloud-times.com>
Subject: Re: [Qemu-trivial] [PATCH] configure: show debug-info option in
 --help output
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
X-List-Received-Date: Thu, 28 Mar 2013 09:24:22 -0000

On Sun, Mar 24, 2013 at 03:05:27PM +0800, riegamaths@gmail.com wrote:
> From: Dunrong Huang <huangdr@cloud-times.com>
> 
> "--enable-debug-info" and "--disable-debug-info" were not shown
> in --help output.
> 
> Signed-off-by: Dunrong Huang <huangdr@cloud-times.com>
> ---
>  configure | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

