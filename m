Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ar1fw-0007bk-EC
	for mharc-qemu-trivial@gnu.org; Fri, 15 Apr 2016 07:12:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ar1fs-0007Th-Td
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 07:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ar1fs-0002gq-5G
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 07:12:32 -0400
Received: from [59.151.112.132] (port=27576 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ar1fk-0002ZK-As; Fri, 15 Apr 2016 07:12:25 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5641009"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2016 19:12:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 47A9B408D284;
	Fri, 15 Apr 2016 19:12:08 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Apr 2016 19:12:07 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87mvp4xsbk.fsf@dusky.pond.sub.org> <570910D5.4030705@cn.fujitsu.com>
	<87a8kzkzlj.fsf@dusky.pond.sub.org> <5710BD28.1090301@redhat.com>
CC: <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>,
	<peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5710CD45.2080803@cn.fujitsu.com>
Date: Fri, 15 Apr 2016 19:15:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5710BD28.1090301@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 47A9B408D284.A6A6E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev property: cleanup
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
X-List-Received-Date: Fri, 15 Apr 2016 11:12:34 -0000



On 04/15/2016 06:06 PM, Paolo Bonzini wrote:
>

>> Here's my try rewording the comment (sticking to GTK-Doc conventions
>> even though I dislike them):
>>
>> /**
>>   * @qdev_property_add_static:
>>   * @dev: Device to add the property to
>>   * @prop: The qdev property definition
>>   * @err: location to store error information
>>   *
>>   * Add a static QOM property to @dev for qdev property @prop.
>>   * On error, store error in @errp.
>>   */
>>
>> Paolo, is it correct?
>
> Yes, it is.  You can add also "The type of the QOM property is derived
> from prop->info", which is what Cao Jin really wanted to convey in his
> patch.
>
> Paolo
>

Thanks Paolo for your explanation, much useful info for me:)

I will collect Markus`s rewording and your suggestion into v2 later.

-- 
Yours Sincerely,

Cao jin



