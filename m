Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlLgj-0002fM-Hj
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 09:59:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlLgh-0002f8-AQ
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 09:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlLgf-0004TJ-Oz
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 09:59:15 -0400
Received: from e3.ny.us.ibm.com ([32.97.182.143]:49160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1QlLgf-0004SK-Jt; Mon, 25 Jul 2011 09:59:13 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e3.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6PDZYrh010277;
	Mon, 25 Jul 2011 09:35:34 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6PDvteC1425522; Mon, 25 Jul 2011 09:57:55 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6PDvrC4022829; Mon, 25 Jul 2011 10:57:54 -0300
Received: from [9.53.41.195] (dyn95341195.austin.ibm.com [9.53.41.195])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6PDvreD022785; Mon, 25 Jul 2011 10:57:53 -0300
Message-ID: <4E2D7660.8080406@linux.vnet.ibm.com>
Date: Mon, 25 Jul 2011 08:57:52 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
	<CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
	<4E2D5EA0.5020104@linux.vnet.ibm.com>
	<CAJSP0QXUzpBLaYhvc3T-ArMaiZ7cxoo4ZsbDDrR8kjEq03P1cQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXUzpBLaYhvc3T-ArMaiZ7cxoo4ZsbDDrR8kjEq03P1cQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.143
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
X-List-Received-Date: Mon, 25 Jul 2011 13:59:16 -0000

On 07/25/2011 07:43 AM, Stefan Hajnoczi wrote:
> On Mon, Jul 25, 2011 at 1:16 PM, Michael Roth<mdroth@linux.vnet.ibm.com>  wrote:
>> On 07/25/2011 05:15 AM, Stefan Hajnoczi wrote:
>>>
>>> On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond<cerbere@gmail.com>
>>>   wrote:
>>>>
>>>> This patch fixes a minor bugs which prevented QEMU from being built
>>>> out of tree.
>>>>
>>>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>>>> ---
>>>>   Makefile |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> I don't normally use --source-path but it still seems broken to me
>>> after applying your patch?
>>>
>>> $ cd /tmp; mkdir out; cd out
>>> $ ~/qemu/configure --source-path=$HOME/qemu
>>> $ make
>>>    GEN   config-all-devices.mak
>>> cat: i386-softmmu/config-devices.mak: No such file or directory
>>> cat: x86_64-softmmu/config-devices.mak: No such file or directory
>>> cat: alpha-softmmu/config-devices.mak: No such file or directory
>>>
>>> Stefan
>>>
>>
>> Works okay for me with and without the patch if I do a `make distclean` in
>> $HOME/qemu beforehand.
>>
>> Not sure what the trigger is for the breakage Alexandre is trying to
>> address.
>
> You are right that make distclean in the source directory solves the issue.
>
> Intuitively I expect ./configure to re-wire things, make distclean
> should not be necessary.
>
> Alexandre: Can you describe the case where you hit a build issue in more detail?
>
> Stefan

The root problem seems to be that by including $(SRC_DIR) in VPATH (via 
$(call set-vpath, $(SRC_PATH):$(SRC_PATH)/hw)), $(SRC_DIR) ends up being 
searched for source files as well as target dependencies. So any crud 
left in there can still satisfy dependencies when building outside 
$SRC_PATH. I'm not sure there's a simple way around this except to 
prefix all source files with $(SRC_PATH) and remove $(SRC_PATH) from 
VPATH...I'm not even sure that would work though..

Perhaps just a friendly error message if we detect the $(SRC_PATH) 
directory needs a distclean? Once you know that's the magic fix it's not 
terribly inconvenient....alternatively we could automatically do the 
distclean in $SRC_PATH but that might be considered overstepping our bounds.

Consequently, it seems like this patch would be a noop...default-configs 
should never exist in an external build directory, so 
$(SRC_PATH)/default-configs and default-configs end up being equivalent 
when make eventually find it in $(SRC_PATH).

