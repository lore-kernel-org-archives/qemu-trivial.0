Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKYj-0005zs-3J
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:19:13 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKYc-0005cU-6P
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKYW-0007BR-Hl
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:19:06 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:35553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlKYN-0007Ap-Nv; Thu, 12 Jan 2012 08:18:51 -0500
Received: by eaak11 with SMTP id k11so695231eaa.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mxGUD0HfdHI0J2kUdC9/pMW8FQLkwadScofJVsiRP2k=;
	b=VDk+3pMPFDemxY8a1iqCGrLRJ/Yt2oqcrGBhPWaBkiYnZfeTqX83eVZdQ3vxrL6wj3
	sJh/y2TT5Xz0CuS0hXu05a09Hes3+tB+eNmUWnG+GXZN6bu0XGYH7kok52hKG6H4HYPb
	e62sHyM0lrTtoai4jZTVs/PNsFGEhvlRSRwHU=
Received: by 10.213.22.134 with SMTP id n6mr8441ebb.56.1326374330733;
	Thu, 12 Jan 2012 05:18:50 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	s16sm19451139eef.2.2012.01.12.05.18.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:18:50 -0800 (PST)
Date: Thu, 12 Jan 2012 13:18:48 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Message-ID: <20120112131848.GB22879@stefanha-thinkpad.localdomain>
References: <1325937599-12763-1-git-send-email-stefanha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325937599-12763-1-git-send-email-stefanha@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Andrzej Zaborowski <balrog@zabor.org>,
	qemu-devel@nongnu.org, Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] omap_dss: correct chip[1] index in
 RFBI_READ/RFBI_STATUS
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
X-List-Received-Date: Thu, 12 Jan 2012 13:19:12 -0000

On Sat, Jan 07, 2012 at 11:59:59AM +0000, Stefan Hajnoczi wrote:
> The RFBI_READ/RFBI_STATUS code incorrectly uses chip[0] when it should
> be using chip[1].  Andrzej Zaborowski <balrog@zabor.org> confirmed this
> bug since I don't know this code well.
> 
> Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> ---
>  hw/omap_dss.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

