Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlL5o-0004IK-01
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:53:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL5h-0003v7-Mj
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:53:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL5d-0004db-Gm
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:53:17 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:63434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlL5T-0004b8-S2; Thu, 12 Jan 2012 08:53:03 -0500
Received: by mail-ey0-f173.google.com with SMTP id k11so709416eaa.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=knm1NvvDb1Whdi1phz8aDGEvcQaw98Vy5nG34d2ZfpU=;
	b=Iv7TQDGJyc7566cPY8WUdCIL2nsLHA+ZXViuCBQi4nEuVKk2h31qZuPslG9HNsN9q7
	Sr4w9Hd/OnIhmVNO8bcXOsJzptkUyCtqn1N7+PFXu7mGZQnEZsrmJ3AdJrTC9L23M06c
	Pp6DKDP/zVWBW/e07FAvRXi+AivNcCw+fP7EM=
Received: by 10.213.16.82 with SMTP id n18mr45088eba.2.1326376383348;
	Thu, 12 Jan 2012 05:53:03 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	x43sm19723743eef.8.2012.01.12.05.53.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:53:02 -0800 (PST)
Date: Thu, 12 Jan 2012 13:53:01 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120112135301.GD23222@stefanha-thinkpad.localdomain>
References: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] virtfs-proxy-helper:
 Fix and clean include statements
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
X-List-Received-Date: Thu, 12 Jan 2012 13:53:21 -0000

On Wed, Jan 11, 2012 at 07:34:28PM +0100, Stefan Weil wrote:
> Please consider adding libcap-dev to the Linux build bots (and of course
> to the personal Linux environment when you are a maintainer).

I have added it to yuzuki.

Stefan

