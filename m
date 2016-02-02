Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQWHL-0002gW-5b
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 03:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQWHJ-0002dq-47
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQWHI-0008CD-3T
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:25:37 -0500
Received: from [59.151.112.132] (port=61014 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQWHD-0008Ay-2c; Tue, 02 Feb 2016 03:25:31 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3227253"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2016 16:25:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D991D418AD51;
	Tue,  2 Feb 2016 16:24:39 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Feb 2016 16:25:28 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1454309636-18263-2-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56B0658A.20605@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56B0680C.8050200@cn.fujitsu.com>
Date: Tue, 2 Feb 2016 16:25:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56B0658A.20605@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D991D418AD51.A6D32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] Emulated CCID card: QOMify
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
X-List-Received-Date: Tue, 02 Feb 2016 08:25:38 -0000



On 02/02/2016 04:15 PM, Michael Tokarev wrote:
> 01.02.2016 09:53, Cao jin wrote:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/usb/ccid-card-emulated.c | 20 +++++++++-----------
>>   hw/usb/ccid.h               |  4 ++++
>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
>> index 869a63c..0b05260 100644
>> --- a/hw/usb/ccid-card-emulated.c
>> +++ b/hw/usb/ccid-card-emulated.c
>> @@ -42,8 +42,6 @@ do {\
>>       } \
>>   } while (0)
>>
>> -#define EMULATED_DEV_NAME "ccid-card-emulated"
>
>
>> --- a/hw/usb/ccid.h
>> +++ b/hw/usb/ccid.h
>> +#define TYPE_EMULATED_CCID "ccid-card-emulated"
>> +#define EMULATED_CCID_CARD(obj) \
>> +     OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)
>
> Why did you move the type definition from .c to .h file?
> It is only referenced in .c, no?
>
> Ditto for the second patch in this series.
>
> Thanks,
>
> /mjt
>

Yes, that type definition is referred only in .c for now, but we are not 
sure about it in the future, for better flexibility, I think put it into 
.h is better. http://wiki.qemu.org/QOMConventions also says:

DO use TYPE_FOO constants, defined in a header if used in other parts of 
code

-- 
Yours Sincerely,

Cao jin



