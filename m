Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtVcs-0005qa-FU
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 02:03:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtVcp-0005l8-Ie
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 02:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtVco-0006UO-L7
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 02:03:23 -0500
Received: from [59.151.112.132] (port=10934 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZtVcm-0006TI-4J; Tue, 03 Nov 2015 02:03:20 -0500
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Nov 2015 15:03:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA31bfW1019067;
	Tue, 3 Nov 2015 09:37:41 +0800
Received: from [10.167.226.57] (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 3 Nov 2015 09:38:17 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446455064-1792-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA_FnN9a3Kc_izXOSGYH_7JXy3qfww0h40tGuPZ8krN0eQ@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56381013.4030304@cn.fujitsu.com>
Date: Tue, 3 Nov 2015 09:38:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_FnN9a3Kc_izXOSGYH_7JXy3qfww0h40tGuPZ8krN0eQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object: fix 2 comment
	typos
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
X-List-Received-Date: Tue, 03 Nov 2015 07:03:24 -0000



On 11/02/2015 07:34 PM, Peter Maydell wrote:
> On 2 November 2015 at 09:04, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   include/qom/object.h | 2 +-
>>   qom/object.c         | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index be7280c..9e5162a 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -511,7 +511,7 @@ struct TypeInfo
>>   /**
>>    * OBJECT_CLASS_CHECK:
>>    * @class: The C type to use for the return value.
>> - * @obj: A derivative of @type to cast.
>> + * @obj: A derivative class of @class to cast.
>>    * @name: the QOM typename of @class.
>
> I think this is right but not sufficient. Since OBJECT_CLASS_CHECK's
> second parameter is not an object but a class, the name "obj" is
> rather misleading and should be changed. My suggestion would be
> to use
>
>   * @classtype: The C type to use for the return value.
>   * @class: A derivative class of @classtype to cast.
>   * @name: the QOM typename of @class.
>
> (and the macro definition parameter names should change to match).
>

Yes, Agree. The comment seems just a copy of macro OBJECT_CHECK`s. Will 
modify it in v2:)

>>    *
>>    * A type safe version of @object_class_dynamic_cast_assert.  This macro is
>> diff --git a/qom/object.c b/qom/object.c
>> index 11cd86b..fc6e161 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -204,7 +204,7 @@ static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
>>   {
>>       assert(target_type);
>>
>> -    /* Check if typename is a direct ancestor of type */
>> +    /* Check if target_type is a direct ancestor of type */
>>       while (type) {
>>           if (type == target_type) {
>>               return true;
>
> This change is good.
>
> thanks
> -- PMM
>

-- 
Yours Sincerely,

Cao Jin

