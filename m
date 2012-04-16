Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJmmm-0002pk-RL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 10:20:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJmmf-0002kk-LK
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 10:20:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJmma-0003Vf-Qn
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 10:20:01 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:40372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJmma-0003VT-Io
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 10:19:56 -0400
Received: by eaaf11 with SMTP id f11so1479902eaa.4
	for <qemu-trivial@nongnu.org>; Mon, 16 Apr 2012 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q87/hpdL8N9NwwHd4NMToRkNsaKgYlfE7nj9UHI1sI0=;
	b=S1Lr1UByCJQPDb9yGjL+v9cD4xsqhgRpH+3+G3rJ4wiFfEta4C/Zz78E2xrl1MQSBU
	nHN4N36qc+SxbKPLPNuIck+CsAZxx14GKOBPXjMxL/lbyHzKGzEKBepc65AzPh7J7FD4
	IL5qmlEgEi8d8OU5sU3wLfzpH/1E/ByjauxRe2m2xLOYMNX+Kufkihj+3eakW+ztKm06
	kZ/GmL5hzCnf1r/77jQQd8/blYC/eyUGLBWbDlabpi0tfufzAd5HtnDGkIdBl2MkO8tf
	WkAXR7szi1YtWdDD1CXnDEKMBho7t9nkPBw5az4G47wARGA0WENeFPyVFzEfCZESyf46
	Qihg==
Received: by 10.213.2.134 with SMTP id 6mr806364ebj.241.1334585994580;
	Mon, 16 Apr 2012 07:19:54 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	x4sm87706985eef.10.2012.04.16.07.19.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 07:19:53 -0700 (PDT)
Date: Mon, 16 Apr 2012 15:19:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
Message-ID: <20120416141951.GA23177@stefanha-thinkpad.localdomain>
References: <1334580702-8416-1-git-send-email-edusf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334580702-8416-1-git-send-email-edusf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] spice-qemu-char.c: Show what name is
 unsupported
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
X-List-Received-Date: Mon, 16 Apr 2012 14:20:07 -0000

On Mon, Apr 16, 2012 at 09:51:42AM -0300, Eduardo Elias Ferreira wrote:
> 
> Signed-off-by: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
> ---
>  spice-qemu-char.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

