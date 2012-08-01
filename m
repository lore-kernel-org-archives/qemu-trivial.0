Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwZYR-0008KT-T3
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 10:05:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwZYK-0007xm-Nw
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 10:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwZYG-0005N4-2n
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 10:05:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1SwZY7-0005Kt-Gx; Wed, 01 Aug 2012 10:05:19 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71E5H5s016495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 10:05:17 -0400
Received: from balrog.usersys.tlv.redhat.com (dhcp-4-121.tlv.redhat.com
	[10.35.4.121])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q71E5Fm4018805; Wed, 1 Aug 2012 10:05:16 -0400
Message-ID: <5019379B.5080206@redhat.com>
Date: Wed, 01 Aug 2012 17:05:15 +0300
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] exec.c: Remove out of date comment
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
X-List-Received-Date: Wed, 01 Aug 2012 14:05:38 -0000

On 08/01/2012 04:35 PM, Peter Maydell wrote:
> Remove an out of date comment: this comment used to be attached to
> cpu_register_physical_memory_log(), before commit 0f0cb164 accidentally
> inserted a couple of other functions between the comment and its function.
> It is in any case obsolete since (a) the function arguments it refers
> to have been replaced with a single MemoryRegionSection* argument and
> (b) the inability to handle regions whose offset_within_address_space
> and offset_within_region aren't equally aligned was fixed as part of
> the rewrite of this code.

(c) it doesn't use the conventional block comment style.

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Pretty sure my analysis is right and this comment is out of date --
> Avi, could you confirm that please?

Yes, you are correct.



-- 
error compiling committee.c: too many arguments to function

