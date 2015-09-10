Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Za9K6-00071m-Bs
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2015 17:24:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Za9K3-0006vb-MF
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 17:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Za9K2-0003oY-Tn
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 17:23:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Za9Jy-0003mv-LI; Thu, 10 Sep 2015 17:23:54 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3B17EC062C96;
	Thu, 10 Sep 2015 21:23:54 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8ALNrAT002852; Thu, 10 Sep 2015 17:23:53 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
	<55EF1B31.6070504@redhat.com> <87r3m8g3na.fsf@blackfin.pond.sub.org>
	<55F00119.4000305@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <55F1F4E9.7040205@redhat.com>
Date: Thu, 10 Sep 2015 17:23:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55F00119.4000305@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] add macro file for
	coccinelle
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
X-List-Received-Date: Thu, 10 Sep 2015 21:24:01 -0000



On 09/09/2015 05:51 AM, Paolo Bonzini wrote:
> 
> 
> On 08/09/2015 20:35, Markus Armbruster wrote:
>>>> Having not used Coccinelle yet, what happens if any of these functions
>>>> become desynchronized ?
>> Coccinelle transforms C to C.  Problem: if you parse C the normal way
>> (first run preprocessor, then the parser proper), you have to unparse
>> and unpreprocess at the end to get a useful result.  Unparsing is easy,
>> but unpreprocessing is hard.
>>
>> Instead, Coccinelle tries to parse *unpreprocessed* C.  Works most of
>> the time, because most uses of function-like macros can be treated as if
>> they were function calls, and most uses of object-like macros can be
>> treated as if they were values.
>>
>> When it doesn't work, Coccinelle needs to resort to magic and / or skip
>> over some code it can't decipher.  The latter is undesirable, because if
>> the skipped code contains something we'd like to transform, we won't.
>>
>> Part of the magic is treating "bad" macros specially.  --macro-file
>> helps with that part: macros defined there are "bad".  Sorry, I can't
>> really explain it, -EMAGIC.  /usr/share/coccinelle/standard.h is used by
>> default.
>>
>> So what happens when the this file gets out of sync?  Worst case is
>> Coccinelle misses a pattern it could find if it was in sync.
>>
>> Provided the macro file makes sense initially, a moderately bit-rotten
>> version is still almost certainly better than nothing.
> 
> Great answer.  I'll only add that exactly the same issue happens with
> the Coverity model.
> 
> Paolo
> 

Great, thanks for the info :)

--js

