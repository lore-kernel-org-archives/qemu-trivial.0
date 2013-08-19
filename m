Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBQ3G-0003AN-0y
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 10:03:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBOfM-0004bR-9A
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 08:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBOfD-00046B-Os
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 08:34:36 -0400
Received: from e32.co.us.ibm.com ([32.97.110.150]:44757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBOfD-00045n-JG
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 08:34:27 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mrhines@linux.vnet.ibm.com>;
	Mon, 19 Aug 2013 06:34:26 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 19 Aug 2013 06:34:23 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id B7ABB3E40045;
	Mon, 19 Aug 2013 06:33:58 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r7JCYMRq193376; Mon, 19 Aug 2013 06:34:22 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r7JCYMGe013152; Mon, 19 Aug 2013 06:34:22 -0600
Received: from [172.16.1.222] (klinux.watson.ibm.com [9.2.208.21])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r7JCYLHg013098; Mon, 19 Aug 2013 06:34:21 -0600
Message-ID: <521210CD.8080600@linux.vnet.ibm.com>
Date: Mon, 19 Aug 2013 08:34:21 -0400
From: "Michael R. Hines" <mrhines@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
	<5211E5D2.9060903@redhat.com>
In-Reply-To: <5211E5D2.9060903@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13081912-5406-0000-0000-00000B95BFC2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.150
X-Mailman-Approved-At: Mon, 19 Aug 2013 10:03:20 -0400
Cc: yamahata@private.email.ne.jp, aliguori@us.ibm.com, quintela@redhat.com,
	qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	owasserm@redhat.com, mrhines@us.ibm.com
Subject: Re: [Qemu-trivial] [PATCH for-1.6] rdma: silly ipv6 bugfix
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
X-List-Received-Date: Mon, 19 Aug 2013 12:34:44 -0000

On 08/19/2013 05:30 AM, Paolo Bonzini wrote:
> Il 19/08/2013 04:27, mrhines@linux.vnet.ibm.com ha scritto:
>> From: "Michael R. Hines" <mrhines@us.ibm.com>
>>
>> My bad - but it's very important for us to warn the user that
>> IPv6 is broken on RoCE in linux right now, until linux releases
>> a fixed version.
> 1.6 has sailed already, so the right thing to do now is to add a
>
> Cc: qemu-stable@nongnu.org
>
> tag before Signed-off-by.  This will ensure that the patch will be
> considered for 1.6.1.
>
> I have already CCed the mailing list on this message, so there is
> nothing you need to do for this particular patch.
>
> Paolo

Understood. Thank you.

- Michael


