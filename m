Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmKmi-00045J-LR
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 05:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmKme-000417-41
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmKmX-0003Yy-LU
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:22:32 -0400
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:56172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmKmX-0003Y8-0o
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:22:25 -0400
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohankumar.m@gmail.com>;
	Tue, 11 Jun 2013 14:44:56 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 11 Jun 2013 14:44:55 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 0683C3940043;
	Tue, 11 Jun 2013 14:52:17 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r5B9M9CC28770546; Tue, 11 Jun 2013 14:52:09 +0530
Received: from d28av04.in.ibm.com (loopback [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r5B9ME8D011994; Tue, 11 Jun 2013 19:22:14 +1000
Received: from explorer.ibm.com (explorer.in.ibm.com [9.124.31.139])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r5B9MDcB011936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 11 Jun 2013 19:22:14 +1000
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51B63DBE.2010903@msgid.tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51B63DBE.2010903@msgid.tls.msk.ru>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/24.1.1
	(x86_64-redhat-linux-gnu)
Date: Tue, 11 Jun 2013 14:52:13 +0530
Message-ID: <87li6ht322.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13061109-5816-0000-0000-000008634A9D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.2
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] configure: explicitly disable
	virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 09:22:35 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 11.06.2013 00:47, Michael Tokarev wrote:
>> Or else
>> 
>>  ./configure --disable-system --enable-virtfs
>> 
>> (which makes no sense by its own but does not error out)
>> will fail to build, because it will define CONFIG_VIRTFS,
>> and the makefile will try to build virtfs-proxy-helper
>> manpage (but not the executable).
>
> The build fails in this case in a separate build tree, because
> the fsdev directory is not created and scripts/texi2pod.pl
> will be called with output = fsdev/virtfs-proxy-helper.pod,
> which can't be created because fsdev/ does not exist.
>

Hi,

I tried ./configure --disable-system --enable-virtfs and make. But didnt
face any build failure. Could you please share your build failure
information? virtfs-proxy-helper.1 is created inside the fsdev folder.

>> 
>> Cc: qemu-trivial@nongnu.org
>> Cc: M. Mohan Kumar <mohan@in.ibm.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  configure |    2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/configure b/configure
>> index a3f0b7a..0ff0380 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3423,6 +3423,8 @@ if test "$softmmu" = yes ; then
>>        tools="qemu-ga\$(EXESUF) $tools"
>>      fi
>>    fi
>> +else
>> +  virtfs=no
>>  fi
>>  
>>  # Mac OS X ships with a broken assembler
>> 


