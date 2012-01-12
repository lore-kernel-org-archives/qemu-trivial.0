Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlL4m-0002X2-7L
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:52:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL4e-00028u-T1
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:52:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL4Z-0004Yg-B8
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:52:12 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:40380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlL4P-0004Xj-5O; Thu, 12 Jan 2012 08:51:57 -0500
Received: by eaak11 with SMTP id k11so709058eaa.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gJYsoXffwIVed+7yX0NHYNKFLdndbwyij5OISapfm40=;
	b=OKGr2e29qJELSCQsMX+RxBE+yjyauoMDoN1Kj7tbL37wd9DhH+kWOzW4nhzNTNx2Du
	w03slK13UJasP1HngggkZjBAaywIpOAQf8GDtu0Ept+YoL1hiXUXfddYppo1a5GaG0Tw
	PqvYOIXA/RYV+SQBYYr3rHcSbUCCdXKUKyQfQ=
Received: by 10.213.22.146 with SMTP id n18mr767230ebb.0.1326376316131;
	Thu, 12 Jan 2012 05:51:56 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id t1sm19765299eeb.3.2012.01.12.05.51.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:51:55 -0800 (PST)
Date: Thu, 12 Jan 2012 13:51:50 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120112135150.GB23222@stefanha-thinkpad.localdomain>
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
X-List-Received-Date: Thu, 12 Jan 2012 13:52:18 -0000

On Wed, Jan 11, 2012 at 07:34:28PM +0100, Stefan Weil wrote:
> Obviously most Linux host systems don't have a libcap-dev package.
> 
> If this package is available, make tries to build virtfs-proxy-helper
> and fails on recent Linux distributions because of a missing attr/xattr.h.
> 
> The first patch fixes this. As I noticed that several include statements
> were redundant, I added the second patch which is optional but cleans
> the code a little bit.
> 
> Please consider adding libcap-dev to the Linux build bots (and of course
> to the personal Linux environment when you are a maintainer).
> 
> Regards,
> Stefan Weil
> 
> [PATCH 1/2] virtfs-proxy-helper: Fix compilation on newer systems
> [PATCH 2/2] virtfs-proxy-helper: Clean include files
> 

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

