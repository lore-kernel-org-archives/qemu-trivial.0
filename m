Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlK77-0001iz-Eo
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 08:18:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlK72-0001S4-Ph
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 08:18:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlK71-0006YO-Ft
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 08:18:20 -0400
Received: from e35.co.us.ibm.com ([32.97.110.153]:56944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1QlK71-0006Wl-A3; Mon, 25 Jul 2011 08:18:19 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6PBwo0S029162;
	Mon, 25 Jul 2011 05:58:50 -0600
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	p6PCGbDJ182886; Mon, 25 Jul 2011 06:16:37 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p6PCMAm2031245; Mon, 25 Jul 2011 06:22:10 -0600
Received: from [9.53.41.195] (dyn95341195.austin.ibm.com [9.53.41.195])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6PCMAL2031131; Mon, 25 Jul 2011 06:22:10 -0600
Message-ID: <4E2D5EA0.5020104@linux.vnet.ibm.com>
Date: Mon, 25 Jul 2011 07:16:32 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
	<CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
In-Reply-To: <CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.110.153
Cc: Alexandre Raymond <cerbere@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: fix out-of-tree builds
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
X-List-Received-Date: Mon, 25 Jul 2011 12:18:23 -0000

On 07/25/2011 05:15 AM, Stefan Hajnoczi wrote:
> On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond<cerbere@gmail.com>  wrote:
>> This patch fixes a minor bugs which prevented QEMU from being built
>> out of tree.
>>
>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>> ---
>>   Makefile |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> I don't normally use --source-path but it still seems broken to me
> after applying your patch?
>
> $ cd /tmp; mkdir out; cd out
> $ ~/qemu/configure --source-path=$HOME/qemu
> $ make
>    GEN   config-all-devices.mak
> cat: i386-softmmu/config-devices.mak: No such file or directory
> cat: x86_64-softmmu/config-devices.mak: No such file or directory
> cat: alpha-softmmu/config-devices.mak: No such file or directory
>
> Stefan
>

Works okay for me with and without the patch if I do a `make distclean` 
in $HOME/qemu beforehand.

Not sure what the trigger is for the breakage Alexandre is trying to 
address.

