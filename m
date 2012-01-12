Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKY1-0004ab-M8
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:18:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKXu-0004Er-NK
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:18:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKXo-0006rR-Tt
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:18:22 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:49035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlKXi-0006qY-5y; Thu, 12 Jan 2012 08:18:10 -0500
Received: by werb10 with SMTP id b10so1681112wer.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NmZXuAPeNEckbqpUyq03MwfvVC5hGw9NTuWMUZk1KoY=;
	b=u5f+FSR48hDT1GI0cQi4jp0/A57kMqzxjJnBcJ1taMYNaeGMhTUQB6CHFxy/Q3+6ui
	Gj+WukPUGgSb/E3uBLHJ2L3enkrF5gwajjJ2einHq8yi+DzVgq1xn9F31X0Crjgi9/IS
	0XFfF7mpozBGs8RrHiM94edEtLrdvylfk0y+I=
Received: by 10.216.131.150 with SMTP id m22mr55755wei.8.1326374289362;
	Thu, 12 Jan 2012 05:18:09 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id u5sm5731015wbm.2.2012.01.12.05.18.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:18:08 -0800 (PST)
Date: Thu, 12 Jan 2012 13:18:07 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Message-ID: <20120112131807.GA22879@stefanha-thinkpad.localdomain>
References: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] Fix fd leak in vvfat.c and strncmp()
 issue in vnc.c
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
X-List-Received-Date: Thu, 12 Jan 2012 13:18:28 -0000

On Fri, Jan 06, 2012 at 04:57:43PM +0000, Stefan Hajnoczi wrote:
> Two unrelated bugs that David Gilbert had kicking around that are easy to fix.
> Let's take care of them.
> 
> Stefan Hajnoczi (2):
>   vvfat: avoid leaking file descriptor in commit_one_file()
>   vnc: fix no-lock-key-sync strncmp() length
> 
>  block/vvfat.c |    3 +++
>  ui/vnc.c      |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)

Applied to the trivial patches tree.

Stefan

