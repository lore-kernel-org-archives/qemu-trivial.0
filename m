Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFfpH-0002RX-NC
	for mharc-qemu-trivial@gnu.org; Sun, 23 Sep 2012 02:37:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFfpF-0002KI-6f
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFfpE-0003FH-22
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:37:57 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:46074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFfpB-0003En-FF; Sun, 23 Sep 2012 02:37:53 -0400
Received: by wiwc10 with SMTP id c10so47590wiw.10
	for <multiple recipients>; Sat, 22 Sep 2012 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=UjIPzEaIpnLg6BdoGbz1+NVGbyNqApOg1PnpTpRNbt0=;
	b=j5QTvubijZM69vQCnRCe/rYEr2Fv4XTAPsshzL6aHOo2lKAeAA3C/Q8+qyzKEg0XZw
	eiSDXjj6jMknmk6MN5qcThLtBWp3M8tChOO7J0DBeoR4Jkwx2InS8imK6UihahosWrwb
	0LrE3ORFyvCb3lqJHX334ZlO2j1rz4uvquO302YVR/WT3olLJTtl3GHQel1GS+Yc5sFA
	ZHs2Rybvl6JOQDamcZy5nTBZaEgUyHDasfnGRh5IqpPKpIJh20CLoJ11qRf9yqY5fCrz
	pAunia7BIEdKQ45vdFka9GVSfSoaveQLtjk90iXJCHrQTz5vqrxWIpSLDp4H4VaKqDjc
	GCaQ==
Received: by 10.180.77.34 with SMTP id p2mr6888018wiw.0.1348382272135;
	Sat, 22 Sep 2012 23:37:52 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id k2sm8530975wiz.7.2012.09.22.23.37.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 23:37:51 -0700 (PDT)
Date: Sun, 23 Sep 2012 07:37:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120923063750.GA7597@stefanha-thinkpad.localdomain>
References: <1348341208-23260-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1348341208-23260-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] net/socket: Fix compiler warning
	(regression for MinGW)
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
X-List-Received-Date: Sun, 23 Sep 2012 06:37:58 -0000

On Sat, Sep 22, 2012 at 09:13:28PM +0200, Stefan Weil wrote:
> Commit 213fd5087e2e4e2da10ad266df0ba950cf7618bf removed a type cast
> which is needed for MinGW:
> 
> net/socket.c:136: warning:
>  pointer targets in passing argument 2 of ‘sendto’ differ in signedness
> /usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/include/winsock2.h:1313: note:
>  expected ‘const char *’ but argument is of type ‘const uint8_t *’
> 
> Add a 'qemu_sendto' macro which provides that type cast where needed
> and use the new macro instead of 'sendto'.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I hope the modifications are trivial enough to justify that I did not
> split this in two patches.
>  
> Regards
> 
> Stefan W.
> 
>  net/socket.c  |    6 +++---
>  qemu-common.h |    5 +++++
>  2 files changed, 8 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

