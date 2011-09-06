Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0wXJ-0000Po-84
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2011 10:22:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wXC-0008Tn-94
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wXA-00061u-PG
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:21:53 -0400
Received: from mail-ew0-f45.google.com ([209.85.215.45]:51751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R0wWy-0005x1-W7; Tue, 06 Sep 2011 10:21:41 -0400
Received: by mail-ew0-f45.google.com with SMTP id 24so2881530ewy.4
	for <multiple recipients>; Tue, 06 Sep 2011 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xaUMGdVk+4zgF5FFRPH/uuOQIcrQoZ9sBOXy0gkYWQM=;
	b=mhfd+cNxRLi4ZC1gALZRugOrugOCn3hwi6ddjDsDMEj8x3zAXfJmFm68ZwROberyVU
	w+XxQqWyRDePYyCV9lJIPGIl/BpDw1EOcdOLo7B7njL6Uwwd4fvG8HDQE1As9G6hBuvI
	VOSYeTSDjtmZ63dTI0tzByxEXHXFRKg+lNUgw=
Received: by 10.14.22.210 with SMTP id t58mr1806913eet.87.1315318900327;
	Tue, 06 Sep 2011 07:21:40 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id f3sm545024eea.4.2011.09.06.07.21.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 07:21:39 -0700 (PDT)
Date: Tue, 6 Sep 2011 15:21:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20110906142136.GB27859@stefanha-thinkpad.localdomain>
References: <1315296096-8115-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315296096-8115-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix qdev-device-use.txt typo in
 -chardev serial, path=COM<NUM>
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
X-List-Received-Date: Tue, 06 Sep 2011 14:22:00 -0000

On Tue, Sep 06, 2011 at 10:01:36AM +0200, Markus Armbruster wrote:
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/qdev-device-use.txt |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

