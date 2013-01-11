Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tta35-0003p9-9m
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:33:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tta2z-0003nn-Oc
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tta2w-0001Q3-8Z
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:33:05 -0500
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tta2w-0001Pz-2R; Fri, 11 Jan 2013 03:33:02 -0500
Received: by mail-wi0-f176.google.com with SMTP id hm6so1777983wib.9
	for <multiple recipients>; Fri, 11 Jan 2013 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6trK5g/l4NOZhaHhNOFOmk7HeuuQidOwDc3nVJIlI0Q=;
	b=lKy5pGDNHsZMrbEgUoRHvxbEk6LR9fFsF1zCfC2pr85DmuRvtzmXtcJySC/c11NYLh
	ouqh4FRbxHNi+pVrxX6a77s+RdVyIVNRv7Jd2uo3pAY4WaoS7WLoKGUN67EcoVwSwcmS
	9t104QV9vVDejstTiiPqPH5i1W9oHUWhdpbtR66gg58/I5lwJuni1KODMXp4VSPBPD8C
	AyxLuy30FB6oFNGSiWTV9j4zGD/vzkCT4KFXqcT2VUeAsrLBzUR5n5h6p1NSDyV2nFsn
	yHHwz604yDH2x7W4yr+tog034DBNP/8V0jg1reEaYc/Ygznya/zq000O7wTIgqE6TNRc
	Rq7g==
X-Received: by 10.180.95.228 with SMTP id dn4mr13903482wib.16.1357893181089;
	Fri, 11 Jan 2013 00:33:01 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id ew4sm6110661wid.11.2013.01.11.00.32.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:33:00 -0800 (PST)
Date: Fri, 11 Jan 2013 09:32:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130111083258.GA23656@stefanha-thinkpad.muc.redhat.com>
References: <1357384658-4160-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357384658-4160-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.176
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix comment (copy+paste bug)
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
X-List-Received-Date: Fri, 11 Jan 2013 08:33:09 -0000

On Sat, Jan 05, 2013 at 12:17:38PM +0100, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

