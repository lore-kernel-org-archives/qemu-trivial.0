Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd0WC-0000s4-4H
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 14:04:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd0W9-0000oV-G8
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd0W0-0004WY-F5
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:04:01 -0400
Received: from e31.co.us.ibm.com ([32.97.110.149]:52195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd0W0-0004WI-7c
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:03:52 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 12:03:51 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 12:03:49 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com
	(b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id DCD2B3E40047;
	Tue, 31 Mar 2015 12:03:48 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VI3mRg35586098; Tue, 31 Mar 2015 11:03:48 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VI3mwd002391; Tue, 31 Mar 2015 12:03:48 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VI3lc5002322; Tue, 31 Mar 2015 12:03:48 -0600
Message-ID: <551AE183.10609@linux.vnet.ibm.com>
Date: Tue, 31 Mar 2015 14:03:47 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org
References: <1427814318-541552-1-git-send-email-stefanb@linux.vnet.ibm.com>
	<551AD054.40802@redhat.com>
In-Reply-To: <551AD054.40802@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033118-8236-0000-0000-00000A7A9D1F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.149
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tpm_tis: fix format for
	64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 18:04:02 -0000

On 03/31/2015 12:50 PM, Eric Blake wrote:
> On 03/31/2015 09:05 AM, Stefan Berger wrote:
>> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> ---
>>   hw/tpm/tpm_tis.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Reviewed-by: Eric Blake <eblake@redhat.com>

Then let me withdraw this one and fix it as you suggested now.

     Stefan


