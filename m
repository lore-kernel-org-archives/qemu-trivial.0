Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9aMO-0002Ui-16
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 07:02:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9aML-0002U6-A8
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9aLx-0002Md-K4
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:02:40 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:65150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9aLx-0002LW-BG; Mon, 19 Mar 2012 07:02:17 -0400
Received: by wibhm17 with SMTP id hm17so3094474wib.4
	for <multiple recipients>; Mon, 19 Mar 2012 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WGieTSZ45HKIQZ76UxKPbvQP35etSISeA5Q2ho3xVlU=;
	b=ssBkh8fhgco4bVlb4mTQm2o3xX8rnb50Jq9+Zk+ZhIUddkiikeBzlrErMn2FBaxgGn
	MvW7UDb8yTUcbYE+R3oQgarOVHlDPOjO9hRorOMTx4abTggQxVKdbuC+L9zWJVBZQGHi
	CkJbHEwzKEiDeKB/SD1rhZn0sTdcYNJe/3DjgdNf9UEv/DuckJF75E80dCPCz2QarYKc
	jctPEqJr4c2vXOemcQsddet58NC6pucnPKxf+MNL4V5K18o9Afld8rXqlZ7WvvoW1Cik
	J58PKdJxjg4Sn46WlQayKdbxq3XUEZHeR+Mr58IZxPcCLcputS+QZhmptebwPC4dH2fi
	Y4yg==
Received: by 10.216.52.14 with SMTP id d14mr6590497wec.35.1332154934487;
	Mon, 19 Mar 2012 04:02:14 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	fn2sm26774675wib.0.2012.03.19.04.02.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 04:02:13 -0700 (PDT)
Date: Mon, 19 Mar 2012 11:02:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120319110212.GB30033@stefanha-thinkpad.localdomain>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.169
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove unused inline
	function
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
X-List-Received-Date: Mon, 19 Mar 2012 11:02:42 -0000

On Sat, Mar 17, 2012 at 01:00:51PM +0100, Stefan Weil wrote:
> Function set_HILO is not needed anywhere.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-mips/op_helper.c |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

