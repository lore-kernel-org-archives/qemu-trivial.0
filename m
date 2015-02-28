Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRewE-0000Hf-88
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:48:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRewC-0000Dv-9v
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:48:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRewB-0003Qz-FF
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:48:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRew7-0003Iv-AW; Sat, 28 Feb 2015 05:47:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6E55E43EE1;
	Sat, 28 Feb 2015 13:47:52 +0300 (MSK)
Message-ID: <54F19CD8.4070308@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 13:47:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
	<54F194B7.9080603@msgid.tls.msk.ru> <54F19602.4010401@huawei.com>
In-Reply-To: <54F19602.4010401@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:48:01 -0000

28.02.2015 13:18, Gonglei wrote:
> On 2015/2/28 18:13, Michael Tokarev wrote:
[]
>> How about this?
>>
> It's ok on function, but seems oddly, isn't it?

I don't see anything odd in it.  The `filename' variable is only
used as an argument for load_device_tree() function and is not used
anywhwere else, so it's logical to free it after use.

>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *machine,
>>          }
>>
>>          fdt = load_device_tree(filename, &fdt_size);
>> +        g_free(filename);
>>          if (!fdt) {
>>              goto out;
>>          }
>>
Thanks,

/mjt


