Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlIE9-0007Nb-DC
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 06:17:33 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIE6-0007Dr-Sb
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIE5-0003MD-Py
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:17:30 -0400
Received: from mail-fx0-f47.google.com ([209.85.161.47]:60326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlIE2-0003Lg-NS; Mon, 25 Jul 2011 06:17:27 -0400
Received: by fxg11 with SMTP id 11so9492335fxg.34
	for <multiple recipients>; Mon, 25 Jul 2011 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8XDZEiQfNtXlM4FRM9kMBxgL/0IsogKi5revGPZSDEg=;
	b=kJ8AjUQaH72p2M0AfNfjQv5kDMLpHMzu8n316xZM8AzgnuX1LXqIW4BXN0SyXoqI1w
	4lHvSiwMe4QjG8nt763MHjk0TSiKx0Rk/ngv23Hx9K6NfuEEnhY+15rERJop6CFpKLol
	qMYK858PQ3sjinaZPnnYCvFO6oJnRoTVxGax8=
Received: by 10.223.55.209 with SMTP id v17mr6461346fag.77.1311589045724;
	Mon, 25 Jul 2011 03:17:25 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id 28sm3711048fax.3.2011.07.25.03.17.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 03:17:24 -0700 (PDT)
Date: Mon, 25 Jul 2011 11:17:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
Message-ID: <20110725101718.GA15078@stefanha-thinkpad.localdomain>
References: <1310389063-16382-1-git-send-email-wolfgang.mauerer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1310389063-16382-1-git-send-email-wolfgang.mauerer@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.47
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vhost build fix for i386
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
X-List-Received-Date: Mon, 25 Jul 2011 10:17:32 -0000

On Mon, Jul 11, 2011 at 02:57:43PM +0200, Wolfgang Mauerer wrote:
> vhost.c uses __sync_fetch_and_and(), which is only
> available for -march=i486 and above (see
> https://bugzilla.redhat.com/show_bug.cgi?id=624279).
> 
> Signed-off-by: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
> ---
>  configure |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

