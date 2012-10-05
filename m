Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK8Hu-0001Sh-7P
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 09:49:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8Ho-0001AS-58
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8Hi-0001RO-Gs
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:49:52 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:42379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK8HT-0000vj-7o; Fri, 05 Oct 2012 09:49:31 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so809294bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pYlEHCPEtvFY5UqGb5J3SB/F4L3stOYmxvZfZsY/QRo=;
	b=L1iE/eAnO8Fh1Bf6HdtFlu78kVfz9N8S7tTP1G6PrOvKvb3wMdkkfdhRLIpP6DMvhs
	brwkWUanOMMu5FRvZ4tg4SFiRNkn9/fxvVkIIl2/x/pspfuBIft8dA/fJr5AOVTqJJCn
	ZWGy7ctoTVlkCn3BhvrXIdWeOXPAHqDx0M5vobFM9KmfVOjcuNG8Xnn1XAfmt9ChU2/F
	BG51ZbriEb5/yuztJa98cWkd8t2JwbhZIRC7sxmyjfZKxazvV+CfePSgPS1z6ic/qYn2
	pb+JucS7CngC3Y9mYhLQgZT6Zkt0Gl6GiVjrNRwz7FC+Oryq6pe7PFVeqP7VEtn5XOMg
	4S+g==
Received: by 10.204.150.211 with SMTP id z19mr1965564bkv.60.1349444970638;
	Fri, 05 Oct 2012 06:49:30 -0700 (PDT)
Received: from localhost (188-194-152-192-dynip.superkabel.de.
	[188.194.152.192])
	by mx.google.com with ESMTPS id x13sm7797875bkv.16.2012.10.05.06.49.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:49:30 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:49:28 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20121005134928.GI10951@stefanha-thinkpad.redhat.com>
References: <1349378133-25644-1-git-send-email-ehabkost@redhat.com>
	<1349378133-25644-2-git-send-email-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349378133-25644-2-git-send-email-ehabkost@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [RFC 01/13] qdev: kill bogus comment
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
X-List-Received-Date: Fri, 05 Oct 2012 13:49:57 -0000

On Thu, Oct 04, 2012 at 04:15:21PM -0300, Eduardo Habkost wrote:
> When the DeviceInfo code was removed, the comment describing
> qdev_subclass_init() was left in the code by mistake. Remove it.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/qdev.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

