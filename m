Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT3wY-0003by-Ir
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 07:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT3wW-0003aU-G9
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 07:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT3wV-00034Q-FL
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 07:28:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55450 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fT3wQ-00032M-P0; Wed, 13 Jun 2018 07:27:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A80E40122A1;
	Wed, 13 Jun 2018 11:27:54 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 262F81116701;
	Wed, 13 Jun 2018 11:27:50 +0000 (UTC)
To: "Emilio G. Cota" <cota@braap.org>,
	Yaowei Bai <baiyaowei@cmss.chinamobile.com>
References: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
	<20180613035030.GB25430@flamenco>
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
	stefanha@redhat.com, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <23a38716-196f-53a0-0a3d-61f269b1dab4@redhat.com>
Date: Wed, 13 Jun 2018 06:27:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613035030.GB25430@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 11:27:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 11:27:54 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tracing.txt: add missing
 '-' for trace option
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 11:28:01 -0000

On 06/12/2018 10:50 PM, Emilio G. Cota wrote:
> On Tue, Jun 12, 2018 at 23:15:49 -0400, Yaowei Bai wrote:
>> Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
>> ---
>>   docs/devel/tracing.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
>> index 07abbb3..6ab32cc 100644
>> --- a/docs/devel/tracing.txt
>> +++ b/docs/devel/tracing.txt
>> @@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
>>   
>>   3. Run the virtual machine to produce a trace file:
>>   
>> -    qemu -trace events=/tmp/events ... # your normal QEMU invocation
>> +    qemu --trace events=/tmp/events ... # your normal QEMU invocation
> 
> The second dash is not missing; both '-args' and '--args' work.
> 
> '-args' seems to be favoured though; see `qemu -h' or `qemu --h' :-)

Actually, we're trying to fix that:
https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documentation

The one-vs-two dash usage is only supported in qemu, not in qemu-nbd or 
qemu-img (that is, qemu acts as if it uses getopt_long_only(), while the 
others use getopt_long() - except that we hand-rolled the parser in 
qemu, meaning you might find quirks where it sometimes doesn't even 
match getopt_long_only()).

At any rate, since --trace is an option that is supported across 
multiple binaries, we SHOULD favor the double-dash spelling in our 
documentation, so that you can consistently reuse the same --trace 
invocation without worrying whether the binary parses its arguments with 
getopt_long() (where double is required) or like getopt_long_only() 
(where the double is optional but supported).

So I'm in favor of this patch, although it may need more of a commit 
message summarizing the justification I've just pointed you to.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

