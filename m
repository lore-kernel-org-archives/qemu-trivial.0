Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDuz-0004m6-88
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDur-0004hz-Ty
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDuq-0000pn-1Z
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:06:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47241)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDue-0000eF-DO; Thu, 14 Feb 2019 05:06:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MUGRh-1gU8QT2WKR-00RFgO; Thu, 14 Feb 2019 11:05:46 +0100
To: Thomas Huth <thuth@redhat.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	qemu-stable@nongnu.org
References: <20190213211827.20300-1-thomas.petazzoni@bootlin.com>
	<8defa16a-2af8-a1a7-0e3e-cb281f9a477d@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07ad6417-eb6f-b35d-06b4-168c5090c95b@vivier.eu>
Date: Thu, 14 Feb 2019 11:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8defa16a-2af8-a1a7-0e3e-cb281f9a477d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qpWYGa/WxT+7OX6R6ixbAtbcqUoMl8l+vcUNr+4mq+8vZZpmt9Z
	Jz3oBnYzai4ABC6KIkeg1aJ7bp/W0jGXCKf99io4ddcH05gUVgXo8WHaxcQnGAq4uJgmK/3
	iMqDdbfSLTf7gwAPXybXy7N891868y0UOmkfoUWSmX2xKLLY48fKnVF3POtZcmyt1ntKeso
	zPl+6X5N/nRxyclGrKPkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J3HEYQTGKts=:Eb/TpMREZi3AS7vT8pPIIo
	quM+28JfS0GYYSmnr3vwMOc3ayj25pzU4nwjmIaLmV8xLkiyCVnVfJ0Pvq4a+PdX6GfoAD6QU
	0EFqDlUWi1th0GdFI3pTLfgAoNvf0FlnUX2gfrWYTrIM2majfS4fLFDUKbuKBrnpDNduERADI
	TmQzgJJsXZwWjTzD7ZjcsrHoFzdj8rVWx4xDFGefwYQ423QFE1FAAJZRpi45m8uGnzgdz7++S
	JmvQze6MdhRGWixONsmkzhEaiBdNOc03Lx4MLE1LylRAUDpGLmIG/s+C+JAsY+dfj5elJsYDD
	tyuVPul4EjwZPvXG/rJOT7ltvRjTtcAPxhK6rNYSFxpceGMp9bYu6DMgbrQxSOwMzqVYXjIC2
	lLpOrvBGpmMpWvqVWywwIuAT4vrL1Lqid3EC2rgb7oXLiQvQzFBv3pgrDqWIVATFzzd47uH6G
	nkUmEUJ2WQu3IShgYHxvAM0pJpOQKmpKTYwyB0WtpByIpqONy7Ahcdm7zbp10XebUHp47BIBK
	JK0ww5Qu+h249FkLDtKkn0OJdx7Le4NtOdBQ5oR5zN2xCgsNGZklu1gyqBAEOeplCAah2t2tE
	SWZ97pn2mxSs53ftdjzwcVM6HukbCResBEsNKTddtExUwWQ81x0VYGqA45uAtDJpJdys4Ls/k
	vuO4F8Pvb9YUmcEzweFpp3trCJMdAu2jPK1rr+pqxULDs6KNXLzGxyWKsh2/PKPa98GJrnVEO
	Pnlp9gEvLHio2P+P94qemPX4TtU5UjGz4jNkn/IwSGRez7UNGMexrt92avw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: improve usbfs
 check
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
X-List-Received-Date: Thu, 14 Feb 2019 10:06:57 -0000

On 14/02/2019 08:00, Thomas Huth wrote:
> On 2019-02-13 22:18, Thomas Petazzoni wrote:
>> The current check to test if usbfs support should be compiled or not
>> solely relies on the presence of <linux/usbdevice_fs.h>, without
>> actually checking that all definition used by Qemu are provided by
>> this header file.
>>
>> With sufficiently old kernel headers, <linux/usbdevice_fs.h> may be
>> present, but some of the definitions needed by Qemu may not be
>> available.
>>
>> This commit improves the check by building a small program that
>> actually tests whether the necessary definitions are available.
>>
>> In addition, it fixes a bug where have_usbfs was set to "yes"
>> regardless of the result of the test.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>>  configure | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 3d89870d99..799c8e3b08 100755
>> --- a/configure
>> +++ b/configure
>> @@ -4266,10 +4266,25 @@ fi
>>  # check for usbfs
>>  have_usbfs=no
>>  if test "$linux_user" = "yes"; then
>> -  if check_include linux/usbdevice_fs.h; then
>> +  cat > $TMPC << EOF
>> +#include <linux/usbdevice_fs.h>
>> +
>> +#ifndef USBDEVFS_GET_CAPABILITIES
>> +#error "USBDEVFS_GET_CAPABILITIES undefined"
>> +#endif
>> +
>> +#ifndef USBDEVFS_DISCONNECT_CLAIM
>> +#error "USBDEVFS_DISCONNECT_CLAIM undefined"
>> +#endif
>> +
>> +int main(void)
>> +{
>> +    return 0;
>> +}
>> +EOF
>> +  if compile_prog "" ""; then
>>      have_usbfs=yes
>>    fi
>> -  have_usbfs=yes
>>  fi
>>  
>>  # check for fallocate
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

