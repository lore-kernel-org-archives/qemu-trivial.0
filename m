Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0CYM-0002C7-SM
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2013 09:52:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0CYG-0001rb-17
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 09:52:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0CYC-0004YQ-NL
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 09:52:43 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:40711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0CY3-0004Wf-G8; Tue, 29 Jan 2013 09:52:31 -0500
Received: by mail-ee0-f45.google.com with SMTP id b57so271384eek.18
	for <multiple recipients>; Tue, 29 Jan 2013 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qBZEVjOKIj5N86Qu0vgni76aG+GLeHbAohXUtlSVkT4=;
	b=VpnUXZq+80IX3Eu117aw12UobWamtSfsnKB4xvdxI9rzcbQSXeZJGbNj6o16iWxc4U
	f36qAOgCbPOivKh/bOuvQ3Rm3KkSHfOZ42lA/0jSdoglxgKP3vcYEZMeIuCdxdWJwBba
	gWBMkvUU6Qan2Mlbx5km1NpToIIuvA7Atw4+9eBQXncfxEFSnRDRg4EzwLlWgFtIaAxy
	txtu3xXjPEChbAhviDEVAMTA4DZ3LrE/x/MqDBeCqADeeSEebWR2yWx61b6bjRnVzhGa
	SGdj5Th4dcg6K/ahUuzGefH88WZ1bYjmiP2OkkPcC33LVZLUWQZ7UogS4j7mC2FtEYc3
	ke+w==
X-Received: by 10.14.204.198 with SMTP id h46mr4233649eeo.1.1359471150539;
	Tue, 29 Jan 2013 06:52:30 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id 44sm20602168eek.5.2013.01.29.06.52.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:52:29 -0800 (PST)
Date: Tue, 29 Jan 2013 15:52:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vishvananda Ishaya <vishvananda@gmail.com>
Message-ID: <20130129145227.GC17664@stefanha-thinkpad.redhat.com>
References: <51024DE2.907@redhat.com>
	<1359140240-42972-1-git-send-email-vishvananda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359140240-42972-1-git-send-email-vishvananda@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Adds mirroring tests for resized
 images
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
X-List-Received-Date: Tue, 29 Jan 2013 14:52:49 -0000

On Fri, Jan 25, 2013 at 10:57:20AM -0800, Vishvananda Ishaya wrote:
> This test verifies two mirroring issues are fixed with resized images:
> 
>  * sync='top' creates an image that is the proper size
>  * sync='full' doesn't cause an assertion failure and crash qemu
> ---
> These are tests for my patches for the following bugs:
> 
> https://bugs.launchpad.net/qemu/+bug/1103868
> https://bugs.launchpad.net/qemu/+bug/1103903
> 
>  tests/qemu-iotests/041     |   48 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/041.out |    4 ++--
>  2 files changed, 50 insertions(+), 2 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

