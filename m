Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZNkb-0001DC-6e
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 14:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZNkR-00016E-1q
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZNkP-0000mC-WE
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:36:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZZNkL-0000kt-E0; Tue, 08 Sep 2015 14:35:57 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 5AF498F2E3;
	Tue,  8 Sep 2015 18:35:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88IZrCD016298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 8 Sep 2015 14:35:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1B1DE300111B; Tue,  8 Sep 2015 20:35:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
	<55EF1B31.6070504@redhat.com>
Date: Tue, 08 Sep 2015 20:35:53 +0200
In-Reply-To: <55EF1B31.6070504@redhat.com> (John Snow's message of "Tue, 8 Sep
	2015 13:30:25 -0400")
Message-ID: <87r3m8g3na.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, peter.maydell@linaro.org
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
X-List-Received-Date: Tue, 08 Sep 2015 18:36:04 -0000

John Snow <jsnow@redhat.com> writes:

> On 09/07/2015 06:21 AM, Paolo Bonzini wrote:
>> Coccinelle chokes on some idioms from compiler.h and queue.h.
>> Extract those in a macro file, to be used with "--macro-file
>> scripts/cocci-macro-file.h".
>> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  scripts/cocci-macro-file.h | 119
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>  create mode 100644 scripts/cocci-macro-file.h
>> 
>> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
>> new file mode 100644
>> index 0000000..eceb4be
>> --- /dev/null
>> +++ b/scripts/cocci-macro-file.h
>> @@ -0,0 +1,119 @@
>> +/* Macro file for Coccinelle
>> + *
>> + * Copyright (C) 2015 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  Paolo Bonzini <pbonzini@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2
>> or, at your
>> + * option, any later version.  See the COPYING file in the
>> top-level directory.
>> + */
>> +
>> +/* Coccinelle only does limited parsing of headers, and chokes on some idioms
>> + * defined in compiler.h and queue.h.  Macros that Coccinelle must know about
>> + * in order to parse .c files must be in a separate macro file---which is
>> + * exactly what you're staring at now.
>> + *
>> + * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
>> + * Coccinelle command line.
>> + */
>> +
>> +/* From qemu/compiler.h */
[Stuff cribbed from various headers...]
>
> Having not used Coccinelle yet, what happens if any of these functions
> become desynchronized ?

Coccinelle transforms C to C.  Problem: if you parse C the normal way
(first run preprocessor, then the parser proper), you have to unparse
and unpreprocess at the end to get a useful result.  Unparsing is easy,
but unpreprocessing is hard.

Instead, Coccinelle tries to parse *unpreprocessed* C.  Works most of
the time, because most uses of function-like macros can be treated as if
they were function calls, and most uses of object-like macros can be
treated as if they were values.

When it doesn't work, Coccinelle needs to resort to magic and / or skip
over some code it can't decipher.  The latter is undesirable, because if
the skipped code contains something we'd like to transform, we won't.

Part of the magic is treating "bad" macros specially.  --macro-file
helps with that part: macros defined there are "bad".  Sorry, I can't
really explain it, -EMAGIC.  /usr/share/coccinelle/standard.h is used by
default.

So what happens when the this file gets out of sync?  Worst case is
Coccinelle misses a pattern it could find if it was in sync.

Provided the macro file makes sense initially, a moderately bit-rotten
version is still almost certainly better than nothing.

