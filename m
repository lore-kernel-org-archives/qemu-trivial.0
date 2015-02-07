Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK1JC-0007t8-HX
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 04:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1JA-0007pB-4p
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1J9-00066Y-Ec
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:04:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK1J0-00064i-W0; Sat, 07 Feb 2015 04:03:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5CF5B41366;
	Sat,  7 Feb 2015 12:03:58 +0300 (MSK)
Message-ID: <54D5D4FE.8070508@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 12:03:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
References: <1422457637-45862-1-git-send-email-borntraeger@de.ibm.com>
	<54C8FDDF.6010300@redhat.com>
In-Reply-To: <54C8FDDF.6010300@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH/RFC] vl.c: fix memory leak spotted by
	valgrind
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
X-List-Received-Date: Sat, 07 Feb 2015 09:04:08 -0000

28.01.2015 18:18, Paolo Bonzini wrote:
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Applied to -trivial, thank you!

/mjt

> On 28/01/2015 16:07, Christian Borntraeger wrote:
>> valgrind complains about:
>> ==42062== 16 bytes in 1 blocks are definitely lost in loss record 387 of 1,048
>> ==42062==    at 0x402DCB2: malloc (vg_replace_malloc.c:299)
>> ==42062==    by 0x40C1BE3: g_malloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
>> ==42062==    by 0x40DA133: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
>> ==42062==    by 0x40DB2E5: g_slist_prepend (in /usr/lib64/libglib-2.0.so.0.3800.2)
>> ==42062==    by 0x801637FF: object_class_get_list_tramp (object.c:690)
>> ==42062==    by 0x40A96C9: g_hash_table_foreach (in /usr/lib64/libglib-2.0.so.0.3800.2)
>> ==42062==    by 0x80164885: object_class_foreach (object.c:665)
>> ==42062==    by 0x80164975: object_class_get_list (object.c:698)
>> ==42062==    by 0x800100A5: machine_parse (vl.c:2447)
>> ==42062==    by 0x800100A5: main (vl.c:3756)
>>
>> Lets free machines in case of mc.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>  vl.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/vl.c b/vl.c
>> index 983259b..9d008ac 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -2450,6 +2450,7 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
>>          mc = find_machine(name);
>>      }
>>      if (mc) {
>> +        g_slist_free(machines);
>>          return mc;
>>      }
>>      if (name && !is_help_option(name)) {
>>
> 


