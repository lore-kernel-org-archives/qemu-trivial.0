Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Svsbt-0007wW-O7
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2012 12:14:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Svsbm-0007uc-Kg
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:14:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Svsbg-00052K-Qv
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:14:14 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:42393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Svsbg-00052B-JV; Mon, 30 Jul 2012 12:14:08 -0400
Received: by wgbfm10 with SMTP id fm10so3990091wgb.10
	for <multiple recipients>; Mon, 30 Jul 2012 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xj6smewYWiZ83+he3dxlHWrS0KP1j3HLKzAnZ5uAYkQ=;
	b=M3u9cRt8uWOmECFS6LaQbkcjROKUVucCWLI6FagInpLOQoOW0NrB5/a5KNxaQVTEGS
	pQyexdBw0m6uZR+94FNT8nTeIO/DYfEeRhmvHWN0TUqXNT44S6rTnYXIaGS4fqMM/cZy
	jOnKxYKxjGi2SMrykEFMitZsnmMgw5ZKF6f2iVZaNzGKdh4EY+R1lPh5maPQA20k+J+g
	w5sJz1ekOqIx6H9jQj9Nhy/e4c03TnqaxGsLyPd+8BT+XjfUXoQtButSenHLpDRo6pWA
	nMo5gTcrQ2c1zjbYwv70EfVSyRZA6DnQ8sPzbja4/lWdPXjItcSkJ9kZhQ+8eTscvuJC
	R+Ww==
Received: by 10.216.67.8 with SMTP id i8mr6255452wed.9.1343664847646;
	Mon, 30 Jul 2012 09:14:07 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	ex20sm25215546wid.7.2012.07.30.09.14.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 09:14:07 -0700 (PDT)
Date: Mon, 30 Jul 2012 17:14:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20120730161405.GA21719@stefanha-thinkpad.localdomain>
References: <500D3923.7060306@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <500D3923.7060306@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/2] usb: Clean common object and
 dependency files
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
X-List-Received-Date: Mon, 30 Jul 2012 16:14:20 -0000

On Mon, Jul 23, 2012 at 01:44:35PM +0200, Jan Kiszka wrote:
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

