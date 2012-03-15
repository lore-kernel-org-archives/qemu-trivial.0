Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S86Zn-0000ah-Uh
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 05:02:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86Zc-0008V9-8Q
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86ZC-00053S-KZ
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:15 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:41087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S86ZC-00052y-CM; Thu, 15 Mar 2012 05:01:50 -0400
Received: by werp12 with SMTP id p12so2972793wer.4
	for <multiple recipients>; Thu, 15 Mar 2012 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3NA6MGZEkJJBpEWE6Jqa38c8HwYLb4qpXDH9VuIpgA8=;
	b=iNRnE4pnZb70IqL5Yb/2XrjNrCRptI3US7yPpwBFakNxUrHgdn7bIsZK893WBESH9b
	5+LfqXaiq9kIKUm9KyLXyM6NgI8b+kXjSMgoS2zv1L2FjgTi9lmEEciTf2j9sBM4scuU
	dvLz5rcZN1NulsjnuOI9fQRe/T8dRMTvM/TtmunZ34U5uuWg34tknbG/Hifw1DhkWa8l
	ceugsXGKrO9pcHiurpF9SorLjZqRseLTH37AsV5JJ3h40HHYegAkCf2rL3EHUl5rUru6
	LoP5Q+X4I410GIZIs476mLvFc/vSKHFVhjFMUQT42dIVRE3LhnKOtY8tIi8wUUsDkU7m
	X77g==
Received: by 10.180.14.230 with SMTP id s6mr13710987wic.2.1331802107409;
	Thu, 15 Mar 2012 02:01:47 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id gp8sm3526898wib.5.2012.03.15.02.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 02:01:46 -0700 (PDT)
Date: Thu, 15 Mar 2012 08:17:03 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Yufei <cyfdecyf@gmail.com>
Message-ID: <20120315081703.GA14355@stefanha-thinkpad.localdomain>
References: <1331134603-73952-1-git-send-email-cyfdecyf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331134603-73952-1-git-send-email-cyfdecyf@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 15 Mar 2012 09:02:26 -0000

On Wed, Mar 07, 2012 at 11:36:43PM +0800, Chen Yufei wrote:
> Signed-off-by: Chen Yufei <cyfdecyf@gmail.com>
> ---
>  module.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

