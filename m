Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkE6U-0000qj-OI
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2012 07:13:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE6O-0000SY-AQ
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:13:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE6I-0005v3-Hs
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:13:24 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:54850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RkE68-0005uT-I2; Mon, 09 Jan 2012 07:13:08 -0500
Received: by eaad1 with SMTP id d1so2086153eaa.4
	for <multiple recipients>; Mon, 09 Jan 2012 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KKFo5GjDFNNfG0vMWJrYt5lUnWGEO3R8vXNiWaWBpFQ=;
	b=LVctWEb/wvH5Yz5noFbZi6ss9ofIZ+Ke1QCoHQgfhJWyWtXyzwyUPSHzZsBA0cMATZ
	LmIpchGuGX0sDdmxuF7tT7yA4SS2Fd9cO/yzicn34AGvblcKnza3d0Tpfi0gNeyQncR+
	yQHAZSsT1SlXmp5pVSTPDylZuNJ1rMYj9p0ZQ=
Received: by 10.213.19.143 with SMTP id a15mr3210987ebb.32.1326111187743;
	Mon, 09 Jan 2012 04:13:07 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	a60sm290133712eeb.4.2012.01.09.04.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 04:13:06 -0800 (PST)
Date: Mon, 9 Jan 2012 12:13:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120109121305.GA14603@stefanha-thinkpad.localdomain>
References: <1325713636-31975-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325713636-31975-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Modify detection of supported
 warning options
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
X-List-Received-Date: Mon, 09 Jan 2012 12:13:28 -0000

On Wed, Jan 04, 2012 at 10:47:16PM +0100, Stefan Weil wrote:
> Reversing the order of the warning options and -Werror is important
> when clang is used instead of gcc. It changes nothing for gcc.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

