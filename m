Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNjID-0006fn-6j
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 05:52:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjIA-0006VA-0w
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:52:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjI8-0002hA-R9
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:52:33 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:41851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNjI6-0002gk-Du; Tue, 08 Nov 2011 05:52:30 -0500
Received: by eyh6 with SMTP id 6so216247eyh.4
	for <multiple recipients>; Tue, 08 Nov 2011 02:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=683XdJx6TMjBotUugT58kN/ceGJzUJZvW04HhXPqDxU=;
	b=XmZki0SLOIhODDkDlLC1vji9Ptc/QxflZsAJmoXt8Oyk2iXngd2fyYXDeeCZkPg2eJ
	DEZMZezgImWmlDoKtUnH0LJ0l5vJ1YwDG7LW2TCcRQ1sj2yG0YvdAmhLoiXyz9ZAnMf9
	ExHa0ghm8bdgIeJr+x6j9WT9e+AuhX69XYM9c=
Received: by 10.14.4.32 with SMTP id 32mr1869186eei.50.1320749549221;
	Tue, 08 Nov 2011 02:52:29 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 49sm3160902eec.1.2011.11.08.02.52.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 02:52:28 -0800 (PST)
Date: Tue, 8 Nov 2011 10:52:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111108105227.GC18592@stefanha-thinkpad.localdomain>
References: <1320746438-31756-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320746438-31756-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix crash on -device
	'?=x'
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
X-List-Received-Date: Tue, 08 Nov 2011 10:52:35 -0000

On Tue, Nov 08, 2011 at 11:00:38AM +0100, Markus Armbruster wrote:
> Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/qdev.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

