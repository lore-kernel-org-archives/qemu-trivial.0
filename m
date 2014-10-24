Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhZd0-0005Eu-Qy
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 03:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhZcs-00054g-Op
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 03:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhZcm-0005pK-Ko
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 03:49:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhZcN-0005kM-MW; Fri, 24 Oct 2014 03:49:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C35DC45F34;
	Fri, 24 Oct 2014 11:49:01 +0400 (MSK)
Message-ID: <544A046D.4090204@msgid.tls.msk.ru>
Date: Fri, 24 Oct 2014 11:49:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, Chen Gang <gang.chen.5i5j@gmail.com>, 
	pbonzini@redhat.com
References: <543BE352.3080609@gmail.com> <543BE616.1000707@suse.de>
In-Reply-To: <543BE616.1000707@suse.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow
 issue about strncat()
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
X-List-Received-Date: Fri, 24 Oct 2014 07:49:41 -0000

On 10/13/2014 06:47 PM, Alexander Graf wrote:
> On 13.10.14 16:36, Chen Gang wrote:
>> strncat() will append additional '\0' to destination buffer, so need
>> additional 1 byte for it, or may cause memory overflow, just like other
>> area within QEMU have done.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> I agree with this patch. However, the code is pretty ugly - I'm sure it
> must've been me who wrote it :).
> 
> Could you please instead rewrite it to use g_strdup_printf() rather than
> strncat()s? That way we resolve all string pitfalls automatically - and
> this code is not the fast path, so doing an extra memory allocation is ok.

I'd just use snprintf() like this:

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 9c23c6b..5eaa36c 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1794,8 +1794,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
         return -1;
     }

-    strncat(buf, "/", sizeof(buf) - strlen(buf));
-    strncat(buf, propname, sizeof(buf) - strlen(buf));
+    snprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "/%s", propname);

     f = fopen(buf, "rb");
     if (!f) {

the buffer is of size PATH_MAX, and we're looking at /proc filesystem where
names should be rather short so we're extremly unlikely to hit this prob in
practice, there's no need to dynamically allocate a buffer for this stuff.

(Or alternatively there's asprintf(), but still I think it is overkill).

I can apply the above if everyone agrees.

Thanks,

/mjt

>>  target-ppc/kvm.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
>> index 9c23c6b..66e7ce5 100644
>> --- a/target-ppc/kvm.c
>> +++ b/target-ppc/kvm.c
>> @@ -1794,8 +1794,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>          return -1;
>>      }
>>  
>> -    strncat(buf, "/", sizeof(buf) - strlen(buf));
>> -    strncat(buf, propname, sizeof(buf) - strlen(buf));
>> +    strncat(buf, "/", sizeof(buf) - strlen(buf) - 1);
>> +    strncat(buf, propname, sizeof(buf) - strlen(buf) - 1);
>>  
>>      f = fopen(buf, "rb");
>>      if (!f) {
>>
> 


