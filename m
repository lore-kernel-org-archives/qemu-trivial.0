Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qobmx-0004OT-L4
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2011 09:47:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Qobmv-0004ND-1f
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 09:47:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Qobmp-00022v-Vw
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 09:47:09 -0400
Received: from e2.ny.us.ibm.com ([32.97.182.142]:39097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1Qobmp-00022c-Ro; Wed, 03 Aug 2011 09:47:03 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e2.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p73DPaVt003782;
	Wed, 3 Aug 2011 09:25:36 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p73Dl1Er166760; Wed, 3 Aug 2011 09:47:01 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p73Dku9H024606; Wed, 3 Aug 2011 09:46:58 -0400
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p73Dkumf024565; Wed, 3 Aug 2011 09:46:56 -0400
Message-ID: <4E39514F.6080200@linux.vnet.ibm.com>
Date: Wed, 03 Aug 2011 09:46:55 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
	<CAJSP0QXvArm0_j0MgsJ2=nJWuGTGSMVTNbPBZYO5S+VuUY-uwA@mail.gmail.com>
In-Reply-To: <CAJSP0QXvArm0_j0MgsJ2=nJWuGTGSMVTNbPBZYO5S+VuUY-uwA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.142
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] Check fread() results to avoid gcc 4.6
 warnings
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
X-List-Received-Date: Wed, 03 Aug 2011 13:47:09 -0000

On 08/01/2011 06:19 AM, Stefan Hajnoczi wrote:
> On Mon, Aug 1, 2011 at 7:49 AM, David Gibson
> <david@gibson.dropbear.id.au>  wrote:
>> When compiling with gcc 4.6, some code in fw_cfg.c complains that fop_ret
>> is assigned but not used (which is true).  However, it looks like the
>> meaningless assignments to fop_ret were done to suppress other gcc warnings
>> due to the fact that fread() is labelled as warn_unused_result in glibc.
>>
>> This patch avoids both errors, by actually checking the fread() result code
>> and dropping out with an error message if it fails.
>>
>> Signed-off-by: David Gibson<david@gibson.dropbear.id.au>
>> ---
>>   hw/fw_cfg.c |   13 +++++++++++++
>>   1 files changed, 13 insertions(+), 0 deletions(-)
> Reviewed-by: Stefan Hajnoczi<stefanha@linux.vnet.ibm.com>
>
Tested-by: Stefan Berger <stefanb@linux.vnet.ibm.com>


