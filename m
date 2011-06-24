Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qa3yr-0004gZ-9w
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 06:51:21 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qa3yn-0004fR-Iq
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qa3ym-0007dc-4f
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:51:17 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:39100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qa3yh-0007by-8y; Fri, 24 Jun 2011 06:51:11 -0400
Received: by wwf26 with SMTP id 26so2425590wwf.10
	for <multiple recipients>; Fri, 24 Jun 2011 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xcbX7oc99DRQVuW1sJZRPsUsbosvur36/WZa4CwIfzI=;
	b=wpuDScy2OKgzSfnNO/CqnraFq7Blzl9hIpaRcN1SnJ+/safURam1mYJvWzbnRf5wH1
	VKTEDVfG6pxKZ5+iZnAuleU1JHNKy06msiuZDk2yPiQalFNkTQsal5E/rJ04eKUfJrQc
	AdziQ7W/BsaWJW9381PWXGRlcHVUeqouYzknU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=x4a68TqhsPU09rGporhecc8Ak28cqWNtq7eEq85TROW3W02fXgEApVF6FhspJxLztt
	Ftz4wAlxLnaH6F1zYH9CLz0GIKav7ARpxbar+eAD6ejkkfIJzM2nVvE0c9V51tttlcf/
	htzBn3/PrnMntZ8/0T+CanCmig9oXZuHqUPBI=
Received: by 10.216.173.14 with SMTP id u14mr537522wel.38.1308912669314;
	Fri, 24 Jun 2011 03:51:09 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id 74sm1319918wem.17.2011.06.24.03.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 03:51:08 -0700 (PDT)
Date: Fri, 24 Jun 2011 11:51:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110624105103.GA5985@stefanha-thinkpad.localdomain>
References: <1308896356-17797-1-git-send-email-weil@mail.berlios.de>
	<1308910549-4445-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1308910549-4445-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] w32: Remove redundant definitions of
 PRI*64
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
X-List-Received-Date: Fri, 24 Jun 2011 10:51:19 -0000

On Fri, Jun 24, 2011 at 12:15:49PM +0200, Stefan Weil wrote:
> The PRI*64 macros are defined in MinGW's inttypes.h since 2002,
> so they are not needed in qemu-common.h (which includes inttypes.h).
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  qemu-common.h |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

