Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEfvo-0007Af-OU
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 16:04:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfvj-00079Y-FN
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfvh-0002RY-FB
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:04:15 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41939)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEfvf-0002N1-Bd; Thu, 11 Apr 2019 16:04:12 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MTzve-1hN1vZ0k2k-00R4Sl; Thu, 11 Apr 2019 22:03:59 +0200
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190404091725.20595-1-dgilbert@redhat.com>
	<20190404091957.GL10471@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <87f831be-0707-2820-8378-e0cf617fa3c7@vivier.eu>
Date: Thu, 11 Apr 2019 22:03:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190404091957.GL10471@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3E3VDz7H7qP8iFnfTU6vQ0p3mrGQOkKBta7N+r7lPQ7z5pT6+NO
	t9y4rigtMQQT2yhm5hZZKoQjxSEGXtRY2EzsuQJiUzJxOnrK/BPrc8p/+vJhkrKotysTUaI
	a3damowbRlxY44lkk9hvVnzEbjV4/SZkGHDTSfaEYETgq6BKjITCQPPqCFNqOZhxgXMOtkt
	tTFjOEn7cYwU6J+F9qLUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EHAI84xBQ6E=:Lt7t3pgUjLpQLlNW+q4Ert
	FzXyhpfLt3AW5KeSRNkpllzD21W1uSH6P1CtTV4mjSm1ZAI31XMcd3Kb9IDk0MICrXDZnfeYS
	V13Vn2xmAurT0cqQQn7WGJA6FlKv5DE5ZpbsiE7ch29Ju9kqtFF2K+fesnQTTNFQETiLzOV0Z
	jIIQ+//7Xn5gh/IXUNh+8YWB2cIqwB8Vuu8xlJ3mYRMRRauwh0N3SkhAb+kymg/Hflg7oHAI4
	HD8s44NN2DNLhn/xhVetHBTuqXdjs9hDQxQZQ1Q8kVCyV7NUXiW/gsZe2aYI+C8j6w2AQ/ocL
	n3nvx8XeRtJvagjo8LGF47xoqUCLJAvyYQ6cNWwy2CqpL2OsxmtI57eMrnsOYijT+2jh78Bpd
	nmqNl4ZbCJweD81YfEJv+ir6hwN6x4RIAAnS5x+V7pz8wko9ScWgoJsHenp8u/MJ2WnrHV51k
	BgLD42OTDbHlQ6G4HBKDBwIHz0rVhrTz7Q57sR1Ck7GhsvziHlj6WtREPR0OLuXB2FgdUFKpM
	mY6erWYW3r7P38Cx1dXEVLlbXSrllYFlJHsv5NghexbDzqHX1IJE4avWNz0jDmB5or3UE8beB
	i0dlG3knkuJ1akI7B13d51arSFCiW/zTnHR+KsnrtnXGvQcPpnZmg+OsVLX9AQk2okptUxCWL
	OhMkmIMVySPCs8PeMlZraWhn8PnkVNFn7ecM4kqS8f3/qV4QnmxuEtZ97fhKxPoUDKR5dzPtw
	npRJCAe1GS8bqHZ/jF3duMRmAtV4uC6JrFUYdhKrhwNaWJp8nMmA4k5yn7M=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] configure: fix pam test warning
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
X-List-Received-Date: Thu, 11 Apr 2019 20:04:16 -0000

On 04/04/2019 11:19, Daniel P. Berrangé wrote:
> CC trivial
> 
> On Thu, Apr 04, 2019 at 10:17:25AM +0100, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> The pam test generates a warning on Fedora 29 with -O3 compilation
>> because the headers declare that the pam_conversation pointer to
>> pam_start must be non-NULL.  Change it to use the same 0 initialised
>> structure as we actually use in qauthz.
>>
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  configure | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> 
>>
>> diff --git a/configure b/configure
>> index 1c563a7027..73f7ad2be0 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2946,9 +2946,9 @@ if test "$auth_pam" != "no"; then
>>  int main(void) {
>>     const char *service_name = "qemu";
>>     const char *user = "frank";
>> -   const struct pam_conv *pam_conv = NULL;
>> +   const struct pam_conv pam_conv = { 0 };
>>     pam_handle_t *pamh = NULL;
>> -   pam_start(service_name, user, pam_conv, &pamh);
>> +   pam_start(service_name, user, &pam_conv, &pamh);
>>     return 0;
>>  }
>>  EOF
> 
> Regards,
> Daniel
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

