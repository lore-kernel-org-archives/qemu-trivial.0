Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVgWt-0006P2-LR
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 07:09:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgWr-0006Lw-Dn
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgWq-0005so-BO
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:09:25 -0400
Received: from mail-bk0-x22f.google.com ([2a00:1450:4008:c01::22f]:38929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgWq-0005ry-45
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:09:24 -0400
Received: by mail-bk0-f47.google.com with SMTP id ji1so1631840bkc.20
	for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2013 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=W8zPCSRodcDsRYU1nvjRe50Jx16CslrUM0w+g3fnhrc=;
	b=U9I+9basR7ZFq/dSwRwi18m583ijSGAltbcUye2SP5TBrcKKBxoI8sAr2evee73Ko2
	meQA2VGEPb1qbHLmXBrAG5rIRHSTw6/rhIH54XJg8xSQY36XKFkL4oo1elzFPaNukVQ6
	PN8apD8wQjTBH2axksUhatX+T155NlNxQRlwl+jUZOjXj46C8WcyjdoBx2Sb9/XlD++X
	mC0NHAPXUmLyiWDr2cLxhRjpv/PpaD2Bkto65F6NpQNrLon8nHhT40GeAldUhMEUCLv5
	aSAsgORo5oQfoxAHCNY4O7Ayki6ONLe3njRem13wVMH5jDjLtU6OHeZ5jyfRcEK42SFk
	IYFA==
X-Received: by 10.205.104.8 with SMTP id dk8mr18220435bkc.34.1366974563302;
	Fri, 26 Apr 2013 04:09:23 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id rm3sm3000492bkb.20.2013.04.26.04.09.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 04:09:22 -0700 (PDT)
Date: Fri, 26 Apr 2013 13:09:20 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20130426110920.GA28416@stefanha-thinkpad.hitronhub.home>
References: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22f
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Track change in FreeBSD SYSCTL(9) types
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
X-List-Received-Date: Fri, 26 Apr 2013 11:09:26 -0000

On Thu, Apr 25, 2013 at 01:59:41PM -0400, Ed Maste wrote:
> Originally from Garrett Cooper in FreeBSD PR ports/155558
> http://www.freebsd.org/cgi/query-pr.cgi?pr=155558
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/syscall.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

