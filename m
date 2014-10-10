Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcOvT-0002C9-J9
	for mharc-qemu-trivial@gnu.org; Thu, 09 Oct 2014 21:23:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcOvI-00020E-Qy
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 21:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcOv9-0004wK-Nk
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 21:23:12 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:52115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcOuq-0004d0-0P; Thu, 09 Oct 2014 21:22:44 -0400
Received: by mail-pa0-f54.google.com with SMTP id ey11so724200pad.27
	for <multiple recipients>; Thu, 09 Oct 2014 18:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mle9yYDuK4IZvi4qh+P5nlEJYYzX+pZTeX5aQZMNnJ4=;
	b=AXby/FT5s05Cx57tyVny1ERNhG1dtkTu7NTil5Webgy6PTxOKcHjctKOTYVp8THu22
	5F5zctAIeqXfZDvxUPAVmNw9itqLrqyA+aP/+0NpkJgHwbB51IT0JglyZt/D35vNw+dG
	7kpiE5I+9jFo/n3GAmUcURGtbTrOtJ9f3UPrGrdIzZGxPe1EgyQXIIU2gP9g8yz6wsuM
	DyXxnBR40XbCNCxVID6cxxJRAmiJQrwYgHOhJ1CopW/errFsS/j+rLk1e8bYrw4Rsszx
	f1JAYyb1C7zoRLiGwTVS0v7Xfv47e4PT4KffMmO86qgNyCdyGylxCMfiuQMLA/xA6L3y
	UN5A==
X-Received: by 10.70.88.197 with SMTP id bi5mr1727376pdb.80.1412904162138;
	Thu, 09 Oct 2014 18:22:42 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([1.202.59.152])
	by mx.google.com with ESMTPSA id qj2sm1662636pbc.78.2014.10.09.18.22.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Oct 2014 18:22:41 -0700 (PDT)
Message-ID: <54373639.4010005@gmail.com>
Date: Fri, 10 Oct 2014 09:28:25 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, peter.maydell@linaro.org, 
	"rth@twiddle.net" <rth@twiddle.net>
References: <54369514.5000004@gmail.com> <5436A1AA.8020004@redhat.com>
In-Reply-To: <5436A1AA.8020004@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
 disas/libvixl/a64/instructions-a64.h: Remove useless varialbe to avoid
 building break with '-Werror'
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
X-List-Received-Date: Fri, 10 Oct 2014 01:23:22 -0000

On 10/9/14 22:54, Eric Blake wrote:
> On 10/09/2014 08:00 AM, Chen Gang wrote:
> 
> That's a very long subject line.  Try to keep subjects around 60
> characters or so ('git shortlog -30' can give you an idea of reasonable
> subjects).

OK, thanks, I shall notice about it next (also let 'git shortlog -30' as
reference).

>             Also, s/varialbe/variable/ in the subject.
> 
>> The related variables are useless, need be removed, or can not pass

OK, thanks. If this patch can still continue (pass checking), I shall
send patch v2 for it.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

