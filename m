Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqhbF-0001ZF-Is
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 03:56:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Rqhb8-0001BH-2y
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 03:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Rqhb2-0002Ke-EF
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 03:55:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1Rqhav-0002K1-5a; Fri, 27 Jan 2012 03:55:41 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0R8tbMx008717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 03:55:38 -0500
Received: from lacos-laptop.usersys.redhat.com (dhcp-1-169.brq.redhat.com
	[10.34.1.169])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q0R8tasf023219; Fri, 27 Jan 2012 03:55:37 -0500
Message-ID: <4F2266D8.2020502@redhat.com>
Date: Fri, 27 Jan 2012 09:56:56 +0100
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111104 Red Hat/3.1.16-2.el6_1 Mnenhy/0.8.4
	Thunderbird/3.1.16
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1327613801-5828-1-git-send-email-lersek@redhat.com>
	<20120127063639.GA22748@stefanha-thinkpad.localdomain>
In-Reply-To: <20120127063639.GA22748@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] keep the PID file locked for the
 lifetime of the process
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
X-List-Received-Date: Fri, 27 Jan 2012 08:55:59 -0000

On 01/27/12 07:36, Stefan Hajnoczi wrote:
> On Thu, Jan 26, 2012 at 10:36:41PM +0100, Laszlo Ersek wrote:
>> The lockf() call in qemu_create_pidfile() aims at ensuring mutual
>> exclusion. We shouldn't close the pidfile on success, because that drops
>> the lock as well [1]:
>>
>>      "File locks shall be released on first close by the locking process
>>      of any file descriptor for the file."
>>
>> Coverity may complain again about the leaked file descriptor; let's
>> worry about that later.
>>
>> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html
>>
>> Signed-off-by: Laszlo Ersek<lersek@redhat.com>
>> ---
>
> Isn't the normal way to do pidfiles O_CREAT | O_EXCL?

Yes, it is.

> It may not work
> on all NFS versions but putting the pidfile on NFS doesn't really make
> sense.
>
> Then we can drop the lockf(3) completely.

When you rely on O_EXCL to ensure mutual exclusion, and an abruptly 
terminated process leaves the lockfile lying around, then the user has 
to clean it up manually before starting the next instance (and double 
check if the pid file is in fact stale or not). I'm personally OK with 
that, but I reckoned the qemu code tried to avoid that intentionally. 
Record locks can't remain stale when the process dies.

Laszlo

