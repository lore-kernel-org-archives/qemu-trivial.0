Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqfGu-00036e-Mv
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 01:26:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfGr-0002vK-FY
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfGq-0001en-AR
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:26:49 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:39632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqfGn-0001e6-AZ; Fri, 27 Jan 2012 01:26:45 -0500
Received: by dajr28 with SMTP id r28so1438409daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 22:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xJFgVVm5jl1xSIQEiLAJXLxCuRblzwNLAwBImhKLdJ8=;
	b=P4510gkwAIUMbK/RoW28zM1I9dfpw1CpKUA9FUtYMsaVvM6jalxk7SRkYAsu/AMDQQ
	ntDecHXP+XCkKo3eQy6be+EbVFYdvi4odbQE7Md+SH01WDPWWGd9JL06ip1Toc6eY/vB
	MCJHEsinBdlBAt6+3xoqZ2Nx+0CYYqZgrlnx4=
Received: by 10.68.120.72 with SMTP id la8mr12120578pbb.56.1327645604074;
	Thu, 26 Jan 2012 22:26:44 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id j5sm17508472pbe.1.2012.01.26.22.26.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 22:26:43 -0800 (PST)
Date: Fri, 27 Jan 2012 06:26:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sergei Trofimovich <slyfox@inbox.ru>
Message-ID: <20120127062638.GB20307@stefanha-thinkpad.localdomain>
References: <1327426960-29196-1-git-send-email-slyfox@inbox.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327426960-29196-1-git-send-email-slyfox@inbox.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Sergei Trofimovich <slyfox@gentoo.org>
Subject: Re: [Qemu-trivial] [PATCH] ./configure: export xfs config via
 --{enable, disable}-xfsctl
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
X-List-Received-Date: Fri, 27 Jan 2012 06:26:50 -0000

On Tue, Jan 24, 2012 at 08:42:40PM +0300, Sergei Trofimovich wrote:
> From: Sergei Trofimovich <slyfox@gentoo.org>
> 
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> ---
>  configure |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

