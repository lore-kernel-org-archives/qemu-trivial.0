Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzrMJ-0001dn-2B
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2013 11:14:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TzrME-0001dX-6Q
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 11:14:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TzrM4-0000WB-JW
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 11:14:54 -0500
Received: from e36.co.us.ibm.com ([32.97.110.154]:48378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TzrM4-0000Vv-DA
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 11:14:44 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Mon, 28 Jan 2013 09:14:43 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 28 Jan 2013 09:14:42 -0700
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id A55EA19D8052;
	Mon, 28 Jan 2013 09:14:25 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r0SGEEw3119062; Mon, 28 Jan 2013 09:14:15 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r0SGECr0016862; Mon, 28 Jan 2013 09:14:13 -0700
Received: from titi.na.relay.ibm.com ([9.80.39.67])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r0SGE6Od016101; Mon, 28 Jan 2013 09:14:08 -0700
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
In-Reply-To: <20130128131438.GF27668@stefanha-thinkpad.redhat.com>
References: <5101BDFD.5010801@linux.vnet.ibm.com>
	<20130128131438.GF27668@stefanha-thinkpad.redhat.com>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 28 Jan 2013 10:14:05 -0600
Message-ID: <87y5fdi8tu.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13012816-7606-0000-0000-000007CE6EEB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.154
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][TRIVIAL] vl: coding style
	cleanups
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
X-List-Received-Date: Mon, 28 Jan 2013 16:14:58 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Thu, Jan 24, 2013 at 05:04:29PM -0600, Jesse Larrew wrote:
>> 
>> Reformat the option parsing code in main() and various supporting functions
>> to conform to the QEMU coding style.
>> 
>> Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
>> ---
>>  vl.c | 476 +++++++++++++++++++++++++++++++++++++------------------------------
>>  1 file changed, 260 insertions(+), 216 deletions(-)
>
> Please CC qemu-trivial@nongnu.org on trivial patches in the future.
>
> There has been discussion about whitespace cleanups recently and it also
> applies to this patch.  There is a cost to such patches - they require
> code review, can clog up the git-blame(1) output, and make it hard for
> stable branch or downstream maintainers to backport fixes.
>
> I'm happy to take this patch but I hope people don't get too
> trigger-happy because this isn't free.
>
> Waiting a while longer to merge in case Blue Swirl or anyone else wants
> to chime in.

Before the patch:

total: 75 errors, 125 warnings, 4230 lines checked

After the patch:

total: 59 errors, 67 warnings, 4274 lines checked

This feels like unnecessary churn to me.  If the patch was taking vl.c
to 0 errors, I'd be more inclined to pay the cost.  But I don't want
there to be 3-4 patches that break blame just to get a single file into
compliance.

Regards,

Anthony Liguori

>
> Stefan


