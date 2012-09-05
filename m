Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9IO5-0006aX-KG
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 12:23:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9INy-0006Zq-NP
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T9INx-00024I-DR
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:23:26 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:37292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1T9INw-000243-U7; Wed, 05 Sep 2012 12:23:25 -0400
Received: by pbbjt11 with SMTP id jt11so1238431pbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MIAIGoh6vBq+9GVq3GIPvUmU1Eglqa4qaHqoDA/n2RQ=;
	b=TeTEX7sHJlMJhii27X7639017uZHEAGn54BHsOpduCU1H3eYT2ZjEukR/XC9oER4gv
	Wrtdpf5VMcMmBD73JWsc87B1Kv5CTLFTlNP2SU12KFRD2K7PtnG96d/HjH0S8xskHZRs
	+BKzOI4XxbhaZTg9LjpsguHRAActmzhlXTjbF6Is+qbHuCQ83ZfBUrvZiT1TQuf9hIf7
	qqPeMNN6/A5gAICzKzy5lUB8S9abwNGFM/VWaw2gI13nBl2rU0nbb/GvziDtUhYuA34X
	s4djNVViRruFgmmI11Q9eoTxfFz4TVN+sA41uEhOIdpT7/g+GybYmpsNeQB+01vp7UNS
	+XTA==
Received: by 10.68.240.236 with SMTP id wd12mr56448052pbc.83.1346862203978;
	Wed, 05 Sep 2012 09:23:23 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id hr1sm1737324pbc.23.2012.09.05.09.23.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 09:23:21 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50477C74.7050606@redhat.com>
Date: Wed, 05 Sep 2012 18:23:16 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<50477269.8050807@redhat.com>
	<87d320e9uk.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d320e9uk.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, riegamaths@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] block: Don't forget to delete temporary
	file
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
X-List-Received-Date: Wed, 05 Sep 2012 16:23:32 -0000

Il 05/09/2012 18:02, Markus Armbruster ha scritto:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Il 05/09/2012 15:26, riegamaths@gmail.com ha scritto:
>>> From: Dunrong Huang <riegamaths@gmail.com>
>>>
>>> The caller would not delete temporary file after failed get_tmp_filename().
>>>
>>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>>> ---
>>>  block.c | 6 +++++-
>>>  1 个文件被修改，插入 5 行(+)，删除 1 行(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index 074987e..2bc9f75 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -433,7 +433,11 @@ int get_tmp_filename(char *filename, int size)
>>>          return -EOVERFLOW;
>>>      }
>>>      fd = mkstemp(filename);
>>> -    if (fd < 0 || close(fd)) {
>>> +    if (fd < 0) {
>>> +        return -errno;
>>> +    }
>>> +    if (close(fd) != 0) {
>>> +        unlink(filename);
>>>          return -errno;
>>>      }
>>>      return 0;
>>>
>>
>> Not necessary, mkstemp will not create a file if it returns an error.
> 
> Read the patch once more :)

Oops. :)

I wondered about that check for close() errors, perhaps an error in
close could just be swallowed?  Since we don't care about the content of
the file after close (it's empty), we also don't care about errors
closing it.

However, perhaps there were errors writing the directory entry...
Should any errors writing the directory entry be reported by open(),
i.e. by mkstemp()?   If not, and the dcache entry is evicted, someone
could create a different file with the same name as ours.  But then, not
even a successful close() guarantees that the data has reached the disk.

And finally, the whole get_tmp_filename is unsafe because there is a
race window between closing and reopening the file, if the directory is
writable and does not have the sticky bit.

So the patch is an improvement, but there is still something unpleasing
in this code...

Paolo


