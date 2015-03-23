Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZx32-0004hj-Th
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2015 03:45:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YZx30-0004gH-SG
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 03:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YZx2z-0004FE-U0
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 03:45:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YZx2p-00047m-M7; Mon, 23 Mar 2015 03:45:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7090EAE5D5;
	Mon, 23 Mar 2015 07:45:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2N7j3jF021502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 23 Mar 2015 03:45:04 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 745673040D0B; Mon, 23 Mar 2015 08:45:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1426869044-21338-1-git-send-email-eblake@redhat.com>
	<550C5229.9030108@weilnetz.de>
Date: Mon, 23 Mar 2015 08:45:02 +0100
In-Reply-To: <550C5229.9030108@weilnetz.de> (Stefan Weil's message of "Fri, 20
	Mar 2015 18:00:25 +0100")
Message-ID: <87oankuphd.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [for-2.3 PATCH v2] gitignore:
	Ignore more .pod files.
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
X-List-Received-Date: Mon, 23 Mar 2015 07:45:19 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 20.03.2015 um 17:30 schrieb Eric Blake:
>> kvm_stat.{1,pod} started showing up as untracked files in my
>> directory, and I nearly accidentally merged them into a commit
>> with my usual habit of 'git add .'.  Rather than spelling out
>> each such file, just ignore the entire pattern.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> CC: qemu-trivial@nongnu.org
>> ---
>>
>> v2: fix man page pattern
>>
>>   .gitignore | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index e32a584..aed0e1f 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -37,14 +37,8 @@
>>   /qemu-tech.html
>>   /qemu-doc.info
>>   /qemu-tech.info
>> -/qemu.1
>> -/qemu.pod
>> -/qemu-img.1
>> -/qemu-img.pod
>>   /qemu-img
>>   /qemu-nbd
>> -/qemu-nbd.8
>> -/qemu-nbd.pod
>>   /qemu-options.def
>>   /qemu-options.texi
>>   /qemu-img-cmds.texi
>> @@ -56,8 +50,7 @@
>>   /qmp-commands.txt
>>   /vscclient
>>   /fsdev/virtfs-proxy-helper
>> -/fsdev/virtfs-proxy-helper.1
>> -/fsdev/virtfs-proxy-helper.pod
>> +*.[1-9]
>>   *.a
>>   *.aux
>>   *.cp
>> @@ -70,6 +63,7 @@
>>   *.ky
>>   *.log
>>   *.pdf
>> +*.pod
>>   *.cps
>>   *.fns
>>   *.kys
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> What about only supporting out-of-tree builds for future versions of QEMU?
> .gitignore could be reduced to a few lines then.

Yes, please!  Could you prep a patch?

