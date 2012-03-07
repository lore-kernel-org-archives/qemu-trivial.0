Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Epg-0000ap-5F
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 06:15:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5EpG-0000ZP-QJ
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:14:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5Ep9-00081C-US
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:14:34 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:53048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5Ep9-0007yH-Lw
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:14:27 -0500
Received: by wgbfm10 with SMTP id fm10so4206149wgb.10
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 03:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Of1k7KwzPWsR04rLBFZmMgeAJZniuW/wwZKVtzVhtGk=;
	b=z+cfyP8APGQrHfWF6KJNN0CEMCGtOAxOHNAEr3+QbKVEdpDknRybSkU+268ieoQ/cY
	egODO82MwkdMSAW7uK8jYxuGwWbnDNXu3G3MzuxB1/evWgtfYk1iAupwQublBLvrbaOW
	EOKDJekPaAKu+Ss+Q/vCWK2frO5PS1cVTgehkH24dtzGA9YrFhXRLhCKrdk8DU25IE4Z
	1ORSzhIj9GKVzRDNW3qi1M+j7je9EBHMRMHYzmbUvcPQ0xTDfH1wwQXFl2Y3GTXRul54
	qWrZf0EmP6cROdvvfV9Ad4fvN1IWjAyE63UnWbXxm1/qYJjq5iOFFkUEfbEkWnRWvpSN
	oImg==
Received: by 10.180.87.100 with SMTP id w4mr2977076wiz.22.1331118865626;
	Wed, 07 Mar 2012 03:14:25 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fl2sm93704406wib.4.2012.03.07.03.14.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 03:14:25 -0800 (PST)
Date: Wed, 7 Mar 2012 11:14:22 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Yufei <cyfdecyf@gmail.com>
Message-ID: <20120307111422.GA314@stefanha-thinkpad.localdomain>
References: <y>
 <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove type field in ModuleEntry as it's
 not used.
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
X-List-Received-Date: Wed, 07 Mar 2012 11:14:58 -0000

On Tue, Mar 06, 2012 at 09:24:45PM +0800, Chen Yufei wrote:
> ---
>  module.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Please add your Signed-off-by: line.  For more info see
http://wiki.qemu.org/Contribute/SubmitAPatch.

Otherwise it looks fine.

