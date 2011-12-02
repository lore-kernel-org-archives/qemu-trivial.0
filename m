Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWNrk-0007dm-ST
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 02:49:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RWNri-0007de-7Y
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RWNrh-0006FQ-A9
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 02:49:02 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:32837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RWNrh-0006FM-31; Fri, 02 Dec 2011 02:49:01 -0500
Received: by bkaq10 with SMTP id q10so660814bka.4
	for <multiple recipients>; Thu, 01 Dec 2011 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xbtMg0jyP+NCfbDIpZuZFFOqdFEBqKj/brbbkR1KNYs=;
	b=BeefVBYiBb/5WUP7qtY0czYJWJoahBUp0oluw3d1TQZMX0guaiyj0qReuUymIdIEdQ
	2P54R3JeGuI50xVrIXRDvARnsU8WFKCk558Y5dnpXFVynmAQuVnzK399zKnn4FyIgXJ3
	7RA0fs+fFlPRb3+1VxoBUozkSbhTX+7Glmlp0=
Received: by 10.204.157.156 with SMTP id b28mr10027740bkx.133.1322812139532;
	Thu, 01 Dec 2011 23:48:59 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-178-147.ip50.fastwebnet.it.
	[93.34.178.147])
	by mx.google.com with ESMTPS id h7sm16279684bkw.12.2011.12.01.23.48.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 23:48:56 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4ED882E2.6090709@redhat.com>
Date: Fri, 02 Dec 2011 08:48:50 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Stefan Weil <sw@weilnetz.de>
References: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
	<4ED87E29.1010207@linux.vnet.ibm.com>
	<4ED88173.2040505@weilnetz.de>
In-Reply-To: <4ED88173.2040505@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Li Zhi Hui <zhihuili@linux.vnet.ibm.com>,
	Mark Wu <wudxw@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-nbd.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 07:49:03 -0000

On 12/02/2011 08:42 AM, Stefan Weil wrote:
>>>
>>> -    if (sharing_fds[0] == -1)
>>> +    if (sharing_fds[0] == -1) {
>>> +        g_free(sharing_fds);
>>>           return 1;
>>> +    }
>>>
>>>       if (device) {
>>>           int ret;
>> Zhihui,
>>
>> Kernel should free all memory used by the process after it exits.  So
>> there's no memory leak even without explicit free.
>
> That's correct. Nevertheless fixing this helps to find other more important
> memory leaks with static or dynamic code analyzers like cppcheck or
> valgrind.
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Please hold off, I'm about to introduce large changes to qemu-nbd for 
asynchronous I/O (including getting rid of sharing_fds in favor of the 
main loop) and and I'd rather avoid gratuitous conflicts.

Paolo

