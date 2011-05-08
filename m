Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2gg-00046m-It
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:02:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2ge-00042m-DY
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2gc-0003G0-F4
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:02:12 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:37863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2gZ-0003FU-Mq; Sun, 08 May 2011 08:02:07 -0400
Received: by wyb42 with SMTP id 42so3835173wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2Ck8wG9J8dN0ZJov9wB/8Yc8D44WNGHHMZ6+kejiFkc=;
	b=o2pgWx9j1fK8ZSiwWYYkyEC9ikSWNA3sNurGbkqiEGx40/14i9KhSsNFtylDmu99VK
	kTjSe0u9Sty3kiZnTEMNs5860S0VafPZrWgXkTexud2bJZ8tnhwqAhCP2fQsYrddp1rk
	wbrnelo48mWGakJr6rMMxKJh9caQMPTbPlYGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DJIEFixUOMbWfzSPQALumitpA1bGuCutFt54J3r89NVabdVWuYWGOBJ/gZVDC+x5yy
	E/t8ua3U456lH9z6Ve9FTrtysIxYwnJBtE4epFgK7BkorgsttVcrloLYTgSzv6/Gquu/
	YBd/5p/DurfjcFTF4KNMv7FMlCJc+zie9Ms40=
Received: by 10.227.58.6 with SMTP id e6mr780614wbh.83.1304856126747;
	Sun, 08 May 2011 05:02:06 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id bd8sm3108537wbb.65.2011.05.08.05.02.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:02:04 -0700 (PDT)
Date: Sun, 8 May 2011 13:02:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110508120200.GC10500@stefanha-thinkpad.localdomain>
References: <1304322846-24376-3-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304322846-24376-3-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 3/4] lsi53c895a: Rename 'sense' to
	'status'
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
X-List-Received-Date: Sun, 08 May 2011 12:02:13 -0000

On Mon, May 02, 2011 at 09:54:05AM +0200, Paolo Bonzini wrote:
> From: Hannes Reinecke <hare@suse.de>
> 
> The 'sense' field in the HBA status structure is misnamed, as it
> actually carries the SCSI status. Rename it.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
>  hw/lsi53c895a.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

