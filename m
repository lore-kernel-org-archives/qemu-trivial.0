Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X8mVA-0006Ud-Cs
	for mharc-qemu-trivial@gnu.org; Sun, 20 Jul 2014 04:29:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X8mV0-0006R0-3Q
	for qemu-trivial@nongnu.org; Sun, 20 Jul 2014 04:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X8mUr-0002ua-2n
	for qemu-trivial@nongnu.org; Sun, 20 Jul 2014 04:29:38 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:40036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1X8mUq-0002uR-Qz; Sun, 20 Jul 2014 04:29:29 -0400
Received: by mail-pa0-f47.google.com with SMTP id kx10so7922541pab.34
	for <multiple recipients>; Sun, 20 Jul 2014 01:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wt5ycEKO2OkxRrPdrzODL/8VvOXpPfjUCLpjXhkcsmA=;
	b=yJsu4ti+pjYf4qNIybKvjp/+IOy3GCBdp3PXC19L5WE5WjW5EBGvfmRuIfyCi8OZJL
	tu7izW+T1BzhIVcQuDG+C9bkVIvEJXR/RfrDxXlcpg4HWj7HQBShbO421P3Po/04ZhL7
	npdzUD9/doRt4LKdh2iIOgU1BbdXv8Lr/RGbIxZnIMQH+blU+LPC3VnBg5yhX4jaJDPb
	/S7amf5exMbuxQxq9HkPEDn6f6ePuLmPwGnI4x/TvuyNH2YgULcl4DrmgrazrsXcRVzh
	jOHPyz1o/jcuIV3kCC4E5hMluU9IlTPTsZJbGsW+zg/uBQK7aCxSE2UDbNKY55gwfLw5
	xA/w==
X-Received: by 10.70.100.34 with SMTP id ev2mr17067387pdb.81.1405844967117;
	Sun, 20 Jul 2014 01:29:27 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.20])
	by mx.google.com with ESMTPSA id
	vk5sm10611730pbc.44.2014.07.20.01.29.24 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jul 2014 01:29:26 -0700 (PDT)
Message-ID: <53CB7DDE.9020804@gmail.com>
Date: Sun, 20 Jul 2014 16:29:18 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>
References: <53C9C82A.2060003@gmail.com> <53CB6FBF.1060009@web.de>
In-Reply-To: <53CB6FBF.1060009@web.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] kvm-all: Use 'tmpcpu' instead of 'cpu'
 in sub-looping to avoid 'cpu' be NULL
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
X-List-Received-Date: Sun, 20 Jul 2014 08:29:47 -0000

On 07/20/2014 03:29 PM, Jan Kiszka wrote:
> On 2014-07-19 03:21, Chen Gang wrote:
>> If kvm_arch_remove_sw_breakpoint() in CPU_FOREACH() always be fail, it
>> will let 'cpu' NULL. And the next kvm_arch_remove_sw_breakpoint() in
>> QTAILQ_FOREACH_SAFE() will get NULL parameter for 'cpu'.
>>
>> And kvm_arch_remove_sw_breakpoint() can assumes 'cpu' must never be NULL,
>> so need define additional temporary variable for 'cpu' to avoid the case.
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  kvm-all.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/kvm-all.c b/kvm-all.c
>> index 3ae30ee..1402f4f 100644
>> --- a/kvm-all.c
>> +++ b/kvm-all.c
>> @@ -2077,12 +2077,13 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
>>  {
>>      struct kvm_sw_breakpoint *bp, *next;
>>      KVMState *s = cpu->kvm_state;
>> +    CPUState *tmpcpu;
>>  
>>      QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
>>          if (kvm_arch_remove_sw_breakpoint(cpu, bp) != 0) {
>>              /* Try harder to find a CPU that currently sees the breakpoint. */
>> -            CPU_FOREACH(cpu) {
>> -                if (kvm_arch_remove_sw_breakpoint(cpu, bp) == 0) {
>> +            CPU_FOREACH(tmpcpu) {
>> +                if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
>>                      break;
>>                  }
>>              }
>>
> 
> Good catch. To make it clear in the changelog: The actual issue is that
> we misuse "cpu" as an iteration variable while its original value is
> still in use. That cpu can eventually become NULL this way is one result.
> 

OK, thanks. If necessary, I shall send patch v2 for additional comments.
(if really necessary to send, please let me know)


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

