Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHahZ-0002Bm-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 09:01:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHahO-0001ha-RN
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHahI-0000S1-OA
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:01:30 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:45336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SHah6-0000Mt-OE; Tue, 10 Apr 2012 09:01:12 -0400
Received: by wibhn6 with SMTP id hn6so2968887wib.10
	for <multiple recipients>; Tue, 10 Apr 2012 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=noTqJtqReH41onkl1hSHj6pBsKYCQrmyKI/WIbRZE/A=;
	b=PjUeyD83kM2nBPDUI2/ukHk+gsrvJpah/qlpn0Pt1tA51kbcr6sMPeVd9F+ltyd0Yb
	+A8V0M1yEmMbb3AMtvTSrRn4QCGXYfAkF0+w6UHyCKGQQlNOAxNOIwT5yB3bXKt1qKEr
	Tpm5bmg3r7qmWJvWNCVLImtNPSeRdQ31E+ZTxY2xDxSuDENFH6uOxKdEC9Eccf5tLX0l
	Ktl6TLGpmjZU1fz89nq39c5Sm1xJUClhszVC3i5p/Wa7e+Sc/64ozXZOX5RGHuM2WyYe
	z592jKTdbNqU2IPNiXmiVnERqMEyOaIZAt9bdExs4Fe8L0wAtUPFhSbp0OLmrL2QuqyO
	eu2g==
Received: by 10.180.107.132 with SMTP id hc4mr6758763wib.21.1334062870037;
	Tue, 10 Apr 2012 06:01:10 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id k6sm37541004wiy.7.2012.04.10.06.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 06:01:09 -0700 (PDT)
Date: Tue, 10 Apr 2012 14:01:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120410130104.GC9094@stefanha-thinkpad.localdomain>
References: <1333740800-721-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333740800-721-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix wrong preprocessor
 statement
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
X-List-Received-Date: Tue, 10 Apr 2012 13:01:40 -0000

On Fri, Apr 06, 2012 at 09:33:20PM +0200, Stefan Weil wrote:
> #abort is not a preprocessor statement. It aborts, but the preprocessor
> statement #error is more common to abort a compilation.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

